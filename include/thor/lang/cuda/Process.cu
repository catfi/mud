/**
 * Copyright (C) 2008-2012 Zillians, Inc. <http://www.zillians.com/>
 *
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License, version 3,
 * as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * See the GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "thor/lang/Language.cuh"
#include "thor/lang/Process.cuh"
#include "thor/lang/Domain.cuh"
//#include "thor/lang/Domain.h"
//#include "thor/lang/Lambda.h"
//#include "thor/container/Vector.h"
#include "framework/service/runtime/RuntimeServiceBuffer.h"
#include "framework/service/runtime/RuntimeServiceBufferCUDA.h"

using namespace thor;

namespace thor {

namespace lang {

namespace internal {

int32 gh_current_invocation_buffer_size = 0;
__device__ int32 gd_current_invocation_buffer_size;
zillians::framework::service::Invocation* gh_current_invocation_buffer_ptr = NULL;
__device__ zillians::framework::service::Invocation* gd_current_invocation_buffer_ptr;

__device__ int32* gd_next_invocation_buffer_index;
__device__ int32* gd_next_invocation_buffer_size;
__device__ zillians::framework::service::Invocation** gd_next_invocation_buffer_ptr;

int32 gh_current_invocation_shuffle_indices_size = 0;
int32* gh_current_invocation_shuffle_indices_ptr = NULL;
__device__ int32* gd_current_invocation_shuffle_indices_ptr;

#define __INVOCATION_PARAMETER_ELEMENTS   (CUDA_INVOCATION_PARAMETER_SIZE/CUDA_INVOCATION_PARAMETER_LOAD_SIZE)
#define __TOTAL_PARAMETER_SIZE_PER_BLOCK  (CUDA_DISPATCHER_THREADS_PER_BLOCK*CUDA_INVOCATION_PARAMETER_SIZE)
#define __TOTAL_LOAD_SIZE_PER_WARP        (CUDA_DISPATCHER_WARP_SIZE * CUDA_INVOCATION_PARAMETER_LOAD_SIZE)
#define __TOTAL_LOADER_WARP_COUNT         (__TOTAL_PARAMETER_SIZE_PER_BLOCK/__TOTAL_LOAD_SIZE_PER_WARP)
#define __TOTAL_WARPS_PER_INVOCATION      (CUDA_INVOCATION_PARAMETER_SIZE/__TOTAL_LOAD_SIZE_PER_WARP)
#define __TOTAL_WARPS_PER_BLOCK           (CUDA_DISPATCHER_THREADS_PER_BLOCK/CUDA_DISPATCHER_WARP_SIZE)
#define __TOTAL_WORKING_ITEMS_PER_WARP    CEILING(__TOTAL_LOADER_WARP_COUNT,__TOTAL_WARPS_PER_BLOCK)


#define CUDA_DMA_EMPTY_BARRIER 1
#define CUDA_DMA_FULL_BARRIER  2

//typedef char int8;
//typedef short int16;
//typedef int int32;
//typedef long long int64;

template<int Size>
struct type_selector;

template<>
struct type_selector<1> {
	typedef int8 type;
};

template<>
struct type_selector<2> {
	typedef int16 type;
};

template<>
struct type_selector<4> {
	typedef int32 type;
};

template<>
struct type_selector<8> {
	typedef int64 type;
};

typedef type_selector<CUDA_INVOCATION_PARAMETER_LOAD_SIZE>::type param_element_type;

__shared__ char __parameter_shm[CUDA_INVOCATION_PARAMETER_SIZE*CUDA_COMPUTE_THREADS_PER_BLOCK];

typedef type_selector<CUDA_INVOCATION_DMA_TRANSFER_SIZE>::type dma_element_type;

__shared__ int32 __dma_size[CUDA_COMPUTE_THREADS_PER_BLOCK];
__shared__ dma_element_type __dma_buffer[CUDA_INVOCATION_DMA_BUFFER_SIZE_PER_THREAD*CUDA_COMPUTE_THREADS_PER_BLOCK/CUDA_INVOCATION_DMA_TRANSFER_SIZE];
__shared__ dma_element_type* __dma_dest[CUDA_COMPUTE_THREADS_PER_BLOCK];
__shared__ dma_element_type* __dma_source[CUDA_COMPUTE_THREADS_PER_BLOCK];

//__device__ int32* __dma_size;
//__device__  dma_element_type* __dma_buffer;
//__device__  dma_element_type** __dma_dest;
//__device__  dma_element_type** __dma_source;

__global__ void __setCurrentInvocationBufferKernel(zillians::framework::service::Invocation* ptr, int32 size) {
	gd_current_invocation_buffer_ptr = ptr;
	gd_current_invocation_buffer_size = size;
}

// exported and will be called from runtime service
void __setCurrentInvocationBuffer(zillians::framework::service::Invocation* ptr, int32 size)
{
	if(gh_current_invocation_buffer_ptr != ptr || gh_current_invocation_buffer_size != size)
	{
		__setCurrentInvocationBufferKernel<<<1,1>>>(ptr, size);
		gh_current_invocation_buffer_ptr = ptr;
		gh_current_invocation_buffer_size = size;
	}
}

__global__ void __setNextInvocationBufferKernel(int32 target_id, int32 bucket_id, zillians::framework::service::Invocation* ptr, int32 size) {
	int32 index = target_id * CUDA_INVOCATION_NEXT_BUCKET_SIZE + bucket_id;
//	printf("setting next invocation buffer (%d,%d) to %p, size = %d\n", target_id, bucket_id, ptr, size);
//	printf("gd_next_invocation_buffer_ptr = %p\n", gd_next_invocation_buffer_ptr);
//	printf("gd_next_invocation_buffer_index = %p\n", gd_next_invocation_buffer_index);
//	printf("gd_next_invocation_buffer_size = %p\n", gd_next_invocation_buffer_size);
	gd_next_invocation_buffer_ptr[index] = ptr;
	gd_next_invocation_buffer_index[index] = 0;
	gd_next_invocation_buffer_size[index] = size;
}

void __setNextInvocationBuffer(int32 target_id, int32 bucket_id, zillians::framework::service::Invocation* ptr, int32 size) {
	__setNextInvocationBufferKernel<<<1,1>>>(target_id, bucket_id, ptr, size);
}

__global__ void __setNextInvocationBufferContainerKernel(zillians::framework::service::Invocation** ptr) {
//	printf("setting invocation buffer container to %p\n", ptr);
	gd_next_invocation_buffer_ptr = ptr;
}

void __setNextInvocationBufferContainer(zillians::framework::service::Invocation** ptr) {
	__setNextInvocationBufferContainerKernel<<<1,1>>>(ptr);
}

__global__ void __setNextInvocationSizeBufferKernel(int32* ptr) {
//	printf("setting invocation size buffer to %p\n", ptr);
	gd_next_invocation_buffer_size = ptr;
}

void __setNextInvocationSizeBuffer(int32* ptr) {
	__setNextInvocationSizeBufferKernel<<<1,1>>>(ptr);
}

__global__ void __setNextInvocationIndexBufferKernel(int32* ptr) {
//	printf("setting invocation index buffer to %p\n", ptr);
	gd_next_invocation_buffer_index = ptr;
}

void __setNextInvocationIndexBuffer(int32* ptr) {
	__setNextInvocationIndexBufferKernel<<<1,1>>>(ptr);
}

__global__ void __setShuffleIndicesBufferKernel(int32* ptr) {
	gd_current_invocation_shuffle_indices_ptr = ptr;
}

// exported and will be called from runtime service
void __setShuffleIndicesBuffer(int32* ptr, int32 size)
{
	if(gh_current_invocation_shuffle_indices_ptr != ptr)
	{
		__setShuffleIndicesBufferKernel<<<1,1>>>(ptr);
		gh_current_invocation_shuffle_indices_ptr = ptr;
	}
	gh_current_invocation_shuffle_indices_size = size;
}

__device__ __forceinline__ void __barrierSync(const int name, const int num)
{
	asm volatile("bar.sync %0, %1;" : : "r"(name), "r"(num) : "memory" );
}

__device__ __forceinline__ void __barrierArrive(const int name, const int num)
{
	asm volatile("bar.arrive %0, %1;" : : "r"(name), "r"(num) : "memory" );
}

__device__ bool __debugging_cond;
__global__ void __setDebugCondKernel(bool cond) {
	__debugging_cond = cond;
}

void __setDebugCond(bool cond) {
	__setDebugCondKernel<<<1,1>>>(cond);
}

__device__ zillians::framework::service::ControlFlags* __control_flags;
__global__ void __setControlFlagsKernel(zillians::framework::service::ControlFlags* flags) {
    __control_flags = flags;

    // initialize the flags
    __control_flags->daemonized = false;
    __control_flags->exited = false;
    __control_flags->exit_code = 0;
    __control_flags->explicit_exited = false;
    __control_flags->explicit_exit_code = 0;
    __control_flags->implicit_exited = false;
    __control_flags->implicit_exit_code = 0;
}

void __setControlFlags(zillians::framework::service::ControlFlags* flags) {
    __setControlFlagsKernel<<<1,1>>>(flags);
}

//__device__ void __loadParametersToShm(char* __parameter_shm, int32* __dma_size, dma_element_type* __dma_buffer, dma_element_type** __dma_dest, dma_element_type** __dma_source)
__device__ void __loadParametersToShm()
{
	int32 local_tid = threadIdx.x - CUDA_COMPUTE_THREADS_PER_BLOCK;
	int32 shuffled_index = blockIdx.x * CUDA_COMPUTE_THREADS_PER_BLOCK + local_tid;

	__dma_source[local_tid] = (dma_element_type*)&gd_current_invocation_buffer_ptr[shuffled_index];
	__dma_dest[local_tid] = (dma_element_type*)&__parameter_shm[local_tid * CUDA_INVOCATION_PARAMETER_SIZE];
	__dma_size[local_tid] = CUDA_INVOCATION_PARAMETER_SIZE;

	__barrierArrive(CUDA_DMA_EMPTY_BARRIER, CUDA_DISPATCHER_THREADS_PER_BLOCK);
	__barrierSync(CUDA_DMA_FULL_BARRIER, CUDA_DISPATCHER_THREADS_PER_BLOCK);
}

__device__ void __loadParametersToShm(char* shm)
{
//	if(threadIdx.x == 0)
//	{
//		char* parameters = (char*)gd_current_invocation_buffer_ptr;
//		param_element_type* typed_shm = (param_element_type*)__parameter_shm;
//		param_element_type* typed_parameters = (param_element_type*)parameters;
//		printf("%d: load param from %p\n", threadIdx.x, parameters);
//		for(int i=0;i<CUDA_COMPUTE_THREADS_PER_BLOCK*CUDA_INVOCATION_PARAMETER_SIZE/CUDA_INVOCATION_PARAMETER_LOAD_SIZE;++i)
//		{
//			typed_shm[i] = typed_parameters[i];
//		}
//	}

	char* parameters = (char*)gd_current_invocation_buffer_ptr;
	int32* shuffle_indices = gd_current_invocation_shuffle_indices_ptr;
	int32 total_invocation = gd_current_invocation_buffer_size;

	//int tid = blockIdx.x * blockDim.x + threadIdx.x;
	//printf("blockIdx.x = %d, blockDim.x = %d, tid = %d\n", blockIdx.x, blockDim.x, tid);
	int32 warp_id = threadIdx.x / CUDA_DISPATCHER_WARP_SIZE;
	int32 wid = threadIdx.x % CUDA_DISPATCHER_WARP_SIZE;
	int32 base_id = blockIdx.x * blockDim.x;

	param_element_type* typed_shm = (param_element_type*)shm;
	param_element_type* typed_parameters = (param_element_type*)parameters;

#if __TOTAL_LOADER_WARP_COUNT == CUDA_DISPATCHER_WARP_SIZE && false
	int32 shuffled_index = -1;
	int32 current_row = base_id;

	#pragma unroll 32
	for(int j=0;j<__TOTAL_WORKING_ITEMS_PER_WARP;++j)
	{
		if(current_row >= total_invocation)
			break;

		shuffled_index = shuffle_indices[current_row];

		// load from global memory into shared memory
		int32 to_index = j * __INVOCATION_PARAMETER_ELEMENTS + threadIdx.x;
		int32 from_index = shuffled_index * __INVOCATION_PARAMETER_ELEMENTS + threadIdx.x;
		//printf("tid=%d, shuffled_index=%d, to_idx=%d, from_idx=%d\n", tid, shuffled_index, to_index, from_index);
		typed_shm[to_index] = typed_parameters[from_index];

		// load next item
		++current_row;
	}
#else
	int32 shuffled_index = -1;
	int32 last_row = -1;
	int32 working_index = warp_id;
	int32 current_row = base_id + working_index / __TOTAL_WARPS_PER_INVOCATION;

	#pragma unroll 32
	for(int j=0;j<__TOTAL_WORKING_ITEMS_PER_WARP;++j)
	{
		if(current_row >= total_invocation)
			break;

		if(current_row != last_row)
		{
			shuffled_index = shuffle_indices[current_row];
		}

		// load from global memory into shared memory
		int32 local_index = working_index % __TOTAL_WARPS_PER_INVOCATION;
		int32 to_index = working_index * CUDA_DISPATCHER_WARP_SIZE + wid;
		int32 from_index = shuffled_index * __INVOCATION_PARAMETER_ELEMENTS + local_index * CUDA_DISPATCHER_WARP_SIZE + wid;
		//printf("tid=%d, wid=%d, warp_id=%d, working_idx=%d, current_row=%d, shuffled_idx=%d, local_index=%d, to_idx=%d, from_idx=%d\n", base_id + threadIdx.x, wid, warp_id, working_index, current_row, shuffled_index, local_index, to_index, from_index);
		typed_shm[to_index] = typed_parameters[from_index];

		// load next item
		working_index += __TOTAL_WARPS_PER_BLOCK;
		last_row = current_row;
		current_row = base_id + working_index / __TOTAL_WARPS_PER_INVOCATION;
	}
#endif
}

__device__ bool __isDMAWarp()
{
	return threadIdx.x < CUDA_DMA_THREADS_PER_BLOCK;
}

__device__ void __runDMAWarp()
{
	while(true)
	{
		__barrierSync(CUDA_DMA_EMPTY_BARRIER, CUDA_DISPATCHER_THREADS_PER_BLOCK);

		bool has_dma = false;
		for(int i=0;i<CUDA_COMPUTE_THREADS_PER_BLOCK;++i)
		{
			int32 size;
			if((size = __dma_size[i]) > 0)
			{
//				if(threadIdx.x == 0)
//					printf("%d (%d): transfer from %p to %p (size = %d, i = %d)\n", threadIdx.x, blockIdx.x, __dma_source[i], __dma_dest[i], size, i);

				has_dma = true;
				__dma_dest[i][threadIdx.x] = __dma_source[i][threadIdx.x];
				if(threadIdx.x == 0)
					__dma_size[i] = 0;
			}
		}

		if(!has_dma) break;

		__barrierArrive(CUDA_DMA_FULL_BARRIER, CUDA_DISPATCHER_THREADS_PER_BLOCK);
	}
}

__device__ void __initDMA()
{
	int32 local_tid = threadIdx.x - CUDA_DMA_THREADS_PER_BLOCK;
	__dma_size[local_tid] = 0;
}

__device__ void __startDMA(int32 target_id, int32 invocation_id)
{
	using namespace zillians::framework::service;

//	printf("start DMA, target id = %d, invocation id = %d\n", target_id, invocation_id);
//	return;

	int32 local_tid = threadIdx.x - CUDA_DMA_THREADS_PER_BLOCK;
	int bucket_id = blockIdx.x % CUDA_INVOCATION_NEXT_BUCKET_SIZE;

	__dma_source[local_tid] = &__dma_buffer[local_tid*CUDA_INVOCATION_DMA_BUFFER_SIZE_PER_THREAD/CUDA_INVOCATION_DMA_TRANSFER_SIZE];
	__dma_dest[local_tid] = (dma_element_type*)&((Invocation*)gd_next_invocation_buffer_ptr[target_id * CUDA_INVOCATION_NEXT_BUCKET_SIZE + bucket_id])[invocation_id];
	__dma_size[local_tid] = CUDA_INVOCATION_DMA_BUFFER_SIZE_PER_THREAD;

//	__threadfence_block();

	__barrierArrive(CUDA_DMA_EMPTY_BARRIER, CUDA_DISPATCHER_THREADS_PER_BLOCK);
	__barrierSync(CUDA_DMA_FULL_BARRIER, CUDA_DISPATCHER_THREADS_PER_BLOCK);

//	__dma_size[local_tid] = 0;
}

__device__ void __completeDMA()
{
	__dma_size[threadIdx.x - CUDA_DMA_THREADS_PER_BLOCK] = 0;

//	__threadfence_block();

	__barrierArrive(CUDA_DMA_EMPTY_BARRIER, CUDA_DISPATCHER_THREADS_PER_BLOCK);
//	__barrierSync(CUDA_DMA_FULL_BARRIER, CUDA_DISPATCHER_THREADS_PER_BLOCK);
}

}

__device__ void daemonize()
{
    internal::__control_flags->daemonized = true;
}

__device__ void exit(int32 exit_code)
{
    internal::__control_flags->explicit_exited = true;
    internal::__control_flags->explicit_exit_code = exit_code;
}

__device__ int32 __getCurrentInvocationId()
{
	//
	// 0, 1, ..., CUDA_DMA_THREADS_PER_BLOCK, CUDA_DMA_THREADS_PER_BLOCK+1, ..., CUDA_DMA_THREADS_PER_BLOCK+CUDA_COMPUTE_THREADS_PER_BLOCK
	// <----------DMA threads---------------> <---------------------------------compute threads------------------------------------------>
	//
	int32 local_id = threadIdx.x - CUDA_DMA_THREADS_PER_BLOCK;
	int32 invoke_id = blockIdx.x * CUDA_COMPUTE_THREADS_PER_BLOCK + local_id;
	if(invoke_id >= internal::gd_current_invocation_buffer_size)
		return -1;
	else
		return local_id;
}

//__device__ int64 __getCurrentFunctionId(char* shm, int32 invocation_id)
__device__ int64 __getCurrentFunctionId(int32 invocation_id)
{

	return *(int64*)(((char*)internal::__parameter_shm) + invocation_id * CUDA_INVOCATION_PARAMETER_SIZE);
}

//__device__ int64 __getCurrentSessionId(char* shm, int32 invocation_id)
__device__ int64 __getCurrentSessionId(int32 invocation_id)
{
	return *(int64*)(((char*)internal::__parameter_shm) + invocation_id * CUDA_INVOCATION_PARAMETER_SIZE + sizeof(int64));
}

//__device__ char* __getCurrentParameterPtr(char* shm, int32 invocation_id)
__device__ char* __getCurrentParameterPtr(int32 invocation_id)
{
	return (char*)(((char*)internal::__parameter_shm) + invocation_id * CUDA_INVOCATION_PARAMETER_SIZE + sizeof(int64) + sizeof(int64) + sizeof(int64));
}

//__device__ void __setLocalDomainObject(Object* domain)
//{
////    gRuntimeServiceBuffer->setLocalDomainObject(domain);
//}
//
//__device__ void __addDomainObject(int64 session_id, Object* domain)
//{
////    gRuntimeServiceBuffer->addDomainObject(session_id, domain);
//}
//
//__device__ Domain* __findDomainObject(int64 session_id)
//{
////    return (Domain*)gRuntimeServiceBuffer->findDomainObject(session_id);
//}
//
//__device__ void __getDomainCallbacks(int32 event, container::Vector< Lambda1<void, Domain> >* callbacks )
//{
////    gRuntimeServiceBuffer->getDomainCallbacks(event, callbacks);
//}

__device__ void  __setImplicitExitCode(int32 exit_code)
{
    internal::__control_flags->implicit_exit_code = exit_code;
    internal::__control_flags->implicit_exited = true;
}

__device__ int32 __getNextInvocationId(int32 target_id)
{
	int bucket_id = blockIdx.x % CUDA_INVOCATION_NEXT_BUCKET_SIZE;
	int index = target_id * CUDA_INVOCATION_NEXT_BUCKET_SIZE + bucket_id;
	int32 next_invocation_id = atomicAdd(&internal::gd_next_invocation_buffer_index[index], 1);
	if(next_invocation_id >= internal::gd_next_invocation_buffer_size[index])
	{
		// TODO assert here
		return -1;
	}
	return next_invocation_id;
}

__device__ void __setNextFunctionId(int32 target_id, int32 invocation_id, int64 function_id)
{
	using namespace zillians::framework::service;

	int32 local_tid = threadIdx.x - CUDA_DMA_THREADS_PER_BLOCK;
	char* dma_buffer_ptr = (char*)internal::__dma_buffer;
	dma_buffer_ptr += local_tid * CUDA_INVOCATION_DMA_BUFFER_SIZE_PER_THREAD;
	Invocation* invocation = (Invocation*)dma_buffer_ptr;
//	printf("%d (%d): set next function id = %ld (%p, %p, %d)\n", threadIdx.x, blockIdx.x, function_id, (char*)internal::__dma_buffer, invocation, local_tid * CUDA_INVOCATION_DMA_BUFFER_SIZE_PER_THREAD);
	invocation->function_id = function_id;

}

__device__ char* __getNextParameterPtr(int32 target_id, int32 invocation_id)
{
	using namespace zillians::framework::service;

	int32 local_tid = threadIdx.x - CUDA_DMA_THREADS_PER_BLOCK;
	return (char*)(&((Invocation*)(&internal::__dma_buffer[local_tid * CUDA_INVOCATION_DMA_BUFFER_SIZE_PER_THREAD / CUDA_INVOCATION_DMA_TRANSFER_SIZE]))->parameters[0]);
}

__device__ void __invokeFunction(Object* domain, int64 function_id)
{
	//printf("%d: invoke function %p, function id = %ld\n", threadIdx.x, domain, function_id);
	//if(domain)
	{
		//int64 session_id = domain->domain()->session_id;
		//int32 target_id = session_id >> 32;
		int32 target_id = 0;

		int32 invocation_id = __getNextInvocationId(target_id);
//		printf("%d: next invocation id = %d\n", threadIdx.x, invocation_id);

		__setNextFunctionId(target_id, invocation_id, function_id);

//		printf("%d: before start DMA\n", threadIdx.x);
		internal::__startDMA(target_id, invocation_id);
	}
}

} }


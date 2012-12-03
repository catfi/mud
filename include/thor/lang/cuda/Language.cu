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
#include <stdio.h>

namespace thor {

namespace lang {

namespace internal {

//#define CEILING(x,y) (((x) + (y) - 1) / (y))

//#define MAX_OBJECT_COUNT 32*32*32*32  // 1M objects
//#define TOTAL_FLAGS  (1+32+32*32+32*32*32)

const int64_t cMagicNumber = 0xFFEEFFAABBEE9933;

struct TrackerHeader
{
	uint64 epoch;
    uint64 type_id;
    uint64 session_id;
    uint64 database_id;
    uint32 allocation_level; // TODO change to size
	uint32 allocation_index;
	char* ptr;
	bool is_valid;
};

struct ObjectHeader
{
    int64 magic_number;
    TrackerHeader* tracker_ptr;
};

struct Block64 {
	uint64 t0;
	uint64 t1;
	uint64 t2;
	uint64 t3;
	uint64 t4;
	uint64 t5;
	uint64 t6;
	uint64 t7;
};

struct Block128 {
	uint64 t0;
	uint64 t1;
	uint64 t2;
	uint64 t3;
	uint64 t4;
	uint64 t5;
	uint64 t6;
	uint64 t7;
	uint64 t8;
	uint64 t9;
	uint64 t10;
	uint64 t11;
	uint64 t12;
	uint64 t13;
	uint64 t14;
	uint64 t15;
};

__device__ TrackerHeader* header_blocks;
__device__ uint32* header_bit_flags; // size = 1 + 32 + 32*32 + 32*32*32

__global__ void __configureHeaderBlocksKernel(TrackerHeader* blocks, uint32* bit_flags)
{
	header_blocks = blocks;
	header_bit_flags = bit_flags;
}

void __configureHeaderBlocks(TrackerHeader* blocks, uint32* bit_flags)
{
	__configureHeaderBlocksKernel<<<1,1>>>(blocks, bit_flags);
}

__device__ Block64* b64_blocks;
__device__ uint32* b64_bit_flags; // size = 1 + 32 + 32*32 + 32*32*32

__global__ void __configureBlocksB64Kernel(Block64* blocks, uint32* bit_flags)
{
	b64_blocks = blocks;
	b64_bit_flags = bit_flags;
}

void __configureBlocksB64(Block64* blocks, uint32* bit_flags)
{
	__configureBlocksB64Kernel<<<1,1>>>(blocks, bit_flags);
}

__device__ Block128* b128_blocks;
__device__ uint32* b128_bit_flags; // size = 1 + 32 + 32*32 + 32*32*32

__global__ void __configureBlocksB128Kernel(Block128* blocks, uint32* bit_flags)
{
	b128_blocks = blocks;
	b128_bit_flags = bit_flags;
}

void __configureBlocksB128(Block128* blocks, uint32* bit_flags)
{
	__configureBlocksB128Kernel<<<1,1>>>(blocks, bit_flags);
}

#define ATOMIC_CASCADE_FLAGS 1

template<typename T>
__device__ T* __allocateBlock(uint32* bit_flags, T* blocks)
{
	// TODO rewrite in PTX assembly to further improve the performance
	uint32 tid = blockDim.x * blockIdx.x + threadIdx.x;

	uint32 f0 = bit_flags[0];
	uint32 f0t;
	uint32 msb0;

	f0t = (tid & 0x1U) ? __brev(f0) : f0;

	while(true)
	{
		asm("bfind.u32 %0, %1;\n\t" : "=r"(msb0) : "r"(f0t));

		if(msb0 == 0xFFFFFFFF)
			break;
		else
		{
			if(tid & 0x1U) msb0 = 31 - msb0;

			uint32 offset1 = 1 + msb0;
			uint32 f1 = bit_flags[offset1];
			uint32 f1t;
			uint32 msb1;

			f1t = (tid & 0x2U) ? __brev(f1) : f1;

			while(true)
			{
				asm("bfind.u32 %0, %1;\n\t" : "=r"(msb1) : "r"(f1t));

				if(msb1 == 0xFFFFFFFF)
					break;
				else
				{
					if(tid & 0x2U) msb1 = 31 - msb1;

					uint32 offset2 = 1 + 32 + msb0 * 32 + msb1;
					uint32 f2 = bit_flags[offset2];
					uint32 f2t;
					uint32 msb2;

					f2t = (tid & 0x4U) ? __brev(f2) : f2;

					while(true)
					{
						asm("bfind.u32 %0, %1;\n\t" : "=r"(msb2) : "r"(f2t));

						if(msb2 == 0xFFFFFFFF)
							break;
						else
						{
							if(tid & 0x4U) msb2 = 31 - msb2;

							uint32 offset3 = 1 + 32 + 32 * 32 + msb0 * 32 * 32 + msb1 * 32 + msb2;
							uint32 f3 = bit_flags[offset3];
							uint32 f3t;
							uint32 msb3;

							f3t = (tid & 0x8U) ? __brev(f3) : f3;

							while(true)
							{
								asm("bfind.u32 %0, %1;\n\t" : "=r"(msb3) : "r"(f3t));

								if(msb3 == 0xFFFFFFFF)
									break;
								else
								{
									if(tid & 0x8U) msb3 = 31 - msb3;

									uint32 index = 32 * 32 * 32 * msb0 + 32 * 32 * msb1 + 32 * msb2 + msb3;
									uint32 mask = 0xFFFFFFFF ^ (0x1U << (msb3));
									//printf("[%d] index = %d, mask = %x\n", tid, index, mask);

									uint32 old_flag = atomicAnd(&bit_flags[offset3], mask);
									uint32 result = old_flag & (~mask);
									if(result != 0x0U)
									{
										//printf("%d -> %d -> (%02d, %02d, %02d, %02d)\n", tid, index, msb0, msb1, msb2, msb3);
										//printf("%d: allocated msb0 = %u, offset1 = %u, f1t = %u, msb1 = %u, offset2 = %u, f2t = %u, msb2 = %u, offset3 = %u, f3t = %u, msb3 = %u, mask = %x\n", tid, msb0, offset1, f1t, msb1, offset2, f2t, msb2, offset3, f3t, msb3, mask);
										return &blocks[index];
									}
									else
									{
										//printf("%d: atomicAnd failed, old_flag = %x, result = %x\n", tid, old_flag, result);
										//f3 = bit_flags[offset3];
										f3 = old_flag;
										f3t = (tid & 0x8U) ? __brev(f3) : f3;
									}
								}
								//f3 ^= 0x1U << (msb3);
							}
#if !ATOMIC_CASCADE_FLAGS
							if(tid & 0x4U) msb2 = 31 - msb2;
#endif
						}

#if ATOMIC_CASCADE_FLAGS
						f2 ^= 0x1U << (msb2);
						uint32 t = atomicAnd(&bit_flags[offset2], f2);
						f2 = t & f2;
						f2t = (tid & 0x4U) ? __brev(f2) : f2;
#else
						f2t ^= 0x1U << (msb2);
#endif
					}
#if !ATOMIC_CASCADE_FLAGS
					if(tid & 0x2U) msb1 = 31 - msb1;
#endif
				}

#if ATOMIC_CASCADE_FLAGS
				f1 ^= 0x1U << (msb1);
				uint32 t = atomicAnd(&bit_flags[offset1], f1);
				f1 = t & f1;
				f1t = (tid & 0x2U) ? __brev(f1) : f1;
#else
				f1t ^= 0x1U << (msb1);
#endif
			}

#if !ATOMIC_CASCADE_FLAGS
			if(tid & 0x1U) msb0 = 31 - msb0;
#endif
		}

#if ATOMIC_CASCADE_FLAGS
		f0 ^= 0x1U << (msb0);
		uint32 t = atomicAnd(&bit_flags[0], f0);
		f0 = t & f0;
		f0t = (tid & 0x1U) ? __brev(f0) : f0;
#else
		f0t ^= 0x1U << (msb0);
#endif
	}

	return NULL;
}

template<typename T>
__device__ void __deallocateBlock(uint32* bit_flags, T* blocks, T* block)
{
	//uint32 tid = blockDim.x * blockIdx.x + threadIdx.x;

	uint32 index = (uint32)(block - &blocks[0]);
#if ATOMIC_CASCADE_FLAGS
	uint32 local_offset3 = (index / 32);
	uint32 local_offset2 = (local_offset3 / 32);
	uint32 local_offset1 = (local_offset2 / 32);
	//uint32 local_offset0 = (local_offset1 / 32);

	uint32 msb3 = index % 32;
	uint32 msb2 = local_offset3 % 32;
	uint32 msb1 = local_offset2 % 32;
	uint32 msb0 = local_offset1 % 32;
	uint32 local_mask3 = 0x1U << msb3;
	uint32 local_mask2 = 0x1U << msb2;
	uint32 local_mask1 = 0x1U << msb1;
	uint32 local_mask0 = 0x1U << msb0;

	uint32 offset0 = 0;
	uint32 offset1 = 1 + local_offset1;
	uint32 offset2 = 1 + 32 + local_offset2;
	uint32 offset3 = 1 + 32 + 32 * 32 + local_offset3;
	//printf("%d: deallocated msb0 = %u, offset1 = %u, msb1 = %u, offset2 = %u, msb2 = %u, offset3 = %u, msb3 = %u, mask = %x\n", tid, msb0, offset1, msb1, offset2, msb2, offset3, msb3, local_mask3);
	atomicOr(&bit_flags[offset0], local_mask0);
	atomicOr(&bit_flags[offset1], local_mask1);
	atomicOr(&bit_flags[offset2], local_mask2);
	atomicOr(&bit_flags[offset3], local_mask3);
#else
	uint32_t bucket = index / 32;
	uint32_t mask = 0x1 << (index % 32);
	uint32_t offset3 = 1 + 32 + 32 * 32 + bucket;
	atomicOr(&bit_flags[offset3], mask);
#endif
}

__device__ char* global_heap;
__device__ uint32 global_heap_size;
__device__ uint32 global_heap_bucket_size;
__device__ uint32* global_heap_bucket;
__device__ uint32* global_heap_bucket_offset;
__device__ unsigned long long int global_heap_next_offset;

__global__ void __configureGlobalHeapKernel(char* heap, uint32 heap_size, uint32* heap_bucket, uint32 heap_bucket_size, uint32* heap_bucket_offset, unsigned long long int heap_next_offset)
{
	global_heap = heap;
	global_heap_size = heap_size;
	global_heap_bucket_size = heap_bucket_size;
	global_heap_bucket = heap_bucket;
	global_heap_bucket_offset = heap_bucket_offset;
	global_heap_next_offset = heap_next_offset;
}

// exported and will be called from object service
void __configureGlobalHeap(char* heap, uint32 heap_size, uint32* heap_bucket, uint32 heap_bucket_size, uint32* heap_bucket_offset, unsigned long long int heap_next_offset)
{
	__configureGlobalHeapKernel<<<1,1>>>(
			heap,
			heap_size,
			heap_bucket,
			heap_bucket_size,
			heap_bucket_offset,
			heap_next_offset);
}

__device__ char* __allocateFromGlobalHeap(uint32 size, TrackerHeader* header)
{
	//uint32 tid = blockDim.x * blockIdx.x + threadIdx.x;

	//size += sizeof(uint64);
	size = (size+127) & (~0x7f); // round-up to next multiple of 128 to avoid false cache line sharing
	//printf("%d -> allocate %d bytes\n", tid, size);
	unsigned long long int offset_mask = (0x1ULL << 32) | size;
//	printf("%d -> mask = %llu\n", tid, offset_mask);
	unsigned long long int offset = atomicAdd(&global_heap_next_offset, offset_mask);

	// TODO check overflow
	uint32 last_allocated_size = (uint32)((offset << 32) >> 32);
	uint32 last_bucket_index = (uint32)(offset >> 32);

//	printf("%d -> last_allocated_size = %u, last_bucket_index = %u\n", tid, last_allocated_size, last_bucket_index);
	if((unsigned long long int)last_allocated_size + (unsigned long long int)size > (unsigned long long int)global_heap_size || last_bucket_index >= global_heap_bucket_size)
	{
		// TODO ?
		//printf("ERROR!!!\n");
		//atomicSub(&global_heap_next_offset, offset_mask);
		return NULL;
	}
	else
	{
		char* allocated_ptr = global_heap + last_allocated_size;
		global_heap_bucket[last_bucket_index] = size / 128;
		global_heap_bucket_offset[last_bucket_index] = last_allocated_size / 128;
		header->allocation_index = last_bucket_index;
		return allocated_ptr;
	}
}

__device__ void __deallocateFromGlobalHeap(char* ptr)
{
	global_heap_bucket[((ObjectHeader*)ptr)->tracker_ptr->allocation_index] = 0;
}

}

__device__ Object* __createObject(int64 size, int64 type_id)
{
	using namespace internal;

	//printf("header_bit_flags = %p\nheader_blocks = %p\n", header_bit_flags, header_blocks);
	TrackerHeader* header = __allocateBlock<TrackerHeader>(header_bit_flags, header_blocks);
	if(!header) return NULL;

	header->type_id = type_id;

	size += sizeof(ObjectHeader);

	char* memory_block = NULL;
	if(size <= 64)
	{
		header->allocation_level = 0;
		memory_block = (char*)__allocateBlock<Block64>(b64_bit_flags, b64_blocks);
	}
	else if(size <= 128)
	{
		header->allocation_level = 1;
		memory_block = (char*)__allocateBlock<Block128>(b128_bit_flags, b128_blocks);
	}
	else
	{
		header->allocation_level = 2;
		memory_block = __allocateFromGlobalHeap(size, header);
	}

	((ObjectHeader*)memory_block)->magic_number = cMagicNumber;
	((ObjectHeader*)memory_block)->tracker_ptr = header;

	header->ptr = memory_block;
	Object* result = (Object*)(memory_block + sizeof(ObjectHeader));

	//printf("creating object, size = %ld, type = %ld, ptr = %p\n", size, type_id, result);

	return result;
}


__device__ void __destroyObject(Object* object)
{
	using namespace internal;

	char* ptr = (char*)object;
	char* memory_block = ptr - sizeof(ObjectHeader);
	TrackerHeader* header = ((ObjectHeader*)memory_block)->tracker_ptr;

	// deallocate the physical memory
	if(header->allocation_level == 0)
	{
		__deallocateBlock<Block64>(b64_bit_flags, b64_blocks, (Block64*)memory_block);
	}
	else if(header->allocation_level == 1)
	{
		__deallocateBlock<Block128>(b128_bit_flags, b128_blocks, (Block128*)memory_block);
	}
	else
	{
		__deallocateFromGlobalHeap(memory_block);
	}

	// deallocate the tracker header
	__deallocateBlock<TrackerHeader>(header_bit_flags, header_blocks, header);
}


__device__ Object::Object() : mInternalDomain(NULL)
{

}

__device__ Object::~Object()
{ }

__device__ Object* Object::clone()
{
	return NULL;
}

__device__ int64 Object::hash()
{
	return 0LL;
}

__device__ Domain* Object::domain()
{
	return NULL;
}

} }

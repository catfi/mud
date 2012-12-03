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

#ifndef THOR_LANG_PROCESS_CUH_
#define THOR_LANG_PROCESS_CUH_

#include "Thor.cuh"
//#include "thor/lang/cudaLanguage.h"
//#include "thor/lang/cudaDomain.h"
//#include "thor/lang/cudaLambda.h"
//#include "thor/container/cudaVector.h"

namespace thor { namespace lang {

extern __device__ void daemonize();
extern __device__ void exit(int32 exit_code);

extern __device__ int32 __getCurrentInvocationId();
extern __device__ int64 __getCurrentFunctionId(int32 invocation_id);
extern __device__ int64 __getCurrentSessionId(int32 invocation_id);
extern __device__ char* __getCurrentParameterPtr(int32 invocation_id);
extern __device__ void  __setExitCode(int32 exit_code);
//extern __device__ void  __setLocalDomainObject(Object* domain);
//extern __device__ void  __addDomainObject(int64 session_id, Object* domain);
//extern __device__ Domain* __findDomainObject(int64 session_id);
//extern __device__ void __getDomainCallbacks(int32 event, container::Vector< Lambda1<void, Domain> >* callbacks);

extern __device__ int32 __getNextInvocationId(int32 target_id);
extern __device__ void __setNextFunctionId(int32 target_id, int32 invocation_id, int64 function_id);
extern __device__ char* __getNextParameterPtr(int32 target_id, int32 invocation_id);

//extern __device__ void __invokeFunction(Object* domain, int64 function_id);

//template<typename A>
//__device__ void __invokeFunction(Object* domain, int64 function_id, A a)
//{
//	if(domain)
//	{
//		int64 session_id = domain->domain()->session_id;
//		int32 target_id = session_id >> 32;
//
//		int32 invocation_id = __getNextInvocationId(target_id);
//		__setNextFunctionId(target_id, invocation_id, function_id);
//		char* ptr = __getNextParameterPtr(target_id, invocation_id);
//
//		*((A*)ptr) = a;
//		ptr += sizeof(A);
//	}
//}
//
//template<typename A, typename B>
//void __invokeFunction(Object* domain, int64 function_id, A a, B b)
//{
//	if(domain)
//	{
//		int64 session_id = domain->domain()->session_id;
//		int32 target_id = session_id >> 32;
//
//		int32 invocation_id = __getNextInvocationId(target_id);
//		__setNextFunctionId(target_id, invocation_id, function_id);
//		char* ptr = __getNextParameterPtr(target_id, invocation_id);
//
//		*((A*)ptr) = a;
//		ptr += sizeof(A);
//		*((B*)ptr) = b;
//		ptr += sizeof(B);
//	}
//}
//
//template<typename A, typename B, typename C>
//void __invokeFunction(Object* domain, int64 function_id, A a, B b, C c)
//{
//	if(domain)
//	{
//		int64 session_id = domain->domain()->session_id;
//		int32 target_id = session_id >> 32;
//
//		int32 invocation_id = __getNextInvocationId(target_id);
//		__setNextFunctionId(target_id, invocation_id, function_id);
//		char* ptr = __getNextParameterPtr(target_id, invocation_id);
//
//		*((A*)ptr) = a;
//		ptr += sizeof(A);
//		*((B*)ptr) = b;
//		ptr += sizeof(B);
//		*((C*)ptr) = c;
//		ptr += sizeof(C);
//	}
//}
//
//template<typename A, typename B, typename C, typename D>
//void __invokeFunction(Object* domain, int64 function_id, A a, B b, C c, D d)
//{
//	if(domain)
//	{
//		int64 session_id = domain->domain()->session_id;
//		int32 target_id = session_id >> 32;
//
//		int32 invocation_id = __getNextInvocationId(target_id);
//		__setNextFunctionId(target_id, invocation_id, function_id);
//		char* ptr = __getNextParameterPtr(target_id, invocation_id);
//
//		*((A*)ptr) = a;
//		ptr += sizeof(A);
//		*((B*)ptr) = b;
//		ptr += sizeof(B);
//		*((C*)ptr) = c;
//		ptr += sizeof(C);
//		*((D*)ptr) = d;
//		ptr += sizeof(D);
//	}
//}
//
//template<typename A, typename B, typename C, typename D, typename E>
//void __invokeFunction(Object* domain, int64 function_id, A a, B b, C c, D d, E e)
//{
//	if(domain)
//	{
//		int64 session_id = domain->domain()->session_id;
//		int32 target_id = session_id >> 32;
//
//		int32 invocation_id = __getNextInvocationId(target_id);
//		__setNextFunctionId(target_id, invocation_id, function_id);
//		char* ptr = __getNextParameterPtr(target_id, invocation_id);
//
//		*((A*)ptr) = a;
//		ptr += sizeof(A);
//		*((B*)ptr) = b;
//		ptr += sizeof(B);
//		*((C*)ptr) = c;
//		ptr += sizeof(C);
//		*((D*)ptr) = d;
//		ptr += sizeof(D);
//		*((E*)ptr) = e;
//		ptr += sizeof(E);
//	}
//}
//
//template<typename A, typename B, typename C, typename D, typename E, typename F>
//void __invokeFunction(Object* domain, int64 function_id, A a, B b, C c, D d, E e, F f)
//{
//	if(domain)
//	{
//		int64 session_id = domain->domain()->session_id;
//		int32 target_id = session_id >> 32;
//
//		int32 invocation_id = __getNextInvocationId(target_id);
//		__setNextFunctionId(target_id, invocation_id, function_id);
//		char* ptr = __getNextParameterPtr(target_id, invocation_id);
//
//		*((A*)ptr) = a;
//		ptr += sizeof(A);
//		*((B*)ptr) = b;
//		ptr += sizeof(B);
//		*((C*)ptr) = c;
//		ptr += sizeof(C);
//		*((D*)ptr) = d;
//		ptr += sizeof(D);
//		*((E*)ptr) = e;
//		ptr += sizeof(E);
//		*((F*)ptr) = f;
//		ptr += sizeof(F);
//	}
//}
//
//template<typename A, typename B, typename C, typename D, typename E, typename F, typename G>
//void __invokeFunction(Object* domain, int64 function_id, A a, B b, C c, D d, E e, F f, G g)
//{
//	if(domain)
//	{
//		int64 session_id = domain->domain()->session_id;
//		int32 target_id = session_id >> 32;
//
//		int32 invocation_id = __getNextInvocationId(target_id);
//		__setNextFunctionId(target_id, invocation_id, function_id);
//		char* ptr = __getNextParameterPtr(target_id, invocation_id);
//
//		*((A*)ptr) = a;
//		ptr += sizeof(A);
//		*((B*)ptr) = b;
//		ptr += sizeof(B);
//		*((C*)ptr) = c;
//		ptr += sizeof(C);
//		*((D*)ptr) = d;
//		ptr += sizeof(D);
//		*((E*)ptr) = e;
//		ptr += sizeof(E);
//		*((F*)ptr) = f;
//		ptr += sizeof(F);
//		*((G*)ptr) = g;
//		ptr += sizeof(G);
//	}
//}
//
//template<typename A, typename B, typename C, typename D, typename E, typename F, typename G, typename H>
//void __invokeFunction(Object* domain, int64 function_id, A a, B b, C c, D d, E e, F f, G g, H h)
//{
//	if(domain)
//	{
//		int64 session_id = domain->domain()->session_id;
//		int32 target_id = session_id >> 32;
//
//		int32 invocation_id = __getNextInvocationId(target_id);
//		__setNextFunctionId(target_id, invocation_id, function_id);
//		char* ptr = __getNextParameterPtr(target_id, invocation_id);
//
//		*((A*)ptr) = a;
//		ptr += sizeof(A);
//		*((B*)ptr) = b;
//		ptr += sizeof(B);
//		*((C*)ptr) = c;
//		ptr += sizeof(C);
//		*((D*)ptr) = d;
//		ptr += sizeof(D);
//		*((E*)ptr) = e;
//		ptr += sizeof(E);
//		*((F*)ptr) = f;
//		ptr += sizeof(F);
//		*((G*)ptr) = g;
//		ptr += sizeof(G);
//		*((H*)ptr) = h;
//		ptr += sizeof(H);
//	}
//}
//
//template<typename A, typename B, typename C, typename D, typename E, typename F, typename G, typename H, typename I>
//void __invokeFunction(Object* domain, int64 function_id, A a, B b, C c, D d, E e, F f, G g, H h, I i)
//{
//	if(domain)
//	{
//		int64 session_id = domain->domain()->session_id;
//		int32 target_id = session_id >> 32;
//
//		int32 invocation_id = __getNextInvocationId(target_id);
//		__setNextFunctionId(target_id, invocation_id, function_id);
//		char* ptr = __getNextParameterPtr(target_id, invocation_id);
//
//		*((A*)ptr) = a;
//		ptr += sizeof(A);
//		*((B*)ptr) = b;
//		ptr += sizeof(B);
//		*((C*)ptr) = c;
//		ptr += sizeof(C);
//		*((D*)ptr) = d;
//		ptr += sizeof(D);
//		*((E*)ptr) = e;
//		ptr += sizeof(E);
//		*((F*)ptr) = f;
//		ptr += sizeof(F);
//		*((G*)ptr) = g;
//		ptr += sizeof(G);
//		*((H*)ptr) = h;
//		ptr += sizeof(H);
//		*((I*)ptr) = i;
//		ptr += sizeof(I);
//	}
//}
//
//template<typename A, typename B, typename C, typename D, typename E, typename F, typename G, typename H, typename I, typename J>
//void __invokeFunction(Object* domain, int64 function_id, A a, B b, C c, D d, E e, F f, G g, H h, I i, J j)
//{
//	if(domain)
//	{
//		int64 session_id = domain->domain()->session_id;
//		int32 target_id = session_id >> 32;
//
//		int32 invocation_id = __getNextInvocationId(target_id);
//		__setNextFunctionId(target_id, invocation_id, function_id);
//		char* ptr = __getNextParameterPtr(target_id, invocation_id);
//
//		*((A*)ptr) = a;
//		ptr += sizeof(A);
//		*((B*)ptr) = b;
//		ptr += sizeof(B);
//		*((C*)ptr) = c;
//		ptr += sizeof(C);
//		*((D*)ptr) = d;
//		ptr += sizeof(D);
//		*((E*)ptr) = e;
//		ptr += sizeof(E);
//		*((F*)ptr) = f;
//		ptr += sizeof(F);
//		*((G*)ptr) = g;
//		ptr += sizeof(G);
//		*((H*)ptr) = h;
//		ptr += sizeof(H);
//		*((I*)ptr) = i;
//		ptr += sizeof(I);
//		*((J*)ptr) = j;
//		ptr += sizeof(J);
//	}
//}

} }

#endif /* THOR_LANG_PROCESS_CUH_ */

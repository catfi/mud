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

#ifndef THOR_LANG_LANGUAGE_CUH_
#define THOR_LANG_LANGUAGE_CUH_

#include "Thor.cuh"

namespace thor { namespace lang {

class Domain;

class Object
{
public:
	__device__ Object();
	__device__ virtual ~Object();

public:
	__device__ virtual Object* clone();
	__device__ virtual int64 hash();
	__device__ Domain* domain();

protected:
	Domain* mInternalDomain;
};


__device__ Object* __createObject(int64 size, int64 type_id);
__device__ void __destroyObject( Object* object );
//void __destroyObjectInternal( Object* object );
//Object* __getSessionObject(int64 session_id);
//void __setSessionObject(int64 session_id, Object* object);
//
//// garbage collection related
//bool __addToRootSet(Object* object);
//bool __removeFromRootSet(Object* object);
//bool __addToGlobalRootSet(thor::int8* reference);
//bool __removeFromGlobalRootSet(thor::int8* reference);
//bool __addToLLVMGCRootSet(thor::int8* llvm_gc_root);
//bool __removeFromLLVMGCRootSet(thor::int8* llvm_gc_root);

} }

#endif /* THOR_LANG_LANGUAGE_CUH_ */

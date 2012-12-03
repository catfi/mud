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

#include "thor/lang/Language.h"
#include "thor/lang/Domain.h"
#include "thor/lang/Process.h"
#include "framework/service/runtime/RuntimeServiceBuffer.h"
#include "framework/service/runtime/RuntimeServiceBufferMT.h"
#include "framework/service/object/ObjectServiceBufferMT.h"
#include "framework/service/object/gc/GarbageCollectorBufferMT.h"

namespace thor {

extern zillians::framework::service::ObjectServiceBufferMT* gObjectServiceBuffer;
extern zillians::framework::service::GarbageCollectorBuffer* gGCBuffer;

namespace lang {

Object::Object() : mInternalDomain(NULL) {
}

Object::~Object() {
}

Object* Object::clone()
{
    return this;
}

int64 Object::hash()
{
    return (int64)this;
}

Domain* Object::domain()
{
    return mInternalDomain;
}

Object* __createObject(int64 size, int64 type_id)
{
    int32 invocation_id = __getCurrentInvocationId();
    int64 session_id = (invocation_id == -1) ? 0 : __getCurrentSessionId(invocation_id);
    return (Object*)gObjectServiceBuffer->create(size, type_id, session_id, -1);
}


void __destroyObject( Object* object )
{
    if( gGCBuffer )
        return;
    
    Object** obj = new Object*[1];
    obj[0] = object;
    __destroyObjectInternal(1, reinterpret_cast<int8**>(obj));
}

void __destroyObjectInternal(int32 count, int8** objects )
{
    Object** p = reinterpret_cast<Object**>(objects);

    for (uint32 i = 0; i < count; i++)
    {
        Object* object = p[i];
        object->~Object();
    }

    gObjectServiceBuffer->destroy(count, reinterpret_cast<byte**>(objects) ); 

    // Note that the objects are dynamic allocated in runtime service
    delete [] objects;
}

Object* __getSessionObject(int64 session_id)
{
    return (Object*)gObjectServiceBuffer->getSessionObject(session_id);
}

void __setSessionObject(int64 session_id, Object* object)
{
    gObjectServiceBuffer->setSessionObject(session_id, (byte*)object);
}


bool __addToRootSet(Object* object)
{
	if(!gGCBuffer) return true;

	using namespace zillians::framework::service;
	auto tracker = ((ObjectHeader*)GET_RAW_BUFFER(object))->tracker_ptr;
	return gGCBuffer->addToRootSet<ObjectTrack>(reinterpret_cast<ObjectTrack::ElemType>(tracker));
}

bool __removeFromRootSet(Object* object)
{
	if(!gGCBuffer) return true;

	using namespace zillians::framework::service;
	auto tracker = ((ObjectHeader*)GET_RAW_BUFFER(object))->tracker_ptr;
	return gGCBuffer->removeFromRootSet<ObjectTrack>(reinterpret_cast<ObjectTrack::ElemType>(tracker));
}

bool __addToGlobalRootSet(int8* reference)
{
	if(!gGCBuffer) return true;

	using namespace zillians::framework::service;
	return gGCBuffer->addToRootSet<GlobalObjectTrack>(reinterpret_cast<GlobalObjectTrack::ElemType>(reference));
}

bool __removeFromGlobalRootSet(int8* reference)
{
	if(!gGCBuffer) return true;

	using namespace zillians::framework::service;
	return gGCBuffer->removeFromRootSet<GlobalObjectTrack>(reinterpret_cast<GlobalObjectTrack::ElemType>(reference));
}

bool __addToLLVMGCRootSet(int8* llvm_gc_root)
{
	if(!gGCBuffer) return true;

	using namespace zillians::framework::service;
	return gGCBuffer->addToRootSet<LLVMGCRootTrack>(reinterpret_cast<LLVMGCRootTrack::ElemType>(llvm_gc_root));
}

bool __removeFromLLVMGCRootSet(int8* llvm_gc_root)
{
	if(!gGCBuffer) return true;

	using namespace zillians::framework::service;
	return gGCBuffer->removeFromRootSet<LLVMGCRootTrack>(reinterpret_cast<LLVMGCRootTrack::ElemType>(llvm_gc_root));
}

// dynamic cast
byte* __dynCastImpl(byte* object, int64 target_type_id)
{
    return gObjectServiceBuffer->dynCast(object, target_type_id);
}

} }



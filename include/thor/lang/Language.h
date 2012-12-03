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

#ifndef THOR_LANG_LANGUAGE_H_
#define THOR_LANG_LANGUAGE_H_

#include "Thor.h"

#include <iostream>
#include <cinttypes>

namespace thor { namespace lang {

typedef std::int8_t int8;
typedef std::int16_t int16;
typedef std::int32_t int32;
typedef std::int64_t int64;
typedef float float32;
typedef double float64;

class Domain;

class Object
{
public:
    Object();
    virtual ~Object();

public:
    virtual Object* clone();
    virtual int64 hash();
    Domain* domain();

protected:
    Domain* mInternalDomain;
};


Object* __createObject(int64 size, int64 type_id);
void __destroyObject( Object* object );
void __destroyObjectInternal( int32 count, int8** objects );
Object* __getSessionObject(int64 session_id);
void __setSessionObject(int64 session_id, Object* object);

// garbage collection related
bool __addToRootSet(Object* object);
bool __removeFromRootSet(Object* object);
bool __addToGlobalRootSet(thor::int8* reference);
bool __removeFromGlobalRootSet(thor::int8* reference);
bool __addToLLVMGCRootSet(thor::int8* llvm_gc_root);
bool __removeFromLLVMGCRootSet(thor::int8* llvm_gc_root);

} }

#endif /* THOR_LANG_LANGUAGE_H_ */

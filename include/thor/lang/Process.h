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

#ifndef THOR_LANG_PROCESS_H_
#define THOR_LANG_PROCESS_H_

#include "Thor.h"
#include "thor/lang/Language.h"
#include "thor/lang/Domain.h"
#include "thor/lang/Lambda.h"
#include "thor/container/Vector.h"
#include <type_traits>

namespace thor { namespace lang {

namespace detail {
int32 getTargetId(int64 session_id);
}

void daemonize();
void exit(int32 exit_code);

int32 __getCurrentInvocationId();
void __setCurrentInvocationId(int32 invocation_id);
int64 __getCurrentFunctionId(int32 invocation_id);
int64 __getCurrentSessionId(int32 invocation_id);
char* __getCurrentParameterPtr(int32 invocation_id);
void  __setExitCode(int32 exit_code);
void  __setLocalDomainObject(Object* domain);
void  __addDomainObject(int64 session_id, Object* domain);
Domain* __findDomainObject(int64 session_id);
void __getDomainCallbacks(int32 event, container::Vector< Lambda1<void, Domain> >* callbacks);

int32 __getNextInvocationId(int32 target_id);
void __setNextSessionId(int32 target_id, int32 invocation_id, int64 session_id);
void __setNextFunctionId(int32 target_id, int32 invocation_id, int64 function_id);
char* __getNextParameterPtr(int32 target_id, int32 invocation_id);

void __invokeFunction(Object* domain, int64 function_id, Lambda0<void>* callback);

void escape_point();

template<typename A>
void lock(A a, int32 io1)
{
}

template<typename A, typename B>
void lock(A a, int32 io1, B b, int32 io2)
{
}

template<typename A, typename B, typename C>
void lock(A a, int32 io1, B b, int32 io2, C c, int32 io3)
{
}

template<typename A, typename B, typename C, typename D>
void lock(A a, int32 io1, B b, int32 io2, C c, int32 io3, D d, int32 io4)
{
}

template<typename A, typename B, typename C, typename D, typename E>
void lock(A a, int32 io1, B b, int32 io2, C c, int32 io3, D d, int32 io4, E e, int32 io5)
{
}

template<typename A>
void unlock(A a, int32 io1)
{
}

template<typename A, typename B>
void unlock(A a, int32 io1, B b, int32 io2)
{
}

template<typename A, typename B, typename C>
void unlock(A a, int32 io1, B b, int32 io2, C c, int32 io3)
{
}

template<typename A, typename B, typename C, typename D>
void unlock(A a, int32 io1, B b, int32 io2, C c, int32 io3, D d, int32 io4)
{
}

template<typename A, typename B, typename C, typename D, typename E>
void unlock(A a, int32 io1, B b, int32 io2, C c, int32 io3, D d, int32 io4, E e, int32 io5)
{
}

} }

#endif /* THOR_LANG_PROCESS_H_ */

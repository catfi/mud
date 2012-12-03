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

#include "thor/lang/Process.h"
#include "thor/lang/Domain.h"
#include "thor/lang/Lambda.h"
#include "thor/container/Vector.h"
#include "framework/service/runtime/RuntimeServiceBufferMT.h"
#include "framework/Processor.h"
#include "rstm/api/library.hpp"

namespace thor {

extern zillians::framework::service::RuntimeServiceBufferMT* gRuntimeServiceBuffer;
extern zillians::framework::ProcessorRuntime* gProcessorRuntime;

namespace lang {

namespace detail {

int32 getTargetId(int64 session_id)
{
    return session_id == -1 ? 0 : session_id >> 32;
}

} /* thor::lang::detail */

void daemonize()
{
    gRuntimeServiceBuffer->setDaemonize();
}

void exit(int32 exit_code)
{
    gRuntimeServiceBuffer->setExplicitExitCode(exit_code);
    gRuntimeServiceBuffer->setExplicitExited();
}

int32 __getCurrentInvocationId()
{
	int32 id = gRuntimeServiceBuffer->getCurrentInvocationId();
//	std::cerr << "get current invocation id = " << id << std::endl;
	return id;
}

void __setCurrentInvocationId(int32 invocation_id)
{
//	std::cerr << "set current invocation id = " << invocation_id << std::endl;
    gRuntimeServiceBuffer->setCurrentInvocationId(invocation_id);
}

int64 __getCurrentFunctionId(int32 invocation_id)
{
    int64 id = gRuntimeServiceBuffer->getCurrentInvocation()->getFunctionId(invocation_id);
//    std::cerr << "#" << invocation_id << " function-id = " << id << std::endl;
    return id;
}

int64 __getCurrentSessionId(int32 invocation_id)
{
    return gRuntimeServiceBuffer->getCurrentInvocation()->getSessionId(invocation_id);
}

char* __getCurrentParameterPtr(int32 invocation_id)
{
    return (char*)gRuntimeServiceBuffer->getCurrentInvocation()->getInvocationPtr(invocation_id);
}

void __setLocalDomainObject(Object* domain)
{
    gRuntimeServiceBuffer->setLocalDomainObject(domain);
}

void __addDomainObject(int64 session_id, Object* domain)
{
    gRuntimeServiceBuffer->addDomainObject(session_id, domain);
}

Domain* __findDomainObject(int64 session_id)
{
    return (Domain*)gRuntimeServiceBuffer->findDomainObject(session_id);
}

void __getDomainCallbacks(int32 event, container::Vector< Lambda1<void, Domain> >* callbacks )
{
    gRuntimeServiceBuffer->getDomainCallbacks(event, callbacks);
}

void  __setImplicitExitCode(int32 exit_code)
{
    gRuntimeServiceBuffer->setImplicitExitCode(exit_code);
    gRuntimeServiceBuffer->setImplicitExited();
}

int32 __getNextInvocationId(int32 target_id)
{
	auto next_invocation_buffer = gRuntimeServiceBuffer->getCurrentThreadNextInvocation(target_id);

	int32 id = next_invocation_buffer->getInvocationCount();
	next_invocation_buffer->setInvocationCount(id + 1);

	return id;
}

void __setNextFunctionId(int32 target_id, int32 invocation_id, int64 function_id)
{
	gRuntimeServiceBuffer->getCurrentThreadNextInvocation(target_id)->setFunctionId(invocation_id, function_id);
}

char* __getNextParameterPtr(int32 target_id, int32 invocation_id)
{
	return (char*)gRuntimeServiceBuffer->getCurrentThreadNextInvocation(target_id)->getInvocationPtr(invocation_id);
}

void __setNextSessionId(int32 target_id, int32 invocation_id, int64 session_id)
{
	gRuntimeServiceBuffer->getCurrentThreadNextInvocation(target_id)->setSessionId(invocation_id, session_id);
}

void __invokeFunction(Object* domain, int64 function_id, Lambda0<void>* callback)
{
    if(domain)
    {
        int64 session_id = domain->domain()->session_id;
        int32 target_id = detail::getTargetId(session_id);
        int32 invocation_id = __getNextInvocationId(target_id);
        __setNextSessionId(target_id, invocation_id, session_id);
        __setNextFunctionId(target_id, invocation_id, function_id);

        char* ptr = __getNextParameterPtr(target_id, invocation_id);
        *((Lambda0<void>**)ptr) = callback;
    }
}

void escape_point()
{
    gProcessorRuntime->enterEscapePoint();
}

void __RSTMSystemInitialize()
{
    TM_SYS_INIT();
}

} }

namespace stm {
    template std::int8_t  stm_read<std::int8_t >(std::int8_t *, TxThread*);
    template std::int32_t stm_read<std::int32_t>(std::int32_t*, TxThread*);
    template std::int64_t stm_read<std::int64_t>(std::int64_t*, TxThread*);
    template std::int8_t* stm_read<std::int8_t*>(std::int8_t**, TxThread*);

    template void stm_write<std::int8_t >(std::int8_t *, std::int8_t , TxThread*);
    template void stm_write<std::int32_t>(std::int32_t*, std::int32_t, TxThread*);
    template void stm_write<std::int64_t>(std::int64_t*, std::int64_t, TxThread*);
    template void stm_write<std::int8_t*>(std::int8_t**, std::int8_t*, TxThread*);
}


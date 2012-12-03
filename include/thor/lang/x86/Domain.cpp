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

#include "thor/lang/Domain.h"
#include "thor/lang/Process.h"
#include "framework/service/runtime/RuntimeServiceBufferMT.h"

namespace thor {

extern zillians::framework::service::RuntimeServiceBufferMT* gRuntimeServiceBuffer;

namespace lang {

// TODO implementation note
// the domain can be created through ManagementEngine
// and can be queried through DomainRepository
//
// DomainRepository provides API to add/remove remote Domain configuration
// DomainRepository may use ClusterEngine to monitor memberships of remote Domain (if ClusterEngine is present)
//
// we need to create ProcessorForwarder which sees remote domain id (client id?)
// for every cross-domain call, there's target id and domain id
// by using target id we can look-up a processor to process the request,
// by using domain we know how the request should be forwarded to (if the processor is ProcessorForwarder)
//
// Object can be pushed or pulled from one domain to another in flat or recursive manner
// or send as parameters by using @byval annotation on declared parameters
//
// we can have non-fixed-size invocation buffer?
// slow on GPU but may not be slow on CPU
// (use vote and data shuffle to reduce the overhead and minimize memory transaction?)
//
// TODO think about conversion rank for two templated identifiers
//

//namespace detail {
//
//// since the Domain::create needs to be exported to RuntimeService, we set the callback pointer to RuntimeServiceBuffer to avoid circular link dependency
//__attribute__((constructor))
//static void initDomainCreateCallback()
//{
//	gRuntimeServiceBuffer->setDomainCreateCallback((void*)&Domain::create);
//}
//
//}

Domain::Domain() : session_id(-1), context(NULL)
{
	mInternalDomain = this;
	__addToRootSet(this);
}

Domain::~Domain()
{
}

Domain* Domain::local()
{
	return (Domain*)gRuntimeServiceBuffer->getLocalDomainObject();
}

Domain* Domain::caller()
{
	int64 session_id = __getCurrentSessionId(__getCurrentInvocationId());
	if(session_id == -1)
		return (Domain*)gRuntimeServiceBuffer->getLocalDomainObject();
	else
		return (Domain*)gRuntimeServiceBuffer->findDomainObject(session_id);
}

Object* Domain::getContext()
{
	return context;
}

void Domain::setContext(Object* ctx)
{
	context = ctx;
}

thor::util::UUID* Domain::getId()
{
	return NULL;
}

void Domain::setId(thor::util::UUID* id)
{ }

DomainType Domain::type()
{
	// TODO implement this
	return SingleThreaded;
}

void Domain::setSessionId(int64 id)
{
    session_id = id;
}

//void Domain::watch(DomainEvent e, DomainEventCallback callback)
//{
//	std::cerr << "Domain::watch (static function callback)" << std::endl;
//}

void Domain::watch(int32 e, Lambda1<void, Domain>* callback)
{
	__addToRootSet(callback);
//	std::cerr << "Domain::watch (lambda function callback)" << std::endl;
	gRuntimeServiceBuffer->addDomainEventCallback((int32)e, callback);
}

} }

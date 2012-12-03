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

#include "thor/lang/Domain.cuh"
#include "thor/lang/Process.cuh"

namespace thor { namespace lang {

__device__ Domain::Domain() : session_id(-1), context(NULL)
{
	mInternalDomain = this;
//	__addToRootSet(this);
}

__device__ Domain::~Domain()
{
}

__device__ Domain* Domain::local()
{
//	return (Domain*)gRuntimeServiceBuffer->getLocalDomainObject();
	return NULL;
}

__device__ Domain* Domain::caller()
{
//	int64 session_id = __getCurrentSessionId(__getCurrentInvocationId());
//	if(session_id == -1)
//		return (Domain*)gRuntimeServiceBuffer->getLocalDomainObject();
//	else
//		return (Domain*)gRuntimeServiceBuffer->findDomainObject(session_id);
	return NULL;
}

__device__ Object* Domain::getContext()
{
	return context;
}

__device__ void Domain::setContext(Object* ctx)
{
	context = ctx;
}

//__device__ thor::util::UUID* Domain::getId()
//{
//	return NULL;
//}

//__device__ void Domain::setId(thor::util::UUID* id)
//{ }

__device__ DomainType Domain::type()
{
	// TODO implement this
	return SingleThreaded;
}

__device__ void Domain::setSessionId(int64 id)
{
    session_id = id;
}

//void Domain::watch(DomainEvent e, DomainEventCallback callback)
//{
//	std::cerr << "Domain::watch (static function callback)" << std::endl;
//}

//__device__ void Domain::watch(int32 e, Lambda1<void, Domain>* callback)
//{
//	__addToRootSet(callback);
////	std::cerr << "Domain::watch (lambda function callback)" << std::endl;
//	gRuntimeServiceBuffer->addDomainEventCallback((int32)e, callback);
//}

} }

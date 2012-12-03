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

#ifndef THOR_LANG_DOMAIN_CUH_
#define THOR_LANG_DOMAIN_CUH_

#include "Thor.cuh"
#include "thor/lang/Language.cuh"

namespace thor { namespace lang {

enum DomainType {
	SingleThreaded,
	MultiThreaded,
	Accelerator,
};

enum DomainEvent {
	Connected,
	Disconnected,
	Unreachable,
	Resumed,
	Crashed,
};

class Domain : public Object
{
	__device__ Domain();
public:
	__device__ virtual ~Domain();

public:
	__device__ static Domain* create();
	__device__ static Domain* local();
	__device__ static Domain* caller();

public:
	__device__ Object* getContext();
	__device__ void setContext(Object* ctx);

public:
//	__device__ void setId(thor::util::UUID* id);
//	__device__ thor::util::UUID* getId();
	__device__ DomainType type();

	__device__ void setSessionId(int64 id);

public:
//	typedef void (*DomainEventCallback)(Domain*);
//	static void watch(DomainEvent e, DomainEventCallback callback);
//	__device__ static void watch(int32 e, Lambda1<void, Domain>* callback);

public:
	int64 session_id;
	Object* context;
};

} }

#endif /* THOR_LANG_DOMAIN_CUH_ */

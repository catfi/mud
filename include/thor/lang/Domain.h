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

#ifndef THOR_LANG_DOMAIN_H_
#define THOR_LANG_DOMAIN_H_

#include "Thor.h"
#include "thor/lang/Language.h"
#include "thor/lang/Lambda.h"
#include "thor/container/Vector.h"
#include "thor/util/UUID.h"

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
	Domain();
public:
	virtual ~Domain();

public:
	static Domain* create();
	static Domain* local();
	static Domain* caller();

public:
	Object* getContext();
	void setContext(Object* ctx);

public:
	void setId(thor::util::UUID* id);
	thor::util::UUID* getId();
	DomainType type();

    void setSessionId(int64 id);

public:
//	typedef void (*DomainEventCallback)(Domain*);
//	static void watch(DomainEvent e, DomainEventCallback callback);
	static void watch(int32 e, Lambda1<void, Domain>* callback);

public:
	int64 session_id;
	Object* context;
};

} }

#endif /* THOR_LANG_DOMAIN_H_ */

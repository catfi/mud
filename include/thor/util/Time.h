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

#ifndef THOR_UTIL_TIME_H_
#define THOR_UTIL_TIME_H_

#include "Thor.h"
#include "thor/lang/Language.h"

#ifdef __THOR_PLATFORM_LINUX__
#include <time.h>
#include <sys/timeb.h>
#include <sys/time.h>
#endif

#ifdef __THOR_PLATFORM_MAC__
#include <mach/clock.h>
#include <mach/mach.h>
#endif

namespace thor { namespace util {

class Time : public thor::lang::Object
{
private:
    Time();

public:
	virtual ~Time();

	static Time* current();

	int64 seconds();
	int64 milliseconds();
	int64 microseconds();

private:
    static Time* create();

private:
#ifdef __THOR_PLATFORM_LINUX__
	timespec* ts;
#endif
#ifdef __THOR_PLATFORM_MAC__
	mach_timespec_t* ts;
#endif
};

} }

#endif /* THOR_UTIL_TIME_H_ */

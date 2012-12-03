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

#include "thor/util/Time.h"

namespace thor { namespace util {

Time::Time() : ts(NULL)
{
#ifdef __THOR_PLATFORM_LINUX__
    ts = new timespec();
#endif    
#ifdef __THOR_PLATFORM_MAC__
    ts = new mach_timespec_t();
#endif    
}

Time::~Time()
{
    if (ts) 
    {
        delete ts;
        ts = NULL;
    }
}

Time* Time::current()
{
	Time* t = Time::create();
#ifdef __THOR_PLATFORM_LINUX__
    clock_gettime(CLOCK_REALTIME, t->ts);
#endif
#ifdef __THOR_PLATFORM_MAC__
    clock_serv_t cclock;
    mach_timespec_t ts;
    clock_get_time(cclock, t->ts);
#endif
    return t;
}

int64 Time::seconds()
{
	return milliseconds()/1000;
}

int64 Time::milliseconds()
{
	return microseconds()/1000;
}

int64 Time::microseconds()
{
	uint64_t us = static_cast<uint64_t>(ts->tv_sec)*1000000LL+static_cast<uint64_t>(ts->tv_nsec)/1000LL;
	return us;
}

} }

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

#ifndef THOR_UTIL_UUID_H_
#define THOR_UTIL_UUID_H_

#include "Thor.h"
#include "thor/lang/Language.h"
#include "thor/lang/String.h"

namespace thor { namespace util {

#define ENABLE_CASE_INSENSITIVE_UUID

struct UUID : public thor::lang::Object
{
public:
    UUID();
    UUID(thor::lang::String* text);
    virtual ~UUID();

public:
    bool valid() const;
    bool invalid() const;
    void random();
    void invalidate();
    thor::lang::String* toString();

public:
    union
    {
    	unsigned char raw[16];
        uint64 u64[2];
        uint32 u32[4];
        uint16 u16[8];
        int64 i64[2];
        int32 i32[4];
        int16 i16[8];
    } data;
};

} }

#endif /* THOR_UTIL_UUID_H_ */

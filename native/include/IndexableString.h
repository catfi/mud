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

#ifndef INDEXABLE_STRING_H
#define INDEXABLE_STRING_H

#include "Thor.h"
#include "thor/lang/String.h"

namespace util {

class IndexableString : public thor::lang::MutableString
{
public:
    IndexableString();
    virtual ~IndexableString();

    IndexableString* addAscii( thor::int8 a_ascii );
    thor::int64 get( thor::int32 index );
    void set( thor::int32 index, thor::int64 value );
};

}

#endif /* INDEXABLE_STRING_H */

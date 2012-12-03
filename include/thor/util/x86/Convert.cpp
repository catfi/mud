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

#include "Thor.h"
#include "thor/lang/Language.h"
#include "thor/util/Convert.h"

#include <sstream>

using namespace std;

namespace thor { namespace util {

using thor::lang::String;

namespace detail {

    template < typename Dest >
    Dest
    convert_to( String * s ) {

        wstringstream wss;
        wss << *(s->data);

        Dest dest = Dest();
        wss >> dest;
        return dest;
    }

    template <>
    int8
    convert_to( String * s ) {
        return convert_to<int32>( s );
    }

    template <>
    int16
    convert_to( String * s ) {
        return convert_to<int32>( s );
    }
}

int8 Convert::toInt8( String * s )
{
    return detail::convert_to<int8>( s );
}

int16 Convert::toInt16( String * s )
{
    return detail::convert_to<int16>( s );
}

int32 Convert::toInt32( String * s )
{
    return detail::convert_to<int32>( s );
}

int64 Convert::toInt64( String * s )
{
    return detail::convert_to<int64>( s );
}

float32 Convert::toFloat32( String * s )
{
    return detail::convert_to<float32>( s );
}

float64 Convert::toFloat64( String * s )
{
    return detail::convert_to<float64>( s );
}

} }

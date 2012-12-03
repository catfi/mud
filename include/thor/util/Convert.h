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


#ifndef THOR_UTIL_CONVERT_H_
#define THOR_UTIL_CONVERT_H_

#include "Thor.h"
#include "thor/lang/Language.h"
#include "thor/lang/String.h"

namespace thor { namespace util {

class Convert : thor::lang::Object
{
public:
    Convert();
    virtual ~Convert();

    static int8 toInt8( thor::lang::String * );
    static int16 toInt16( thor::lang::String * );
    static int32 toInt32( thor::lang::String * );
    static int64 toInt64( thor::lang::String * );
    static float32 toFloat32( thor::lang::String * );
    static float64 toFloat64( thor::lang::String * );

    static thor::lang::String * toString( int8 );
    static thor::lang::String * toString( int16 );
    static thor::lang::String * toString( int32 );
    static thor::lang::String * toString( int64 );
    static thor::lang::String * toString( float32 );
    static thor::lang::String * toString( float64 );
    
    template < typename Value >
    static thor::lang::String* toString( Value* value )
    {
       return value->toString();
    }

};

} }

#endif /* THOR_UTIL_CONVERT_H_ */


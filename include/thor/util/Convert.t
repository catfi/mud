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

import .= thor.lang;

@cpu
class Convert extends Object
{
    @cpu
    public function new():void { }

    @cpu
    public function delete():void { }
    
    @cpu
    @native
    public static function toInt8( s: String ) : int8;

    @cpu
    @native
    public static function toInt16( s: String ) : int16;

    @cpu
    @native
    public static function toInt32( s: String ) : int32;

    @cpu
    @native
    public static function toInt64( s: String ) : int64;

    @cpu
    @native
    public static function toFloat32( s: String ) : float32;

    @cpu
    @native
    public static function toFloat64( s: String ) : float64;

    @cpu
    private static function buildString<Value>( value: Value ) : String
    {
       var builder : StringBuilder = new StringBuilder();
       builder.append( value );
       return builder.toString();
    }

    @cpu
    public static function toString( v: int8 ) : String
    {
       return buildString( v );
    }

    @cpu
    public static function toString( v: int16 ) : String
    {
       return buildString( v );
    }

    @cpu
    public static function toString( v: int32 ) : String
    {
       return buildString( v );
    }

    @cpu
    public static function toString( v: int64 ) : String
    {
       return buildString( v );
    }

    @cpu
    public static function toString( v: float32 ) : String
    {
       return buildString( v );
    }

    @cpu
    public static function toString( v: float64 ) : String
    {
       return buildString( v );
    }

    @cpu
    @native { include="thor/util/Convert.h" }
    public static function toString<Value>( value: Value ) : String;

}

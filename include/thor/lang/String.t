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

@cpu 
@native
class String extends Object
{
    @cpu 
    @native
    public function new():void;
    
    @cpu 
    @native
    public virtual function delete():void;

    @cpu 
    public static function create():String {
        var obj:String = new String();
		return obj;
    }
    
    @cpu 
    @native
    public function hash():int64;
    
    @cpu 
    @native
    public function isEqual(rhs:String):bool;
    
    @cpu 
    @native
    public function isLessThan(rhs:String):bool;
    
    @cpu 
    @native
    public function length():int32;
    
    @cpu 
    @native
    public function concate(other:String):String;
    
    @cpu 
    @native
    public function find(candidate:String):int32;
    
    @cpu 
    @native
    public function compareTo(other:String):int32;

    @cpu 
    @native
    public function compareToIgnoreCase(other:String):int32;
    
    @cpu 
    @native
    public function endsWith(suffix:String):bool;

    @cpu 
    @native
    public function equals(other:String):bool;
    
    @cpu 
    @native
    public function equalsIgnoreCase(other:String):bool;

    @cpu 
    @native
    public function indexOf(str:String):int32;

    @cpu 
    @native
    public function indexOf(str:String, fromIndex:int32):int32;

    @cpu 
    @native
    public function lastIndexOf(str:String):int32;

    @cpu 
    @native
    public function lastIndexOf(str:String, fromIndex:int32):int32;
    
    @cpu 
    @native
    public function regionMatches(ignoreCase:bool, toffset:int32, other:String, ooffset:int32, len:int32):bool;

    @cpu 
    @native
    public function regionMatches(toffset:int32, other:String, ooffset:int32, len:int32):bool;

    @cpu 
    @native
    public function startsWith(prefix:String):bool;

    @cpu 
    @native
    public function startsWith(prefix:String, toffset:int32):bool;

    @cpu 
    @native
    public function substring(beginIndex:int32):String;
    
    @cpu 
    @native 
    public function substring(beginIndex:int32, endIndex:int32):String;
    
    @cpu 
    @native
    public function toLowerCase():String;

    @cpu 
    @native
    public function toUpperCase():String;

    @cpu 
    @native
    public function trim():String;

    @cpu 
    @native
    public function toString():String;

    @cpu 
    public function __add__( other:int8 ):MutableString
    {  
        return MutableString.create(this).concate( other ); 
    }

    @cpu 
    public function __add__( other:int16 ):MutableString
    {  
        return MutableString.create(this).concate( other ); 
    }

    @cpu 
    public function __add__( other:int32 ):MutableString
    {  
        return MutableString.create(this).concate( other ); 
    }

    @cpu 
    public function __add__( other:int64 ):MutableString
    {  
        return MutableString.create(this).concate( other ); 
    }

    @cpu 
    public function __add__( other:float32 ):MutableString
    {  
        return MutableString.create(this).concate( other ); 
    }

    @cpu 
    public function __add__( other:float64 ):MutableString
    {  
        return MutableString.create(this).concate( other ); 
    }

    @cpu 
    public function __add__( other:String ):MutableString
    {
        return MutableString.create(this).concate( other );
    }

    // dummy placeholder
    @cpu
    private var string_internal:Object;
}

@cpu
@native
class MutableString extends String 
{
    @cpu
    @native
    public function new( s:String ):void;

    @cpu
    @native 
    public function delete():void;

    @cpu
    public static function create( s:String ):MutableString
    {
        var obj:MutableString = new MutableString( s );
		return obj;
    }

    @cpu
    @native 
    public function concate( other:int8 ):MutableString;

    @cpu
    @native 
    public function concate( other:int16 ):MutableString;

    @cpu
    @native 
    public function concate( other:int32 ):MutableString;

    @cpu
    @native 
    public function concate( other:int64 ):MutableString;

    @cpu
    @native 
    public function concate( other:float32 ):MutableString;

    @cpu
    @native 
    public function concate( other:float64 ):MutableString;

    @cpu
    @native 
    public function concate( other:String ):MutableString;

    @cpu
    public function __add__( other:int8 ):MutableString
    {  
        return this.concate( other ); 
    }

    @cpu
    public function __add__( other:int16 ):MutableString
    {  
        return this.concate( other ); 
    }

    @cpu
    public function __add__( other:int32 ):MutableString
    {  
        return this.concate( other ); 
    }

    @cpu
    public function __add__( other:int64 ):MutableString
    {  
        return this.concate( other ); 
    }

    @cpu
    public function __add__( other:float32 ):MutableString
    {  
        return this.concate( other ); 
    }

    @cpu
    public function __add__( other:float64 ):MutableString
    {  
        return this.concate( other ); 
    }

    @cpu
    public function __add__( other:String ):MutableString
    {
        return this.concate( other );
    }

    // dummy placeholder
    @cpu
    private var stream_internal:Object;
}

@cpu 
@native
function __getStringLiteral(symbol_id:int64):String;

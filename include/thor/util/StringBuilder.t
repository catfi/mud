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
 

import . = thor.unmanaged;
import . = thor.lang;

@cpu
@native
class StringBuilder extends Object
{
    @cpu
    @native
    public function new():void;
     
    @cpu
    @native
    public function new(s:String):void;

    @cpu
    @native
    public function delete():void; 
     
    @cpu
    @native
    public function length():int32;
    
    @cpu
    @native
    public function reverse():void;

    @cpu
    @native
    public function toString():String;
    
    @cpu
    @native
    public function toString(start:int32, end:int32):String;
    
    @cpu
    @native
    public function append(v:String):void;

    @cpu
    @native
    public function appendAsCharacter(v:int8):void;

    @cpu
    @native
    public function appendAsCharacter(v:int16):void;

    @cpu
    @native
    public function appendAsCharacter(v:int32):void;

    @cpu
    @native
    public function append(v:int8):void;
    
    @cpu
    @native
    public function append(v:int16):void;

    @cpu
    @native
    public function append(v:int32):void;

    @cpu
    @native
    public function append(v:int64):void;

    @cpu
    @native
    public function append(v:float32):void;

    @cpu
    @native
    public function append(v:float64):void;

    @cpu
    @native
    public function insert(offset:int32, v:String):void;
    
    @cpu
    @native
    public function insert(offset:int32, v:int8):void;
    
    @cpu
    @native
    public function insert(offset:int32, v:int16):void;

    @cpu
    @native
    public function insert(offset:int32, v:int32):void;

    @cpu
    @native
    public function insert(offset:int32, v:int64):void;

    @cpu
    @native
    public function insert(offset:int32, v:float32):void;

    @cpu
    @native
    public function insert(offset:int32, v:float64):void;

    @cpu
    var stream : ptr_<int64>;
}



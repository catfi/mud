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

@cpu
@native { include = "thor/lang/Array.h" }
class ArrayIterator<T> extends Object
{
	@native
    public function new(c : Array<T>) : void ;

	@native
	public virtual function delete() : void;

	@native
    public function hasNext() : bool ;

	@native
    public function next() : bool ;

	@native
    public function get() : T ;

	public static function create(c : Array<T>) : ArrayIterator<T>
	{
		return new ArrayIterator<T>(c);
	}

	var _cur : ptr_<int8>;
	var _end : ptr_<int8>;
}

@cpu
@native { include="thor/lang/Array.h" }
class Array<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(size:int64):void;
	
	@native
	public function get(index:int64):T;
	
	@native
	public function set(index:int64, v:T):void;
	
	@native
	public function size():int64;

    @native
    private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _data:ptr_<int8>;
	private var _size:int64;
}

@cpu
typedef Array<int8> Bytes;

@cpu
@native { include="thor/lang/Array.h" }
class Array2D<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(size_0 : int64, size_1 : int64):void;
	
	@native
	public function get(idx_0 : int64, idx_1 : int64):T;
	
	@native
	public function set(idx_0 : int64, idx_1 : int64, v:T):void;
	
	@native
	public function size(idx : int64):int64;
	
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _internal1:int64;

    private var _size_0 : int64;
    private var _size_1 : int64;
    
}


@native { include="thor/lang/Array.h" }
class Array3D<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(size_0 : int64, size_1 : int64, size_2 : int64):void;
	
	@native
	public function get(idx_0 : int64, idx_1 : int64, idx_2 : int64):T;
	
	@native
	public function set(idx_0 : int64, idx_1 : int64, idx_2 : int64, v:T):void;
	
	@native
	public function size(idx : int64):int64;
	
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _internal1:int64;

    private var _size_0 : int64;
    private var _size_1 : int64;
    private var _size_2 : int64;
    
}


@native { include="thor/lang/Array.h" }
class Array4D<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(size_0 : int64, size_1 : int64, size_2 : int64, size_3 : int64):void;
	
	@native
	public function get(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64):T;
	
	@native
	public function set(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, v:T):void;
	
	@native
	public function size(idx : int64):int64;
	
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _internal1:int64;

    private var _size_0 : int64;
    private var _size_1 : int64;
    private var _size_2 : int64;
    private var _size_3 : int64;
    
}


@native { include="thor/lang/Array.h" }
class Array5D<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(size_0 : int64, size_1 : int64, size_2 : int64, size_3 : int64, size_4 : int64):void;
	
	@native
	public function get(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64):T;
	
	@native
	public function set(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, v:T):void;
	
	@native
	public function size(idx : int64):int64;
	
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _internal1:int64;

    private var _size_0 : int64;
    private var _size_1 : int64;
    private var _size_2 : int64;
    private var _size_3 : int64;
    private var _size_4 : int64;
    
}


@native { include="thor/lang/Array.h" }
class Array6D<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(size_0 : int64, size_1 : int64, size_2 : int64, size_3 : int64, size_4 : int64, size_5 : int64):void;
	
	@native
	public function get(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64):T;
	
	@native
	public function set(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64, v:T):void;
	
	@native
	public function size(idx : int64):int64;
	
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _internal1:int64;

    private var _size_0 : int64;
    private var _size_1 : int64;
    private var _size_2 : int64;
    private var _size_3 : int64;
    private var _size_4 : int64;
    private var _size_5 : int64;
    
}


@native { include="thor/lang/Array.h" }
class Array7D<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(size_0 : int64, size_1 : int64, size_2 : int64, size_3 : int64, size_4 : int64, size_5 : int64, size_6 : int64):void;
	
	@native
	public function get(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64, idx_6 : int64):T;
	
	@native
	public function set(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64, idx_6 : int64, v:T):void;
	
	@native
	public function size(idx : int64):int64;
	
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _internal1:int64;

    private var _size_0 : int64;
    private var _size_1 : int64;
    private var _size_2 : int64;
    private var _size_3 : int64;
    private var _size_4 : int64;
    private var _size_5 : int64;
    private var _size_6 : int64;
    
}


@native { include="thor/lang/Array.h" }
class Array8D<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(size_0 : int64, size_1 : int64, size_2 : int64, size_3 : int64, size_4 : int64, size_5 : int64, size_6 : int64, size_7 : int64):void;
	
	@native
	public function get(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64, idx_6 : int64, idx_7 : int64):T;
	
	@native
	public function set(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64, idx_6 : int64, idx_7 : int64, v:T):void;
	
	@native
	public function size(idx : int64):int64;
	
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _internal1:int64;

    private var _size_0 : int64;
    private var _size_1 : int64;
    private var _size_2 : int64;
    private var _size_3 : int64;
    private var _size_4 : int64;
    private var _size_5 : int64;
    private var _size_6 : int64;
    private var _size_7 : int64;
    
}

@cpu
@native { include="thor/lang/Array.h" }
class Array9D<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(size_0 : int64, size_1 : int64, size_2 : int64, size_3 : int64, size_4 : int64, size_5 : int64, size_6 : int64, size_7 : int64, size_8 : int64):void;
	
	@native
	public function get(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64, idx_6 : int64, idx_7 : int64, idx_8 : int64):T;
	
	@native
	public function set(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64, idx_6 : int64, idx_7 : int64, idx_8 : int64, v:T):void;
	
	@native
	public function size(idx : int64):int64;
	
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _internal1:int64;

    private var _size_0 : int64;
    private var _size_1 : int64;
    private var _size_2 : int64;
    private var _size_3 : int64;
    private var _size_4 : int64;
    private var _size_5 : int64;
    private var _size_6 : int64;
    private var _size_7 : int64;
    private var _size_8 : int64;
    
}

@cpu
@native { include="thor/lang/Array.h" }
class Array10D<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(size_0 : int64, size_1 : int64, size_2 : int64, size_3 : int64, size_4 : int64, size_5 : int64, size_6 : int64, size_7 : int64, size_8 : int64, size_9 : int64):void;
	
	@native
	public function get(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64, idx_6 : int64, idx_7 : int64, idx_8 : int64, idx_9 : int64):T;
	
	@native
	public function set(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64, idx_6 : int64, idx_7 : int64, idx_8 : int64, idx_9 : int64, v:T):void;
	
	@native
	public function size(idx : int64):int64;
	
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _internal1:int64;

    private var _size_0 : int64;
    private var _size_1 : int64;
    private var _size_2 : int64;
    private var _size_3 : int64;
    private var _size_4 : int64;
    private var _size_5 : int64;
    private var _size_6 : int64;
    private var _size_7 : int64;
    private var _size_8 : int64;
    private var _size_9 : int64;
    
}

@cpu
@native { include="thor/lang/Array.h" }
class Array11D<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(size_0 : int64, size_1 : int64, size_2 : int64, size_3 : int64, size_4 : int64, size_5 : int64, size_6 : int64, size_7 : int64, size_8 : int64, size_9 : int64, size_10 : int64):void;
	
	@native
	public function get(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64, idx_6 : int64, idx_7 : int64, idx_8 : int64, idx_9 : int64, idx_10 : int64):T;
	
	@native
	public function set(idx_0 : int64, idx_1 : int64, idx_2 : int64, idx_3 : int64, idx_4 : int64, idx_5 : int64, idx_6 : int64, idx_7 : int64, idx_8 : int64, idx_9 : int64, idx_10 : int64, v:T):void;
	
	@native
	public function size(idx : int64):int64;
	
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _internal1:int64;

    private var _size_0 : int64;
    private var _size_1 : int64;
    private var _size_2 : int64;
    private var _size_3 : int64;
    private var _size_4 : int64;
    private var _size_5 : int64;
    private var _size_6 : int64;
    private var _size_7 : int64;
    private var _size_8 : int64;
    private var _size_9 : int64;
    private var _size_10 : int64;
    
}


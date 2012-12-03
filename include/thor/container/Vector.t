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
import . = thor.util;

@cpu
@native { include = "thor/container/Vector.h" }
class VectorIterator<T> extends Object
{
	@native
    public function new(c : Vector<T>) : void ;

	@native
	public virtual function delete() : void;

	@native
    public function hasNext() : bool ;

	@native
    public function next() : bool ;

	@native
    public function get() : T ;

	public static function create(c : Vector<T>) : VectorIterator<T>
	{
		return new VectorIterator<T>(c);
	}

	var _cur : ptr_<int8>;
	var _end : ptr_<int8>;
}

@cpu
@native { include="thor/container/Vector.h" }
class Vector<T> extends Object implements GarbageCollectable
{
    @cpu
    @native
    public function new() : void;

    @cpu
    @native
    public function new(init_size : int64) : void;

    @cpu
    @native
    public virtual function delete() : void;

    @cpu
    @native
    public function push_back(v : T) : void;

    @cpu
    @native
    public function add(v : T) : void;

    @cpu
    @native
    public function pop_back() : void;

    @cpu
    @native
    public function set(index : int64, v : T) : void;

    @cpu
    @native
    public function get(index : int64) : T;

	@native
    public function iter() : VectorIterator<T> ;

    @cpu
    @native
    public function size() : int64;

    @cpu
    @native
    public function capacity() : int64;
 
    @cpu
    @native
    private virtual function getContainedObjects(o: CollectableObject) : void;

    @cpu
    @native
    private function extend_capacity() : void;

    ///////////////////////////////////////////////////////////////
    //// data member

    @cpu
    var _p : ptr_<T>;
    @cpu
    var _size : int64;
    @cpu
    var _capacity : int64;
}

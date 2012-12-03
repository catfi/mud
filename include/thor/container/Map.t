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
@native { include = "thor/container/Map.h" }
class MapEntry<Key, Value> extends Object
{
    @cpu
	@native
    public function new(e : MapEntry<Key, Value>) : void ;

    @cpu
	@native
    public function new(k : Key, v : Value) : void ;

    @cpu
	public static function create(k : Key, v : Value) : MapEntry<Key, Value>
	{
		return new MapEntry<Key, Value>(k, v);
	}

    @cpu
    public var key : Key ;
    @cpu
    public var value : Value;
}

@cpu
@native { include = "thor/container/Map.h" }
class MapIterator<Key, Value> extends Object
{
    @cpu
	@native
    public function new(c : Map<Key, Value>) : void ;

    @cpu
	@native
	public virtual function delete() : void;

    @cpu
	@native
    public function hasNext() : bool ;

    @cpu
	@native
    public function next() : bool ;

    @cpu
	@native
    public function get() : MapEntry<Key, Value> ;

    @cpu
	public static function create(c : Map<Key, Value>) : MapIterator<Key, Value>
	{
		return new MapIterator<Key, Value>(c);
	}

    @cpu
	var _cur : ptr_<int8>;
	@cpu
	var _end : ptr_<int8>;
}

@cpu
@native { include = "thor/container/Map.h" }
class Map<Key, Value> extends Object implements GarbageCollectable
{
    @cpu
	@native
    public function new() : void ;

    // access
    @cpu
	@native
    public function get(k : Key) : Value ;

    @cpu
	@native
    public function set(k : Key, v : Value) : void ;

    @cpu
	@native
    public function remove(k : Key) : void ;

    @cpu
	@native
    public function iter() : MapIterator<Key, Value> ;

    // info
    @cpu
	@native
    public function has(k : Key) : bool ;

    @cpu
	@native
    public function empty() : bool ;

    @cpu
	@native
    public function size() : int64 ;

    @cpu
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;

    // member (just a pointer here, so no matter the instantiation type)
    @cpu
    var _p : ptr_<Key> ;
}

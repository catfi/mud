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
@native { include = "thor/container/HashMap.h" }
class HashMapEntry<Key, Value> extends Object
{
	@native
    public function new(e : HashMapEntry<Key, Value>) : void ;

	@native
    public function new(k : Key, v : Value) : void ;

	public static function create(k: Key, v: Value): HashMapEntry<Key, Value>
	{
		return new HashMapEntry<Key, Value>(k, v);
	}

    public var key : Key ;
    public var value : Value;
}

@cpu
@native { include = "thor/container/HashMap.h" }
class HashMapIterator<Key, Value> extends Object
{
	@native
    public function new(c : HashMap<Key, Value>) : void ;

	@native
	public virtual function delete() : void;

	@native
    public function hasNext() : bool ;

	@native
    public function next() : bool ;

	@native
    public function get() : HashMapEntry<Key, Value> ;

	public static function create(c : HashMap<Key, Value>) : HashMapIterator<Key, Value>
	{
		return new HashMapIterator<Key, Value>(c);
	}

	var _cur : ptr_<int8>;
	var _end : ptr_<int8>;
}

@cpu
@native { include = "thor/container/HashMap.h" }
class HashMap<Key, Value> extends Object implements GarbageCollectable
{
	@native
    public function new() : void ;

    // access
	@native
    public function get(k : Key) : Value ;

	@native
    public function set(k : Key, v : Value) : void ;

	@native
    public function remove(k : Key) : void ;

	@native
    public function iter() : HashMapIterator<Key, Value> ;

    // info
	@native
    public function has(k : Key) : bool ;

	@native
    public function empty() : bool ;

	@native
    public function size() : int64 ;

	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;

    // member (just a pointer here, so no matter the instantiation type)
    var _p : ptr_<Key> ;
}

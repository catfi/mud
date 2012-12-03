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

#ifndef THOR_CONTAINER_HASH_MAP_H_
#define THOR_CONTAINER_HASH_MAP_H_

#include "Thor.h"
#include "thor/lang/Language.h"
#include "thor/lang/String.h"
#include "thor/lang/GarbageCollectable.h"

#include <unordered_map>
#include <vector>

namespace thor { namespace container {

template < typename Key >
struct KeyIsEqual
{
    bool operator()(const Key* lhs, const Key* rhs) const
    {
        Key* plhs = const_cast<Key*>(lhs);
        Key* prhs = const_cast<Key*>(rhs);
        return plhs->isEqual(prhs);
    }
};

template <> struct KeyIsEqual<int8   > { bool operator()(const int8    lhs, const int8    rhs) const { return lhs == rhs; } } ;
template <> struct KeyIsEqual<int16  > { bool operator()(const int16   lhs, const int16   rhs) const { return lhs == rhs; } } ;
template <> struct KeyIsEqual<int32  > { bool operator()(const int32   lhs, const int32   rhs) const { return lhs == rhs; } } ;
template <> struct KeyIsEqual<int64  > { bool operator()(const int64   lhs, const int64   rhs) const { return lhs == rhs; } } ;
template <> struct KeyIsEqual<float32> { bool operator()(const float32 lhs, const float32 rhs) const { return lhs == rhs; } } ;
template <> struct KeyIsEqual<float64> { bool operator()(const float64 lhs, const float64 rhs) const { return lhs == rhs; } } ;

template < typename Key >
struct KeyHash
{
    size_t operator()(const Key* lhs) const
    {
        Key* plhs = const_cast<Key*>(lhs);
        return plhs->hash();
    }
};

template <> struct KeyHash<int8   > { size_t operator()(const int8    v) const { return std::hash<int8   >()(v) ; } } ;
template <> struct KeyHash<int16  > { size_t operator()(const int16   v) const { return std::hash<int16  >()(v) ; } } ;
template <> struct KeyHash<int32  > { size_t operator()(const int32   v) const { return std::hash<int32  >()(v) ; } } ;
template <> struct KeyHash<int64  > { size_t operator()(const int64   v) const { return std::hash<int64  >()(v) ; } } ;
template <> struct KeyHash<float32> { size_t operator()(const float32 v) const { return std::hash<float32>()(v) ; } } ;
template <> struct KeyHash<float64> { size_t operator()(const float64 v) const { return std::hash<float64>()(v) ; } } ;


template < typename Key, typename Value >
struct HashMapEntry : public thor::lang::Object
{
    typedef typename std::conditional<std::is_class<Key  >::value, Key  *, Key  >::type key_type;
    typedef typename std::conditional<std::is_class<Value>::value, Value*, Value>::type value_type;

	HashMapEntry(HashMapEntry<Key, Value>* e) : key(e->key), value(e->value) {}
	HashMapEntry(key_type k, value_type v) : key(k), value(v) {}

	static HashMapEntry<Key, Value>* create(key_type k, value_type v);

    key_type   key;
    value_type value;
} ;

template < typename Key, typename Value >
class HashMap;

template < typename Key, typename Value >
class HashMapIterator : public thor::lang::Object
{
public:
    typedef typename std::conditional<std::is_class<Key  >::value, Key  *, Key  >::type key_type;
    typedef typename std::conditional<std::is_class<Value>::value, Value*, Value>::type value_type;
    typedef typename HashMap<Key, Value>::impl_type::iterator map_iterator;

    HashMapIterator(HashMap<Key, Value>* c)
    {
		_cur = new map_iterator();
		_end = new map_iterator();

        *_cur = c->begin();
        *_end = c->end();
    }

	virtual ~HashMapIterator()
	{
		delete _cur;
		delete _end;
	}

    bool hasNext()
    {
        return *_cur != *_end;
    }

    bool next()
    {
        ++(*_cur);
        return true;
    }

    HashMapEntry<Key, Value>* get()
    {
		return HashMapEntry<Key, Value>::create((*_cur)->first, (*_cur)->second);
    }

	static HashMapIterator<Key, Value>* create(HashMap<Key, Value>* c);

private:
    map_iterator* _cur;
    map_iterator* _end;
};


template < typename Key, typename Value >
class HashMap : public thor::lang::Object, public thor::lang::GarbageCollectable
{
public:
    typedef typename std::conditional<std::is_class<Key  >::value, Key  *, Key  >::type key_type;
    typedef typename std::conditional<std::is_class<Value>::value, Value*, Value>::type value_type;

    typedef std::unordered_map<key_type, value_type, KeyHash<Key>, KeyIsEqual<Key> > impl_type;

    // Ctor
    HashMap()
    {
        _map = new std::unordered_map<key_type, value_type, KeyHash<Key>, KeyIsEqual<Key> >();
    }
    // Dtor
    ~HashMap()
    {
        if(_map)
            delete _map;
    }
    // access
    value_type get(key_type k)
    {
        if(has(k))
            return _map->find(k)->second;
        else
            return value_type();
    }

    void set(key_type k, value_type v)
    {
        _map->insert(std::make_pair(k, v));
    }

    void remove(key_type k)
    {
        _map->erase(k);
    }

    HashMapIterator<Key, Value>* iter()
    {
        return HashMapIterator<Key, Value>::create(this);
    }

    // info
    bool has(key_type k)
    {
        return _map->count(k) > 0;
    }

    bool empty()
    {
        return _map->empty();
    }

    int64 size()
    {
        return _map->size();
    }

    typename impl_type::iterator begin()
    {
        return _map->begin();
    }

    typename impl_type::iterator end()
    {
        return _map->end();
    }

private:
	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
    {
    	// Skip if the value_type is primitive
		for (auto it = _map->begin(); it != _map->end(); it++)
		{
			thor::lang::detail::addObjectToGCHelper<std::is_class<Key>::value>::add(collect_object, it->first);
			thor::lang::detail::addObjectToGCHelper<std::is_class<Value>::value>::add(collect_object, it->second);
		}
    }

private:
    impl_type* _map;
};


} }

#endif /* THOR_CONTAINER_HASH_MAP_H_ */

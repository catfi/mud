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

#ifndef THOR_CONTAINER_MAP_H_
#define THOR_CONTAINER_MAP_H_

#include "Thor.h"
#include "thor/lang/Language.h"
#include "thor/lang/GarbageCollectable.h"

#include <map>
#include <vector>

namespace thor { namespace container {

typedef std::int64_t int64;
typedef double float64;

template < typename Key, typename Value >
struct MapEntry : public thor::lang::Object
{
    typedef typename std::conditional<std::is_class<Key  >::value, Key  *, Key  >::type key_type;
    typedef typename std::conditional<std::is_class<Value>::value, Value*, Value>::type value_type;

	MapEntry(MapEntry<Key, Value>* e) : key(e->key), value(e->value) {}
	MapEntry(key_type k, value_type v) : key(k), value(v) {}

	static MapEntry<Key, Value>* create(key_type k, value_type v);

    key_type   key;
    value_type value;
} ;

template < typename Key, typename Value >
class Map;

template < typename Key, typename Value >
class MapIterator : public thor::lang::Object
{
public:
    typedef typename std::conditional<std::is_class<Key  >::value, Key  *, Key  >::type key_type;
    typedef typename std::conditional<std::is_class<Value>::value, Value*, Value>::type value_type;
	typedef typename std::map<key_type, value_type>::iterator map_type;

    MapIterator(Map<Key, Value>* c)
    {
		_cur = new map_type();
		_end = new map_type();

        *_cur = c->begin();
        *_end = c->end();
    }
	virtual ~MapIterator()
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

    MapEntry<Key, Value>* get()
    {
		return MapEntry<Key, Value>::create((*_cur)->first, (*_cur)->second);
    }

	static MapIterator<Key, Value>* create(Map<Key, Value>* c);

private:
    map_type* _cur;
    map_type* _end;
} ;

template < typename Key >
struct KeyLessCmp
{
    bool operator()(const Key* lhs, const Key* rhs) const
    {
        Key* prhs = const_cast<Key*>(rhs);
        Key* plhs = const_cast<Key*>(lhs);
        return plhs->isLessThan(prhs);
    }
} ;

template <> struct KeyLessCmp<int8   > { bool operator()(const int8    lhs, const int8    rhs) const { return lhs < rhs; } } ;
template <> struct KeyLessCmp<int16  > { bool operator()(const int16   lhs, const int16   rhs) const { return lhs < rhs; } } ;
template <> struct KeyLessCmp<int32  > { bool operator()(const int32   lhs, const int32   rhs) const { return lhs < rhs; } } ;
template <> struct KeyLessCmp<int64  > { bool operator()(const int64   lhs, const int64   rhs) const { return lhs < rhs; } } ;
template <> struct KeyLessCmp<float32> { bool operator()(const float32 lhs, const float32 rhs) const { return lhs < rhs; } } ;
template <> struct KeyLessCmp<float64> { bool operator()(const float64 lhs, const float64 rhs) const { return lhs < rhs; } } ;

template < typename Key, typename Value >
class Map : public thor::lang::Object, public thor::lang::GarbageCollectable
{
public:
    typedef typename std::conditional<std::is_class<Key  >::value, Key  *, Key  >::type key_type;
    typedef typename std::conditional<std::is_class<Value>::value, Value*, Value>::type value_type;

    // Ctor
    Map()
    {
        _map = new std::map<key_type, value_type, KeyLessCmp<Key> >();
    }
    // Dtor
    ~Map()
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

    MapIterator<Key, Value>* iter()
    {
        return MapIterator<Key, Value>::create(this);
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

    typename std::map<key_type, value_type>::iterator begin()
    {
        return _map->begin();
    }

    typename std::map<key_type, value_type>::iterator end()
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
    std::map<key_type, value_type, KeyLessCmp<Key> >* _map;
} ;


} }

#endif /* THOR_CONTAINER_MAP_H_ */

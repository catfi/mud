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

#ifndef THOR_CONTAINER_VECTOR_H_
#define THOR_CONTAINER_VECTOR_H_

#include "Thor.h"
#include "thor/lang/Language.h"
#include "thor/lang/GarbageCollectable.h"

#include <functional>

namespace thor { namespace container {

template < typename T >
class Vector;

template < typename T >
class VectorIterator : public thor::lang::Object
{
public:
    typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;
	typedef value_type* vector_iter_type;

    VectorIterator(Vector<T>* c)
    {
		_cur = c->_data;
		_end = c->_data + c->_size;
    }

	virtual ~VectorIterator()
	{
	}

    bool hasNext()
    {
        return _cur != _end;
    }

    bool next()
    {
        ++_cur;
        return true;
    }

    value_type get()
    {
		return *_cur;
    }

	static VectorIterator<T>* create(Vector<T>* c);

private:
    vector_iter_type _cur;
    vector_iter_type _end;
} ;

template < typename T >
class Vector : public thor::lang::Object, public thor::lang::GarbageCollectable
{
public:
    typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

    Vector()
        : _data(NULL)
        , _size(0)
        , _capacity(0)
    {
    }

    Vector(int64 init_size)
        : _data(NULL)
        , _size(init_size)
        , _capacity(init_size)
    {
        _data = new value_type[init_size];
    }

    virtual ~Vector()
    {
        delete _data;
    }

    void push_back(value_type v)
    {
        add( v );
    }

    void add(value_type v)
    {
        //std::cout << __FUNCTION__ << "()" << std::endl;
        // double capacity
        if(_capacity == 0 || _size + 1 > _capacity)
        {
            extend_capacity();
        }
        _data[_size] = v;
        ++_size;
    }

    value_type get(int64 index)
    {
        return _data[index];
    }

    void set(int64 index, value_type v)
    {
        _data[index] = v;
    }

    void pop_back()
    {
        if(_size == 0) return;
        --_size;
    }

    VectorIterator<T>* iter()
    {
        return VectorIterator<T>::create(this);
    }

    int64 size()
    {
        return _size;
    }

    int64 capacity()
    {
        return _capacity;
    }

private:
	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
    {
    	// Skip if the value_type is primitive
    	if (std::is_class<T>::value)
    	{
            for(int i=0;i<_size;++i)
            {
            	thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
            }
    	}
    }

    void extend_capacity()
    {
        if(_capacity == 0)
        {
            _capacity = 3;
        }
        else
        {
            _capacity *= 2;
        }
        value_type* new_data = new value_type[_capacity];
        for(size_t i = 0; i < _size; ++i)
        {
            new_data[i] = _data[i];
        }
        if(_data != NULL)
        {
            delete _data;
        }
        _data = new_data;
    }

    friend class VectorIterator<T>;

    value_type* _data;
    int64 _size;
    int64 _capacity;
} ;

} }

#endif /* THOR_CONTAINER_VECTOR_H_ */

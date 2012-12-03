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

#ifndef THOR_LANG_ARRAY_H_
#define THOR_LANG_ARRAY_H_

#include <array>
#include "Thor.h"
#include "thor/lang/Language.h"
#include "thor/lang/GarbageCollectable.h"

namespace thor { namespace lang {

template < typename T >
class Array;

template < typename T >
class ArrayIterator : public thor::lang::Object
{
public:
    typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;
	typedef value_type* array_iter_type;

    ArrayIterator(Array<T>* c)
    {
		_cur = c->_data;
		_end = c->_data + c->_size;
    }

	virtual ~ArrayIterator()
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

	static ArrayIterator<T>* create(Array<T>* c);

private:
    array_iter_type _cur;
    array_iter_type _end;
} ;

template<typename T>
class Array : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

    friend ArrayIterator<T>;

	Array() : _data(NULL), _size(0)
	{ }

public:
	Array(int64 size)
	{
		_data = (value_type*)::malloc(sizeof(value_type)*size);
		_size = size;
	}

	~Array()
	{
		::free((void*)_data); _data = NULL;
		_size = 0;
	}

	value_type get(int64 index)
	{
		if(index >= 0 && index < _size)
		{
			return _data[index];
		}
		else
		{
			// TODO throw exception here
		}
	}

	void set(int64 index, value_type v)
	{
		if(index >= 0 && index < _size)
		{
			_data[index] = v;
		}
		else
		{
			// TODO throw exception here
		}
	}

    ArrayIterator<T>* iter()
    {
        return ArrayIterator<T>::create(this);
    }

	int64 size()
	{
		return _size;
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

	value_type* _data;
	int64 _size;
};

template<typename T>
class Array2D : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

	Array2D() : _data(NULL)
	{ }

public:
	Array2D(int64 size_0, int64 size_1)
	{
        _size_0 = size_0;
        _size_1 = size_1;
		_data = (value_type*)::malloc(sizeof(value_type)*all_size());
        
	}

	~Array2D()
	{
		::free((void*)_data); _data = NULL;
        _size_0 = 0;
        _size_1 = 0;
	}

	value_type get(int64 idx_0, int64 idx_1)
	{
        size_t index = calculate_index(idx_0, idx_1);
        return _data[index];
	}

	void set(int64 idx_0, int64 idx_1, value_type v)
	{
        size_t index = calculate_index(idx_0, idx_1);
        _data[index] = v;
	}

    int64 size(int64 idx)
	{
		if (idx == 0) return _size_0;
        if (idx == 1) return _size_1;
        
	}

private:
    size_t calculate_index(int64 idx_0, int64 idx_1)
    {
        size_t result = 0;
        result += idx_0; result *= _size_1;
        result += idx_1;        return result;
    }

    size_t all_size()
    {
        return _size_0 * _size_1;
    }

	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
	{
		// Skip if the value_type is primitive
		if (std::is_class<T>::value)
		{
			for(int i=0;i<all_size();++i)
			{
				thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
			}
		}
	}

	value_type* _data;
    size_t _size_0;
    size_t _size_1;
};


template<typename T>
class Array3D : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

	Array3D() : _data(NULL)
	{ }

public:
	Array3D(int64 size_0, int64 size_1, int64 size_2)
	{
        _size_0 = size_0;
        _size_1 = size_1;
        _size_2 = size_2;
		_data = (value_type*)::malloc(sizeof(value_type)*all_size());
        
	}

	~Array3D()
	{
		::free((void*)_data); _data = NULL;
        _size_0 = 0;
        _size_1 = 0;
        _size_2 = 0;
	}

	value_type get(int64 idx_0, int64 idx_1, int64 idx_2)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2);
        return _data[index];
	}

	void set(int64 idx_0, int64 idx_1, int64 idx_2, value_type v)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2);
        _data[index] = v;
	}

    int64 size(int64 idx)
	{
		if (idx == 0) return _size_0;
        if (idx == 1) return _size_1;
        if (idx == 2) return _size_2;
        
	}

private:
    size_t calculate_index(int64 idx_0, int64 idx_1, int64 idx_2)
    {
        size_t result = 0;
        result += idx_0; result *= _size_1;
        result += idx_1; result *= _size_2;
        result += idx_2;        return result;
    }

    size_t all_size()
    {
        return _size_0 * _size_1 * _size_2;
    }

	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
	{
		// Skip if the value_type is primitive
		if (std::is_class<T>::value)
		{
			for(int i=0;i<all_size();++i)
			{
				thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
			}
		}
	}

	value_type* _data;
    size_t _size_0;
    size_t _size_1;
    size_t _size_2;
};


template<typename T>
class Array4D : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

	Array4D() : _data(NULL)
	{ }

public:
	Array4D(int64 size_0, int64 size_1, int64 size_2, int64 size_3)
	{
        _size_0 = size_0;
        _size_1 = size_1;
        _size_2 = size_2;
        _size_3 = size_3;
		_data = (value_type*)::malloc(sizeof(value_type)*all_size());
        
	}

	~Array4D()
	{
		::free((void*)_data); _data = NULL;
        _size_0 = 0;
        _size_1 = 0;
        _size_2 = 0;
        _size_3 = 0;
	}

	value_type get(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3);
        return _data[index];
	}

	void set(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, value_type v)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3);
        _data[index] = v;
	}

    int64 size(int64 idx)
	{
		if (idx == 0) return _size_0;
        if (idx == 1) return _size_1;
        if (idx == 2) return _size_2;
        if (idx == 3) return _size_3;
        
	}

private:
    size_t calculate_index(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3)
    {
        size_t result = 0;
        result += idx_0; result *= _size_1;
        result += idx_1; result *= _size_2;
        result += idx_2; result *= _size_3;
        result += idx_3;        return result;
    }

    size_t all_size()
    {
        return _size_0 * _size_1 * _size_2 * _size_3;
    }

	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
	{
		// Skip if the value_type is primitive
		if (std::is_class<T>::value)
		{
			for(int i=0;i<all_size();++i)
			{
				thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
			}
		}
	}

	value_type* _data;
    size_t _size_0;
    size_t _size_1;
    size_t _size_2;
    size_t _size_3;
};


template<typename T>
class Array5D : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

	Array5D() : _data(NULL)
	{ }

public:
	Array5D(int64 size_0, int64 size_1, int64 size_2, int64 size_3, int64 size_4)
	{
        _size_0 = size_0;
        _size_1 = size_1;
        _size_2 = size_2;
        _size_3 = size_3;
        _size_4 = size_4;
		_data = (value_type*)::malloc(sizeof(value_type)*all_size());
        
	}

	~Array5D()
	{
		::free((void*)_data); _data = NULL;
        _size_0 = 0;
        _size_1 = 0;
        _size_2 = 0;
        _size_3 = 0;
        _size_4 = 0;
	}

	value_type get(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4);
        return _data[index];
	}

	void set(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, value_type v)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4);
        _data[index] = v;
	}

    int64 size(int64 idx)
	{
		if (idx == 0) return _size_0;
        if (idx == 1) return _size_1;
        if (idx == 2) return _size_2;
        if (idx == 3) return _size_3;
        if (idx == 4) return _size_4;
        
	}

private:
    size_t calculate_index(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4)
    {
        size_t result = 0;
        result += idx_0; result *= _size_1;
        result += idx_1; result *= _size_2;
        result += idx_2; result *= _size_3;
        result += idx_3; result *= _size_4;
        result += idx_4;        return result;
    }

    size_t all_size()
    {
        return _size_0 * _size_1 * _size_2 * _size_3 * _size_4;
    }

	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
	{
		// Skip if the value_type is primitive
		if (std::is_class<T>::value)
		{
			for(int i=0;i<all_size();++i)
			{
				thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
			}
		}
	}

	value_type* _data;
    size_t _size_0;
    size_t _size_1;
    size_t _size_2;
    size_t _size_3;
    size_t _size_4;
};


template<typename T>
class Array6D : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

	Array6D() : _data(NULL)
	{ }

public:
	Array6D(int64 size_0, int64 size_1, int64 size_2, int64 size_3, int64 size_4, int64 size_5)
	{
        _size_0 = size_0;
        _size_1 = size_1;
        _size_2 = size_2;
        _size_3 = size_3;
        _size_4 = size_4;
        _size_5 = size_5;
		_data = (value_type*)::malloc(sizeof(value_type)*all_size());
        
	}

	~Array6D()
	{
		::free((void*)_data); _data = NULL;
        _size_0 = 0;
        _size_1 = 0;
        _size_2 = 0;
        _size_3 = 0;
        _size_4 = 0;
        _size_5 = 0;
	}

	value_type get(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5);
        return _data[index];
	}

	void set(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, value_type v)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5);
        _data[index] = v;
	}

    int64 size(int64 idx)
	{
		if (idx == 0) return _size_0;
        if (idx == 1) return _size_1;
        if (idx == 2) return _size_2;
        if (idx == 3) return _size_3;
        if (idx == 4) return _size_4;
        if (idx == 5) return _size_5;
        
	}

private:
    size_t calculate_index(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5)
    {
        size_t result = 0;
        result += idx_0; result *= _size_1;
        result += idx_1; result *= _size_2;
        result += idx_2; result *= _size_3;
        result += idx_3; result *= _size_4;
        result += idx_4; result *= _size_5;
        result += idx_5;        return result;
    }

    size_t all_size()
    {
        return _size_0 * _size_1 * _size_2 * _size_3 * _size_4 * _size_5;
    }

	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
	{
		// Skip if the value_type is primitive
		if (std::is_class<T>::value)
		{
			for(int i=0;i<all_size();++i)
			{
				thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
			}
		}
	}

	value_type* _data;
    size_t _size_0;
    size_t _size_1;
    size_t _size_2;
    size_t _size_3;
    size_t _size_4;
    size_t _size_5;
};


template<typename T>
class Array7D : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

	Array7D() : _data(NULL)
	{ }

public:
	Array7D(int64 size_0, int64 size_1, int64 size_2, int64 size_3, int64 size_4, int64 size_5, int64 size_6)
	{
        _size_0 = size_0;
        _size_1 = size_1;
        _size_2 = size_2;
        _size_3 = size_3;
        _size_4 = size_4;
        _size_5 = size_5;
        _size_6 = size_6;
		_data = (value_type*)::malloc(sizeof(value_type)*all_size());
        
	}

	~Array7D()
	{
		::free((void*)_data); _data = NULL;
        _size_0 = 0;
        _size_1 = 0;
        _size_2 = 0;
        _size_3 = 0;
        _size_4 = 0;
        _size_5 = 0;
        _size_6 = 0;
	}

	value_type get(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5, idx_6);
        return _data[index];
	}

	void set(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, value_type v)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5, idx_6);
        _data[index] = v;
	}

    int64 size(int64 idx)
	{
		if (idx == 0) return _size_0;
        if (idx == 1) return _size_1;
        if (idx == 2) return _size_2;
        if (idx == 3) return _size_3;
        if (idx == 4) return _size_4;
        if (idx == 5) return _size_5;
        if (idx == 6) return _size_6;
        
	}

private:
    size_t calculate_index(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6)
    {
        size_t result = 0;
        result += idx_0; result *= _size_1;
        result += idx_1; result *= _size_2;
        result += idx_2; result *= _size_3;
        result += idx_3; result *= _size_4;
        result += idx_4; result *= _size_5;
        result += idx_5; result *= _size_6;
        result += idx_6;        return result;
    }

    size_t all_size()
    {
        return _size_0 * _size_1 * _size_2 * _size_3 * _size_4 * _size_5 * _size_6;
    }

	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
	{
		// Skip if the value_type is primitive
		if (std::is_class<T>::value)
		{
			for(int i=0;i<all_size();++i)
			{
				thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
			}
		}
	}

	value_type* _data;
    size_t _size_0;
    size_t _size_1;
    size_t _size_2;
    size_t _size_3;
    size_t _size_4;
    size_t _size_5;
    size_t _size_6;
};


template<typename T>
class Array8D : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

	Array8D() : _data(NULL)
	{ }

public:
	Array8D(int64 size_0, int64 size_1, int64 size_2, int64 size_3, int64 size_4, int64 size_5, int64 size_6, int64 size_7)
	{
        _size_0 = size_0;
        _size_1 = size_1;
        _size_2 = size_2;
        _size_3 = size_3;
        _size_4 = size_4;
        _size_5 = size_5;
        _size_6 = size_6;
        _size_7 = size_7;
		_data = (value_type*)::malloc(sizeof(value_type)*all_size());
        
	}

	~Array8D()
	{
		::free((void*)_data); _data = NULL;
        _size_0 = 0;
        _size_1 = 0;
        _size_2 = 0;
        _size_3 = 0;
        _size_4 = 0;
        _size_5 = 0;
        _size_6 = 0;
        _size_7 = 0;
	}

	value_type get(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5, idx_6, idx_7);
        return _data[index];
	}

	void set(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7, value_type v)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5, idx_6, idx_7);
        _data[index] = v;
	}

    int64 size(int64 idx)
	{
		if (idx == 0) return _size_0;
        if (idx == 1) return _size_1;
        if (idx == 2) return _size_2;
        if (idx == 3) return _size_3;
        if (idx == 4) return _size_4;
        if (idx == 5) return _size_5;
        if (idx == 6) return _size_6;
        if (idx == 7) return _size_7;
        
	}

private:
    size_t calculate_index(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7)
    {
        size_t result = 0;
        result += idx_0; result *= _size_1;
        result += idx_1; result *= _size_2;
        result += idx_2; result *= _size_3;
        result += idx_3; result *= _size_4;
        result += idx_4; result *= _size_5;
        result += idx_5; result *= _size_6;
        result += idx_6; result *= _size_7;
        result += idx_7;        return result;
    }

    size_t all_size()
    {
        return _size_0 * _size_1 * _size_2 * _size_3 * _size_4 * _size_5 * _size_6 * _size_7;
    }

	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
	{
		// Skip if the value_type is primitive
		if (std::is_class<T>::value)
		{
			for(int i=0;i<all_size();++i)
			{
				thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
			}
		}
	}

	value_type* _data;
    size_t _size_0;
    size_t _size_1;
    size_t _size_2;
    size_t _size_3;
    size_t _size_4;
    size_t _size_5;
    size_t _size_6;
    size_t _size_7;
};


template<typename T>
class Array9D : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

	Array9D() : _data(NULL)
	{ }

public:
	Array9D(int64 size_0, int64 size_1, int64 size_2, int64 size_3, int64 size_4, int64 size_5, int64 size_6, int64 size_7, int64 size_8)
	{
        _size_0 = size_0;
        _size_1 = size_1;
        _size_2 = size_2;
        _size_3 = size_3;
        _size_4 = size_4;
        _size_5 = size_5;
        _size_6 = size_6;
        _size_7 = size_7;
        _size_8 = size_8;
		_data = (value_type*)::malloc(sizeof(value_type)*all_size());
        
	}

	~Array9D()
	{
		::free((void*)_data); _data = NULL;
        _size_0 = 0;
        _size_1 = 0;
        _size_2 = 0;
        _size_3 = 0;
        _size_4 = 0;
        _size_5 = 0;
        _size_6 = 0;
        _size_7 = 0;
        _size_8 = 0;
	}

	value_type get(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7, int64 idx_8)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5, idx_6, idx_7, idx_8);
        return _data[index];
	}

	void set(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7, int64 idx_8, value_type v)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5, idx_6, idx_7, idx_8);
        _data[index] = v;
	}

    int64 size(int64 idx)
	{
		if (idx == 0) return _size_0;
        if (idx == 1) return _size_1;
        if (idx == 2) return _size_2;
        if (idx == 3) return _size_3;
        if (idx == 4) return _size_4;
        if (idx == 5) return _size_5;
        if (idx == 6) return _size_6;
        if (idx == 7) return _size_7;
        if (idx == 8) return _size_8;
        
	}

private:
    size_t calculate_index(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7, int64 idx_8)
    {
        size_t result = 0;
        result += idx_0; result *= _size_1;
        result += idx_1; result *= _size_2;
        result += idx_2; result *= _size_3;
        result += idx_3; result *= _size_4;
        result += idx_4; result *= _size_5;
        result += idx_5; result *= _size_6;
        result += idx_6; result *= _size_7;
        result += idx_7; result *= _size_8;
        result += idx_8;        return result;
    }

    size_t all_size()
    {
        return _size_0 * _size_1 * _size_2 * _size_3 * _size_4 * _size_5 * _size_6 * _size_7 * _size_8;
    }

	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
	{
		// Skip if the value_type is primitive
		if (std::is_class<T>::value)
		{
			for(int i=0;i<all_size();++i)
			{
				thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
			}
		}
	}

	value_type* _data;
    size_t _size_0;
    size_t _size_1;
    size_t _size_2;
    size_t _size_3;
    size_t _size_4;
    size_t _size_5;
    size_t _size_6;
    size_t _size_7;
    size_t _size_8;
};


template<typename T>
class Array10D : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

	Array10D() : _data(NULL)
	{ }

public:
	Array10D(int64 size_0, int64 size_1, int64 size_2, int64 size_3, int64 size_4, int64 size_5, int64 size_6, int64 size_7, int64 size_8, int64 size_9)
	{
        _size_0 = size_0;
        _size_1 = size_1;
        _size_2 = size_2;
        _size_3 = size_3;
        _size_4 = size_4;
        _size_5 = size_5;
        _size_6 = size_6;
        _size_7 = size_7;
        _size_8 = size_8;
        _size_9 = size_9;
		_data = (value_type*)::malloc(sizeof(value_type)*all_size());
        
	}

	~Array10D()
	{
		::free((void*)_data); _data = NULL;
        _size_0 = 0;
        _size_1 = 0;
        _size_2 = 0;
        _size_3 = 0;
        _size_4 = 0;
        _size_5 = 0;
        _size_6 = 0;
        _size_7 = 0;
        _size_8 = 0;
        _size_9 = 0;
	}

	value_type get(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7, int64 idx_8, int64 idx_9)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5, idx_6, idx_7, idx_8, idx_9);
        return _data[index];
	}

	void set(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7, int64 idx_8, int64 idx_9, value_type v)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5, idx_6, idx_7, idx_8, idx_9);
        _data[index] = v;
	}

    int64 size(int64 idx)
	{
		if (idx == 0) return _size_0;
        if (idx == 1) return _size_1;
        if (idx == 2) return _size_2;
        if (idx == 3) return _size_3;
        if (idx == 4) return _size_4;
        if (idx == 5) return _size_5;
        if (idx == 6) return _size_6;
        if (idx == 7) return _size_7;
        if (idx == 8) return _size_8;
        if (idx == 9) return _size_9;
        
	}

private:
    size_t calculate_index(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7, int64 idx_8, int64 idx_9)
    {
        size_t result = 0;
        result += idx_0; result *= _size_1;
        result += idx_1; result *= _size_2;
        result += idx_2; result *= _size_3;
        result += idx_3; result *= _size_4;
        result += idx_4; result *= _size_5;
        result += idx_5; result *= _size_6;
        result += idx_6; result *= _size_7;
        result += idx_7; result *= _size_8;
        result += idx_8; result *= _size_9;
        result += idx_9;        return result;
    }

    size_t all_size()
    {
        return _size_0 * _size_1 * _size_2 * _size_3 * _size_4 * _size_5 * _size_6 * _size_7 * _size_8 * _size_9;
    }

	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
	{
		// Skip if the value_type is primitive
		if (std::is_class<T>::value)
		{
			for(int i=0;i<all_size();++i)
			{
				thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
			}
		}
	}

	value_type* _data;
    size_t _size_0;
    size_t _size_1;
    size_t _size_2;
    size_t _size_3;
    size_t _size_4;
    size_t _size_5;
    size_t _size_6;
    size_t _size_7;
    size_t _size_8;
    size_t _size_9;
};


template<typename T>
class Array11D : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

	Array11D() : _data(NULL)
	{ }

public:
	Array11D(int64 size_0, int64 size_1, int64 size_2, int64 size_3, int64 size_4, int64 size_5, int64 size_6, int64 size_7, int64 size_8, int64 size_9, int64 size_10)
	{
        _size_0 = size_0;
        _size_1 = size_1;
        _size_2 = size_2;
        _size_3 = size_3;
        _size_4 = size_4;
        _size_5 = size_5;
        _size_6 = size_6;
        _size_7 = size_7;
        _size_8 = size_8;
        _size_9 = size_9;
        _size_10 = size_10;
		_data = (value_type*)::malloc(sizeof(value_type)*all_size());
        
	}

	~Array11D()
	{
		::free((void*)_data); _data = NULL;
        _size_0 = 0;
        _size_1 = 0;
        _size_2 = 0;
        _size_3 = 0;
        _size_4 = 0;
        _size_5 = 0;
        _size_6 = 0;
        _size_7 = 0;
        _size_8 = 0;
        _size_9 = 0;
        _size_10 = 0;
	}

	value_type get(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7, int64 idx_8, int64 idx_9, int64 idx_10)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5, idx_6, idx_7, idx_8, idx_9, idx_10);
        return _data[index];
	}

	void set(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7, int64 idx_8, int64 idx_9, int64 idx_10, value_type v)
	{
        size_t index = calculate_index(idx_0, idx_1, idx_2, idx_3, idx_4, idx_5, idx_6, idx_7, idx_8, idx_9, idx_10);
        _data[index] = v;
	}

    int64 size(int64 idx)
	{
		if (idx == 0) return _size_0;
        if (idx == 1) return _size_1;
        if (idx == 2) return _size_2;
        if (idx == 3) return _size_3;
        if (idx == 4) return _size_4;
        if (idx == 5) return _size_5;
        if (idx == 6) return _size_6;
        if (idx == 7) return _size_7;
        if (idx == 8) return _size_8;
        if (idx == 9) return _size_9;
        if (idx == 10) return _size_10;
        
	}

private:
    size_t calculate_index(int64 idx_0, int64 idx_1, int64 idx_2, int64 idx_3, int64 idx_4, int64 idx_5, int64 idx_6, int64 idx_7, int64 idx_8, int64 idx_9, int64 idx_10)
    {
        size_t result = 0;
        result += idx_0; result *= _size_1;
        result += idx_1; result *= _size_2;
        result += idx_2; result *= _size_3;
        result += idx_3; result *= _size_4;
        result += idx_4; result *= _size_5;
        result += idx_5; result *= _size_6;
        result += idx_6; result *= _size_7;
        result += idx_7; result *= _size_8;
        result += idx_8; result *= _size_9;
        result += idx_9; result *= _size_10;
        result += idx_10;        return result;
    }

    size_t all_size()
    {
        return _size_0 * _size_1 * _size_2 * _size_3 * _size_4 * _size_5 * _size_6 * _size_7 * _size_8 * _size_9 * _size_10;
    }

	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
	{
		// Skip if the value_type is primitive
		if (std::is_class<T>::value)
		{
			for(int i=0;i<all_size();++i)
			{
				thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
			}
		}
	}

	value_type* _data;
    size_t _size_0;
    size_t _size_1;
    size_t _size_2;
    size_t _size_3;
    size_t _size_4;
    size_t _size_5;
    size_t _size_6;
    size_t _size_7;
    size_t _size_8;
    size_t _size_9;
    size_t _size_10;
};

} }

#endif /* THOR_LANG_ARRAY_H_ */

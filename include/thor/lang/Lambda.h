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

#ifndef THOR_LANG_LAMBDA_H_
#define THOR_LANG_LAMBDA_H_

#include "Thor.h"
#include "thor/lang/Language.h"
#include <type_traits>

namespace thor { namespace lang {

class Lambda : public Object
{
};

template <typename R>
class Lambda0 : public Lambda
{
	typedef typename std::conditional<std::is_class<R>::value, R*, R>::type return_type;

	// member_function_ptr takes the first parameter as this pointer
	typedef return_type (*member_function_ptr)(void*);

	// normal function pointer
	typedef return_type (*function_ptr)();

public:
	Lambda0() : _invoke(NULL), _obj(NULL) {}

	template <typename T>
	Lambda0(T* o)
	{
		_invoke = reinterpret_cast<member_function_ptr>(&T::invoke);
		_obj = o;
	}

	~Lambda0() {}

	return_type invoke()
	{
		return ((member_function_ptr)(_invoke))(_obj);
	}

public:
	member_function_ptr _invoke;
	void* _obj;
};


template <typename R, typename T0>
class Lambda1 : public Lambda
{
	typedef typename std::conditional<std::is_class<R>::value, R*, R>::type return_type;
	typedef typename std::conditional<std::is_class<T0>::value, T0*, T0>::type arg0;

	// member_function_ptr takes the first parameter as this pointer
	typedef return_type (*member_function_ptr)(void*, arg0);

	// normal function pointer
	typedef return_type (*function_ptr)(arg0);

public:
	Lambda1() : _invoke(NULL), _obj(NULL) {}

	template <typename T>
	Lambda1(T* o)
	{
		_invoke = reinterpret_cast<member_function_ptr>(&T::invoke);
		_obj = o;
	}

	~Lambda1() {}

	return_type invoke(arg0 t0)
	{
		return ((member_function_ptr)(_invoke))(_obj, t0);
	}

public:
	member_function_ptr _invoke;
	void* _obj;
};

template <typename R, typename T0, typename T1>
class Lambda2 : public Lambda
{
	typedef typename std::conditional<std::is_class<R>::value, R*, R>::type return_type;
	typedef typename std::conditional<std::is_class<T0>::value, T0*, T0>::type arg0;
	typedef typename std::conditional<std::is_class<T1>::value, T1*, T1>::type arg1;

	// member_function_ptr takes the first parameter as this pointer
	typedef return_type (*member_function_ptr)(void*, arg0, arg1);

	// normal function pointer
	typedef return_type (*function_ptr)(arg0, arg1);

public:
	Lambda2() : _invoke(NULL), _obj(NULL) {}

	template <typename T>
	Lambda2(T* o)
	{
		_invoke = reinterpret_cast<member_function_ptr>(&T::invoke);
		_obj = o;
	}

	~Lambda2() {}

	return_type invoke(arg0 t0, arg1 t1)
	{
		return ((member_function_ptr)(_invoke))(_obj, t0, t1);
	}

public:
	member_function_ptr _invoke;
	void* _obj;
};

} }

#endif /* THOR_LANG_LAMBDA_H_ */

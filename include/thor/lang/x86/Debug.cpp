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

#include "thor/lang/Debug.h"

namespace thor { namespace lang {

void print(bool v)
{
    std::wcout << std::boolalpha << v;
}

void print(int8 v)
{
    std::wcout << (int32)v;
}

void print(int16 v)
{
    std::wcout << (int32)v;
}

void print(int32 v)
{
    std::wcout << (int32)v;
}

void print(int64 v)
{
    std::wcout << v;
}

void print(float32 v)
{
    std::wcout << v;
}

void print(float64 v)
{
    std::wcout << v;
}

void print(String* v)
{
	if(!v->data)
	{
		std::cerr << "Error: invalid string data used in print, string object ptr = " << v << std::endl;
	}
	else
	{
		std::wcout << *(v->data);
	}
}

void trace(String* v)
{
	if(!v->data)
	{
		std::cerr << "Error: invalid string data used in trace, string object ptr = " << v << std::endl;
	}
	else
	{
		std::wcout << *(v->data) << std::endl;
	}
}

} }


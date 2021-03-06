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

#include <sstream>
#include <iostream>
#include "mud/IndexableString.h"

using namespace thor;
using namespace thor::lang;

IndexableString::IndexableString()
    : MutableString( new String() )
{
}

IndexableString::~IndexableString(){}

IndexableString* IndexableString::addAscii( int8 a_ascii )
{
    stream->clear();
    stream->str(L"");
    *stream << (wchar_t)a_ascii;
    if( !*stream )
        return nullptr;

    *(this->data) += stream->str();

    return this;
}

int64 IndexableString::getEncodedNumAt( int32 a_index )
{
    string_type::const_iterator begin = data->begin();
    return *(begin + a_index);
}

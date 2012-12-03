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

#ifndef THOR_LANG_STRING_H_
#define THOR_LANG_STRING_H_

#include "Thor.h"
#include "thor/lang/Language.h"

namespace thor { namespace lang {

class MutableString;

class String : public Object
{
public:
    String();
    virtual ~String();

public:
    static String* create();

public:
    int64 hash();
    bool isEqual(String* rhs);
    bool isLessThan(String* rhs);

public:
    int32 length();
    String* concate(String* other);
    int32 find(String* candidate);
    int32 compareTo(String* other);
    int32 compareToIgnoreCase(String* other);
    bool endsWith(String* suffix);
    bool equals(String* other);
    bool equalsIgnoreCase(String* other);
    int32 indexOf(String* str);
    int32 indexOf(String* str, int32 fromIndex);
    int32 lastIndexOf(String* str);
    int32 lastIndexOf(String* str, int32 fromIndex);
    bool regionMatches(bool ignoreCase, int32 toffset, String* other, int32 ooffset, int32 len);
    bool regionMatches(int32 toffset, String* other, int32 ooffset, int32 len);
    bool startsWith(String* prefix);
    bool startsWith(String* prefix, int32 toffset);
    String* substring(int32 beginIndex);
    String* substring(int32 beginIndex, int32 endIndex);
    String* toLowerCase();
    String* toUpperCase();
    String* trim();
    String* toString();

    MutableString* __add__( int8 other );
    MutableString* __add__( int16 other );
    MutableString* __add__( int32 other );
    MutableString* __add__( int64 other );
    MutableString* __add__( float32 other );
    MutableString* __add__( float64 other );
    MutableString* __add__( String * other );

public:
    typedef std::wstring string_type;
    typedef string_type::value_type value_type;
    typedef string_type::size_type size_type;
    typedef std::char_traits<value_type> traits_type;

    string_type* data;
};

class MutableString : public String
{
public:
    MutableString( String* );
    virtual ~MutableString();

public:
    static MutableString* create( String* );

public:
    MutableString* concate( int8 other );
    MutableString* concate( int16 other );
    MutableString* concate( int32 other );
    MutableString* concate( int64 other );
    MutableString* concate( float32 other );
    MutableString* concate( float64 other );
    MutableString* concate( String * other );

    MutableString* __add__( int8 other );
    MutableString* __add__( int16 other );
    MutableString* __add__( int32 other );
    MutableString* __add__( int64 other );
    MutableString* __add__( float32 other );
    MutableString* __add__( float64 other );
    MutableString* __add__( String * other );

public:
    typedef std::basic_stringstream<value_type> stream_type;

    stream_type* stream;
};

String* __getStringLiteral(int64 symbol_id);

} }

#endif /* THOR_LANG_STRING_H_ */

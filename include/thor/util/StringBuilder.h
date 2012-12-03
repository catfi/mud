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

#ifndef THOR_UTIL_STRING_BUILDER_H_
#define THOR_UTIL_STRING_BUILDER_H_

#include "Thor.h"
#include "thor/lang/Language.h"
#include "thor/lang/String.h"

#include <string>
#include <sstream>

namespace thor { namespace util {

class StringBuilder : public thor::lang::Object
{
public:

    StringBuilder();
    StringBuilder( StringBuilder const & ) = delete;
    explicit StringBuilder( ::thor::lang::String * s );
    virtual ~StringBuilder();

    int32 length();

    void reverse();

    thor::lang::String * toString();
    thor::lang::String * toString( int32 start, int32 end );

    void append( thor::lang::String * v );

    void appendAsCharacter( int8 v );
    void appendAsCharacter( int16 v );
    void appendAsCharacter( int32 v );

    void append( int8 v );
    void append( int16 v );
    void append( int32 v );
    void append( int64 v );
    void append( float32 v );
    void append( float64 v );

    void insert( int32 offset, thor::lang::String * s );
    void insert( int32 offset, int8 v );
    void insert( int32 offset, int16 v );
    void insert( int32 offset, int32 v );
    void insert( int32 offset, int64 v );
    void insert( int32 offset, float32 v );
    void insert( int32 offset, float64 v );

private:

    typedef std::wstring string_type;
    typedef std::wstringstream stream_type;
    typedef std::wstringbuf buffer_type;
    typedef std::char_traits<string_type::value_type> traits_type;

private:

    template < typename Sequence >
    void pullChars( Sequence & chars ) 
    {
        buffer_type * buffer = stream->rdbuf();
        while( buffer->in_avail() )
            chars.push( buffer->sbumpc() );
    }

    stream_type * stream;
};

} }

#endif

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

#include "thor/lang/String.h"
#include "thor/util/StringBuilder.h"

#include <cstdint>
#include <cassert>

#include <stack>
#include <queue>
#include <iostream>
#include <sstream>

using namespace thor::lang;
using namespace std;

namespace thor { namespace util {

StringBuilder::StringBuilder()
: stream( new stream_type )
{ }

StringBuilder::StringBuilder( String * s )
: stream( new stream_type( *(s->data) ) )
{ }

StringBuilder::~StringBuilder()
{
    //delete stream;
}

int32 StringBuilder::length()
{
    stream->rdbuf()->pubseekoff( 0, ios_base::end );
    return stream->tellp();
}

void StringBuilder::reverse()
{
    buffer_type * old_buffer = stream->rdbuf();

    stack<traits_type::int_type> chars;
    old_buffer->pubseekoff( 0, ios_base::beg );
    pullChars( chars ); 
  
    stream_type * new_stream = new stream_type;
    buffer_type * new_buffer = new_stream->rdbuf();
    while( !chars.empty() )
    {
        new_buffer->sputc( chars.top() );
        chars.pop();
    }

    delete stream;
    stream = new_stream;
}

String *
StringBuilder::toString()
{
    String * result = String::create();
    *(result->data) = stream->str();
    return result;
}

String *
StringBuilder::toString( int32 start, int32 end )
{
    int32 length = end - start;

    buffer_type * buffer = stream->rdbuf();
    thor::lang::String * result = thor::lang::String::create();

    stream->rdbuf()->pubseekoff( start, ios_base::beg );
    for( ; 0 < length; --length )
        result->data->append( 1, traits_type::to_char_type(buffer->sbumpc()) );

    return result;
}

void
StringBuilder::append( thor::lang::String * v )
{
    *stream << *(v->data);
}

void
StringBuilder::appendAsCharacter( int8 v )
{
    stream->rdbuf()->pubseekoff( 0, ios_base::end );

    stream->rdbuf()->sputc( traits_type::to_char_type(v) );
}

void
StringBuilder::appendAsCharacter( int16 v )
{
    stream->rdbuf()->pubseekoff( 0, ios_base::end );

    stream->rdbuf()->sputc( traits_type::to_char_type(v) );
}

void
StringBuilder::appendAsCharacter( int32 v )
{
    stream->rdbuf()->pubseekoff( 0, ios_base::end );

    stream->rdbuf()->sputc( traits_type::to_char_type(v) );
}

void
StringBuilder::append( int8 v )
{
    stream->rdbuf()->pubseekoff( 0, ios_base::end );

    *stream << (intmax_t)v;
}

void
StringBuilder::append( int16 v )
{
    stream->rdbuf()->pubseekoff( 0, ios_base::end );

    *stream << (intmax_t)v;
}

void
StringBuilder::append( int32 v )
{
    stream->rdbuf()->pubseekoff( 0, ios_base::end );

    *stream << (intmax_t)v;
}

void
StringBuilder::append( int64 v )
{
    stream->rdbuf()->pubseekoff( 0, ios_base::end );

    *stream << (intmax_t)v;
}

void
StringBuilder::append( float32 v )
{
    stream->rdbuf()->pubseekoff( 0, ios_base::end );

    *stream << v;
}

void
StringBuilder::append( float64 v )
{
    stream->rdbuf()->pubseekoff( 0, ios_base::end );

    *stream << v;
}

void
StringBuilder::insert( int32 offset, String * s )
{
    buffer_type * buffer = stream->rdbuf();

    buffer->pubseekoff( offset, ios_base::beg );
    
    queue<traits_type::int_type> chars;
    pullChars( chars );

    *stream << *(s->data);
  
    while( !chars.empty() )
    {
        buffer->sputc( chars.front() );
        chars.pop();
    }
}

void
StringBuilder::insert( int32 offset, int8 v )
{
    buffer_type * buffer = stream->rdbuf();

    buffer->pubseekoff( offset, ios_base::beg );

    queue<traits_type::int_type> chars;
    pullChars( chars );

    *stream << v;

    while( !chars.empty() )
    {
        buffer->sputc( chars.front() );
        chars.pop();
    }
}

void
StringBuilder::insert( int32 offset, int16 v )
{
    buffer_type * buffer = stream->rdbuf();

    buffer->pubseekoff( offset, ios_base::beg );

    queue<traits_type::int_type> chars;
    pullChars( chars );

    *stream << v;

    while( !chars.empty() )
    {
        buffer->sputc( chars.front() );
        chars.pop();
    }
}

void
StringBuilder::insert( int32 offset, int32 v )
{
    buffer_type * buffer = stream->rdbuf();

    buffer->pubseekoff( offset, ios_base::beg );

    queue<traits_type::int_type> chars;
    pullChars( chars );

    *stream << v;

    while( !chars.empty() )
    {
        buffer->sputc( chars.front() );
        chars.pop();
    }
}

void
StringBuilder::insert( int32 offset, int64 v )
{
    buffer_type * buffer = stream->rdbuf();

    buffer->pubseekoff( offset, ios_base::beg );

    queue<traits_type::int_type> chars;
    pullChars( chars );

    *stream << v;

    while( !chars.empty() )
    {
        buffer->sputc( chars.front() );
        chars.pop();
    }
}

void
StringBuilder::insert( int32 offset, float32 v )
{
    buffer_type * buffer = stream->rdbuf();

    buffer->pubseekoff( offset, ios_base::beg );

    queue<traits_type::int_type> chars;
    pullChars( chars );

    *stream << v;

    while( !chars.empty() )
    {
        buffer->sputc( chars.front() );
        chars.pop();
    }    
}

void
StringBuilder::insert( int32 offset, float64 v )
{
    buffer_type * buffer = stream->rdbuf();

    buffer->pubseekoff( offset, ios_base::beg );

    queue<traits_type::int_type> chars;
    pullChars( chars );

    *stream << v;

    while( !chars.empty() )
    {
        buffer->sputc( chars.front() );
        chars.pop();
    } 
}

} }


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
#include "framework/processor/KernelMT.h"
#include "framework/service/runtime/RuntimeServiceBufferMT.h"

#include <cassert>

#include <functional>
#include <algorithm>
#include <string>

namespace thor {

extern zillians::framework::service::RuntimeServiceBufferMT* gRuntimeServiceBuffer;

namespace lang {

String::String() : data(new string_type())
{ }

String::~String()
{
    if (data)
    {
        delete data;
        data = NULL;
    }
}

int64 String::hash()
{
    return std::hash<std::wstring>()(*data);
}

bool String::isEqual(String* rhs)
{
    return compareTo(rhs) == 0;
}

bool String::isLessThan(String* rhs)
{
    return compareTo(rhs) < 0;
}

int32 String::length()
{
    return (int32)data->length();
}

String* String::concate(String* other)
{
    String* obj = String::create();
    *(obj->data) += *data;
    *(obj->data) += *(other->data);
    return obj;
}

int32 String::find(String* candidate)
{
    size_type t = data->find(*(candidate->data));
    if(t == string_type::npos)
        return -1;
    else
        return (int32)t;
}

int32 String::compareTo(String* other) 
{
    return data->compare( *(other->data) );
}

bool String::endsWith(String* suffix) 
{
    if( data->length() < suffix->data->length() )
        return false;
	
    size_type offset = data->length() - suffix->data->length();

	return traits_type::compare( suffix->data->c_str(), data->c_str() + offset,
	                             suffix->data->length() ) == 0;
}

bool String::equals(String* other)
{
    return *data == *(other->data);
}

int32 String::indexOf(String* str)
{
    return indexOf(str, 0);
}

int32 String::indexOf(String* str, int32 fromIndex)
{
    if( fromIndex < 0 || data->length() < fromIndex )
        return false;

    size_type first = data->find( *(str->data), (size_type)fromIndex );

    return (first == string_type::npos) ? -1 : (int32)first;
}

int32 String::lastIndexOf(String* str)
{
    return lastIndexOf(str, 0);
}

int32 String::lastIndexOf(String* str, int32 fromIndex)
{
    if( fromIndex < 0 || data->length() < fromIndex )
        return false;

    String * sub = substring( fromIndex );
    assert( sub );
    size_type last = sub->data->rfind( *(str->data) );
   
    return (last == string_type::npos) ? -1 : (int32)last;
}

bool String::startsWith(String* prefix)
{
    return startsWith(prefix, 0);
}

bool String::startsWith(String* prefix, int32 toffset)
{
    if( toffset < 0 || data->length() < toffset )
        return false;
	
    return traits_type::compare( prefix->data->c_str(), data->c_str() + toffset,
                                 prefix->data->length() ) == 0;
}

String* String::substring(int32 beginIndex)
{
    return substring( beginIndex, data->length() );
}

String* String::substring(int32 beginIndex, int32 endIndex)
{
    if( beginIndex < 0 || endIndex < 0 || endIndex < beginIndex )
        return NULL;

    String* obj = String::create();
     
    *(obj->data) = data->substr( (size_type)beginIndex, size_type(endIndex-beginIndex) );
     
    return obj;
}

namespace detail {

    template <typename CharT>
    inline CharT get_space();

    template <>
    inline wchar_t get_space()
    {
        return L' ';
    }

    template <>
    inline char get_space()
    {
        return ' ';
    }

}

String* String::trim()
{
    using namespace detail;

    String* obj = String::create();
    
    typedef string_type::value_type value_type;       

    string_type::const_iterator begin = data->begin();
    for( ; begin != data->end(); ++begin ) {
        if( traits_type::lt(get_space<value_type>(), *begin) )
            break;
    }
    
    if( begin == data->end() )
        return obj;

    string_type::const_reverse_iterator rbegin = data->rbegin();
    for( ; rbegin != data->rend(); ++rbegin ) {
        if( traits_type::lt(get_space<value_type>(), *rbegin) )
            break;
    }
    
    obj->data->assign( begin, rbegin.base() );

    return obj;
}

bool String::regionMatches(int32 toffset, String* other, int32 ooffset, int32 len)
{
    return regionMatches(false, toffset, other, ooffset, len);
}

bool String::regionMatches(bool ignoreCase, int32 toffset, String* other, int32 ooffset, int32 len)
{
    if( toffset < 0 || ooffset < 0 || len < 0 )
        return false;

    if( data->length() < toffset + len || other->data->length() < ooffset + len )
        return false;

    string_type::const_iterator source = data->begin() + (size_type)toffset,
                                target = other->data->begin() + (size_type)ooffset;

    if( ignoreCase ) {
        
        std::locale const default_locale; 
        for( ; len; --len ) {
            if( std::toupper(*source++, default_locale) != std::toupper(*target++, default_locale) )
                return false;
        }
     
        return true;
        
    } else {
        return std::equal( source, source + (size_type)len, 
                           target, traits_type::eq );
    }
}

String* String::toLowerCase()
{
    String* obj = String::create();
    
    obj->data->resize( data->length() );
    
    std::locale const default_locale;
    std::transform( data->begin(), data->end(), obj->data->begin(), 
                    std::bind(std::tolower<value_type>, std::placeholders::_1, default_locale) );

    return obj;
}

String* String::toUpperCase()
{
    String* obj = String::create();

    obj->data->resize( data->length() );

    std::locale const default_locale;
    std::transform( data->begin(), data->end(), obj->data->begin(),
                    std::bind(std::toupper<value_type>, std::placeholders::_1, default_locale) );

    return obj;
}

bool String::equalsIgnoreCase(String* other)
{
    if( data->length() != other->data->length() )
        return false;
    
    std::locale const default_locale;
    string_type::const_iterator source = data->begin(),
                                target = other->data->begin();
    while( source != data->end() ) {
        if( std::toupper(*source++, default_locale) != std::toupper(*target++, default_locale) )
            return false;
    }

    return true;
}

int32 String::compareToIgnoreCase(String* other)
{
    String *lower_this = toLowerCase(),
           *lower_other = other->toLowerCase();

    return lower_this->compareTo( lower_other );
}

String* String::toString()
{
    return this;
}

MutableString::MutableString(String* s) : stream(new stream_type())
{ 
    *(this->data) = *(s->data);
}

MutableString::~MutableString()
{
    if (stream)
    {
        delete stream;
        stream = NULL;
    }
}

MutableString* MutableString::concate(int8 other)
{
    stream->clear();
    stream->str(L"");
    *stream << (int64)other;
    
    if( !*stream )  
        return nullptr;

    *(this->data) += stream->str();
    
    return this;
}

MutableString* MutableString::concate(int16 other)
{
    stream->clear();
    stream->str(L"");
    *stream << (int64)other;
    
    if( !*stream )  
        return nullptr;

    *(this->data) += stream->str();
    
    return this;
}

MutableString* MutableString::concate(int32 other)
{
    stream->clear();
    stream->str(L"");
    *stream << (int64)other;
    
    if( !*stream )  
        return nullptr;

    *(this->data) += stream->str();
    
    return this;
}

MutableString* MutableString::concate(int64 other)
{
    stream->clear();
    stream->str(L"");
    *stream << other;
    
    if( !*stream )  
        return nullptr;

    *(this->data) += stream->str();
    
    return this;
}

MutableString* MutableString::concate(float32 other)
{
    stream->clear();
    stream->str(L"");
    *stream << other;
    
    if( !*stream )  
        return nullptr;

    *(this->data) += stream->str();
    
    return this;
}

MutableString* MutableString::concate(float64 other)
{
    stream->clear();
    stream->str(L"");
    *stream << other;
    
    if( !*stream )  
        return nullptr;

    *(this->data) += stream->str();
    
    return this;
}

MutableString* MutableString::concate(String* other)
{
    *(this->data) += *(other->data);
    return this;
}

String* __getStringLiteral(int64 symbol_id)
{
    //String* obj = String::createDelegate();
    String* obj = String::create();
    ((zillians::framework::processor::KernelMT*)gRuntimeServiceBuffer->getKernel())->queryStringLiteral(symbol_id, *(obj->data));
    return obj;
}


} }

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

#include "thor/util/UUID.h"
#include "thor/lang/String.h"
#include <apr_uuid.h>
#include <locale>
#include <string.h>

namespace thor { namespace util {

namespace detail {

void wcs_to_cstr(const wchar_t* src, char* dest)
{
    static std::locale ascii_locale;
    std::use_facet<std::ctype<wchar_t> >(ascii_locale).narrow(src, src + wcslen(src), '?', &dest[0]);
}

void cstr_to_wcs(const char* src, wchar_t* dest)
{
    static std::locale ascii_locale;
    std::use_facet<std::ctype<wchar_t> >(ascii_locale).widen(src, src + strlen(src), &dest[0]);
}

}

UUID::UUID()
{
	invalidate();
}

UUID::UUID(thor::lang::String* s)
{
    // parse the data
	// TODO
//        apr_uuid_parse(&data.raw, text->data->c_str());
}

UUID::~UUID()
{ }


bool UUID::valid() const
{
#if __WORDSIZE == 32
    return  ( data.u32[0] != 0 ) ||
            ( data.u32[1] != 0 ) ||
            ( data.u32[2] != 0 ) ||
            ( data.u32[3] != 0 );
#else
    return  ( data.u64[0] != 0 ) ||
            ( data.u64[1] != 0 );
#endif
}

bool UUID::invalid() const
{
#if __WORDSIZE == 32
    return  ( data.u32[0] == 0 ) &&
            ( data.u32[1] == 0 ) &&
            ( data.u32[2] == 0 ) &&
            ( data.u32[3] == 0 );
#else
    return  ( data.u64[0] == 0 ) &&
            ( data.u64[1] == 0 );
#endif
}

void UUID::random()
{
//        apr_uuid_get(&id.data.raw);
}

void UUID::invalidate()
{
#if __WORDSIZE == 32
    data.u32[0] = 0;
    data.u32[1] = 0;
    data.u32[2] = 0;
    data.u32[3] = 0;
#else
    data.u64[0] = 0;
    data.u64[1] = 0;
#endif
}

thor::lang::String* UUID::toString()
{
	thor::lang::String* s = thor::lang::String::create();
	s->data = new thor::lang::String::string_type;

	char ascii[APR_UUID_FORMATTED_LENGTH+1];
	wchar_t ucs4[APR_UUID_FORMATTED_LENGTH+1];
	apr_uuid_format(ascii, (apr_uuid_t*)&data.raw[0]);

	detail::cstr_to_wcs(ascii, ucs4);
	s->data->append(ucs4);
	// TODO
	return s;
}


} }

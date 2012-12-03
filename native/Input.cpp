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

#include "mud/Input.h"

using namespace thor;
using namespace thor::lang;

String* raw_input()
{
    String* obj = String::create();
    // std::wcin >> *(obj->data);
    std::getline( std::wcin, *(obj->data) );
    return obj;

}

int64 input()
{
    int64 result = 0;
    std::wcin >> result;
    return result;
}

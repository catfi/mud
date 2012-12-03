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

#ifndef THOR_LANG_DEBUG_H_
#define THOR_LANG_DEBUG_H_

#include "Thor.h"
#include "thor/lang/String.h"

namespace thor { namespace lang {

void print(bool v);
void print(int8 v);
void print(int16 v);
void print(int32 v);
void print(int64 v);
void print(float32 v);
void print(float64 v);
void print(String* v);
void trace(String* v);

} }

#endif /* THOR_LANG_DEBUG_H_ */

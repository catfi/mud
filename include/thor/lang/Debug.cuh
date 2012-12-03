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

#ifndef THOR_LANG_DEBUG_CUH_
#define THOR_LANG_DEBUG_CUH_

#include "Thor.cuh"
//#include "thor/lang/String.h"

namespace thor { namespace lang {

__device__ void print(bool v);
__device__ void print(int8 v);
__device__ void print(int16 v);
__device__ void print(int32 v);
__device__ void print(int64 v);
__device__ void print(float32 v);
__device__ void print(float64 v);
//void print(String* v);
//void trace(String* v);

} }

#endif /* THOR_LANG_DEBUG_CUH_ */

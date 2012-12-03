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

#ifndef THOR_PRIMITIVETYPES_H_
#define THOR_PRIMITIVETYPES_H_

#include "Platform.h"

#ifndef __CUDACC__
    #if defined (__THOR_PLATFORM_LINUX__) || defined (__THOR_PLATFORM_MAC__)
        #include <cstdint>
    #else
        #include <boost/cstdint.hpp>
    #endif
#endif
#include <limits.h>
#include <stddef.h>

namespace thor {

#ifndef __CUDACC__

    #if defined (__THOR_PLATFORM_LINUX__) || defined (__THOR_PLATFORM_MAC__)

        typedef char byte;

        typedef std::int8_t int8;
        typedef std::int16_t int16;
        typedef std::int32_t int32;
        typedef std::int64_t int64;

        typedef std::uint8_t uint8;
        typedef std::uint16_t uint16;
        typedef std::uint32_t uint32;
        typedef std::uint64_t uint64;

        typedef float float32;
        typedef double float64;

    #else

        typedef char byte;

        typedef boost::int8_t int8;
        typedef boost::int16_t int16;
        typedef boost::int32_t int32;
        typedef boost::int64_t int64;

        typedef boost::uint8_t uint8;
        typedef boost::uint16_t uint16;
        typedef boost::uint32_t uint32;
        typedef boost::uint64_t uint64;

        typedef float float32;
        typedef double float64;

    #endif

#else
    typedef char byte;

    typedef signed char     int8;
    typedef short int       int16;
    typedef int             int32;

    # if __WORDSIZE == 64
        typedef long int        int64;
    # else
        typedef long long int       int64;
    #endif

    typedef unsigned char       uint8;
    typedef unsigned short int  uint16;
    typedef unsigned int        uint32;

    #if __WORDSIZE == 64
        typedef unsigned long int   uint64;
    #else
        typedef unsigned long long int  uint64;
    #endif

    typedef float float32;
    typedef double float64;

#endif

}

#endif /* THOR_PRIMITIVETYPES_H_ */

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

#ifndef THOR_UTIL_RANDOM_H_
#define THOR_UTIL_RANDOM_H_

#include "Thor.h"

#include <random>
#include <limits>
#include <type_traits>
#include "thor/lang/Language.h"

namespace thor { namespace util { 

namespace detail {

    template <typename, bool, bool>
    struct default_random_limits;

    template <typename T>
    struct default_random_limits<T,true,false> {
        static T max() {
            return std::numeric_limits<T>::max();
        }
   
        static T min() {
            return std::numeric_limits<T>::min();
        }
    };

    template <typename T>
    struct default_random_limits<T,false,true> {
        static T max() {
            return static_cast<T>(1.0);
        }
    
        static T min() {
            return static_cast<T>(0.0);
        }
    };
}

struct Uniform : public thor::lang::Object
{
    typedef std::uniform_int_distribution<int64> int_distribution_t;
    typedef std::uniform_real_distribution<float64> real_distribution_t;

	Uniform();
	virtual ~Uniform();
};

struct Normal : public thor::lang::Object
{
    typedef std::normal_distribution<float64> real_distribution_t;

	Normal();
	virtual ~Normal();
};

template <typename T, typename D>
class Random : public thor::lang::Object
{

    typedef std::mt19937 engine_t;
    engine_t * engine;

    typedef typename std::conditional<  
                                      std::is_integral<T>::value,
                                      typename D::int_distribution_t, 
                                      typename D::real_distribution_t
                                     >::type distribution_t;
    distribution_t * distribution;

    typedef detail::default_random_limits<
                                          T,
                                          std::is_integral<T>::value,
                                          std::is_floating_point<T>::value
                                         > limits_t;
    
public:

    Random()
    : engine( new engine_t(std::random_device()()) ),
      distribution( new distribution_t(limits_t::min(), limits_t::max()) )
    { }

    Random( int64 seed )
    : engine( new engine_t(seed) ), 
      distribution( new distribution_t(limits_t::min(), limits_t::max()) ) 
    { }

    Random( T min, T max )
    : engine( new engine_t(std::random_device()()) ),
      distribution( new distribution_t(min, max) )
    { }
 
    Random( int64 seed, T min, T max )
    : engine( new engine_t(seed) ),
      distribution( new distribution_t(limits_t::min(), limits_t::max()) )
    { }

	virtual ~Random() {
		delete engine, delete distribution;
	}

    void seed( int64 seed ) {
        engine->seed( seed );
    }

    T next() {
        return static_cast<T>( (*distribution)(*engine) );
    }
};

} }

#endif

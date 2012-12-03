/**
 * Copyright (C) 2008-2012 Zillians, Inc. <http://www.zillians.com/>
 *
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License, version 3,
 * as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY : float64; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * See the GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include <Thor.h>

#include <cmath>

namespace thor { namespace math {

float64 acos( float64 x ) { return std::acos( x ); }
float64 asin( float64 x ) { return std::asin( x ); }
float64 atan( float64 x ) { return std::atan( x ); }
float64 atan2( float64 y, float64 x ) { return std::atan2( y, x ); }
float64 cos( float64 x ) { return std::cos( x ); }
float64 sin( float64 x ) { return std::sin( x ); }
float64 tan( float64 x ) { return std::tan( x ); }
float64 acosh( float64 x ) { return std::acosh( x ); }
float64 asinh( float64 x ) { return std::asinh( x ); }
float64 atanh( float64 x ) { return std::atanh( x ); }
float64 cosh( float64 x ) { return std::cosh( x ); }
float64 sinh( float64 x ) { return std::sinh( x ); }
float64 tanh( float64 x ) { return std::tanh( x ); }
float64 exp( float64 x ) { return std::exp( x ); }
float64 exp2( float64 x ) { return std::exp2( x ); }
float64 expm1( float64 x ) { return std::expm1( x ); }
int64 ilogb( float64 x ) { return std::ilogb( x ); }
float64 ldexp( float64 x, int64 exp ) { return std::ldexp( x, exp ); }
float64 log( float64 x ) { return std::log( x ); }
float64 log10( float64 x )  { return std::log10( x ); }
float64 log1p( float64 x )  { return std::log1p( x ); }
float64 log2( float64 x ) { return std::log2( x ); }
float64 logb( float64 x ) { return std::logb( x ); }
float64 scalbn( float64 x, int64 n ) { return std::scalbn( x, n ); }
float64 cbrt( float64 x ) { return std::cbrt( x ); }
float64 fabs( float64 x ) { return std::fabs( x ); }
float64 hypot( float64 x, float64 y ) { return std::hypot( x, y ); }
float64 pow( float64 x, float64 y ) { return std::pow( x, y ); }
float64 sqrt( float64 x ) { return std::sqrt( x ); }
float64 erf( float64 x ) { return std::erf( x ); }
float64 erfc( float64 x ) { return std::erfc( x ); }
float64 lgamma( float64 x ) { return std::lgamma( x ); }
float64 tgamma( float64 x ) { return std::tgamma( x ); }
float64 ceil( float64 x ) { return std::ceil( x ); }
float64 floor( float64 x ) { return std::floor( x ); }
float64 nearbyint( float64 x ) { return std::nearbyint( x ); }
float64 rint( float64 x ) { return std::rint( x ); }
int64 irint( float64 x ) { return std::llrint( x ); }
float64 round( float64 x ) { return std::round( x ); }
float64 iRound( float64 x ) { return std::llround( x ); }
float64 trunc( float64 x ) { return std::trunc( x ); }
float64 mod( float64 x, float64 y ) { return std::fmod( x, y ); }
float64 remainder( float64 x, float64 y ) { return std::remainder( x, y ); }
float64 copysign( float64 x, float64 y ) { return std::copysign( x, y ); }
float64 nextafter( float64 x, float64 y ) { return std::nextafter( x, y ); }
float64 nexttoward( float64 x, float64 y ) { return std::nexttoward( x, y ); }
float64 dim( float64 x, float64 y ) { return std::fdim( x, y ); }
float64 max( float64 x, float64 y ) { return std::fmax( x, y ); }
float64 min( float64 x, float64 y ) { return std::fmin( x, y ); }
float64 ma( float64 x, float64 y, float64 z ) { return std::fma( x, y, z ); }

bool isgreater( float64 x, float64 y ) { return std::isgreater( x, y ); }
bool isgreaterequal( float64 x, float64 y ) { return std::isgreaterequal( x, y ); }
bool isless( float64 x, float64 y ) { return std::isless( x, y ); }
bool islessequal( float64 x, float64 y ) { return std::islessequal( x, y ); }
bool islessgreater ( float64 x, float64 y ) { return std::islessgreater( x, y );}

}  }

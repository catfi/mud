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

@cpu
@native 
function acos( x : float64 ) : float64;

@cpu
@native 
function asin( x : float64 ) : float64;

@cpu
@native 
function atan( x : float64 ) : float64;

@cpu
@native 
function atan2( y : float64, x : float64 ) : float64;

@cpu
@native 
function cos( x : float64 ) : float64;

@cpu
@native 
function sin( x : float64 ) : float64;

@cpu
@native 
function tan( x : float64 ) : float64;

@cpu
@native 
function acosh( x : float64 ) : float64;

@cpu
@native 
function asinh( x : float64 ) : float64;

@cpu
@native 
function atanh( x : float64 ) : float64;

@cpu
@native 
function cosh( x : float64 ) : float64;

@cpu
@native 
function sinh( x : float64 ) : float64;

@cpu
@native 
function tanh( x : float64 ) : float64;

@cpu
@native 
function exp( x : float64 ) : float64;

@cpu
@native 
function exp2( x : float64 ) : float64;

@cpu
@native 
function expm1( x : float64 ) : float64;

@cpu
@native 
function ilogb( x : float64 ) : int64;

@cpu
@native 
function ldexp( x : float64, iexp : int64 ) : float64;

@cpu
@native 
function log( x : float64 ) : float64;

@cpu
@native 
function log10( x : float64 ) : float64;

@cpu
@native 
function log1p( x : float64 ) : float64;

@cpu
@native 
function log2( x : float64 ) : float64;

@cpu
@native 
function logb( x : float64 ) : float64;

@cpu
@native 
function scalbn( x : float64, n : int64 ) : float64;

@cpu
@native 
function cbrt( x : float64 ) : float64;

@cpu
@native 
function fabs( x : float64 ) : float64;

@cpu
@native 
function hypot( x : float64, y : float64 ) : float64;

@cpu
@native 
function pow( x : float64, y : float64 ) : float64;

@cpu
@native 
function sqrt( x : float64 ) : float64;

@cpu
@native 
function erf( x : float64 ) : float64;

@cpu
@native 
function erfc( x : float64 ) : float64;

@cpu
@native 
function lgamma( x : float64 ) : float64;

@cpu
@native 
function tgamma( x : float64 ) : float64;

@cpu
@native 
function ceil( x : float64 ) : float64;

@cpu
@native 
function floor( x : float64 ) : float64;

@cpu
@native 
function nearbyint( x : float64 ) : float64;

@cpu
@native 
function rint( x : float64 ) : float64;

@cpu
@native 
function irint( x : float64 ) : int64;

@cpu
@native 
function round( x : float64 ) : float64;

@cpu
@native 
function iRound( x : float64 ) : float64;

@cpu
@native 
function trunc( x : float64 ) : float64;

@cpu
@native 
function mod( x : float64, y : float64 ) : float64;

@cpu
@native 
function remainder( x : float64, y : float64 ) : float64;

@cpu
@native 
function copysign( x : float64, y : float64 ) : float64;

@cpu
@native 
function nextafter( x : float64, y : float64 ) : float64;

@cpu
@native 
function nexttoward( x : float64 ) : float64;

@cpu
@native 
function dim( x : float64, y : float64 ) : float64;

@cpu
@native 
function max( x : float64, y : float64 ) : float64;

@cpu
@native 
function min( x : float64 ) : float64;

@cpu
@native 
function ma( x : float64, y : float64, z : float64 ) : float64;

@cpu
@native 
function isgreater( x : float64, y : float64 ) : bool;

@cpu
@native 
function isgreaterequal( x : float64, y : float64 ) : bool;

@cpu
@native 
function isless( x : float64, y : float64 ) : bool;

@cpu
@native 
function islessequal( x : float64, y : float64 ) : bool;

@cpu
@native 
function islessgreater ( x : float64, y : float64 ) : bool;

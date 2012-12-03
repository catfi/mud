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

import . = thor.unmanaged;

@cpu
@native { include = "thor/lang/Lambda.h" }
class Lambda extends Object
{
}

@cpu
@native { include = "thor/lang/Lambda.h" }
class Lambda0<R> extends Lambda
{
    @cpu
	@native
	public function new<T>(o: T): void;

    @cpu
	@native
	public function delete(): void;

    @cpu
	@native
	@export
	public function invoke(): R;

    @cpu
	var _invoke : int64;	    // function pointer
	@cpu
	var _obj : ptr_<Object>;	// lambda object
}

@cpu
@native { include = "thor/lang/Lambda.h" }
class Lambda1<R, T0> extends Lambda
{
    @cpu
	@native
	public function new<T>(o: T): void;

    @cpu
	@native
	public function delete(): void;

    @cpu
	@native
	@export
	public function invoke(t0: T0): R;

    @cpu
	var _invoke : int64;	// function pointer
	
	@cpu
	var _obj : ptr_<Object>;	// lambda object
}

@cpu
@native { include = "thor/lang/Lambda.h" }
class Lambda2<R, T0, T1> extends Lambda
{
    @cpu
	@native
	public function new<T>(o: T): void;

    @cpu
	@native
	public function delete(): void;

    @cpu
	@native
	@export
	public function invoke(t0: T0, t1: T1): R;

    @cpu
	var _invoke : int64;	// function pointer
	
	@cpu
	var _obj : ptr_<Object>;	// lambda object
}


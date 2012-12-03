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
import . = thor.lang;

@cpu
@native { include="thor/util/Random.h" }
class Uniform extends Object { }

@cpu
@native { include="thor/util/Random.h" }
class Normal extends Object { }

@cpu
@native { include="thor/util/Random.h" }
class Random<T,D> extends Object
{
    @cpu
    private var engine : ptr_<int8>;
    @cpu
    private var distribution : ptr_<int8>;
    
    @cpu
	@native
    public function new() : void;

    @cpu
	@native
    public function new(seed:int64) : void;

    @cpu
	@native
    public function new(min:T, max:T) : void;

    @cpu
	@native
    public function new(seed:int64, min:T, max:T) : void;

    @cpu
	@native
    public virtual function delete() : void;

    @cpu
	@native
    public function seed(seed:int64) : void;    

    @cpu
	@native
    public function next() : T;
}

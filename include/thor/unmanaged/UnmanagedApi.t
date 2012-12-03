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

import . = thor.lang;

@cpu
class ptr_<T> extends Object { }

@cpu
class ref_<T> extends Object { }

@cpu
class const_<T> extends Object { }

@cpu
@system
function deref<P, V>(pointer:P):V;

@cpu
@system
function addressof<V, P>(value:V):P;

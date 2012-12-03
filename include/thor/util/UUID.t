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
@native
class UUID extends Object 
{
    @cpu
	@native
	public function new():void;
	
	@cpu
	@native
	public function new(s:String):void;
	
	@cpu
	@native
	public function random():void;
	
	@cpu
	@native
	public function invalidate():void;
	
	@cpu
	@native
	public function toString():String;
	
	@cpu
	private var _dummy_placeholder0:int64;
	@cpu
	private var _dummy_placeholder1:int64;
}


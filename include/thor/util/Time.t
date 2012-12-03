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
import . = thor.unmanaged;

@cpu
@native
class Time extends Object
{
    @native
    private function new():void;

    @native
    public virtual function delete():void;

	@native
	public static function current():Time;
	
	@native
	public function seconds():int64;
	
	@native
	public function milliseconds():int64;
	
	@native
	public function microseconds():int64;

    private static function create():Time
    {
        return new Time();
    }
	
	private var _internal: ptr_<int8>;
}

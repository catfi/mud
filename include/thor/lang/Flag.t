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

@cpu
@native
class Flag extends Object
{
    @cpu
	@native
	public function new():void;
	
	@cpu
	@native
	public function createInteger(name:String, description:String, required:bool):void;
	
	@cpu
	@native
	public function createFloat(name:String, description:String, required:bool):void;
	
	@cpu
	@native
	public function createString(name:String, description:String, required:bool):void;
	
	@cpu
	@native
	public function positional(name:String);
	
	@cpu
	@native
	public function parse():bool;
	
	@cpu
	@native
	public function has(name:String):bool;
	
	@cpu
	@native
	public function lookupInteger(name:String):int64;

    @cpu
	@native
	public function lookupFloat(name:String):float64;

    @cpu
	@native
	public function lookupString(name:String):String;
	
	@cpu
	@native
	public function help():String;
	
	@cpu
	private var _thor_lang_flag_internal_1:int64;
	@cpu
	private var _thor_lang_flag_internal_2:int64;
	@cpu
	private var _thor_lang_flag_internal_3:int64; 
}

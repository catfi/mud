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
@gpu
@system
function print(value:bool):void;

@cpu
@gpu
@system
function print(value:int8):void;

@cpu
@gpu
@system
function print(value:int16):void;

@cpu
@gpu
@system
function print(value:int32):void;

@cpu
@system
function print(value:int64):void;

@cpu
@gpu
@system
function print(value:float32):void;

@cpu
@gpu
@system
function print(value:float64):void;

@cpu
@system
function print(value:String):void;

@cpu
@system
function trace(value:String):void;

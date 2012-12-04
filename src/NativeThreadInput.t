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

import .= thor.unmanaged;

@native
class NativeThreadInput extends Object
{
    @native
    public function new():void;

    @native
    public virtual function delete():void;

    @native
    public function start(): void;

    @native
    public function setLastInput(): void;

    @native
    public function getInput(): String;

    private var mThread: ptr_<int8>;
    private var mMutex: ptr_<int8>;
    private var mInputString: ptr_<int8>;
    private var mLastInput: bool;
}

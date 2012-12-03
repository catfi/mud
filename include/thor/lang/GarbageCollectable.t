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
function thread_init_gc_root() : void
{
    // each thread should call this function before any calling any thorscript function

    // Well, currently, it's a place holder
    // The llvm gc root will be placed here
}

@cpu
@native
interface GarbageCollectable
{
	@native
	public function getContainedObjects(o: CollectableObject): void;
}

@cpu
@native
class CollectableObject; 


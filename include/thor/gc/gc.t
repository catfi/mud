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

import . = thor.container;
import . = thor.lang;

@cpu
function performAndWaitGC(): void
{
    var last_generation_id = getGenerationId();

    while (true)
    {
        // Well, at least run three times so that we could
        // make sure the floating garbage is elimited
        if (getGenerationId() - last_generation_id >= 3)
        {
            break;
        }
    }
}

@cpu
function getActiveObject(): Vector<Object>
{
    var objects = new Vector<Object>();

    // tempoarily disable gc, so we could safely access 
    // active objects
    setGCEnable(false);

    // wait for the gc stop
    while (isGCWorking());
    getActiveObjectInternal(objects);

    // well, after disabling, we need to enabling
    setGCEnable(true);

    return objects;
}

@cpu
@system
function getGenerationId(): int64;

@cpu
@system
function isGCWorking(): bool;

@cpu
@system
function setGCEnable(enable: bool): void;

@cpu
@system
function getActiveObjectInternal(objects: Vector<Object>): void;

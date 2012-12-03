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


//
// thor.lang.initialize
// 
// The initialize function will be called before entry function. Currently, it should
// be set with annotation "export" so that it could be called by the framework.
//
@export
@cpu
@gpu 
function initialize() : void
{
    on(x86={
        // initialize local domain object
        var obj = Domain.create();
        var session_id = __getCurrentSessionId(__getCurrentInvocationId());
    
        obj.setSessionId(session_id);
        __addDomainObject(session_id, obj);
        __setLocalDomainObject(obj);
        __RSTMSystemInitialize();
    },
    cuda = {
        //var obj = Domain.create();
    });        
}

@system
@cpu
@gpu
class Object
{
    @native
    @cpu
    @gpu
    public virtual function delete():void;
	
    @native
    @cpu
    @gpu
    public virtual function clone():Object;
    
    @native
    @cpu
    @gpu
    public virtual function hash():int64;
    
    @native
    @cpu
    @gpu
    public function domain():Domain;

    private var _thor_lang_object_internal:Object;
}

@system
@cpu
@gpu
function __createObject(size:int64, type_id:int64):Object;

@system
@cpu
@gpu
function __destroyObject(object:Object):void;

@system
@cpu
function __addToRootSet(object:Object):bool;

@system
@cpu
function __removeFromRootSet(object:Object):bool;

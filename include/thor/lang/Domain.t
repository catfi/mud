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
import . = thor.util;

@cpu
enum DomainType {
	SingleThreaded,
	MultiThreaded,
	Accelerator
}

@cpu
enum DomainEvent {
	Connected,
	Disconnected,
	Unreachable,
	Resumed,
	Crashed
}
 
@cpu
@gpu
@native { include="thor/lang/Domain.h" }
class Domain extends Object
{
    @cpu
    @native
    private function new():void;

    @cpu
	public static function create():Domain {
        var obj:Domain = new Domain();
		return obj;
    }   
	
	@cpu
	@gpu
	@native
	public static function local():Domain;
	
	@cpu
	@gpu
	@native
	public static function caller():Domain;
	
	@cpu
	@gpu
	@native
	public function getContext():Object;

    @cpu
    @gpu
	@native
	public function setContext(ctx:Object):void;

    @cpu
	@native
	public function getId():UUID;
	
	@cpu
	@native
	public function setId(id:UUID):void;

    @cpu
	@native
	public function type():DomainType;

    @cpu
    @native
    public function setSessionId(id: int64):void;

	//@native
	//public static function watch(e:DomainEvent, callback:function(Domain):void):void;	
	
	@cpu
	@native
	public static function watch(e:int32, callback:lambda(Domain):void):void;	
	//public static function watch(e:int32):void;
	
	@cpu
	private var session_id:int64;
	@cpu
	private var context:Object;
}


// This will be called in framework
// TODO: event should be DomainEvent
@cpu
@export
function domain_callback(e:int32) : void
{
    // find or create the specific domain, according to the session id
    var session_id = __getCurrentSessionId(__getCurrentInvocationId());
    var domain = null;

    if (e == 0)
    {
        // conntect
        domain = Domain.create();
        domain.setSessionId(session_id);

        __addDomainObject(session_id, domain);
    }
    else if (e == 1 || e == 3 || e == 4)
    {
        // disconnect/crash/resume
        domain = __findDomainObject(session_id);
    }

    if (domain == null) return;

    // fetch all callback from the specific event
    var callbacks = new Vector< Lambda1<void, Domain> >();
    __getDomainCallbacks(e, callbacks);

    for (var i = 0; i < callbacks.size(); i++)
    {
        var f = callbacks.get(i);
        f(domain);
    }
}

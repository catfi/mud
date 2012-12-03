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

/*
// TODO kernel launch helpers on accelerators
@native
public function accLaunch<F>(dim_x:int64, dim_y:int64, dim_z:int64, function:F):int32;
 
@native
public function accLaunch<F, T0>(dim_x:int64, dim_y:int64, dim_z:int64, function:F, p0:T0):int32; 

@native
public function accLaunch<F, T0, T1>(dim_x:int64, dim_y:int64, dim_z:int64, function:F, p0:T0, p1:T1):int32; 

@native
public function accLaunch<F, T0, T1, T2>(dim_x:int64, dim_y:int64, dim_z:int64, function:F, p0:T0, p1:T1, p2:T2):int32; 
*/

import . = thor.container;

@cpu 
@gpu 
@native
function daemonize():void;

@cpu 
@gpu 
@native
function exit(exit_code:int32):void;

@cpu 
@gpu 
@native
function __getCurrentInvocationId():int32;

@cpu 
@gpu 
@native
function __cuda_getCurrentInvocationId():int32;

@cpu 
@gpu 
@native
function __getCurrentSessionId(invocation_id:int32):int64;

@cpu
@gpu 
@native
function __getSessionObject(session_id:int64):Object;

@cpu
@gpu 
@native
function __setSessionObject(session_id:int64, object:Object):void;

@cpu
@gpu 
@native
function __setLocalDomainObject(domain: Object):void;

@cpu
@gpu 
@native
function __addDomainObject(session_id: int64, domain: Object):void;

@cpu
@gpu 
@native
function __findDomainObject(session_id: int64): Domain;

// TODO: event should be enum DomainEvent
@cpu 
@native
function __getDomainCallbacks(event: int32, callbacks: Vector< Lambda1<void, Domain> > ): void;

// This one will be used by @async restruct
@export
@cpu
function invokeFunctionWrapper(f: lambda(): void)
{
    f();
    __removeFromRootSet(cast<Object>(f));
}

@native
@cpu
function __invokeFunction(domain:Object, function_id:int64, callback:lambda(): void): void;

@cpu 
@native { include="thor/lang/Process.h" }
function escape_point(): void;

@native { include="thor/lang/Process.h" }
function __RSTMSystemInitialize():void;

@native { include="thor/lang/Process.h" }
function lock<A>(a:A, io1:int32):void;

@native { include="thor/lang/Process.h" }
function lock<A, B>(a:A, io1:int32, b:B, io2:int32):void;

@native { include="thor/lang/Process.h" }
function lock<A, B, C>(a:A, io1:int32, b:B, io2:int32, c:C, io3:int32):void;

@native { include="thor/lang/Process.h" }
function lock<A, B, C, D>(a:A, io1:int32, b:B, io2:int32, c:C, io3:int32, d:D, io4:int32):void;

@native { include="thor/lang/Process.h" }
function lock<A, B, C, D, E>(a:A, io1:int32, b:B, io2:int32, c:C, io3:int32, d:D, io4:int32, e:E, io5:int32):void;

@native { include="thor/lang/Process.h" }
function unlock<A>(a:A, io1:int32):void;

@native { include="thor/lang/Process.h" }
function unlock<A, B>(a:A, io1:int32, b:B, io2:int32):void;

@native { include="thor/lang/Process.h" }
function unlock<A, B, C>(a:A, io1:int32, b:B, io2:int32, c:C, io3:int32):void;

@native { include="thor/lang/Process.h" }
function unlock<A, B, C, D>(a:A, io1:int32, b:B, io2:int32, c:C, io3:int32, d:D, io4:int32):void;

@native { include="thor/lang/Process.h" }
function unlock<A, B, C, D, E>(a:A, io1:int32, b:B, io2:int32, c:C, io3:int32, d:D, io4:int32, e:E, io5:int32):void;

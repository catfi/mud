import thor.container;
import thor.math;

import Game;
import Util;
import Server;

// event base
class Event
{ }

// event listener base
class EventListener
{
    public virtual function performed( event : Event ) : void
    {
        print( "EventListener.performed" );
    }
}

var gEventQueue : thor.container.Vector<Event> = new thor.container.Vector<Event>;

// event type codes
var EVENT_MOVE : int32 = 0;

var gMoveEventListeners : thor.container.Vector<EventListener> = new thor.container.Vector<EventListener>;

// public interface for each sub-systems
function pushEvent( event : Event ) : void
{
    gEventQueue.push_back( event );
}

function addEventListener( eventType : int32, listener : EventListener ) : void
{
    if ( eventType == EVENT_MOVE )
    {
        gMoveEventListeners.push_back( listener );
    }
    else
    {
        print ( "ERROR! unknown event type\n" );
    }
}

var gEventDispatcher : Util.Timer = null;

// internal code to consume events in queue
function dispatchEvents() : void
{
    while ( gEventQueue.size() != 0 )
    {
        var last : int64 = gEventQueue.size() - 1;
        var event : Event = gEventQueue.get( last );
        if ( isa<MoveEvent>(event) )
        {
            for( var listener in gMoveEventListeners )
                listener.performed( event );

            gEventQueue.pop_back();
        }
        else if ( isa<ExitEvent>(event) )
        {
            var listener : ExitEventListener = new ExitEventListener;
            listener.performed( event );
            gEventQueue.pop_back();
        }
        else if ( isa<GenerateMobEvent>(event) )
        {
            var listener : EventListener = new GenerateMobEventListener;
            listener.performed( event );
            gEventQueue.pop_back();
        }
        else if ( isa<SayEvent>(event) )
        {
            var listener : EventListener = new SayEventListener;
            listener.performed( event );
            gEventQueue.pop_back();
        }
        else
        {
            print( "ERROR! unknown event type\n" );
            return;
        }
    }
}

// real event types
class MoveEvent extends Event
{
    public var mLiving : Game.Living;
    public var mOffset : Game.Point;
    public var mDirection : int32;

    public static var NORTH : int32 = 1;
    public static var WEST : int32 = 2;
    public static var SOUTH : int32 = 3;
    public static var EAST : int32 = 4;

    public function new( living : Game.Living,
                         offset : Game.Point )
    {
        mLiving = living;
        mOffset = offset;
    }

    public function new( living : Game.Living,
                         direction : int32 )
    {
        mLiving = living;
        mDirection = direction;
    }
}

class ExitEvent extends Event
{
    public var mPlayer : Game.PlayerInfo;

    public function new( player : Game.PlayerInfo )
    {
        mPlayer = player;
    }
}

class SayEvent extends Event
{
    public var mPlayer : Game.PlayerInfo;
    public var mMsg : String;

    public function new( player : Game.PlayerInfo, msg : String )
    {
        mPlayer = player;
        mMsg = msg;
    }
}

class AttackEvent extends Event
{
    public var mSource : Game.Living;
    public var mTarget : Game.Living;

    public function new( source : Game.Living, target : Game.Living ) : void
    {
        mSource = source;
        mTarget = target;
    }
}

class GenerateMobEvent extends Event
{ }

// real listeners
class ExitEventListener// extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        var exitEvent : ExitEvent = cast<ExitEvent>(event);

        var player : Game.PlayerInfo = exitEvent.mPlayer;
        var domain : Domain = Server.ConnectionSystem.sPlayerDomainTable.get( player );

        // remove player and mapped domain in connection system
        Server.ConnectionSystem.sDomainPlayerTable.remove( domain );
        Server.ConnectionSystem.sPlayerDomainTable.remove( player );

        // remove player object from game
        Server.gGameState.remove( player );
    }
}

class GenerateMobEventListener extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        var mob = Game.MobGenerator.gen();

        Server.ObjectSystem.addMob( mob );
    }
}

class SayEventListener extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        var sayEvent : SayEvent = cast<SayEvent>( event );

        print( "broadcast: \"" + sayEvent.mMsg + "\"\n" );
        Server.ConnectionSystem.broadcast( sayEvent.mPlayer.name + " says: " + sayEvent.mMsg );
    }
}

class MoveEventListener extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        var moveEvent = cast<MoveEvent>( event );

        // if mob is nearby a player, don't move
        if ( isa<Game.Mob>( moveEvent.mLiving ) )
        {
            var players = Server.gGameState.players();
            for ( var p in players )
            {
                var dist = thor.math.fabs(moveEvent.mLiving.position.row - p.position.row) +
                           thor.math.fabs(moveEvent.mLiving.position.col - p.position.col);

                if ( dist < 2.0 )
                    return;
            }
        }

        var successful : bool = Server.ObjectSystem.move(moveEvent.mLiving, moveEvent.mDirection);
        if ( isa<Game.Mob>( moveEvent.mLiving ) )
            return;

        var player = cast<Game.PlayerInfo>( moveEvent.mLiving );

        if ( successful )
        {
            var objects = Server.gGameState.mAllObjects;
            var msg : String = "map: " + Util.VectorConverter.toString(objects);

            Server.ConnectionSystem.send( player, msg );
        }
        else
        {
            Server.ConnectionSystem.send( player, "invalid move" );
        }
    }
}


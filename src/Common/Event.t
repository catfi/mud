import thor.container;

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
        else if( isa<ExitEvent>(event) )
        {
            var listener : ExitEventListener = new ExitEventListener;
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
    public var mObject : Game.ObjectInfo;
    public var mOffset : Game.Point;

    public function new( object : Game.ObjectInfo,
                         offset : Game.Point )
    {
        mObject = object;
        mOffset = offset;
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

// real listeners
class ExitEventListener// extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        print( "ExitEventListener.performed" );
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

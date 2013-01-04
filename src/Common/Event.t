import thor.container;

import Game;
import Util;

// event base
interface Event
{
    public function type() : int32;
}

class EventListener
{
    public virtual function performed( event : Event ) : void
    { }
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
        if ( event.type() == EVENT_MOVE )
        {
            for( var listener in gMoveEventListeners )
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
class MoveEvent implements Event
{
    public var mObject : Game.ObjectInfo;
    public var mOffset : Game.Point;

    public function new( object : Game.ObjectInfo,
                         offset : Game.Point )
    {
        mObject = object;
        mOffset = offset;
    }

    public virtual function type() : int32
    {
        return EVENT_MOVE;
    }
}

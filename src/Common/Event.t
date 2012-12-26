import thor.container;

import Game;

// event base
interface Event
{
    public function type() : int32;
}

interface EventListener
{
    public function performed() : void;
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
    if( eventType == EVENT_MOVE )
        gMoveEventListeners.push_back( listener );
}

// real event types
class MoveEvent implements Event
{
    public var mOffset : Game.Point;
    public var mObject : Game.ObjectInfo;

    public virtual function type() : int32
    {
        return EVENT_MOVE;
    }
}

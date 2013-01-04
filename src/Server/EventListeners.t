import Common;
import Game;
import Util;

class MoveEventListener extends Common.EventListener
{
    public virtual function performed( event : Common.Event ) : void
    {
        var moveEvent = cast<Common.MoveEvent>( event );
        var player = cast<Game.PlayerInfo>( moveEvent.mObject );

        if ( ObjectSystem.move(moveEvent.mObject, moveEvent.mOffset) )
        {
            var objects = gGameState.mAllObjects;
            var msg : String = "map: " + Util.VectorConverter.toString(objects);

            ConnectionSystem.send( player, msg );
        }
        else
        {
            ConnectionSystem.send( player, "invalid move" );
        }
    }
}

import Common;
import Game;
import Util;

class MoveEventListener extends Common.EventListener
{
    public virtual function performed( event : Common.Event ) : void
    {
        var moveEvent = cast<Common.MoveEvent>( event );

        var player : Game.PlayerInfo = null;
        if( isa<Game.PlayerInfo>( moveEvent.mObject ) )
            player = cast<Game.PlayerInfo>( moveEvent.mObject );

        if ( ObjectSystem.move(moveEvent.mObject, moveEvent.mOffset) )
        {
            if( player != null )
            {
                var objects = gGameState.mAllObjects;
                var msg : String = "map: " + Util.VectorConverter.toString(objects);

                ConnectionSystem.send( player, msg );
            }
        }
        else
        {
            if ( player != null )
            {
                ConnectionSystem.send( player, "invalid move" );
            }
        }
    }
}

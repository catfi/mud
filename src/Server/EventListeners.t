import thor.math;

import Common;
import Game;
import Util;

class MoveEventListener extends Common.EventListener
{
    public virtual function performed( event : Common.Event ) : void
    {
        var moveEvent = cast<Common.MoveEvent>( event );

        // if mob is nearby a player, don't move
        if ( isa<Game.Mob>( moveEvent.mObject ) )
        {
            var players = gGameState.players();
            for ( var p in players )
            {
                var dist = thor.math.fabs(moveEvent.mObject.position.row - p.position.row) +
                           thor.math.fabs(moveEvent.mObject.position.col - p.position.col);

                if ( dist < 2.0 )
                    return;
            }
        }

        var successful : bool = ObjectSystem.move(moveEvent.mObject, moveEvent.mOffset);
        if ( isa<Game.Mob>( moveEvent.mObject ) )
            return;

        var player = cast<Game.PlayerInfo>( moveEvent.mObject );

        if ( successful )
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

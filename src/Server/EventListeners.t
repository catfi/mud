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
        if ( isa<Game.Mob>( moveEvent.mLiving ) )
        {
            var players = gGameState.players();
            for ( var p in players )
            {
                var dist = thor.math.fabs(moveEvent.mLiving.position.row - p.position.row) +
                           thor.math.fabs(moveEvent.mLiving.position.col - p.position.col);

                if ( dist < 2.0 )
                    return;
            }
        }

        var successful : bool = ObjectSystem.move(moveEvent.mLiving, moveEvent.mDirection);
        if ( isa<Game.Mob>( moveEvent.mLiving ) )
            return;

        var player = cast<Game.PlayerInfo>( moveEvent.mLiving );

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

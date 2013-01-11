import .= thor.container;
import .= thor.util;

import .= Game;
import .= Util;
import Common;

class ObjectSystem
{
    private static function isValidPos( row : int32, col : int32 ) : bool
    {
        if ( !(0 <= row && row < MAP_ROW_LIMIT) )
            return false;

        if ( !(0 <= col && col < MAP_COLUMN_LIMIT) )
            return false;

        return true;
    }

    private static function isValidMove( object : ObjectInfo, offset : Point ) : bool
    {

        var next : Point = new Point( object.position.row + offset.row,
                                      object.position.col + offset.col );

        if( !isValidPos( next.row, next.col ) )
            return false;

        return true;
    }

    private static function getMapString() : String
    {
        return "map: " + VectorConverter.toString(gGameState.mAllObjects);
    }

    private static function getRandomPos() : Point
    {
        var rowGenerator : Random<int32, Uniform> = new Random<int32, Uniform>( 0, MAP_ROW_LIMIT-1 );
        var colGenerator : Random<int32, Uniform> = new Random<int32, Uniform>( 0, MAP_COLUMN_LIMIT-1 );

        var result : Point = new Point( 0, 0 );
        do
        {
            result.row = rowGenerator.next();
            result.col = colGenerator.next();
        } while ( !isValidPos(result.row, result.col) );

        return result;
    }

    public static function move( object : ObjectInfo, offset : Game.Point ) : bool
    {
        if ( !isValidMove(object, offset) )
            return false;

        object.position.row += offset.row;
        object.position.col += offset.col;

        return true;
    }

    public static function move( living : Living, direction : int32 ) : bool
    {
        var current = living.mRoom;
        var next : Room = null;

        if ( direction == Common.MoveEvent.NORTH )
            next = current.mNorth;
        else if ( direction == Common.MoveEvent.SOUTH )
            next = current.mSouth;
        else if ( direction == Common.MoveEvent.WEST )
            next = current.mWest;
        else if ( direction == Common.MoveEvent.EAST )
            next = current.mEast;
        else
            return false;

        if ( next == null )
            return false;

        current.leave( living );
        next.enter( living );

        return true;
    }

    public static function add( player : PlayerInfo ) : void
    {
        gGameState.add( player );

        print( "add player\n" );
        ConnectionSystem.send( player, getMapString() );
    }

    public static function addMob( mob : Mob ) : void
    {
        gGameState.add( mob );

        print( "add mob\n" );
    }
}

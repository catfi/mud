import .= thor.container;
import .= thor.util;

import .= Game;
import .= Util;
import Common;

class ObjectSystem
{
    private static function isValidPos( point : Point ) : bool
    {
        if ( !( (0 <= point.row && point.row < MAP_ROW_LIMIT) &&
                (0 <= point.col && point.col < MAP_COLUMN_LIMIT) ) )
        {
            return false;
        }

        var objects : Vector< ObjectInfo > = gGameState.mAllObjects;
        for ( var i = 0; i != objects.size(); ++i )
        {
            if ( objects[ i ].position.row == point.row &&
                 objects[ i ].position.col == point.col )
            {
                return false;
            }
        }

        return true;
    }

    private static function isValidMove( object : ObjectInfo, offset : Point ) : bool
    {

        var next : Point = new Point( object.position.row + offset.row,
                                      object.position.col + offset.col );

        if( !isValidPos( next ) )
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
        } while ( !isValidPos(result) );

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

    public static function move( object : ObjectInfo, direction : int32 ) : void
    {
        print( "ObjectSystem.move()\n" );

        var offset : Point = new Point( 0, 0 );

        if( direction == DIRECT_NORTH )
            offset.row = -1;
        else if( direction == DIRECT_SOUTH )
            offset.row = 1;
        else if( direction == DIRECT_WEST )
            offset.col = -1;
        else if( direction == DIRECT_EAST )
            offset.col = 1;

        var event : Common.Event = new Common.MoveEvent( object, offset );
        Common.pushEvent( event );
/*
        var msg : PlayerMessage = new PlayerMessage( player, "map: " + VectorConverter.toString(gGameState.mAllObjects) );
        var msgs : Vector< PlayerMessage > = new Vector< PlayerMessage >;
        msgs.push_back( msg );

        ConnectionSystem.send( msgs );
*/
    }

    public static function addPlayer( player : PlayerInfo )
    {
        var players : Vector< PlayerInfo > = gGameState.mPlayers;
        var objects : Vector< ObjectInfo > = gGameState.mAllObjects;

        player.position = getRandomPos();

        players.push_back( player );
        objects.push_back( player );

        print( "add player A \n " );
        ConnectionSystem.send( player, getMapString() );
    }
}

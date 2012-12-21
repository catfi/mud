import .= thor.container;
import .= thor.util;

import .= Game;
import .= Util;

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

    private static function isValidMove( player : PlayerInfo, offset : Point ) : bool
    {

        var next : Point = new Point( player.position.row + offset.row,
                                      player.position.col + offset.col );

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

    public static function move( player : PlayerInfo, direction : int32 ) : void
    {
        var offset : Point = new Point( 0, 0 );

        if( direction == DIRECT_NORTH )
            offset.row = -1;
        else if( direction == DIRECT_SOUTH )
            offset.row = 1;
        else if( direction == DIRECT_WEST )
            offset.col = -1;
        else if( direction == DIRECT_EAST )
            offset.col = 1;

        if( isValidMove( player, offset ) )
        {
            player.position.row += offset.row;
            player.position.col += offset.col;
        }

        var msg : PlayerMessage = new PlayerMessage( player, "map: " + VectorConverter.toString(gGameState.mAllObjects) );
        var msgs : Vector< PlayerMessage > = new Vector< PlayerMessage >;

        msgs.push_back( msg );
        ConnectionSystem.send( msgs );
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

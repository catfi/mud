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

        var next : Point = Point( player.position.row + offset.row,
                                  player.position.col + offset.col );

        if( !isValidPos( next ) )
            return false;

        return true;
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

        if( !isValidMove( player, offset ) )
            return;

        player.position.row += offset.row;
        player.position.col += offset.col;

        var msg : PlayerMessage = new Message( player, "map: " + VectorConverter.toString(gGameState.mAllObjects) );
        var msgs : Vector< PlayerMessage > new Vector< Message >;
        msgs.push_back( msg );
        ConnectionSystem.send( msgs );
    }
}

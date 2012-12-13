import .= thor.lang;
import .= thor.container;
import .= Game;

class ClientGame
{
    private var map : GameMap;
    private var position : Point;
    private var other_players_position : Vector<Point>;

    // client should download map first, so server don't send map to client
    public function new( client_pos:Point ) : void
    {
        map = new GameMap(12,25);
        position = client_pos;
        other_players_position = new Vector<Point>();
    }

    public function update_position( aPoint:Point ) : void
    {
        position = aPoint;
    }

    public function showMap() : void
    {
        // top horizontal line
        for( var col : int64 = 0; col <= map.width() + 1; ++col )
            print( "-" );
        print( "\n" );

        // print map
        for( var row : int64 = 0; row != map.height(); ++row )
        {
            print( "|" );
            for( var col : int64 = 0; col != map.width(); ++col )
            {
                var mapPoint : Point = new Point( row, col );
                if ( isAtMyPos( mapPoint ) )
                    print( "@" );
                else if ( isAtOtherPlayerPos( mapPoint ) )
                    print( "#" );
                else
                    print( " " );
            }
            print( "|\n" );
        }

        // bottom horizontal line
        for( var col : int64 = 0; col <= map.width() + 1; ++col )
            print( "-" );
        print( "\n" );
    }

    private function isAtMyPos( aPoint:Point ) : bool
    {
        return aPoint.isEqual( position );
    }

    private function isAtOtherPlayerPos( aPoint:Point ) : bool
    {
        for ( var i : int32 = 0; i < other_players_position.size(); ++i )
        {
            if ( aPoint.isEqual( other_players_position[i] ) )
                return true;
        }
        return false;
    }
}

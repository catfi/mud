import .= thor.lang;
import .= thor.container;
import .= Game;

class ClientGame
{
    private var map : GameMap;
    private var position : Point;
    private var other_players_position : Vector<Point>;
    private var progress : int32;

    // work around for enum type
    public static const INIT : int32 = 0;
    public static const INPUT_LOOP : int32 = 1;

    // client should download map first, so server don't send map to client
    public function new() : void
    {
        position = new Point(-1,-1);
        init();
    }

    public function new( client_pos:Point ) : void
    {
        position = client_pos;
        init();
    }

    private function init() : void
    {
        map = new GameMap(12,25);
        other_players_position = new Vector<Point>();
        progress = ClientGame.INIT;
    }

    public function update_position( aPoint:Point ) : void
    {
        position = aPoint;
    }

    public function get_progress() : int32
    {
        return progress;
    }

    public function set_progress( x:int32 )
    {
        progress = x;
    }

    public function showMap() : void
    {
        // top horizontal line
        for( var col : int32 = 0; col <= map.width() + 1; ++col )
            print( "-" );
        print( "\n" );

        // print map
        for( var row : int32 = 0; row != map.height(); ++row )
        {
            print( "|" );
            for( var col : int32 = 0; col != map.width(); ++col )
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
        for( var col : int32 = 0; col <= map.width() + 1; ++col )
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

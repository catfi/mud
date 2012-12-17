import .= thor.lang;
import .= thor.container;

import .= Game;

class ClientGame
{
    private var myName : String;
    private var map : GameMap;
    private var position : Point;
    private var other_players_position : Vector<Point>;
    private var progress : int32;

    // work around for enum type
    public static const INIT : int32 = 0;
    public static const INPUT_LOOP : int32 = 1;

    // client should download map first, so server don't send map to client
    public function new( name : String ) : void
    {
        myName = name;
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

    public function getMyName() : String
    {
        return myName;
    }

    public function getMap() : GameMap
    {
        return map;
    }

    public function get_progress() : int32
    {
        return progress;
    }

    public function set_progress( x:int32 )
    {
        progress = x;
    }
}

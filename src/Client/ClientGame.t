import .= thor.lang;
import .= thor.container;

import .= Game;

class ClientGame
{
    private var myName : String;
    private var map : GameMap;
    private var progress : int32;

    // work around for enum type
    public static const INIT : int32 = 0;
    public static const INPUT_LOOP : int32 = 1;

    // client should download map first, so server don't send map to client
    public function new( name : String ) : void
    {
        myName = name;
        init();
    }

    public function new( client_pos:Point ) : void
    {
        init();
    }

    private function init() : void
    {
        map = new GameMap();
        progress = ClientGame.INIT;
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

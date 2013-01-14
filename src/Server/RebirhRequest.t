import Game;

class RebirthRequest
{
    public var mPlayer : Game.PlayerInfo;
    public var mCounter : int32 = 5;

    public function new( player : Game.PlayerInfo ) : void
    {
        mPlayer = player;
    }
}

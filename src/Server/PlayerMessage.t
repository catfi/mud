import .= Game;

class PlayerMessage
{
    public function new( p : PlayerInfo, m : String )
    {
        mPlayer = p;
        mMsg = m;
    }

    public var mPlayer : PlayerInfo;
    public var mMsg : String;
}

import .= Game;

class ClientInfo
{
    public var id : int32;
    public var position : Point;
    public var name : String;

    // client states
    public var isNameComplete : bool;

    public function new( identifier : int32 ) : void
    {
        this.id = identifier;
        this.position = new Point( 0, 0 );
        this.isNameComplete = false;
    }

    public function dump() : void
    {
        print( "id=\{id} name=\{name}\n" );
    }
}

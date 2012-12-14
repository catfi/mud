class ObjectInfo
{
    public var id : int32;
    public var position : Point;
    public var name : String;

    public function new( identifier : int32 ) : void
    {
        this.id = identifier;
        this.position = new Point( 0, 0 );
    }

    public function dump() : void
    {
        print( "id=\{id} name=\{name}\n" );
    }
}

class ClientInfo extends ObjectInfo
{
    // client states
    public var isNameComplete : bool = false;

    public function new( identifer : int32 ) : void
    {
        super( identifer );
    }
}

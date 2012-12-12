class ClientInfo
{
    public var id : int32;
    public var position : Point;
    public var name : String;

    // client states
    private var is_name_complete : bool;

    public function new( identifier : int32 ) : void
    {
        this.id = identifier;
        this.position = new Point( 0, 0 );
        this.is_name_complete = false;
    }

    public function dump() : void
    {
        print( "id=\{id} name=\{name}\n" );
    }
}

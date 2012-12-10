class ClientInfo
{
    public var id : int32;
    public var position : Point; 

    public function new( identifier : int32 ) : void
    {
        this.id = identifier; 
        this.position = new Point( 0, 0 );
    } 
}

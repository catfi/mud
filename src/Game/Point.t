class Point
{
    public var row : int64;
    public var col : int64;

    public function new( i : int64, j : int64 ) : void
    {
        this.row = i;
        this.col = j;
    }

    public function isEqual( aPoint: Point ) : bool
    {
        return ( this.row == aPoint.row ) &&
               ( this.col == aPoint.col );
    }
}

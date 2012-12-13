import .= util;

class Point
{
    public var row : int32;
    public var col : int32;

    public function new( i : int32, j : int32 ) : void
    {
        this.row = i;
        this.col = j;
    }

    public function isEqual( aPoint: Point ) : bool
    {
        return ( this.row == aPoint.row ) &&
               ( this.col == aPoint.col );
    }

    public function new( encodedPos : int64 ) : void
    {
        this.row = encodedPos / power32;
        this.col = encodedPos % power32;
    }

    public function toEncodedPos() : int64
    {
        return row * power32 + col;
    }
}

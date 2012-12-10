import .= thor.lang;

class Map
{
    private var map : Array2D<int32>;
    
    public function new( height : int64, width : int64 ) : void
    {
        map = new Array2D<int32>( height, width );
    }

    public function valid( x : int64, y : int64 ) : bool
    {
        return ( 0 <= y && y < map.size(0) ) &&
               ( 0 <= x && x < map.size(1) );
    }

    public function get( x : int64, y : int64 ) : int32
    {
        return map.get( y, x ); 
    }

    public function set( x : int64, y : int64, value : int32 ) : void
    {
        map.set( y, x, value );
    }
}

class Point
{
    public var x : int64;
    public var y : int64;

    public function new( i : int64, j : int64 ) : void
    {
        this.x = i;
        this.y = j;
    } 
}

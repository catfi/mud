import .= thor.lang;
import .= util;

class GameMap
{
    private var map : Array2D<int32>;

    public function new( h : int64, w : int64 ) : void
    {
        map = new Array2D<int32>( h, w );
    }

    public function height() : int64
    {
        return map.size(0);
    }

    public function width() : int64
    {
        return map.size(1);
    }

    public function valid( r : int64, c : int64 ) : bool
    {
        return ( 0 <= r && r < this.height() ) &&
               ( 0 <= c && c < this.width() );
    }

    public function get( r : int64, c : int64 ) : int32
    {
        return map.get( r, c );
    }

    public function set( r : int64, c : int64, value : int32 ) : void
    {
        map.set( r, c, value );
    }
}

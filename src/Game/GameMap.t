import .= thor.lang;
import .= Util;

class GameMap
{
    private var map : Array2D<int32>;
    public static const DEFAULT_HEIGHT : int32 = 12;
    public static const DEFAULT_WIDTH : int32 = 25;

    public function new() : void
    {
        init( DEFAULT_HEIGHT, DEFAULT_WIDTH );
    }

    public function new( h : int32, w : int32 ) : void
    {
        init( h, w );
    }

    private function init( h : int32, w : int32 ) : void
    {
        map = new Array2D<int32>( h, w );
        for ( var r : int32 = 0; r < h; ++r )
            for ( var c : int32 = 0; c < w; ++c )
                map.set( r, c, 0 );
    }

    public function height() : int32
    {
        return map.size(0);
    }

    public function width() : int32
    {
        return map.size(1);
    }

    public function valid( r : int32, c : int32 ) : bool
    {
        return ( 0 <= r && r < this.height() ) &&
               ( 0 <= c && c < this.width() );
    }

    public function get( r : int32, c : int32 ) : int32
    {
        return map.get( r, c );
    }

    public function set( r : int32, c : int32, value : int32 ) : void
    {
        map.set( r, c, value );
    }
}

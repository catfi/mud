import .= Game; // for Point

class Canvas
{
    private var canvas : Array2D<String>;

    public function new( h : int32, w : int32 ) : void
    {
        canvas = new Array2D<String>( h, w );
        for ( var r : int32 = 0; r < h; ++r )
            for ( var c : int32 = 0; c < w; ++c )
                canvas.set( r, c, " " );
    }

    public function height() : int32
    {
        return cast<int32>( canvas.size(0) );
    }

    public function width() : int32
    {
        return cast<int32>( canvas.size(1) );
    }

    public function drawHVLine( from : Point, to : Point, str : String )
    {
        if ( from.row == to.row )
        {
            for ( var c : int32 = from.col; c <= to.col; ++c )
                drawChar( new Point( from.row, c ), str.substring( 0, 1 ) );
        }
        else if ( from.col == to.col )
        {
            for ( var r : int32 = from.row; r <= to.row; ++r )
                drawChar( new Point( r, from.col ), str.substring( 0, 1 ) );
        }
    }

    public function draw( point : Point, str : String )
    {
        for ( var i : int32 = 0; i < str.length(); ++i )
        {
            var r : int32 = point.row;
            var c : int32 = point.col + i;
            drawChar( new Point( r, c ), str.substring( i, i + 1 ) );
        }
    }

    public function crop( point : Point, h : int32, w : int32 ) : Canvas
    {
        // assert h and w > 0
        var new_canvas : Canvas = new Canvas( h, w );
        for ( var r : int32 = 0; r < h; ++r )
        {
            for ( var c : int32 = 0; c < w; ++c )
            {
                var canvasChar : String = canvas.get( point.row + r, point.col + c ).substring( 0, 1 );
                new_canvas.drawChar( new Point( r, c ), canvasChar );
            }
        }
        return new_canvas;
    }

    public function show()
    {
        print( getSerializedString() );
    }

    public function getSerializedString() : String
    {
        var result : String = new String;
        for ( var r : int32 = 0; r < height(); ++r )
        {
            for ( var c : int32 = 0; c < width(); ++c )
            {
                result = result + canvas.get( r, c ).substring( 0, 1 );
            }
            result = result + "\n";
        }

        return result;
    }

    private function drawChar( point : Point, str : String )
    {
        if ( point.row < height() &&
             point.col < width() )
        {
            canvas.set( point.row, point.col, str.substring( 0, 1 ) );
        }
    }
}

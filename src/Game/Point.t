import .= thor.util;

import .= Common;

class Point
{
    public var row : int32;
    public var col : int32;

    public function new( theRow : int32, theCol : int32 ) : void
    {
        this.row = theRow;
        this.col = theCol;
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

    public static function from( str : String ) : Point
    {
        str = str.trim();

        var left : int32 = str.indexOf("(");
        var right : int32 = str.indexOf(")");

        // invalid format
        if( left != 0  || right != str.length()-1 )
            return null;

        str = str.substring( 1, str.length()-1 );
        var comma : int32 = str.indexOf(",");
        if( comma == -1 )
            return null;

        var result : Point = new Point(
                                        Convert.toInt32( str.substring(0, comma) ),
                                        Convert.toInt32( str.substring(comma+1) )
                                      );

        return result;
    }

    public function toString() : String
    {
        return "(" + row + "," + col + ")";
    }
}

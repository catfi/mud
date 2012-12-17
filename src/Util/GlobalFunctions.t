import .= thor.container;
import .= thor.util;
import .= Game;

class VectorConverter
{
    public static function fromString( str : String ) : Vector<ObjectInfo>
    {
        str = str.trim();

        var objects : Vector<ObjectInfo> = new Vector<ObjectInfo>;

        var begin : int32 = 0;
        var end : int32;

        var colon : int64 = ":"[ 0 ];

        while( begin < str.length() )
        {
            if( str[ begin ] == colon )
                break;

            end = str.indexOf( ":", begin );
            if( end == -1 ) end = str.length();

            objects.push_back(
                                ObjectInfo.from(
                                                  str.substring(begin, end)
                                               )
                             );
            begin = end + 1;
        }

        return objects;
    }

    public static function toString( objects : Vector<ObjectInfo> ) : String
    {
        if( objects.size() == 0 )
            return "";

        var result = Convert.toString( objects[ 0 ] );

        for( var i = 1; i < objects.size(); ++i )
            result = result + ":" + Convert.toString( objects[ i ] );

        return result;
    }
}



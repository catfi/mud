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

        var result = objects[0].toString();

        for( var i = 1; i < objects.size(); ++i )
            result = result + ":" + objects[ i ].toString();

        return result;
    }
}

function isEqual<U,V>( u : U, v : V ) : bool
{
    return u.isEqual( v );
}

// find first target in vector and return the target index if found
// or return -1 for not found
function find<U,V>( vec : Vector<U>, target : V ) : int32
{
    for ( var i = 0; i < vec.size(); ++i )
    {
        if ( isEqual(target, vec[i]) )
        {
            return i;
        }
    }
    return -1;
}

// erase element in Vector<T>
function remove<U,V>( vec : Vector<U>, target : V ) : void
{
    var found = find( vec, target );

    if ( found == -1 ) return;

    for ( var i = found+1; i < vec.size(); ++i )
    {
        vec[ i-1 ] = vec[ i ];
    }
    vec.pop_back();
}

import .= thor.util;

class ObjectInfo
{
    public var id : int32;
    public var name : String;
    public var position : Point;

    public function new( identifier : int32 ) : void
    {
        this.id = identifier;
        this.position = new Point( 0, 0 );
    }

    public function new( identifier : int32, thePosition : Point ) : void
    {
        id = identifier;
        position = thePosition;
    }

    public function dump() : void
    {
        print( "id=\{id} name=\{name}\n" );
    }

    public static function from( str : String ) : ObjectInfo
    {
        str = str.trim();

        // contains no commas
        var firstComma : int32 = str.indexOf(",");
        if( firstComma == -1 )
            return null;

        // has only one comma
        var secondComma : int32 = str.indexOf(",", firstComma+1);
        if( secondComma == -1 )
            return null;

        var identifier : int32 = Convert.toInt32( str.substring(0, firstComma) );
        var theName : String = str.substring( firstComma+1, secondComma );
        var thePosition : Point = Point.from( str.substring(secondComma+1) );

        var result : ObjectInfo = new ObjectInfo( identifier, thePosition );
        result.name = theName;

        return result;
    }

    public function toString() : String
    {
        return Convert.toString(id) + "," + name + "," + Convert.toString(position);
    }
}

class ClientInfo extends ObjectInfo
{
    // client states
    public var isNameComplete : bool = false;

    public function new( identifer : int32 ) : void
    {
        super( identifer );
    }
}

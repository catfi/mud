import .= thor.util;

class ObjectInfo
{
    public var id : int32;
    public var name : String;
    public var position : Point;
    public var mRoom : Room = null;

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

    public function setPos( pos : Point ) : void
    {
        position = pos;
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

    public virtual function toString() : String
    {
        return Convert.toString(id) + "," + name + "," + Convert.toString(position);
    }

    public virtual function isEqual( object : ObjectInfo ) : bool
    {
        return id == object.id;
    }
}

class Living extends ObjectInfo
{
    public var life : int32;
    public var attack : int32;
    public var defence : int32;
    public var isAlive : bool;

    public function new( identifier : int32,
                         theLife : int32,
                         theAttack : int32,
                         theDefence : int32 ) : void
    {
        super( identifier );

        life = theLife;
        attack = theAttack;
        defence = theDefence;
        isAlive = true;
    }

    public function new( identifier : int32,
                         thePosition : Point,
                         theLife : int32,
                         theAttack : int32,
                         theDefence : int32 ) : void
    {
        super( identifier, thePosition );

        life = theLife;
        attack = theAttack;
        defence = theDefence;
        isAlive = true;
    }

    public virtual function toString() : String
    {
        return Convert.toString(id) + "," + name + "," + Convert.toString(position);
    }
}

class PlayerInfo extends Living
{
    // client states
    public var isNameComplete : bool = false;

    public function new( identifier : int32 ) : void
    {
        super( identifier, 10, 6, 4 );
    }

    public function new( identifier : int32, thePosition : Point ) : void
    {
        super( identifier, thePosition, 100, 6, 4 );
    }

    public virtual function isEqual( object : ObjectInfo ) : bool
    {
        return isa<PlayerInfo>(object) && id == object.id;
    }
}

class Mob extends Living
{
    private var mMobName : MobName;

    public function new( theId : int32, mobName : MobName ) : void
    {
        super( theId, 17, 6, 5 );
        mMobName = mobName;
    }

    public virtual function isEqual( object : ObjectInfo ) : bool
    {
        return isa<Mob>(object) && id == object.id;
    }

    public function getNameString() : String
    {
        return mMobName.getString();
    }

    public function getNameId() : int32
    {
        return mMobName.getId();
    }

    public virtual function toString() : String
    {
        return Convert.toString(id) + "," + getNameString() + "," + Convert.toString(position);
    }
}

import Game;

function enterSameRoom( nameId : int32, id : int32 )
{
    print( "\"" );
    print( Game.MobName.getString( nameId ) );
    print( " \{id}\" " );
    print( "is entering this room!\n" );
}

function attackMobMsg( nameId : int32, hp: int32, dmg: int32 )
{
    if ( hp != 0 )
    {
        print( Game.MobName.getString( nameId ) );
        print( " was damaged by \{dmg}. Now, it has \{hp} HP. And, It is very angry!\n" );
    }
    else
    {
        print( Game.MobName.getString( nameId ) );
        print( " was killed!\n" );
    }
}

import Game;

function enterSameRoom( nameId : int32, id : int32 )
{
    print( "\"" );
    print( Game.MobName.getString( nameId ) );
    print( " \{id}\" " );
    print( "is entering this room!\n" );
}

function attackMobMsg( nameId : int32, hp : int32, dmg : int32 )
{
    print( Game.MobName.getString( nameId ) );
    if ( hp != 0 )
    {
        print( " was damaged by \{dmg}. Now, it has \{hp} HP. And, It is very angry!\n" );
    }
    else
    {
        print( " was killed!\n" );
    }
}

function attackedByMobMsg( nameId : int32, hp : int32, dmg : int32 )
{
    print( "You are attacked by " );
    print( Game.MobName.getString( nameId ) );
    print( ". " );
    if ( hp <= 0 )
    {
        print( "Now, you are a ghost...\n" );
    }
    else
    {
        print( " You are damaged by \{dmg}. Now, you have \{hp} HP.\n" );
    }
}

function rebirthMsg()
{
    print( " You are rebirth!!!" );
}

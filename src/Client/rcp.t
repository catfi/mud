import Game;

function enterSameRoom( nameId : int32, id : int32 )
{
    print( "\"" );
    print( Game.MobName.getString( nameId ) );
    print( " \{id}\"" );
    print( "is entering this room!\n" );
}

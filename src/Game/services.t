import thor.util;

import Util;
import Server;
import Common;


var gMobGenerateIssuer : Util.Timer = null;

@server
function issueMobs() : void
{
    //print( "issueMobs()\n" );
    if ( Server.gGameState.mMobCount < Server.gGameState.mPlayerCount )
    //if ( Server.gGameState.mMobCount < 20 )
    {
        Common.pushEvent( new Common.GenerateMobEvent );
    }
}

var gMobWalkIssuer : Util.Timer = null;

@server
function issueMobWalks() : void
{
    if ( Server.gGameState.mMobCount == 0 )
        return;

    var gen = new thor.util.Random<int32, thor.util.Uniform>( 1, 4 );

    var mobs = Server.gGameState.mobs();

    for ( var mob in mobs )
        Common.pushEvent( new Common.MoveEvent(mob, gen.next()) );

}

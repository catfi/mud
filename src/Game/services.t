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

    var gen = new thor.util.Random<int32, thor.util.Uniform>( -1, 2 );

    var mobs = Server.gGameState.mobs();

    for ( var mob in mobs )
    {
        var offset = new Point( gen.next(), gen.next() );
        Common.pushEvent( new Common.MoveEvent(mob, offset) );
    }
}

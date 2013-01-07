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



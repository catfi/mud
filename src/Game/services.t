import thor.util;
import thor.container;

import Util;
import Server;
import Client;
import Common;


var gMobGenerateIssuer : Util.Timer = null;

@server
function issueMobs() : void
{
    //print( "issueMobs()\n" );
    //if ( Server.gGameState.mMobCount < Server.gGameState.mPlayerCount )
    if ( Server.gGameState.mMobCount < 1000 )
    {
        Common.pushEvent( new Common.GenerateMobEvent( 250 ) );
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

var gMobAttackIssuer : Util.Timer = null;

@server
function issueMobAttacks() : void
{
    var mobs = Server.gGameState.mobs();

    for ( var mob in mobs )
    {
        if ( !mob.mRoom.hasPlayers() )
            continue;

        var players = Server.gGameState.players();
        var max = players.size()-1;
        var rand = new thor.util.Random<int32, thor.util.Uniform>( 0, max );

        Common.pushEvent( new Common.MobAttackEvent(mob, players[rand.next()]) );
    }
}

var gRebirthRequestHandler : Util.Timer = null;

@server
function handleRebirthRequests() : void
{
    print( "handle rebirth\n" );
    if ( Server.gRebirthRequests.size() <= 0 )
        return;

    var rebirthes = new thor.container.Vector<PlayerInfo>;

    var i = 0;
    while ( i < Server.gRebirthRequests.size() )
    {
        var request = Server.gRebirthRequests[ i ];

        if ( 0 < request.mCounter )
        {
            --request.mCounter;
            ++i;
            continue;
        }

        // 0 == request.mSecsRemain
        rebirthes.push_back( request.mPlayer );

        for ( var rep = i+1; rep < Server.gRebirthRequests.size(); ++rep )
            Server.gRebirthRequests[ rep-1 ] = Server.gRebirthRequests[ rep ];

        Server.gRebirthRequests.pop_back();
    }

    //
    for ( var player in rebirthes )
    {
        print( "rebirth : " + player.toString() + "\n" );
        player.life = 800;
        Server.gGameState.add( player );

        var dest = Server.ConnectionSystem.getDomain(player);
        @remote { domain = dest }
        Client.RebirthMsg();
    }
}

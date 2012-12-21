import .= thor.container;
import .= thor.util;

import .= Util;
import .= Client;
import .= Game;

// the real entry function on server
// @server
// function handle_client_connect( client : Domain ) : void
// {
//     // update server state
//     gameState.addPlayer( client );
//
//     @remote { domain = client }
//     Client.welcome( gameState.getPlayerCount() );
//
//     /*
//     //gameState.addClient( Domain.local() );
//     @async
//     simulate_client();
//     */
// }

@server
function initCmds() : void
{
    commands.push_back( new MoveCmd );
    commands.push_back( new SayCmd );

    commandFormats.push_back( "( n | s | w | e )" );
    commandFormats.push_back( "say [message]" );
}

@server
function initCmdStrs() : void
{
    if( gCmdStrsWereInitialized )
        return;

    gDirectCmdStrs.set( DIRECT_NORTH, "n" );
    gAllCmdStrs.set( DIRECT_NORTH, "n" );

    gDirectCmdStrs.set( DIRECT_SOUTH, "s" );
    gAllCmdStrs.set( DIRECT_SOUTH, "s" );

    gDirectCmdStrs.set( DIRECT_WEST, "w" );
    gAllCmdStrs.set( DIRECT_WEST, "w" );

    gDirectCmdStrs.set( DIRECT_EAST, "e" );
    gAllCmdStrs.set( DIRECT_EAST, "e" );

    gAllCmdStrs.set( COMMAND_SAY, "say" );

    gAllCmdStrs.set( COMMAND_TALK, "talk" );

    gAllCmdStrs.set( COMMAND_QUIT, "quit" );

    gCmdStrsWereInitialized = true;
}

/*
@server
function broadcast( fromClient : Domain, msg : String ) : void
{
    var fromPlayerName : String = gGameState.getPlayerName( fromClient );
    var clients : Vector<Domain> = gGameState.getConnectedDomains();

    // print( "broadcast request !\n" );
    for ( var i : int32 = 0; i < clients.size(); ++i )
    {
        // print( "to_client #\{i}\n" );
        var client : Domain = clients[ i ];
        // if ( to_client != from_client )
        {
            new SendStringToClient( "\{fromPlayerName} said: \{msg}", client );
        }
    }
}
*/

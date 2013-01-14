import thor.container;

import .= Server;
import .= Util;

import Game;

@entry
@client
function client_entry() : int32
{
    initCmdStrs();

    daemonize();
    return 0;
}

@entry
@server
function server_entry() : int32
{
    gGameState = new GameState;
    gRebirthRequests = new thor.container.Vector<Server.RebirthRequest>;

    initCmds();
    initCmdStrs();

    registerEventListeners();
    launchServices();

    Domain.watch( 0, lambda( client : Domain ) : void {
        handle_client_connect( client );
    });
    daemonize();

    return 0;
}

import .= Server;
import .= Util;

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
    initCmds();
    initCmdStrs();

    registerEventListeners();

    Domain.watch( 0, lambda( client : Domain ) : void {
        handle_client_connect( client );
    });
    daemonize();

    return 0;
}

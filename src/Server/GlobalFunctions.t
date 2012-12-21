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

@server
function server_receive_encoded_char( encoded_char : int64 ):void
{
    var client : Domain = Domain.caller();
    var msg_buffer : MsgBuffer = client_msg_buffer.get( client );
    msg_buffer.add_encoded_char( encoded_char );
    var msg : IndexableString = new IndexableString();
    if ( msg_buffer.is_msg_complete() )
    {
        msg = msg_buffer.get_msg();
        if ( gameState.isPlayerNameComplete( client ) == false )
        {
            print( "client \{msg} is added\n" );
            gameState.setPlayerName( client, msg );

            // send string to client
            new SendStringToClient( "map: " + VectorConverter.toString(gameState.mAllObjects), client );
        }
        else
        {
            // validate command first
            var foundCommand : bool = false;
            // for each command, find a command can execute
            for( var i : int64 = 0; i < commands.size(); ++i )
            {
                if( commands[ i ].accept( msg ) )
                {
                    foundCommand = true;
                    var result : bool = commands[ i ].execute( msg, client );

                    if( !result )
                    {
                        var format : String = commandFormats[ i ];
                        new SendStringToClient( "execute falied! format is: \{format}", client );
                    }

                    break;
                }
            }

            // send error message when find no proper command
            if( !foundCommand )
                new SendStringToClient( "invalid command!", client );
        }
    }
}

@server
function broadcast( fromClient : Domain, msg : String ) : void
{
    var fromPlayerName : String = gameState.getPlayerName( fromClient );
    var clients : Vector<Domain> = gameState.getConnectedDomains();

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

import .= thor.container;
import .= thor.util;
import .= util;
import .= Client;
import .= Game;

// the real entry function on server
@server
function handle_client_connect( client : Domain ) : void
{
    // update server state
    serverState.addClient( client );

    @remote { domain = client }
    Client.welcome( serverState.getClientCount() );

    /*
    //serverState.addClient( Domain.local() );
    @async
    simulate_client();
    */
}

@server
function simulate_client() : void
{
    var cmds : Vector<String> = new Vector<String>;

    cmds.push_back( "Left" );
    cmds.push_back( "Right" );
    cmds.push_back( "Up" );
    cmds.push_back( "Down" );

    var gen : Random<int32,Uniform> = new Random<int32, Uniform>( 0, 3 );
    while( true ) {
        var i : int32 = gen.next();
        process_command( cmds[ i ] );

        sleep_for_msec( 500 );
    }
}

@server
function process_command( str : String ) : void
{
    var client : Domain = Domain.local();

    for( var i : int64 = 0; i < commands.size(); ++i )
    {
        if( commands[ i ].accept( str ) )
        {
            var result : bool = commands[ i ].execute( str, client );

            if( !result )
                print( "execution error!\n" );

            serverState.show();
            return;
        }
    }

    print( "invalid command!\n" );
}

@server
function init_commands() : void
{
    commands.push_back( new MoveCmd );
    commands.push_back( new SayCmd );

    commandFormats.push_back( "( left | right | up | down )" );
    commandFormats.push_back( "say [message]" );
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
        if ( serverState.isClientNameComplete( client ) == false )
        {
            print( "client \{msg} is added\n" );
            serverState.setClientName( client, msg );

            var objects = new Vector<ObjectInfo>;
            // collect monster infos
            //
            // collect player infos
            var iter : HashMapIterator<Domain, ClientInfo> = serverState.clientInfos.iter();
            while ( iter.hasNext() )
            {
                objects.push_back( iter.get().value );
                iter.next();
            }
            // send string to client
            new SendStringToClient( "map: " + VectorConverter.toString(objects), client );
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
function broadcast( from_client : Domain, msg : String ) : void
{
    var from_client_name : String = serverState.getClientName( from_client );
    var all_client : Vector<Domain> = serverState.getAllClientDomain();

    // print( "broadcast request !\n" );
    for ( var i : int32 = 0; i < all_client.size(); ++i )
    {
        // print( "to_client #\{i}\n" );
        var to_client : Domain = all_client[i];
        // if ( to_client != from_client )
        {
            new SendStringToClient( "\{from_client_name} said: \{msg}", to_client );
        }
    }
}

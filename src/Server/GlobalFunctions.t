import .= thor.container;
import .= thor.util;
import .= util;
import .= Client;
import .= Game;

var commands : Vector<Command> = new Vector<Command>;

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
}

var client_msg_buffer : HashMap<Domain, MsgBuffer> = new HashMap<Domain, MsgBuffer>();

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
            new SendStringToClient( VectorConverter.toString(objects), client );
        }
        else
        {
            var clientName : String = serverState.getClientName( client );
            print( "recv client \{clientName}'s message: \{msg}\n" );
            broadcast( client, msg );
        }
    }
}

@server
function broadcast( from_client : Domain, msg : IndexableString ) : void
{
    var from_client_name : String = serverState.getClientName( from_client );
    var all_client : Vector<Domain> = serverState.getAllClientDomain();

    // print( "broadcast request !\n" );
    for ( var i : int32 = 0; i < all_client.size(); ++i )
    {
        // print( "to_client #\{i}\n" );
        var to_client : Domain = all_client[i];
        var result_msg : IndexableString = new IndexableString();
        result_msg.concate( from_client_name );
        result_msg.concate(  " said: \{msg}\n" );
        // if ( to_client != from_client )
        {
            new SendStringToClient( result_msg, to_client );
        }
    }
}

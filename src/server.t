import .= thor.container;
import .= thor.util;

var server_state : ServerState = new ServerState;
var commands : Vector<Command> = new Vector<Command>;

// the real entry function on server
@server
function handle_client_connect( client : Domain ) : void
{
    // update server state
    server_state.addClient( client );
    var user_count = server_state.getClientCount();
    print( "current user count: \{user_count}\n" );
    new SendString( welcome_client(), client );

    // call client's entry function
    //@remote { domain = client }
    //client_main();

    @async 
    simulate_client();
}

@server
function welcome_client() : IndexableString
{
    var user_count = server_state.getClientCount();
    var welcome_client_msg : String = "welcome! current online user count: \{user_count}\n";
    var hello: IndexableString = new IndexableString();
    hello.concate( welcome_client_msg );
    return hello;
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

        sleep_for_msec( 1500 );        
    }
}

@server
function process_command( str : String ) : void
{
    var client : Domain = Domain.caller();    

    for( var i : int32 = 0; i != commands.size(); ++i )
    {
        if( commands[ i ].accept( str ) )
        {
            var result : bool = commands[ i ].execute( str, client );
            
            if( !result )
                print( "execution error!\n" );
            
            server_state.show(); 
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

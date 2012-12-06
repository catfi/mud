var server_state : ServerState = new ServerState();

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
    @remote { domain = client }
    client_main();
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


var server_state : ServerState = new ServerState();

// the real entry function on server
@server
function handle_client_connect( client : Domain ) : void
{
    // update server state
    server_state.addClient( client );
    var user_count = server_state.getClientCount();
    print( "current user count: \{user_count}\n" );

    // call client's entry function
    @remote { domain = client }
    client_main();
}

@server
function hello_msg() : IndexableString
{
    //var hellostr : String = "hello! your id is \{client_connected_count}\n";
    var hellostr : String = "hello!\n";
    var hello: IndexableString = new IndexableString();
    hello.concate( hellostr );
    return hello;
}

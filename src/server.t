import . = thor.container;

class ServerState
{
    private var id_domain_table : HashMap<int32, Domain>;  // id => Domain
    private var domain_id_table : HashMap<Domain, int32>;  // Domain => id
    private var client_connected_count : int32;

    public function new()
    {
        id_domain_table = new HashMap<int32, Domain>;
        domain_id_table = new HashMap<Domain, int32>;
        client_connected_count = 0;
    }

    public function addClient( a_client:Domain ) : void
    {
        // TODO: atomic
        id_domain_table.set( client_connected_count, a_client );
        domain_id_table.set( a_client, client_connected_count );
        ++client_connected_count;

        // dump for debug
        print( " a client coming!\n" );
    }

    public function getClientCount() : int32
    {
        return client_connected_count;
    }
}

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

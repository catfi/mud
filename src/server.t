import . = thor.container;

var server_state : ServerState = new ServerState();

@server
function handle_user_coming( a_client:Domain ):void
{
    server_state.addClient( a_client );
}



class ServerState
{
    private var id_domain_table : Map<int32, Domain>;  // id => Domain
    // private var domain_id_table : Map<Domain, int32>;  // Domain => id
    private var max_client_id : int32;

    public function new()
    {
        id_domain_table = new Map<int32, Domain>;
        // domain_id_table = new Map<Domain, int32>;
        max_client_id = -1;
    }

    public function addClient( a_client:Domain ) : void
    {
        // atomic?

        ++max_client_id;
        id_domain_table.set( max_client_id, a_client );
        // domain_id_table.set( a_client, max_client_id );

        // dump for debug
        print( " a client coming! id=\{max_client_id}\n" );
    }

    public function get_max_client_id() : int32
    {
        return max_client_id;
    }

    public function hello_msg() : IndexableString
    {
        var hellostr : String = "Hello! Your id is \{max_client_id}\n";
        var hello: IndexableString = new IndexableString();
        hello.concate( hellostr );
        // var hello : String = "Hello! Your id is \{get_max_client_id()}\n";
        return hello;
    }
}

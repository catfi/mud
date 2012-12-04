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

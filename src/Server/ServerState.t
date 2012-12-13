import .= thor.container;
import .= util;
import .= Game;

class ServerState
{
    private static const CLIENT_MSG_BUFFER_SIZE : int32 = 1000;

    // connection info
    private var domain_id_table : HashMap< Domain, int32 >;
    private var client_connected_count : int32;
     
    // world map
    private var map : GameMap;

    // client information
    private var client_infos : HashMap< Domain, ClientInfo >;
    
    // move command code
    public const DirectLeft : int32 = 1;
    public const DirectRight : int32 = 2;
    public const DirectUp : int32 = 3;
    public const DirectDown : int32 = 4;
    
    // map info
    public const MapSpace : int32 = -1;

    public function new()
    {
        domain_id_table = new HashMap<Domain, int32>;
        client_infos = new HashMap< Domain, ClientInfo >;
        
        client_connected_count = 0;

        initMap();
    }

    public function getAllClientDomain() : Vector<Domain>
    {
        var result : Vector<Domain> = new Vector<Domain>;
        var iter : HashMapIterator<Domain, int32> = domain_id_table.iter();
        while ( iter.hasNext() )
        {
            result.push_back( iter.get().key );
            iter.next();
        }
        return result;
    }

    public function setClientName( client: Domain, clientName: String )
    {
        client_infos.get( client ).name = clientName;
        client_infos.get( client ).is_name_complete = true;
        client_infos.get( client ).dump();
    }

    public function getClientName( client: Domain ) : String
    {
        return client_infos.get( client ).name;
    }

    public function isClientNameComplete( client: Domain ) : bool
    {
        return client_infos.get( client ).is_name_complete;
    }

    // helper functions
    private function getId( client : Domain ) : int32
    {
        return domain_id_table.get( client ); 
    }    

    private function getInfo( client : Domain ) : ClientInfo 
    {
        return client_infos.get( client );
    }

    private function initMap()
    {
        map = new GameMap( 9, 9 );

        for( var h : int64 = 0; h != map.height(); ++h )
        {
            for( var w : int64 = 0; w != map.width(); ++w ) 
            {
                map.set( h, w, MapSpace );  
            }
        }
    }    
    
    // engine interfaces
    public function addClient( client : Domain ) : void
    {
        // TODO: atomic
        //id_domain_table.set( client_connected_count, client );
        domain_id_table.set( client, client_connected_count );
        ++client_connected_count;

        // insert an entry of client inforamtion         
        client_infos.set( client, new ClientInfo( getId(client) ) );
        client_msg_buffer.set( client, new MsgBuffer( CLIENT_MSG_BUFFER_SIZE ) );
 
        // dump for debug
        print( "A new client coming! Querying client's name...\n" );
    }
    
    public function move( client : Domain, direction : int32 ) : void
    {
        var client_info : ClientInfo = getInfo( client );
        
        var next_row : int32 = client_info.position.row;
        var next_col : int32 = client_info.position.col;

        switch( direction )
        {
        case 1: // DirectUp
            next_row -= 1;
        case 2: // DirectDown
            next_row += 1;
        case 3: // DirectLeft
            next_col -= 1;
        case 4: // DirectRight
            next_col += 1;
        }

        if( !map.valid( next_row, next_col ) )
            return;

        // clear previous mark on map
        map.set( client_info.position.row, client_info.position.col, MapSpace );
        map.set( next_row, next_col, client_info.id );

        // update positions
        client_info.position.row = next_row;
        client_info.position.col = next_col;
    }

    public function getClientCount() : int32
    {
        return client_connected_count;
    }

    public function show() : void
    {
        print( "--------------------------------------\n" );
        for( var h : int64 = 0; h != map.height(); ++h )
        {
            for( var w : int64 = 0; w != map.width(); ++w )
            {
                var value : int32 = map.get(h, w);
                switch( value )
                {
                case -1: // MapSpace
                    print( " " );
                default:
                    print( "*" );
                }
            }
            print( "\n" );
        }
        print( "--------------------------------------\n" );
    }
}

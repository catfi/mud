import .= thor.container;
import .= util;

class ServerState
{
    // connection info
    private var domain_id_table : HashMap< Domain, int32 >;
    private var client_connected_count : int32;
     
    // world map
    private var map : Map;

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
        map = new Map( 9, 9 );

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
        client_msg_buffer.set( client, new MsgBuffer( 1000 ) );
 
        // dump for debug
        print( " a client coming!\n" );
    }
    
    public function move( client : Domain, direction : int32 ) : void
    {
        var client_info : ClientInfo = getInfo( client );
        
        var next_x : int32 = client_info.position.x;
        var next_y : int32 = client_info.position.y;

        switch( direction )
        {
        case 1: // DirectLeft
            next_x -= 1; 
        case 2: // DirectRight 
            next_x += 1;
        case 3: // DirectUp
            next_y -= 1;
        case 4: // DirectDown
            next_y += 1;
        }

        if( !map.valid( next_x, next_y ) )
            return;
        
        // clear previous mark on map
        map.set( client_info.position.x, client_info.position.y, MapSpace );
        map.set( next_x, next_y, client_info.id ); 
    
        // update positions
        client_info.position.x = next_x;
        client_info.position.y = next_y;
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

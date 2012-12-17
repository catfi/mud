import .= thor.container;
import .= thor.util;

import .= Util;
import .= Game;

class ServerState
{
    private static const CLIENT_MSG_BUFFER_SIZE : int32 = 1000;

    // connection info
    private var domainIdTable : HashMap< Domain, int32 >;
    private var clientConnectedCount : int32;

    // world map
    private var map : GameMap;

    // client information
    public var clientInfos : HashMap< Domain, ClientInfo >;

    // move command code
    public const DirectLeft : int32 = 1;
    public const DirectRight : int32 = 2;
    public const DirectUp : int32 = 3;
    public const DirectDown : int32 = 4;

    // map info
    public const MapSpace : int32 = -1;

    public function new()
    {
        domainIdTable = new HashMap<Domain, int32>;
        clientInfos = new HashMap< Domain, ClientInfo >;

        clientConnectedCount = 0;

        initMap();
    }

    public function getAllClientDomain() : Vector<Domain>
    {
        var result : Vector<Domain> = new Vector<Domain>;
        var iter : HashMapIterator<Domain, int32> = domainIdTable.iter();
        while ( iter.hasNext() )
        {
            result.push_back( iter.get().key );
            iter.next();
        }
        return result;
    }

    public function setClientName( client: Domain, clientName: String )
    {
        clientInfos.get( client ).name = clientName;
        clientInfos.get( client ).isNameComplete = true;
        clientInfos.get( client ).dump();
    }

    public function getClientName( client: Domain ) : String
    {
        return clientInfos.get( client ).name;
    }

    public function isClientNameComplete( client: Domain ) : bool
    {
        return clientInfos.get( client ).isNameComplete;
    }

    // helper functions
    private function getId( client : Domain ) : int32
    {
        return domainIdTable.get( client );
    }

    private function getInfo( client : Domain ) : ClientInfo
    {
        return clientInfos.get( client );
    }

    private function initMap()
    {
        map = new GameMap( 9, 9 );

        for( var h : int32 = 0; h != map.height(); ++h )
        {
            for( var w : int32 = 0; w != map.width(); ++w )
            {
                map.set( h, w, MapSpace );
            }
        }
    }

    // engine interfaces
    public function addClient( client : Domain ) : void
    {
        // TODO: atomic
        //id_domain_table.set( clientConnectedCount, client );
        domainIdTable.set( client, clientConnectedCount );
        ++clientConnectedCount;

        // generate random position of the client
        var x_gen : Random<int32,Uniform> = new Random<int32, Uniform>( 0, 12-1 );
        var y_gen : Random<int32,Uniform> = new Random<int32, Uniform>( 0, 25-1 );
        var clientInfo = new ClientInfo( getId(client) );
        clientInfo.position = new Point( x_gen.next(), y_gen.next() );

        // insert an entry of client inforamtion
        clientInfos.set( client, clientInfo );
        client_msg_buffer.set( client, new MsgBuffer( CLIENT_MSG_BUFFER_SIZE ) );


        // dump for debug
        print( "A new client coming! Querying client's name...\n" );
    }

    public function move( client : Domain, direction : int32 ) : void
    {
        var clientInfo : ClientInfo = getInfo( client );

        var next_row : int32 = clientInfo.position.row;
        var next_col : int32 = clientInfo.position.col;

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
        map.set( clientInfo.position.row, clientInfo.position.col, MapSpace );
        map.set( next_row, next_col, clientInfo.id );

        // update positions
        clientInfo.position.row = next_row;
        clientInfo.position.col = next_col;
    }

    public function getClientCount() : int32
    {
        return clientConnectedCount;
    }

    public function show() : void
    {
        print( "--------------------------------------\n" );
        for( var h : int32 = 0; h != map.height(); ++h )
        {
            for( var w : int32 = 0; w != map.width(); ++w )
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

var serverState : ServerState = new ServerState;

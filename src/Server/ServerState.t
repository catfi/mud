import .= thor.container;
import .= thor.util;

import .= Util;
import .= Game;

class ServerState
{
    private static const CLIENT_MSG_BUFFER_SIZE : int32 = 1000;

    // connection info
    private var clientConnectedCount : int32 = 0;

    // world map
    private var map : GameMap;

    // client information
    public var clientInfos : HashMap< Domain, ClientInfo > = new HashMap< Domain, ClientInfo >;

    // mob information
    public var mobs : Vector< ObjectInfo > = new Vector< ObjectInfo >;

    // move command code
    public const DirectLeft : int32 = 1;
    public const DirectRight : int32 = 2;
    public const DirectUp : int32 = 3;
    public const DirectDown : int32 = 4;

    // map info
    public const MapSpace : int32 = -1;

    public function new()
    {
        initMap();
    }

    public function getAllClientDomain() : Vector<Domain>
    {
        var result : Vector<Domain> = new Vector<Domain>;
        var iter : HashMapIterator<Domain, ClientInfo> = clientInfos.iter();
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

    private function getInfo( client : Domain ) : ClientInfo
    {
        return clientInfos.get( client );
    }

    public function getPlayers() : Vector<ObjectInfo>
    {
        var players : Vector<ObjectInfo> = new Vector<ObjectInfo>;

        var iter : HashMapIterator< Domain, ClientInfo > = clientInfos.iter();
        while ( iter.hasNext() )
        {
            players.push_back( iter.get().value );
            iter.next();
        }

        return players;
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
        ++clientConnectedCount;

        // generate random position of the client
        var clientInfo = new ClientInfo( clientConnectedCount, generatePlayerPos() );

        // insert an entry of client inforamtion
        clientInfos.set( client, clientInfo );
        client_msg_buffer.set( client, new MsgBuffer( CLIENT_MSG_BUFFER_SIZE ) );


        // dump for debug
        print( "A new client coming! Querying client's name...\n" );
    }

    public function playerMove( client : Domain, direction : int32 ) : void
    {
        var clientInfo : ClientInfo = getInfo( client );

        var nextRow : int32 = clientInfo.position.row;
        var nextCol : int32 = clientInfo.position.col;

        switch( direction )
        {
        case 1: // DirectUp
            nextRow -= 1;
        case 2: // DirectDown
            nextRow += 1;
        case 3: // DirectLeft
            nextCol -= 1;
        case 4: // DirectRight
            nextCol += 1;
        }

        if( !validatePlayerPos(nextRow, nextCol) )
            return;

        // update positions
        clientInfo.position.row = nextRow;
        clientInfo.position.col = nextCol;
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

    private function generatePlayerPos() : Point
    {
        var players : Vector<ObjectInfo> = this.getPlayers();

        var rowGenerator : Random<int32, Uniform> = new Random<int32, Uniform>( 0, 12-1 );
        var colGenerator : Random<int32, Uniform> = new Random<int32, Uniform>( 0, 25-1 );

        var generatedRow : int32 = 0;
        var generatedCol : int32 = 0;

        do
        {
            generatedRow = rowGenerator.next();
            generatedCol = colGenerator.next();
        } while( !validatePlayerPos(generatedRow, generatedCol) );

        return new Point( generatedRow, generatedCol );
    }

    private function validatePlayerPos( row : int32, col : int32 ) : bool
    {
        if( !( (0 <= row && row < 12) &&
               (0 <= col && col < 25) ) )
        {
            return false;
        }

        var players : Vector<ObjectInfo> = this.getPlayers();
        // find if any other players had occupied the position
        for( var i = 0; i != players.size(); ++i )
        {
            if( players[i].position.row == row && players[i].position.col == col )
            {
                return false;
            }
        }

        return true;
    }

    private function generateMonsterPos() : Point
    {
        return new Point( 0, 0 );
    }
}

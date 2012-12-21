import .= thor.container;
import .= thor.util;

import .= Util;
import .= Game;

class GameState
{
    // private static const CLIENT_MSG_BUFFER_SIZE : int32 = 1000;

    // connection info
    private var mConnectedPlayerCount : int32 = 0;

    // client information
    public var mDomainPlayerMap : HashMap< Domain, PlayerInfo > = new HashMap< Domain, PlayerInfo >;

    // player information
    public var mPlayers : Vector< PlayerInfo > = new Vector< PlayerInfo >;

    // mob information
    public var mMobs : Vector< ObjectInfo > = new Vector< ObjectInfo >;

    // all objects
    public var mAllObjects : Vector< ObjectInfo > = new Vector< ObjectInfo >;

    public function getConnectedDomains() : Vector<Domain>
    {
        var result : Vector<Domain> = new Vector<Domain>;
        var iter : HashMapIterator<Domain, PlayerInfo> = mDomainPlayerMap.iter();
        while ( iter.hasNext() )
        {
            result.push_back( iter.get().key );
            iter.next();
        }
        return result;
    }

    public function setPlayerName( client: Domain, clientName: String )
    {
        mDomainPlayerMap.get( client ).name = clientName;
        mDomainPlayerMap.get( client ).isNameComplete = true;
        mDomainPlayerMap.get( client ).dump();
    }

    public function getPlayerName( client: Domain ) : String
    {
        return mDomainPlayerMap.get( client ).name;
    }

    public function isPlayerNameComplete( client: Domain ) : bool
    {
        return mDomainPlayerMap.get( client ).isNameComplete;
    }

    private function getInfo( client : Domain ) : PlayerInfo
    {
        return mDomainPlayerMap.get( client );
    }

    // engine interfaces
    public function addPlayer( client : Domain ) : void
    {
        // TODO: atomic
        ++mConnectedPlayerCount;

        // generate random position of the client
        var playerInfo = new PlayerInfo( getPlayerCount(), generatePos() );

        // insert an entry of player inforamtion
        mDomainPlayerMap.set( client, playerInfo );
        mPlayers.push_back( playerInfo );
        mAllObjects.push_back( playerInfo );

        // client_msg_buffer.set( client, new MsgBuffer( gCLIENT_MSG_BUFFER_SIZE ) );

        // dump for debug
        print( "A new client coming! Querying client's name...\n" );
    }

    public function playerMove( client : Domain, direction : int32 ) : void
    {
        var clientInfo : PlayerInfo = getInfo( client );

        var nextRow : int32 = clientInfo.position.row;
        var nextCol : int32 = clientInfo.position.col;


        if( direction == DIRECT_NORTH )
            nextRow -= 1;
        else if( direction == DIRECT_SOUTH )
            nextRow += 1;
        else if( direction == DIRECT_WEST )
            nextCol -= 1;
        else if( direction == DIRECT_EAST )
            nextCol += 1;


        if( !validatePos(nextRow, nextCol) )
            return;

        // update positions
        clientInfo.position.row = nextRow;
        clientInfo.position.col = nextCol;
    }

    public function getPlayerCount() : int32
    {
        return mConnectedPlayerCount;
    }

    private function generatePos() : Point
    {
        var rowGenerator : Random<int32, Uniform> = new Random<int32, Uniform>( 0, MAP_ROW_LIMIT-1 );
        var colGenerator : Random<int32, Uniform> = new Random<int32, Uniform>( 0, MAP_COLUMN_LIMIT-1 );

        var generatedRow : int32 = 0;
        var generatedCol : int32 = 0;

        do
        {
            generatedRow = rowGenerator.next();
            generatedCol = colGenerator.next();
        } while ( !validatePos(generatedRow, generatedCol) );

        return new Point( generatedRow, generatedCol );
    }

    private function validatePos( row : int32, col : int32 ) : bool
    {
        if ( !( (0 <= row && row < MAP_ROW_LIMIT) &&
                (0 <= col && col < MAP_COLUMN_LIMIT) ) )
        {
            return false;
        }

        // find if any other players had occupied the position
        for ( var i = 0; i != mAllObjects.size(); ++i )
        {
            if ( mAllObjects[i].position.row == row && mAllObjects[i].position.col == col )
            {
                return false;
            }
        }

        return true;
    }
}

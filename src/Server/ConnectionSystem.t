import .= thor.container;
import .= Util;
import .= Game;

import Common;
import Client;

@server
function handle_client_connect( client : Domain ) : void
{
    ConnectionSystem.handleClientConnect( client );

    @remote { domain = client }
    Client.welcome( ConnectionSystem.getPlayerCount() );
}

class ConnectionSystem
{
    public static function handleClientConnect( client : Domain ) : void
    {
        gClientMsgBuffer.set( client, new MsgBuffer( gCLIENT_MSG_BUFFER_SIZE ) );
    }

    public static function login( domain : Domain, name : String ) : void
    {
        sConnectedPlayerCount += 1;
        sMaxDistchId += 1;
        var newPlayer : PlayerInfo = new PlayerInfo( sMaxDistchId );
        newPlayer.name = name;
        sDomainPlayerTable.set( domain, newPlayer );
        sPlayerDomainTable.set( newPlayer, domain );

        ObjectSystem.add( newPlayer );
    }

    public static function isLogin( domain : Domain ) : bool
    {
        return sDomainPlayerTable.has( domain );
    }

    public static function getPlayerCount() : int32
    {
        return sConnectedPlayerCount;
    }

    public static function getPlayer( domain : Domain ) : PlayerInfo
    {
        return sDomainPlayerTable.get( domain );
    }

    public static function send( packet : thor.container.Vector<PlayerMessage> ) : void
    {
        for ( var p in packet )
        {
            sendStringToClient( p.mMsg, getDomain( p.mPlayer ) );
        }
    }

    public static function send( player : PlayerInfo, msg : String ) : void
    {
        sendStringToClient( msg, getDomain( player ) );
    }

    public static function broadcast( msg : String ) : void
    {
        var iter : HashMapIterator<Domain, PlayerInfo> = sDomainPlayerTable.iter();
        while ( iter.hasNext() )
        {
            var client : Domain = iter.get().key;
            sendStringToClient( msg, client );
            iter.next();
        }
    }

    public static function getDomain( player : PlayerInfo ) : Domain
    {
        return sPlayerDomainTable.get( player );
    }

    private static function sendStringToClient( msg: String, target: Domain ):void
    {
        var playerName : String = getPlayer( target ).name;
        print( "send \{msg} to client \{playerName}\n" );

        /*
        The receiver may run in multi-thread mode,
        so the execution order is not the same as the order of sender

        We encoded as (0*2^32 + msg_length) (1*2^32 + msg[0]) ... (msg_length*2^32 + msg[msg_length-1])
        Then the receiver can assemble them. For the time being, we have not added msg id yet.
        */

        @remote { domain = target }
        Client.client_receive_encoded_char( msg.length() );

        for ( var i:int32 = 0; i < msg.length(); ++i )
        {
            @remote { domain = target }
            Client.client_receive_encoded_char( (i+1) * Common.power32 + msg[ i ] );
        }
    }

    // connection info
    private static var sConnectedPlayerCount : int32 = 0;

    // domain <=> player table
    public static var sDomainPlayerTable : HashMap< Domain, PlayerInfo > = new HashMap< Domain, PlayerInfo >;
    public static var sPlayerDomainTable : HashMap< PlayerInfo, Domain > = new HashMap< PlayerInfo, Domain >;

    // domain login state
    private static var sMaxDistchId : int32 = 0;
}

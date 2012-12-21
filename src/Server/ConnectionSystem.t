import .= thor.container;
import Client;
import .= Game;

@server
function handle_client_connect( client : Domain ) : void
{
    // update server state
    // ConnectionSystem.addClient( client );

    @remote { domain = client }
    Client.welcome( ConnectionSystem.getPlayerCount() );
}

class ConnectionSystem
{
    public static function getPlayer( domain : Domain ) : PlayerInfo
    {
        return sDomainPlayerTable.get( domain );
    }

    /*
    public static function addClient( domain : Domain ) : void
    {
    }
    */

    public static function login( domain : Domain, name : String ) : void
    {
        sConnectedPlayerCount += 1;
        sMaxDistchId += 1;
        var newPlayer : PlayerInfo = new PlayerInfo( sMaxDistchId );
        newPlayer.name = name;
        sDomainPlayerTable.set( domain, newPlayer );
        sPlayerDomainTable.set( newPlayer, domain );

        // ObjectSystem.addPlayer( player );
    }

    public static function isLogin( domain : Domain ) : bool
    {
        return sDomainPlayerTable.has( domain );
    }

    public static function getPlayerCount() : int32
    {
        return sConnectedPlayerCount;
    }

    public static function send( packet : thor.container.Vector<PlayerMessage> ) : void
    {
        for ( var p in packet )
        {
            new SendStringToClient( p.mMsg, getDomain( p.mPlayer ) );
        }
    }

    public static function broadcast( msg : String ) : void
    {
        var iter : HashMapIterator<Domain, PlayerInfo> = sDomainPlayerTable.iter();
        while ( iter.hasNext() )
        {
            var client : Domain = iter.get().key;
            new SendStringToClient( msg, client );
            iter.next();
        }
    }

    private static function getDomain( player : PlayerInfo ) : Domain
    {
        return sPlayerDomainTable.get( player );
    }

    // connection info
    private static var sConnectedPlayerCount : int32 = 0;

    // domain <=> player table
    private static var sDomainPlayerTable : HashMap< Domain, PlayerInfo > = new HashMap< Domain, PlayerInfo >;
    private static var sPlayerDomainTable : HashMap< PlayerInfo, Domain > = new HashMap< PlayerInfo, Domain >;

    // domain login state
    private static var sMaxDistchId : int32 = 0;
}

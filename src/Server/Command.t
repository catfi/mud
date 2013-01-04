import .= thor.container;

import .= Util;
import .= Game;

class Command
{
    public virtual function accept( str : String ) : bool
    {
        return false;
    }

    public virtual function execute( str : String, client : Domain ) : bool
    {
        return false;
    }
}

class MoveCmd extends Command
{
    public virtual function accept( str : String ) : bool
    {
        var tokens = split( str );

        if( tokens.size() != 1 )
            return false;

        for( var direction : int32 = DIRECT_NORTH; direction <= DIRECT_EAST; ++direction )
        {
            if( tokens[ 0 ].toLowerCase().equals( gDirectCmdStrs.get(direction) ) )
                return true;
        }

        return false;
    }

    public virtual function execute( str : String, client : Domain ) : bool
    {
        var player : PlayerInfo = ConnectionSystem.getPlayer( client );

        var tokens = split( str );

        for( var direction : int32 = DIRECT_NORTH; direction <= DIRECT_EAST; ++direction )
        {
            if( tokens[ 0 ].toLowerCase().equals( gDirectCmdStrs.get(direction) ) )
                ObjectSystem.move( player, direction );
        }

        return true;
    }
}

class SayCmd extends Command
{
    public virtual function accept( str : String ) : bool
    {
        var tokens = split( str );

        if( tokens.size() == 0 )
            return false;

        if( tokens[ 0 ].toLowerCase().equals( "say" ) )
            return true;

        return false;
    }

    public virtual function execute( str : String, client : Domain ) : bool
    {
        var player : PlayerInfo = ConnectionSystem.getPlayer( client );

        var tokens = split( str );
        // miss the message to send
        if( tokens.size() < 2 )
            return false;

        str = str.trim();
        var space : int64 = " "[ 0 ];
        var msg_begin = 0;
        // ignore 'say' command
        while( msg_begin < str.length() && str[msg_begin] != space )
            ++msg_begin;

        var msg : String = str.substring( msg_begin ).trim();
        print( "broadcast: \"\{msg}\"\n" );
        msg = player.name + " says: " + msg;
        ConnectionSystem.broadcast( msg );

        return true;
    }
}

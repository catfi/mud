import .= thor.container;

import .= Util;
import .= Game;
import .= Common;

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

        if( tokens[ 0 ].toLowerCase().equals( "n" ) )
            return true;

        if( tokens[ 0 ].toLowerCase().equals( "w" ) )
            return true;

        if( tokens[ 0 ].toLowerCase().equals( "e" ) )
            return true;

        if( tokens[ 0 ].toLowerCase().equals( "s" ) )
            return true;

        return false;
    }

    public virtual function execute( str : String, client : Domain ) : bool
    {
        var player : PlayerInfo = ConnectionSystem.getPlayer( client );

        var tokens = split( str );

        var direction : int32 = 0;
        if( tokens[ 0 ].toLowerCase().equals( "n" ) )
            direction = MoveEvent.NORTH;

        if( tokens[ 0 ].toLowerCase().equals( "s" ) )
            direction = MoveEvent.SOUTH;

        if( tokens[ 0 ].toLowerCase().equals( "w" ) )
            direction = MoveEvent.WEST;

        if( tokens[ 0 ].toLowerCase().equals( "e" ) )
            direction = MoveEvent.EAST;

        Common.pushEvent( new MoveEvent(player, direction) );

        return true;
    }
}

class SayCmd extends Command
{
    public virtual function accept( str : String ) : bool
    {
        var tokens = split( str );

        if ( tokens.size() == 0 )
            return false;

        if ( tokens[ 0 ].toLowerCase().equals( "say" ) )
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

class ExitCmd extends Command
{
    public virtual function accept( str : String ) : bool
    {
        var tokens = split( str );

        if ( tokens.size() != 1 )
            return false;

        if ( tokens[ 0 ].toLowerCase().equals( "quit" ) )
            return true;

        return false;
    }

    public virtual function execute( str : String, client : Domain ) : bool
    {
        var player : PlayerInfo = ConnectionSystem.getPlayer( client );
        var exitEvent : Common.ExitEvent = new Common.ExitEvent( player );
        Common.pushEvent( exitEvent );
        return true;
    }
}

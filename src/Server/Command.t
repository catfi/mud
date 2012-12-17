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
    private var directions : Vector<String> = new Vector<String>;

    public function new() : void
    {
        directions.push_back( "north" );
        directions.push_back( "south" );
        directions.push_back( "west" );
        directions.push_back( "east" );
    }

    public virtual function accept( str : String ) : bool
    {
        var tokens = split( str );

        if( tokens.size() != 1 )
            return false;

        for( var direction in directions )
        {
            if( tokens[ 0 ].toLowerCase().equals(direction) )
                return true;
        }

        return false;
    }

    public virtual function execute( str : String, client : Domain ) : bool
    {
        var tokens = split( str );

        for( var i : int32 = 0; i < directions.size(); ++i )
        {
            if( tokens[ 0 ].toLowerCase().equals( directions[i] ) )
                serverState.playerMove( client, i+1 );
        }

        new SendStringToClient( "map: " + VectorConverter.toString(serverState.getPlayers()), client );
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
        broadcast( client, msg );

        return true;
    }
}

import .= thor.container;
import .= util;

class Command
{
    public virtual function accept( str : String ) : bool
    {
        return false;
    }

    public virtual function execute( str : String, client : Domain ) : bool
    {
        // do nothing
        return false;
    }
}

class UnaryCmd extends Command
{
    public virtual function accept( str : String ) : bool
    {
        return split( str ).size() == 1;
    }
}

class BinaryCmd extends Command
{
    public virtual function accept( str : String ) : bool
    {
        return split( str ).size() == 2;
    }
}

class TernaryCmd extends Command
{
    public virtual function accept( str : String ) : bool
    {
        return split( str ).size() == 3;
    }
}

class MoveCmd extends UnaryCmd
{
    private var directions : Vector<String> = new Vector<String>;

    public function new() : void
    {
        directions.push_back( "Left" );
        directions.push_back( "Right" );
        directions.push_back( "Up" );
        directions.push_back( "Down" );
    }

    public virtual function accept( str : String ) : bool
    {
        var tokens = split( str );

        if( tokens.size() != 1 )
            return false;

        for( var direction in directions )
        {
            if( direction.equals( tokens[ 0 ] ) )
            {
                return true;
            }
        }
        return false;
    }

    public virtual function execute( str : String, client : Domain ) : bool
    {
        var tokens = split( str );

        if( tokens[ 0 ].equals( "Left" ) )
            serverState.move( client, 1 );

        if( tokens[ 0 ].equals( "Right" ) )
            serverState.move( client, 2 );

        if( tokens[ 0 ].equals( "Up" ) )
            serverState.move( client, 3 );

        if( tokens[ 0 ].equals( "Down" ) )
            serverState.move( client, 4 );

        return true;
    }
}

class SayCmd extends UnaryCmd
{
    public virtual function accept( str : String ) : bool
    {
        var tokens = split( str );

        if( tokens.size() < 2 )
            return false;

        if( tokens[ 0 ].toLowerCase().equals( "say" ) )
            return true;

        return false;
    }

    public virtual function execute( str : String, client : Domain ) : bool
    {
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

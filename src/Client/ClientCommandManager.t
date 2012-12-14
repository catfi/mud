import .= thor.container;
import .= util;

class ClientCommandManager
{
    private static var init : bool = false;
    private static var allCommands : Vector<String>;

    public static function create() : void
    {
        if ( !init )
        {
            allCommands = new Vector<String>;
            allCommands.push_back( "say" );
            allCommands.push_back( "talk" );
            allCommands.push_back( "south" );
            allCommands.push_back( "north" );
            allCommands.push_back( "east" );
            allCommands.push_back( "west" );
            allCommands.push_back( "quit" );
            init = true;
        }
        else
        {
            print( "assert false in ClientCommandManager" );
        }
    }

    public static function accept( str : String ) : bool
    {
        var tokens = split( str );
        for( var i : int32 = 0; i < allCommands.size(); ++i )
        {
            if( allCommands[ i ].isEqual( tokens[0] ) )
            {
                return true;
            }
        }
        return false;
    }

    public static function send( str : IndexableString ) : void
    {
        new SendStringToServer( str, g_server );
    }
}

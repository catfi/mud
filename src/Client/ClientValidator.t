import .= thor.container;
import .= util;

class CommandValidator
{
    private static var allCommands : Vector<String> = null;

    private static function initLookupTable() 
    {
        allCommands = new Vector<String>;
        allCommands.push_back( "say" );
        allCommands.push_back( "talk" );
        allCommands.push_back( "south" );
        allCommands.push_back( "north" );
        allCommands.push_back( "east" );
        allCommands.push_back( "west" );
        allCommands.push_back( "quit" );
    }

    public static function accept( str : String ) : bool
    {
        if ( allCommands == null )
        {
            initLookupTable();
        }

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
}

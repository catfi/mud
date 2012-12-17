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
        if( tokens.size() == 0 )
            return false;

        for( var i : int32 = 0; i < allCommands.size(); ++i )
        {
            if( allCommands[ i ].isEqual( tokens[0].toLowerCase() ) )
            {
                return true;
            }
        }

        return false;
    }

    public static function isValidName( str : String ) : bool
    {
        if ( str.length() > 15 )
            return false;
        else
            return true;
    }
}

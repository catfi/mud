import .= thor.container;

import .= Util;
import .= Game;

class CommandValidator
{
    public static function accept( str : String ) : bool
    {
        var tokens = split( str );
        if( tokens.size() == 0 )
            return false;

        for( var command : int32 = COMMAND_BEGIN; command <= COMMAND_END; ++command )
        {
            if( tokens[0].toLowerCase().equals( gAllCmdStrs.get(command) ) )
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

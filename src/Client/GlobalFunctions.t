import .= util;

// TODO: should be singleton
class ClientInput
{
    private static var input_in_native_thread : NativeThreadInput;

    public static function create(): void
    {
        static var init : bool = false;
        if ( !init )
        {
            input_in_native_thread = new NativeThreadInput();
            input_in_native_thread.start();
            init = true;
        }
        else
        {
            // assert false
            print( "assert false in ClientInput" );
        }
    }

    public static function get_name():String
    {
        while(true)
        {
            var name : String;
            name = input_in_native_thread.getInput();
            if ( name.length() != 0 )
                return name;
            sleep_for_msec( 50 );
        }
        var dummy : String;
        return dummy;
    }

    public static function input_loop():void
    {
        while(true)
        {
            // TODO: use Command class
            var command : String;
            command = input_in_native_thread.getInput();

            if ( is_command_valid( command ) )
                issue_command( command );

            sleep_for_msec( 50 );
        }
    }

    // check each command before sending to the server to reduce the loading of server
    private static function is_command_valid( a_command : String ) : bool
    {
        return ( a_command.length() != 0 );
    }

    private static function issue_command( a_command : String ) : void
    {
        var msg : IndexableString = new IndexableString();
        msg.concate( a_command );
        new SendStringToServer( msg, g_server );
        // print( "I issueed a command \{a_command}\n" );
    }
}


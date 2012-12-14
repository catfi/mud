import .= util;

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
        while( true )
        {
            // TODO: use Command class
            var command : String;
            command = input_in_native_thread.getInput();

            if ( command.length() != 0 )
            {
                if(  CommandValidator.accept( command ) )
                    new SendStringToServer( command, gServer );
                else
                    print( "invalid command!\n" );
            }

            sleep_for_msec( 50 );
        }
    }
}

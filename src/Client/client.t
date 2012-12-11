import .= thor.lang;
import .= thor.container;
import .= util;

var input_in_native_thread : NativeThreadInput = new NativeThreadInput();
var receive_encoded_char_count : int32 = 0; // do not include msg length info
var receive_buffer : Vector<int32> = new Vector<int32>(1000);

@client
function input_loop():void
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

@client
function get_name():String
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

@client
function print_func():void
{
    var x : int64 = 0;
    while(true)
    {
        print(" print_func \{x}\n");
        sleep_for_msec( 1000 );
    }
}

// check each command before sending to the server to reduce the loading of server
@client
function is_command_valid( a_command : String ) : bool
{
    return ( a_command.length() != 0 );
}

@client
function issue_command( a_command : String ) : void
{
    print( "I issueed a command \{a_command}\n" );
}

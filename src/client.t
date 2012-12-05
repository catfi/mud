// objects
var input_in_native_thread : NativeThreadInput = new NativeThreadInput();

// functions
@client
function receive_ascii( a_ascii : int8 ):void
{
    var is : IndexableString = new IndexableString();
    is.addAscii( a_ascii );
    print( cast<MutableString>(is) );
}

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

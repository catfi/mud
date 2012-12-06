import .= thor.lang;
import .= thor.container;

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

@client
function receive_encoded_char( encoded_char : int64 ):void
{
    // assert the receive buffer is clear
    var index : int32 = encoded_char / power32;
    var decoded_char : int32 = encoded_char % power32;

    /* test if we don't sync them, can be removed
    {
        var is : IndexableString = new IndexableString();
        is.addAscii( decoded_char );
        print( is );
    }
    */

    // accumulate the received char count
    if ( index != 0 )
    {
        atomic () {
            receive_encoded_char_count++;
        }
    }

    // remember that index 0 is real message's length
    receive_buffer.set( index, decoded_char );

    // if all encoded char is received
    var msg_length : int32 = receive_buffer.get( 0 );
    var need_clear_buffer : bool = false;
    if ( msg_length == receive_encoded_char_count )
    {
        var is : IndexableString = new IndexableString();
        for ( var i:int32 = 1; i <= msg_length; ++i )
        {
            is.addAscii( receive_buffer.get(i) );
        }

        // handle it
        print( "\n\{is}\n" );

        // clear the receive buffer
        need_clear_buffer = true;
    }
    else if ( msg_length != 0 && receive_encoded_char_count > msg_length )
    {
        print( "oh the sender send too quick! i'm just a work around!" );
        need_clear_buffer = true;
    }

    if ( need_clear_buffer )
    {
        for ( var i:int32 = 0; i <= msg_length; ++i )
        {
            receive_buffer.set( i, 0 );
        }
        receive_encoded_char_count = 0;
        need_clear_buffer = false;
    }
}

import .= thor.lang;
import .= thor.container;
import .= Game;
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

var g_server : Domain;
var msg_buffer : MsgBuffer = new MsgBuffer(1000);

var client_game : ClientGame;

@client
function welcome( user_count:int32 ):void
{
    g_server = Domain.caller();

    var welcome_msg : String = "Welcome to Zillians MUD! current online user count: \{user_count}\n";
    print( welcome_msg );

    var query_name_msg : String = "Please type your name: ";
    print( query_name_msg );

    ClientInput.create();
    var player_name : String = ClientInput.get_name();

    client_game = new ClientGame();

    var p : IndexableString = new IndexableString();
    p.concate( player_name );
    new SendStringToServer( p, g_server );
}

@client
function update_position( pos:int64 ) : void
{
    client_game.update_position( new Point( pos ) );
    client_game.showMap();

    if ( client_game.get_progress() == ClientGame.INIT )
    {
        client_game.set_progress( ClientGame.INPUT_LOOP );
        @async ClientInput.input_loop();
    }
}

@client
function client_receive_encoded_char( encoded_char : int64 ):void
{
    msg_buffer.add_encoded_char( encoded_char );
    var msg : IndexableString = new IndexableString();
    if ( msg_buffer.is_msg_complete() )
    {
        msg = msg_buffer.get_msg();
        print( "[server] \{msg}\n" );
    }
}

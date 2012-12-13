import .= thor.lang;
import .= thor.container;
import .= Game;
import .= util;

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

    input_in_native_thread.start();
    var player_name : String = get_name();

    client_game = new ClientGame();

    var p : IndexableString = new IndexableString();
    p.concate( player_name );
    new SendStringToServer( p, g_server );

    @async input_loop();
}

@client
function update_position( pos:int64 ) : void
{
    client_game.update_position( new Point( pos ) );
    client_game.showMap();
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

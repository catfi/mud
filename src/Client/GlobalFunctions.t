import .= thor.lang;
import .= thor.container;
import .= Game;
import .= util;

var gServer : Domain;
var gMsgBuffer : MsgBuffer = new MsgBuffer(1000);

var gClientGame : ClientGame;

@client
function welcome( user_count:int32 ):void
{
    gServer = Domain.caller();

    var welcomeMsg : String = "Welcome to Zillians MUD! current online user count: \{user_count}\n";
    print( welcomeMsg );

    var queryNameMsg : String = "Please type your name: ";
    print( queryNameMsg );

    ClientInput.create();
    var playerName : String = ClientInput.get_name();

    gClientGame = new ClientGame();

    var p : IndexableString = new IndexableString();
    p.concate( playerName );
    new SendStringToServer( p, gServer );
}

@client
function update_position( pos:int64 ) : void
{
    gClientGame.update_position( new Point( pos ) );
    gClientGame.showMap();

    if ( gClientGame.get_progress() == ClientGame.INIT )
    {
        gClientGame.set_progress( ClientGame.INPUT_LOOP );
        @async ClientInput.input_loop();
    }
}

@client
function client_receive_encoded_char( encoded_char : int64 ):void
{
    gMsgBuffer.add_encoded_char( encoded_char );
    var msg : IndexableString = new IndexableString();
    if ( gMsgBuffer.is_msg_complete() )
    {
        msg = gMsgBuffer.get_msg();
        print( "[server] \{msg}\n" );
    }
}

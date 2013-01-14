import .= thor.lang;
import .= thor.container;

import .= Game;
import .= Util;

var gServer : Domain;
var gClientMsgBuffer : MsgBuffer = new MsgBuffer(1000);
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
    var playerName : String;
    do
    {
        playerName = ClientInput.get_name();
    }
    while ( !CommandValidator.isValidName( playerName ) );

    gClientGame = new ClientGame( playerName );

    var p : IndexableString = new IndexableString();
    p.concate( playerName );
    new SendStringToServer( p, gServer );
}

@client
function client_receive_encoded_char( encoded_char : int64 ):void
{
    gClientMsgBuffer.add_encoded_char( encoded_char );
    var msg : IndexableString = new IndexableString();
    if ( gClientMsgBuffer.is_msg_complete() )
    {
        msg = gClientMsgBuffer.get_msg();
        print( "[server] \{msg}\n" );

        CommandHandler.execute( msg );

        if ( gClientGame.get_progress() == ClientGame.INIT )
        {
            gClientGame.set_progress( ClientGame.INPUT_LOOP );
            @async ClientInput.input_loop();
        }
    }
}

@client
function enterSameRoom( nameId : int32, mobId : int32 ) : void
{
    print( "enterSameRoom( \{nameId}, \{mobId} )\n" );
}

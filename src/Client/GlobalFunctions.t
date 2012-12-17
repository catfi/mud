import .= thor.lang;
import .= thor.container;

import .= Game;
import .= Util;

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
    gMsgBuffer.add_encoded_char( encoded_char );
    var msg : IndexableString = new IndexableString();
    if ( gMsgBuffer.is_msg_complete() )
    {
        msg = gMsgBuffer.get_msg();
        print( "[server] \{msg}\n" );

        // test show map
        var mapHeader : int32 = msg.indexOf( "map:" );
        if( mapHeader != -1 )
        {
            var mapObjectInfo : Vector<ObjectInfo> = VectorConverter.fromString( msg.substring(mapHeader+4) );
            // gClientGame.showAllMapInfo( mapObjectInfo );
            gClientGame.showMap( mapObjectInfo );
        }

        if ( gClientGame.get_progress() == ClientGame.INIT )
        {
            gClientGame.set_progress( ClientGame.INPUT_LOOP );
            @async ClientInput.input_loop();
        }
    }
}

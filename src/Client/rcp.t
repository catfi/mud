import .= thor.lang;
import .= thor.container;

import Game;
import .= Util;

var gServer : Domain;
var gClientMsgBuffer : MsgBuffer = new MsgBuffer(1000);
var gClientGame : ClientGame;

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

    // TODO: should be open after server added client success
    if ( gClientGame.get_progress() == ClientGame.INIT )
    {
        gClientGame.set_progress( ClientGame.INPUT_LOOP );
        @async ClientInput.input_loop();
    }
}

/*
function startInputLoop() : void
{
    if ( gClientGame.get_progress() == ClientGame.INIT )
    {
        gClientGame.set_progress( ClientGame.INPUT_LOOP );
        @async ClientInput.input_loop();
    }
}
*/

function client_receive_encoded_char( encoded_char : int64 ):void
{
    gClientMsgBuffer.add_encoded_char( encoded_char );
    var msg : IndexableString = new IndexableString();
    if ( gClientMsgBuffer.is_msg_complete() )
    {
        msg = gClientMsgBuffer.get_msg();
        print( "[server] \{msg}\n" );

        CommandHandler.execute( msg );
    }
}

function RebirthMsg() : void
{
    print( "RebirthMsg\n" );
}

function enterSameRoom( nameId : int32, id : int32 )
{
    print( "\"" );
    print( Game.MobName.getString( nameId ) );
    print( " \{id}\" " );
    print( "is entering this room!\n" );
}

function attackMobMsg( nameId : int32, hp : int32, dmg : int32 )
{
    print( Game.MobName.getString( nameId ) );
    if ( hp != 0 )
    {
        print( " was damaged by \{dmg}. Now, it has \{hp} HP. And, It is very angry!\n" );
    }
    else
    {
        print( " was killed!\n" );
    }
}

function showRoomInfo( playerCount : int32, mobCount : int32 ) : void
{
    var are_or_is = ( 1 < playerCount + mobCount ? "are" : "is");

    var message = "In this room, there \{are_or_is} ";

    var playerPostfix = ( 1 < playerCount ? "s" : "" );

    message = message + "\{playerCount} player\{playerPostfix}";

    if ( mobCount != 0 )
    {
        var mobPostfix = ( 1 < mobCount ? "s" : "" );
        message = message + " and \{mobCount} mob\{mobPostfix}";
    }

    message = message + ".\n";
    print( message );
}

function attackedByMobMsg( nameId : int32, hp : int32, dmg : int32 )
{
    print( "You are attacked by " );
    print( Game.MobName.getString( nameId ) );
    print( ". " );
    if ( hp <= 0 )
    {
        print( "Now, you are a ghost...\n" );
    }
    else
    {
        print( " You are damaged by \{dmg}. Now, you have \{hp} HP.\n" );
    }
}

function rebirthMsg()
{
    print( " You are rebirth!!!" );
}

import .= thor.container;
import .= thor.util;

import .= Util;
import .= Client;
import .= Game;
import Common;

@server
function initCmds() : void
{
    commands.push_back( new MoveCmd );
    commands.push_back( new SayCmd );
    commands.push_back( new ExitCmd );

    commandFormats.push_back( "( n | s | w | e )" );
    commandFormats.push_back( "say [message]" );
}

@server
function initCmdStrs() : void
{
    if( gCmdStrsWereInitialized )
        return;

    gDirectCmdStrs.set( DIRECT_NORTH, "n" );
    gAllCmdStrs.set( DIRECT_NORTH, "n" );

    gDirectCmdStrs.set( DIRECT_SOUTH, "s" );
    gAllCmdStrs.set( DIRECT_SOUTH, "s" );

    gDirectCmdStrs.set( DIRECT_WEST, "w" );
    gAllCmdStrs.set( DIRECT_WEST, "w" );

    gDirectCmdStrs.set( DIRECT_EAST, "e" );
    gAllCmdStrs.set( DIRECT_EAST, "e" );

    gAllCmdStrs.set( COMMAND_SAY, "say" );

    gAllCmdStrs.set( COMMAND_TALK, "talk" );

    gAllCmdStrs.set( COMMAND_QUIT, "quit" );

    gCmdStrsWereInitialized = true;
}

@server
function registerEventListeners() : void
{
    Common.addEventListener( Common.EVENT_MOVE, new Common.MoveEventListener );
}

@server
function launchServices() : void
{
    Common.gEventDispatcher = Util.Timer.loop( 200,
                                               lambda() : void {
                                                   Common.dispatchEvents();
                                               } );
    Common.gEventDispatcher.start();
    //
    Game.gMobGenerateIssuer = Util.Timer.loop( 500,
                                               lambda() : void {
                                                   Game.issueMobs();
                                               } );
    Game.gMobGenerateIssuer.start();
    //
    Game.gMobWalkIssuer = Util.Timer.loop( 500,
                                           lambda() : void {
                                               Game.issueMobWalks();
                                           } );
    Game.gMobWalkIssuer.start();
}

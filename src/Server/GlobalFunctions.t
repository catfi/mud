import .= thor.container;
import .= thor.util;

import .= Util;
import .= Client;
import .= Game;

@server
function initCmds() : void
{
    commands.push_back( new MoveCmd );
    commands.push_back( new SayCmd );

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

import .= thor.container;

var DIRECTION_NORTH : int32 = 1;
var DIRECTION_SOUTH : int32 = 2;
var DIRECTION_WEST : int32 = 3;
var DIRECTION_EAST : int32 = 4;

var allCommands : HashMap< int32, String > = new HashMap< int32, String>;
var directionCommands : HashMap< int32, String > = new HashMap< int32, String >;

function initDirectionCommands() : void
{
    directionCommands.set( DIRECTION_NORTH, "n" );
    allCommands.set( DIRECTION_NORTH, "n" );

    directionCommands.set( DIRECTION_SOUTH, "s" );
    allCommands.set( DIRECTION_SOUTH, "s" );

    directionCommands.set( DIRECTION_WEST, "w" );
    allCommands.set( DIRECTION_WEST, "w" );

    directionCommands.set( DIRECTION_EAST, "e" );
    allCommands.set( DIRECTION_EAST, "e" );
}


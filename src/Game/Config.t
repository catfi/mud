import .= thor.container;

// command codes
var COMMAND_BEGIN : int32 = 1;
var DIRECT_NORTH : int32 = 1;
var DIRECT_SOUTH : int32 = 2;
var DIRECT_WEST : int32 = 3;
var DIRECT_EAST : int32 = 4;
var COMMAND_SAY : int32 = 5;
var COMMAND_TALK : int32 = 6;
var COMMAND_QUIT : int32 = 7;
var COMMAND_ATTACK : int32 = 8;
var COMMAND_END : int32 = 8;

// map setting
var MAP_ROW_LIMIT : int32 = 25;
var MAP_COLUMN_LIMIT : int32 = 120;

// maps to store command strings
var gAllCmdStrs : HashMap< int32, String > = new HashMap< int32, String>;
var gDirectCmdStrs : HashMap< int32, String > = new HashMap< int32, String >;

var gCmdStrsWereInitialized : bool = false;

// player setting
var gPlayerDefaultHp : int32 = 100;

import .= thor.container;

import .= Util;

import Game;

// whole server information
var gGameState : GameState = null;

// commands to executa and their formats
var commands : Vector<Command> = new Vector<Command>;
var commandFormats : Vector<String> = new Vector<String>;

// the dead players
var gRebirthRequests : Vector<RebirthRequest> = null;

import .= thor.container;

import .= Util;

// whole server information
var serverState : ServerState = new ServerState;

// commands to executa and their formats
var commands : Vector<Command> = new Vector<Command>;
var commandFormats : Vector<String> = new Vector<String>;

// messages sent from clients
var client_msg_buffer : HashMap<Domain, MsgBuffer> = new HashMap<Domain, MsgBuffer>();


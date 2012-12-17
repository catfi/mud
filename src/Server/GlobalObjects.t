import .= thor.container;

import .= Util;

// commands to executa and their formats
var commands : Vector<Command> = new Vector<Command>;
var commandFormats : Vector<String> = new Vector<String>;

// messages sent from clients
var client_msg_buffer : HashMap<Domain, MsgBuffer> = new HashMap<Domain, MsgBuffer>();


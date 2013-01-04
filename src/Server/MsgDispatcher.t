import .= thor.container;

import .= Util;
import .= Game;

// messages sent from clients
var gClientMsgBuffer : HashMap<Domain, MsgBuffer> = new HashMap<Domain, MsgBuffer>();
const gCLIENT_MSG_BUFFER_SIZE : int32 = 1000;

@server
function server_receive_encoded_char( encoded_char : int64 ):void
{
    var client : Domain = Domain.caller();
    var msg_buffer : MsgBuffer = gClientMsgBuffer.get( client );
    msg_buffer.add_encoded_char( encoded_char );
    var msg : IndexableString = new IndexableString();
    if ( msg_buffer.is_msg_complete() )
    {
        msg = msg_buffer.get_msg();
        if ( !ConnectionSystem.isLogin( client ) )
        {
            print( "client \{msg} is added\n" );
            ConnectionSystem.login( client, msg );
        }
        else
        {
            var player : PlayerInfo = ConnectionSystem.getPlayer( client );
            // validate command first
            var foundCommand : bool = false;
            // for each command, find a command can execute
            for( var i : int64 = 0; i < commands.size(); ++i )
            {
                if( commands[ i ].accept( msg ) )
                {
                    foundCommand = true;
                    var result : bool = commands[ i ].execute( msg, client );

                    if( !result )
                    {
                        var format : String = commandFormats[ i ];

                        ConnectionSystem.send( player, "execute falied! format is: \{format}" );
                    }

                    break;
                }
            }

            // send error message when find no proper command
            if( !foundCommand )
                ConnectionSystem.send( player, "invalid command!" );
        }
    }
}


import .= thor.lang;
import .= thor.container;
import .= util;

var client_msg_buffer : HashMap<Domain, MsgBuffer> = new HashMap<Domain, MsgBuffer>();

@server
function server_receive_encoded_char( encoded_char : int64 ):void
{
    var client : Domain = Domain.caller();
    var msg_buffer : MsgBuffer = client_msg_buffer.get( client );
    msg_buffer.add_encoded_char( encoded_char );
    var msg : IndexableString = new IndexableString();
    if ( msg_buffer.is_msg_complete() )
    {
        msg = msg_buffer.get_msg();
        print( "client \{msg} is added\n" );
        server_state.setClientName( client, msg );
        new SendStringToClient( msg, client );
    }
}

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
        if ( server_state.isClientNameComplete( client ) == false )
        {
            print( "client \{msg} is added\n" );
            server_state.setClientName( client, msg );
            // new SendStringToClient( msg, client );
        }
        else
        {
            var clientName : String = server_state.getClientName( client );
            print( "recv client \{clientName}'s message: \{msg}\n" );
            broadcast( client, msg );
        }
    }
}

@server
function broadcast( from_client : Domain, msg : IndexableString ) : void
{
    var from_client_name : String = server_state.getClientName( from_client );
    var all_client : Vector<Domain> = server_state.getAllClientDomain();

    // print( "broadcast request !\n" );
    for ( var i : int32 = 0; i < all_client.size(); ++i )
    {
        // print( "to_client #\{i}\n" );
        var to_client : Domain = all_client[i];
        var result_msg : IndexableString = new IndexableString();
        result_msg.concate( from_client_name );
        result_msg.concate(  " said: \{msg}\n" );
        // if ( to_client != from_client )
        {
            new SendStringToClient( result_msg, to_client );
        }
    }
}

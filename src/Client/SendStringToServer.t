import .= Util;
import .= Common;
import .= Server;

class SendStringToServer
{
    public function new( msg: String, target: Domain ):void
    {
        /*
        The receiver may run in multi-thread mode,
        so the execution order is not the same as the order of sender

        We encoded as (0*2^32 + msg_length) (1*2^32 + msg[0]) ... (msg_length*2^32 + msg[msg_length-1])
        Then the receiver can assemble them. For the time being, we have not added msg id yet.
        */
        print( "send \{msg} to server\n" );

        @remote { domain = target }
        server_receive_encoded_char( msg.length() );

        for ( var i:int32 = 0; i < msg.length(); ++i )
        {
            var value = msg[ i ];
            @remote { domain = target } server_receive_encoded_char( (i+1) * power32 + value );
        }
    }
}

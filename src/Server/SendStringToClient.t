import .= Util;
import .= Common;
import .= Client;

class SendStringToClient
{
    public function new( msg: String, target: Domain ):void
    {
        var playerName : String = gameState.getPlayerName( target );
        print( "send \{msg} to client \{playerName}\n" );

        /*
        The receiver may run in multi-thread mode,
        so the execution order is not the same as the order of sender

        We encoded as (0*2^32 + msg_length) (1*2^32 + msg[0]) ... (msg_length*2^32 + msg[msg_length-1])
        Then the receiver can assemble them. For the time being, we have not added msg id yet.
        */

        @remote { domain = target }
        client_receive_encoded_char( msg.length() );

        for ( var i:int64 = 0; i < msg.length(); ++i )
        {
            @remote { domain = target } client_receive_encoded_char( (i+1) * power32 + msg[ i ] );
        }
    }
}

import .= thor.lang;
import .= thor.container;

import .= Common;

class MsgBuffer
{
    private var buffer : Vector<int32>;
    private var receive_encoded_char_count : int32;
    private var msg_complete_flag : bool;
    private var msg : IndexableString;

    public function new( buffer_size:int32 ) : void
    {
        buffer = new Vector<int32>(buffer_size);
        msg_complete_flag = false;
        msg = new IndexableString();
        clear();
    }

    public function add_encoded_char( encoded_char : int64 ) : void
    {
        // assert the receive buffer is clear
        var index : int32 = encoded_char / power32;
        var decoded_char : int32 = encoded_char % power32;

        // remember that index 0 is real message's length
        buffer.set( index, decoded_char );

        // accumulate the received char count
        var current_char_count : int32 = 0;
        if ( index != 0 )
        {
            // issue: we don't have different mutex for each client msg box
            atomic () {
                receive_encoded_char_count++;
                current_char_count = receive_encoded_char_count;
            }
        }

        // if all encoded char is received
        var msg_length : int32 = buffer.get( 0 );

        if ( msg_length == current_char_count )
        {
            if ( msg_complete_flag == true )
            {
                print( "*** oh the sender send too quick! i'm just a work around!" );
                clear();
            }

            for ( var i:int32 = 1; i <= msg_length; ++i )
            {
                msg.addAscii( buffer.get(i) );
            }

            // handle it ( a command or something )
            msg_complete_flag = true;
            clear();
        }
        else if ( msg_length != 0 && msg_length < current_char_count )
        {
            print( "=== oh the sender send too quick! i'm just a work around!" );
            clear();
        }
    }

    public function is_msg_complete() : bool
    {
        return msg_complete_flag;
    }

    public function get_msg() : IndexableString
    {
        var result : IndexableString = msg;
        msg_complete_flag = false;
        msg = new IndexableString();
        return result;
    }

    private function clear():void
    {
        for ( var i:int32 = 0; i < buffer.size(); ++i )
        {
            buffer.set( i, 0 );
        }
        receive_encoded_char_count = 0;
    }
}

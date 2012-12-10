import .= thor.container;

var power32 : int64 = cast<int64>(1) << 32;

class SendString
{
    public function new( msg: IndexableString, target: Domain ):void
    {
        /*
        The receiver may run in multi-thread mode,
        so the execution order is not the same as the order of sender

        We encoded as (0*2^32 + msg_length) (1*2^32 + msg[0]) ... (msg_length*2^32 + msg[msg_length-1])
        Then the receiver can assemble them. For the time being, we have not added msg id yet.
        */
        @remote { domain = target }
        receive_encoded_char( msg.length() );

        for ( var i:int64 = 0; i < msg.length(); ++i )
        {
            @remote { domain = target } receive_encoded_char( (i+1) * power32 + msg[ i ] );
        }
    }
}

@native
function charToString( ch : int64 ) : String;

function split( str : String ) : Vector<String>
{
    var tokens = new Vector<String>();    
    
    str = str.trim();
    var space : int64 = " "[ 0 ];
    
    var current : int32 = 0;
    while( current != str.length() )
    {
        // find begin of a token
        var begin : int32 = current; 

        // ignore spaces
        while( begin != str.length() && str[ begin ] == space )
           ++begin; 
        
        // ignore non-spaces 
        var end : int32 = begin;
        while( end != str.length() && str[ end ] != space )
            ++end; 
        
        tokens.push_back( str.substring(begin, end) );

        current = end;
    } 
    
    return tokens;
}

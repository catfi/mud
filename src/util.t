import .= thor.container;

class SendString
{
    public function new( msg: IndexableString, target: Domain ):void
    {
        print( "(debug)send \{msg}\n" );
        for ( var i:int32 = 0; i < msg.length(); ++i )
        {
            @remote { domain = target } receive_ascii( msg.getEncodedNumAt(i) );
        }
    }
}

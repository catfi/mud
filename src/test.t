@entry
function test():int32
{
    var s : String;
    s = raw_input();
    print(s);

    var is : IndexableString = new IndexableString();
    is.addAscii( 97 );
    is.addAscii( 98 );
    is.concate( 987 );
    print( cast<MutableString>(is) );
    print( is.getEncodedNumAt( 0 ) );
    print( is.getEncodedNumAt( 1 ) );
    print( is.getEncodedNumAt( 2 ) );
    print( is.getEncodedNumAt( 3 ) );
    print( is.getEncodedNumAt( 4 ) );

    return 0;

}

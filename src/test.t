/*
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

function print_func():void
{
    var x : int64 = 0;
    while(true)
    {
        print(" print_func \{x}\n");
        sleep_for_msec( 1000 );
    }
}

function input_loop():void
{
    while(true)
    {
        var s : String;
        s = input_in_native_thread.getInput();

        if ( s.length() != 0 )
        {
            print( s );
            print("there are something in in put buffer\n");
        }

        sleep_for_msec( 1000 );
    }
}

var input_in_native_thread : NativeThreadInput = new NativeThreadInput();
@entry
function testInput():int32
{

    input_in_native_thread.start();
    @async print_func();
    @async input_loop();

    daemonize();
    return 0;
}
*/

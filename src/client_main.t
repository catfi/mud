@client
function client_main() : void
{
    var server : Domain = Domain.caller();
    print( "hi this is client.\n" );

    input_in_native_thread.start();
    @async input_loop();
    @async print_func();
}

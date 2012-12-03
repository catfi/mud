// the real entry function on server
@server
function server_main( client : Domain ) : void
{
    // call client's entry function
    @remote { domain = client }
    client_main();
    
    print( "hi this is server.\n" );

}

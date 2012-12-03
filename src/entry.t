@entry
@client
function client_entry() : int32
{
    daemonize();
    return 0;
}

@entry
@server
function server_entry() : int32
{
    Domain.watch( 0, lambda( client : Domain ) : void {
        
        // call the real entry function on server
        server_main( client );    

    });
    daemonize();

    return 0;
}

@client
function welcome( user_count:int32 ):void
{
    var server : Domain = Domain.caller();

    var welcome_msg : String = "Welcome to Zillians MUD! current online user count: \{user_count}\n";
    print( welcome_msg );

    var query_name_msg : String = "Please type your name: ";
    print( query_name_msg );
    input_in_native_thread.start();
    var player_name : String = get_name();

    var p : IndexableString = new IndexableString();
    p.concate( player_name );
    new SendString( p, server );

    /*
    @remote { domain = server }
        add_client_name();
    */

    // @async input_loop();
}

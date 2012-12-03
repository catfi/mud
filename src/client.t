@client
function client_main() : void
{
    var server : Domain = Domain.caller();

    print( "hi this is client.\n" );
}

@client
function receive_ascii( a_ascii : int8 ):void
{
    var is : IndexableString = new IndexableString();
    is.addAscii( a_ascii );
    print( cast<MutableString>(is) );
}

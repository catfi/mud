@client
function receive_ascii( a_ascii : int8 ):void
{
    var is : IndexableString = new IndexableString();
    is.addAscii( a_ascii );
    print( cast<MutableString>(is) );
}

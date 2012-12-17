import .= thor.container;

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

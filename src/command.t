import .= thor.container;

class Command
{
    public virtual function accept( str : String ) : bool
    {
        return false;
    }

    public virtual function execute( str : String, client : Domain ) : void
    {
        // do nothing
    }
}

class UnaryCmd extends Command
{
    public virtual function accept( str : String ) : bool
    {
        return split( str ).size() == 1;
    }
}

class BinaryCmd extends Command
{
    public virtual function accept( str : String ) : bool
    {
        return split( str ).size() == 2;
    }
}

class TernaryCmd extends Command
{
    public virtual function accept( str : String ) : bool
    {
        return split( str ).size() == 3;
    }
}

class MoveCmd extends UnaryCmd
{
    private var directions : Vector<String> = new Vector<String>;

    public function new() : void
    {
        directions.push_back( "Left" );    
        directions.push_back( "Right" );    
        directions.push_back( "Up" );    
        directions.push_back( "Down" );    
    }

    public virtual function accept( str : String ) : bool
    {
        if( !super.accept(str) )
            return false;
        
        var tokens = split( str ); 
        for( var direction in directions )
            if( direction.equals( tokens[ 0 ] ) )
                return true;

        return false;
    }

    public virtual function execute( str : String, client : Domain ) : void
    {
        
    }
}

interface Command
{
    public function accept( str : String ) : bool;
    public function execute( client : Domain ) : void; 
}

class DefaultCmd implements Command
{
    public virtual function accept( str : String ) : bool
    {
        return false;    
    }

    public virtual function execute( client : Domain ) : void
    {
        // do nothing    
    }
}


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

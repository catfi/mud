// use atomic to simulate mutex
class Mutex
{
    private var mAvailableLock : int32; // atomic doesn't support bool type

    public function new()
    {
        mAvailableLock = 1;
    }

    public function tryLock() : bool
    {
        var isGetLock : bool = false;
        atomic ()
        {
            if ( mAvailableLock == 1 )
            {
                mAvailableLock = 0;
                isGetLock = true;
            }
        }
        /*
        if ( isGetLock )
        {
            print( "someone get lock!\n" );
        }
        */
        return isGetLock;
    }

    public function release()
    {
        atomic ()
        {
            mAvailableLock = 1;
        }
        //print( "someone release lock!\n" );
    }
}

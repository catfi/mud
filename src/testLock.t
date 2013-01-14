import .= thor.container;
import .= thor.util;

var foo : Array<int32>;
const foosize : int32 = 1000;

var gMutex : TestMutex = new TestMutex;
var ok : int32 = 0;

var getlock : int32 = 0;
var maxGetLock : int32 = 0;

class TestMutex
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
                ++getlock;
                isGetLock = true;
            }
        }
        if ( isGetLock )
        {
            print( "someone get lock!\n" );
        }
        return isGetLock;
    }

    public function release()
    {
        atomic ()
        {
            mAvailableLock = 1;
            //--getlock;
        }
        print( "someone release lock!\n" );
    }
}

@entry
function mutex_test() : int32
{
    foo = new Array<int32>(foosize);
    for ( var r : int32 = 0; r < foosize; ++r )
    {
        foo.set( r, 0 );
    }
    for ( var r : int32 = 0; r < foosize; ++r )
    {
        @async occupyone( r );
    }

    daemonize();

    return 0;
}

function occupyone(r:int32) : void
{
    print( "r=\{r}\n" );
    occupyPos(r);
}

function occupyPos( num:int32)
{
    /*
     * We must use a lock for each object move or create event
     * When a async event want to move/create player/mob,
     * the handler must get the lock and set it to false.
     */
    var randGen : Random<int32, Uniform> = new Random<int32, Uniform>( 0, foosize-1 );
    while ( true )
    {
        if ( gMutex.tryLock() )
        {
            if ( getlock > maxGetLock ) maxGetLock = getlock;
            while ( true )
            {
                var rand_index : int32 = randGen.next();
                if ( foo[rand_index] == 0 )
                {
                    foo[rand_index] = num;
                    print( "rand_index=\{rand_index}\n" );
                    ++ok;
                    if ( ok == foosize )
                    {
                        checkResult();
                    }
                    gMutex.release();
                    return;
                }
            }
        }
    }
}

function checkResult()
{
    print( "check result\n" );
    for ( var i : int32 = 0; i < foosize; ++i )
    {
        var isExist = false;
        for ( var j : int32 = 0; j < foosize; ++j )
        {
            if ( i == foo[j] )
            {
                isExist = true;
                break;
            }
        }
        if ( !isExist )
        {
            var e : int32 = foo[i];
            print( " e=\{e}\n" );
        }
    }
    print( " maxGetLock=\{maxGetLock}\n" );
}

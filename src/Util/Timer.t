import thor.container;

// lambda workaround, we don't remove timer from the HashMap
var gIdToTimer : thor.container.HashMap<int64, Timer> = new thor.container.HashMap<int64, Timer>;
var gTimerId : int64 = 0;

class Timer
{
    private var mCallback : lambda():void;
    private var mMSec : int32;
    private var mShotCount : int32; // -1 will be forever loop
    private var mStopFlag : bool;
    private var mIsRunning : bool;
    private static const sSleepUnit : int32 = 10; // msec

    // lambda workaround
    private var mId : int64;

    private function new( shotCount : int32, ms : int32, callback : lambda():void ) : void
    {
        // user specify data member
        mShotCount = shotCount;
        mMSec = ms;
        mCallback = callback;

        // inner data member
        mStopFlag = false;
        mIsRunning = false;
        mId = gTimerId;

        // increase work around timer id
        ++gTimerId;
    }

    public static function loop( ms : int32, callback : lambda():void, count : int32 = -1 ) : Timer
    {
        var timer : Timer = new Timer( count, ms, callback );
        gIdToTimer.set( timer.mId ,timer );
        return timer;
    }

    public static function oneShot( ms : int32, callback : lambda():void ) : Timer
    {
        return loop( ms, callback, 1 );
    }

    public function start()
    {
        if ( !mIsRunning )
        {
            @async startWorkaround( mId );
        }
    }

    public function stop()
    {
        mStopFlag = true;
    }

    private static function startWorkaround( id : int64 )
    {
        var timer = gIdToTimer.get( id );
        timer.mIsRunning = true;
        timer.mStopFlag = false;
        if ( timer.mShotCount == -1 )
        {
            while ( true )
            {
                sleepWorkaround( id, timer.mMSec );
                if ( timer.mStopFlag ) break;
                @async executeCallback( id );
            }
        }
        else
        {
            for ( var i : int32 = 0; i < timer.mShotCount; ++i )
            {
                sleepWorkaround( id, timer.mMSec );
                if ( timer.mStopFlag ) break;
                @async executeCallback( id );
            }
            timer.mIsRunning = false;
        }
    }

    private static function executeCallback( id : int64 )
    {
        var timer = gIdToTimer.get( id );
        timer.mCallback();
    }

    private static function sleepWorkaround( id : int64, ms:int32 )
    {
        // we must use for-loop to force insert escape point
        var timer = gIdToTimer.get( id );
        for ( var i : int32 = 0; i < ms / sSleepUnit; ++i )
        {
            if ( timer.mStopFlag ) break;
            sleep_for_msec( sSleepUnit );
        }
    }

    private function isEqual( timer : Timer )
    {
        return mId == timer.mId;
    }
}

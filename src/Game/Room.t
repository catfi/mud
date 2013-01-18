import thor.container;

import Common;
import Util;

class Room
{
    // the coordinate of this room
    public var mPos : Point;

    // objects in this room
    public var mPlayers : thor.container.Vector<PlayerInfo> = new thor.container.Vector<PlayerInfo>;
    public var mMobs : thor.container.Vector<Mob> = new thor.container.Vector<Mob>;

    // next door rooms of this room
    public var mNorth : Room;
    public var mSouth : Room;
    public var mEast : Room;
    public var mWest : Room;

    public function new( pos : Point ) : void
    {
        mPos = pos;
    }

    public function setNextDoors( north : Room,
                                  south : Room,
                                  east : Room,
                                  west : Room ) : void
    {
        mNorth = north;
        if ( north != null )
            north.mSouth = this;

        mSouth = south;
        if ( south != null )
            south.mNorth = this;

        mEast = east;
        if ( east != null )
            east.mWest = this;

        mWest = west;
        if ( west != null )
            west.mEast = this;
    }

    public function enter( living : Living ) : void
    // does not check whether the living already in this room or not
    {
        // update living's state, all livings in the same room share a extinct position object
        living.position = mPos;
        living.mRoom = this;

        if ( isa<PlayerInfo>(living) )
        {
            var player = cast<PlayerInfo>(living);
            mPlayers.push_back( player );
            Common.pushEvent( new Common.PlayerEnterRoomEvent(player, this) );
        }
        else if ( isa<Mob>(living) )
        {
            var mob = cast<Mob>(living);
            mMobs.push_back( mob );
            Common.pushEvent( new Common.MobEnterRoomEvent(mob, this) );
        }
    }

    public function leave( living : Living ) : void
    {
        living.position = null;
        living.mRoom = null;

        remove( living );
    }

    public function remove( living : Living ) : void
    {
        if ( isa<PlayerInfo>(living) )
        {
            Util.remove( mPlayers, living );
        }
        else if ( isa<Mob>(living) )
        {
            Util.remove( mMobs, living );
        }
    }

    public function hasPlayers() : bool
    {
        return mPlayers.size() != 0;
    }

    public function hasMobs() : bool
    {
        return mMobs.size() != 0;
    }
}

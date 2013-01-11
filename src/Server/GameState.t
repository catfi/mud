import .= thor.container;
import .= thor.util;

import .= Util;
import .= Game;

class GameState
{
    public var mPlayerCount : int32 = 0;

    public var mMobCount : int32 = 0;

    public var rooms : Array2D<Game.Room> = new Array2D<Game.Room>( MAP_ROW_LIMIT, MAP_COLUMN_LIMIT );
    // player information
    public var mPlayers : Vector< PlayerInfo > = new Vector< PlayerInfo >;

    // mob information
    public var mMobs : Vector< ObjectInfo > = new Vector< ObjectInfo >;

    // all objects
    public var mAllObjects : Vector< ObjectInfo > = new Vector< ObjectInfo >;

    public function new() : void
    {
        for ( var row = 0; row < MAP_ROW_LIMIT; ++row )
        {
            for ( var col = 0; col < MAP_COLUMN_LIMIT; ++col )
            {
                rooms.set( row, col, new Room( new Point(row, col) ) );
                rooms.get( row, col ).setNextDoors( null, null, null, null );
            }
        }

        for ( var row = 1; row < MAP_ROW_LIMIT-1; ++row )
        {
            for ( var col = 1; col < MAP_COLUMN_LIMIT-1; ++col )
            {
                rooms.get( row, col ).setNextDoors( rooms.get(row-1, col),
                                                    rooms.get(row+1, col),
                                                    rooms.get(row, col+1),
                                                    rooms.get(row, col-1) );
            }
        }
    }

    public function players() : Vector< PlayerInfo >
    {
        var players = new Vector< PlayerInfo >;

        for ( var object in mAllObjects )
        {
            if( isa<PlayerInfo>( object ) )
                players.push_back( cast<PlayerInfo>(object) );
        }

        return players;
    }

    public function mobs() : Vector< Mob >
    {
        var mobs = new Vector< Mob >;

        for ( var object in mAllObjects )
        {
            if( isa<Mob>( object ) )
                mobs.push_back( cast<Mob>(object) );
        }

        return mobs;
    }

    public function add( object : ObjectInfo ) : void
    {
        if( isa<PlayerInfo>( object ) )
            ++mPlayerCount;
        else if( isa<Mob>( object ) )
            ++mMobCount;

        mAllObjects.push_back( object );
    }

    public function remove( object : ObjectInfo ) : void
    {
        // find obejct in all players
        var found : int32 = -1;
        for ( var idx : int32 = 0; idx != mPlayers.size(); ++idx )
        {
            if ( object.id == mPlayers[ idx ].id )
                found = idx;
        }

        if ( found != -1 )
        {
            for( var idx : int32 = found + 1; idx != mPlayers.size(); ++idx )
                mPlayers[ idx - 1 ] = mPlayers[ idx ];

            mPlayers.pop_back();
        }

        // find object in all mobs
        found = -1;
        for ( var idx : int32 = 0; idx != mMobs.size(); ++idx )
        {
            if ( object.id == mMobs[ idx ].id )
                found = idx;
        }

        if ( found != -1 )
        {
            for( var idx : int32 = found + 1; idx != mMobs.size(); ++idx )
                mMobs[ idx - 1 ] = mMobs[ idx ];

            mMobs.pop_back();
        }

        // find object in all objects collection
        found = -1;
        for ( var idx : int32 = 0; idx != mAllObjects.size(); ++idx )
        {
            if ( object.id == mAllObjects[ idx ].id )
                found = idx;
        }

        if ( found != -1 )
        {
            for( var idx : int32 = found + 1; idx != mAllObjects.size(); ++idx )
                mAllObjects[ idx - 1 ] = mAllObjects[ idx ];

            mAllObjects.pop_back();
        }
    }
}

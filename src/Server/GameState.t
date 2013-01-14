import .= thor.container;
import .= thor.util;

import .= Util;
import .= Game;

class GameState
{
    public var mPlayerCount : int32 = 0;

    public var mMobCount : int32 = 0;

    public var roomArea : Array2D<Game.Room> = new Array2D<Game.Room>( MAP_ROW_LIMIT+2, MAP_COLUMN_LIMIT+2 );

    // player information
    public var mPlayers : Vector< PlayerInfo > = new Vector< PlayerInfo >;

    // mob information
    public var mMobs : Vector< ObjectInfo > = new Vector< ObjectInfo >;

    // all objects
    public var mAllObjects : Vector< ObjectInfo > = new Vector< ObjectInfo >;

    public function new() : void
    {
        // initialize each blocks to null
        for ( var realRow : int32 = 0; realRow < MAP_ROW_LIMIT+2; ++realRow )
        {
            for ( var realCol : int32 = 0; realCol < MAP_COLUMN_LIMIT+2; ++realCol )
            {
                roomArea.set( realRow, realCol, null );
            }
        }

        // new rooms in areas except borders
        for ( var realRow : int32 = 1; realRow < MAP_ROW_LIMIT+1; ++realRow )
        {
            for ( var realCol : int32 = 1; realCol < MAP_COLUMN_LIMIT+1; ++realCol )
            {
                roomArea.set( realRow, realCol,
                              new Game.Room( new Point(realRow-1, realCol-1) ) );
            }
        }

        // set rooms to associate with their neighbors
        for ( var realRow : int32 = 1; realRow < MAP_ROW_LIMIT+1; ++realRow )
        {
            for ( var realCol : int32 = 1; realCol < MAP_COLUMN_LIMIT+1; ++realCol )
            {
                roomArea.get( realRow, realCol ).setNextDoors( roomArea.get(realRow-1, realCol),
                                                               roomArea.get(realRow+1, realCol),
                                                               roomArea.get(realRow, realCol+1),
                                                               roomArea.get(realRow, realCol-1) );
            }
        }
    }

    public function roomAt( row : int32, col : int32 ) : Game.Room
    {
        return roomArea.get( row + 1, col + 1 );
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

    public function randomPos() : Game.Point
    {
        var rowGen : Random<int32, Uniform> = new Random<int32, Uniform>( 0, MAP_ROW_LIMIT-1 );
        var colGen : Random<int32, Uniform> = new Random<int32, Uniform>( 0, MAP_COLUMN_LIMIT-1 );

        var row = 0;
        do {
            row = rowGen.next();
        } while ( !(0 <= row && row < MAP_ROW_LIMIT) );

        var col = 0;
        do {
            col = colGen.next();
        } while ( !(0 <= col && col < MAP_COLUMN_LIMIT) );

        return new Game.Point( row, col );
    }

    public function add( living : Living ) : void
    {
        if ( isa<PlayerInfo>( living ) )
            ++mPlayerCount;
        else if( isa<Mob>( living ) )
            ++mMobCount;

        var pos = randomPos();
        roomAt( pos.row, pos.col ).enter( living );

        mAllObjects.push_back( living );
    }

    public function remove( target : PlayerInfo ) : void
    {
        var found : int32 = -1;

        for ( var idx = 0; idx != mAllObjects.size(); ++idx )
        {
            var object = mAllObjects[ idx ];

            if ( isa<PlayerInfo>(object) )
            {
                var player = cast<PlayerInfo>(object);
                if ( player.id == target.id )
                {
                    found = idx;
                    break;
                }
            }
        }

        if ( found != -1 )
        {
            for( var idx : int32 = found + 1; idx != mAllObjects.size(); ++idx )
                mAllObjects[ idx - 1 ] = mAllObjects[ idx ];

            mAllObjects.pop_back();
        }
    }

    public function remove( target : Mob ) : void
    {
        var found : int32 = -1;

        for ( var idx = 0; idx != mAllObjects.size(); ++idx )
        {
            var object = mAllObjects[ idx ];

            if ( isa<Mob>(object) )
            {
                var mob = cast<Mob>(object);
                if ( mob.id == target.id )
                {
                    found = idx;
                    break;
                }
            }
        }

        if ( found != -1 )
        {
            for( var idx : int32 = found + 1; idx != mAllObjects.size(); ++idx )
                mAllObjects[ idx - 1 ] = mAllObjects[ idx ];

            mAllObjects.pop_back();
        }
    }
}

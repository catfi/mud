import .= thor.lang;
import .= thor.container;
import .= Game;
import .= util;

class ClientGame
{
    private var myName : String;
    private var map : GameMap;
    private var position : Point;
    private var other_players_position : Vector<Point>;
    private var progress : int32;

    // work around for enum type
    public static const INIT : int32 = 0;
    public static const INPUT_LOOP : int32 = 1;

    // client should download map first, so server don't send map to client
    public function new( name : String ) : void
    {
        myName = name;
        position = new Point(-1,-1);
        init();
    }

    public function new( client_pos:Point ) : void
    {
        position = client_pos;
        init();
    }

    private function init() : void
    {
        map = new GameMap(12,25);
        other_players_position = new Vector<Point>();
        progress = ClientGame.INIT;
    }

    public function update_position( aPoint:Point ) : void
    {
        position = aPoint;
    }

    public function getMyName() : String
    {
        return myName;
    }

    public function get_progress() : int32
    {
        return progress;
    }

    public function set_progress( x:int32 )
    {
        progress = x;
    }

    public function showMap() : void
    {
        // top horizontal line
        for( var col : int32 = 0; col <= map.width() + 1; ++col )
            print( "-" );
        print( "\n" );

        // print map
        for( var row : int32 = 0; row != map.height(); ++row )
        {
            print( "|" );
            for( var col : int32 = 0; col != map.width(); ++col )
            {
                var mapPoint : Point = new Point( row, col );
                if ( isAtMyPos( mapPoint ) )
                    print( "@" );
                else if ( isAtOtherPlayerPos( mapPoint ) )
                    print( "#" );
                else
                    print( " " );
            }
            print( "|\n" );
        }

        // bottom horizontal line
        for( var col : int32 = 0; col <= map.width() + 1; ++col )
            print( "-" );
        print( "\n" );
    }

    public function showAllMapInfo( aPlayerInfo : Vector<ObjectInfo> ) : void
    {
        var mapString : Vector<IndexableString> = mapStringRendering( aPlayerInfo );
        var playerString : Vector<IndexableString> = playerStringRendering( aPlayerInfo );
        // assert mapString.size == playerString.size
        for ( var i : int32 = 0; i < mapString.size(); ++i )
        {
            print( mapString[i] );
            print( "   " );
            print( playerString[i] );
            print( "\n" );
        }
    }

    private function mapStringRendering( aPlayerInfo : Vector<ObjectInfo> ) : Vector<IndexableString>
    {
        var mapString : Vector<IndexableString> = new Vector<IndexableString>;
        const ROW_COUNT : int32 = map.height() + 2; // +2 for top & bottom horizontal lines
        for( var i : int32 = 0; i < ROW_COUNT; ++i )
            mapString.push_back( new IndexableString() );

        // fill player token in the tempMap
        var tempMap : GameMap = new GameMap(map.height(),map.width());
        for( var i : int32 = 0; i < aPlayerInfo.size(); ++i )
        {
            var r : int32 = aPlayerInfo[i].position.row;
            var c : int32 = aPlayerInfo[i].position.col;
            tempMap.set( r, c, 97 + aPlayerInfo[i].id ); // 97 is 'a' ascii
            if ( aPlayerInfo[i].name.isEqual( myName ) )
            {
                tempMap.set( r, c, 64 ); // 64 is '@' ascii
            }
        }

        // top horizontal line
        for( var col : int32 = 0; col <= tempMap.width() + 1; ++col )
            mapString[0].concate( "-" );

        // map
        for( var row : int32 = 0; row != tempMap.height(); ++row )
        {
            mapString[row+1].concate( "|" );
            for( var col : int32 = 0; col != tempMap.width(); ++col )
            {
                var gridValue : int32 = tempMap.get( row, col );
                if ( gridValue != 0 )
                {
                    mapString[row+1].addAscii( gridValue );
                }
                else
                {
                    mapString[row+1].concate( " " );
                }
            }
            mapString[row+1].concate( "|" );
        }

        // bottom horizontal line
        for( var col : int32 = 0; col <= tempMap.width() + 1; ++col )
            mapString[ROW_COUNT - 1].concate( "-" );

        return mapString;
    }

    private function playerStringRendering( aPlayerInfo : Vector<ObjectInfo> ) : Vector<IndexableString>
    {
        var playerString : Vector<IndexableString> = new Vector<IndexableString>;
        const ROW_COUNT : int32 = map.height() + 2; // +2 for top & bottom horizontal lines
        const COLUMN_WIDTH : int32 = 18;
        for( var i : int32 = 0; i < ROW_COUNT; ++i )
            playerString.push_back( new IndexableString() );
        var posToShow : int32 = 0;
        for( var i : int32 = 0; i < aPlayerInfo.size(); ++i )
        {
            var row : int32 = posToShow % ROW_COUNT;
            var col : int32 = posToShow / ROW_COUNT;

            // not show self
            if ( aPlayerInfo[i].name.isEqual( myName ) )
                continue;
            ++posToShow;

            // assert name's length <= 15
            playerString[row].addAscii( 97 + aPlayerInfo[i].id ); // 97 is 'a' ascii
            playerString[row].concate( "." );
            playerString[row].concate( aPlayerInfo[i].name );
            var spaceNeeded : int32 = COLUMN_WIDTH * ( col + 1 ) - playerString[row].length();
            for ( var j : int32 = 0; j < spaceNeeded; ++j )
                playerString[row].concate( " " );
        }
        return playerString;
    }

    private function isAtMyPos( aPoint:Point ) : bool
    {
        return aPoint.isEqual( position );
    }

    private function isAtOtherPlayerPos( aPoint:Point ) : bool
    {
        for ( var i : int32 = 0; i < other_players_position.size(); ++i )
        {
            if ( aPoint.isEqual( other_players_position[i] ) )
                return true;
        }
        return false;
    }
}

import .= thor.lang;
import .= thor.container;

import .= Game;
import .= Util;

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

    public function showMap( objectInfo : Vector<ObjectInfo> ) : void
    {
        var canvas = new Canvas( map.height() + 2, 75 );

        // draw map border
        canvas.drawHVLine( new Point( 0, 0 ), new Point( 0, map.width() + 2 ), "-" );
        canvas.drawHVLine( new Point( map.height() + 1, 0 ), new Point( map.height() + 1, map.width() + 2 ), "-" );
        canvas.drawHVLine( new Point( 1, 0 ), new Point( map.height(), 0 ), "|" );
        canvas.drawHVLine( new Point( 1, map.width() + 2 ), new Point( map.height(), map.width() + 2 ), "|" );

        // draw player token in map
        for( var i : int32 = 0; i < objectInfo.size(); ++i )
        {
            var r : int32 = objectInfo[i].position.row + 1;
            var c : int32 = objectInfo[i].position.col + 1;
            var pos : Point = new Point( r, c );
            if ( objectInfo[i].name.isEqual( myName ) )
            {
                canvas.draw( pos, "@" );
            }
            else
            {
                var token : IndexableString = new IndexableString();
                token.addAscii( 97 + objectInfo[i].id ); // 97 is 'a' ascii
                canvas.draw( pos, token );
            }
        }

        // draw player info
        var showedObjectCount : int32 = 0;
        const ROW_COUNT : int32 = map.height() + 2; // +2 for border
        const COL_WIDTH : int32 = 18;
        const GAP : int32 = 3;
        for( var i : int32 = 0; i < objectInfo.size(); ++i )
        {
            if ( !objectInfo[i].name.isEqual( myName ) )
            {
                var r : int32 = showedObjectCount % ROW_COUNT;
                var c : int32 = showedObjectCount / ROW_COUNT;

                var pos : Point = new Point( r, map.width() + 2 + GAP + c * COL_WIDTH );
                var token : IndexableString = new IndexableString();
                token.addAscii( 97 + objectInfo[i].id ); // 97 is 'a' ascii
                token.concate( "." );
                token.concate( objectInfo[i].name );
                canvas.draw( pos, token );

                ++showedObjectCount;
            }
        }

        canvas.show();
    }
}

import .= thor.lang;
import .= thor.container;
import .= Util;
import .= Game;
import Game;

class CommandHandler
{
    public static function execute( msg : String )
    {
        // massage of show map
        var mapHeader : int32 = msg.indexOf( "map:" );
        if( mapHeader != -1 )
        {
            var mapObjectInfo : Vector<ObjectInfo> = VectorConverter.fromString( msg.substring(mapHeader+4) );
            showMap( mapObjectInfo );
        }
    }

    private static function showMap( objectInfo : Vector<ObjectInfo> ) : void
    {
        var myName : String = gClientGame.getMyName();
        var canvas = new Canvas( Game.MAP_ROW_LIMIT + 2, 140 );

        // draw map border
        canvas.drawHVLine( new Point( 0, 0 ), new Point( 0, Game.MAP_COLUMN_LIMIT + 2 ), "-" );
        canvas.drawHVLine( new Point( Game.MAP_ROW_LIMIT + 1, 0 ), new Point( Game.MAP_ROW_LIMIT + 1, Game.MAP_COLUMN_LIMIT + 2 ), "-" );
        canvas.drawHVLine( new Point( 1, 0 ), new Point( Game.MAP_ROW_LIMIT, 0 ), "|" );
        canvas.drawHVLine( new Point( 1, Game.MAP_COLUMN_LIMIT + 2 ), new Point( Game.MAP_ROW_LIMIT, Game.MAP_COLUMN_LIMIT + 2 ), "|" );

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
        const ROW_COUNT : int32 = Game.MAP_ROW_LIMIT + 2; // +2 for border
        const COL_WIDTH : int32 = 18;
        const GAP : int32 = 3;
        for( var i : int32 = 0; i < objectInfo.size(); ++i )
        {
            if ( !objectInfo[i].name.isEqual( myName ) )
            {
                var r : int32 = showedObjectCount % ROW_COUNT;
                var c : int32 = showedObjectCount / ROW_COUNT;

                var pos : Point = new Point( r, Game.MAP_COLUMN_LIMIT + 2 + GAP + c * COL_WIDTH );
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

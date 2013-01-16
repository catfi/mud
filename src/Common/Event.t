import thor.container;
import thor.math;

import Game;
import Util;
import Server;
import Client;

// event base
class Event
{ }

// event listener base
class EventListener
{
    public virtual function performed( event : Event ) : void
    {
        print( "EventListener.performed" );
    }
}

var gEventQueue : thor.container.Vector<Event> = new thor.container.Vector<Event>;
var gEventQueueMutex : Util.Mutex = new Util.Mutex;

// event type codes
var EVENT_MOVE : int32 = 0;

var gMoveEventListeners : thor.container.Vector<EventListener> = new thor.container.Vector<EventListener>;

// public interface for each sub-systems
function pushEvent( event : Event ) : void
{
    while ( true )
    {
        if ( gEventQueueMutex.tryLock() )
        {
            gEventQueue.push_back( event );
            gEventQueueMutex.release();
            break;
        }
    }
}

function addEventListener( eventType : int32, listener : EventListener ) : void
{
    if ( eventType == EVENT_MOVE )
    {
        gMoveEventListeners.push_back( listener );
    }
    else
    {
        print ( "ERROR! unknown event type\n" );
    }
}

var gEventDispatcher : Util.Timer = null;

// internal code to consume events in queue
function dispatchEvents() : void
{
    while ( gEventQueue.size() != 0 )
    {
        // pop out the last event
        var last : int64 = gEventQueue.size() - 1;
        var event : Event = gEventQueue.get( last );
        gEventQueue.pop_back();

        if ( isa<MoveEvent>(event) )
        {
            for( var listener in gMoveEventListeners )
                listener.performed( event );
        }
        else if ( isa<ExitEvent>(event) )
        {
            var listener : ExitEventListener = new ExitEventListener;
            listener.performed( event );
        }
        else if ( isa<GenerateMobEvent>(event) )
        {
            var listener : EventListener = new GenerateMobEventListener;
            listener.performed( event );
        }
        else if ( isa<SayEvent>(event) )
        {
            var listener : EventListener = new SayEventListener;
            listener.performed( event );
        }
        else if ( isa<MobEnterRoomEvent>(event) )
        {
            var listener : EventListener = new MobEnterRoomEventListener;
            listener.performed( event );
        }
        else if ( isa<PlayerAttackEvent>(event) )
        {
            var listener : EventListener = new PlayerAttackEventListener;
            listener.performed( event );
        }
        else if ( isa<MobAttackEvent>(event) )
        {
            var listener : EventListener = new MobAttackEventListener;
            listener.performed( event );
        }
        else if ( isa<PlayerDeadEvent>(event) )
        {
            var listener : EventListener = new PlayerDeadEventListener;
            listener.performed( event );
        }
        else if ( isa<PlayerRebirthEvent>(event) )
        {
            var listener : EventListener = new PlayerRebirthEventListener;
            listener.performed( event );
        }
        else
        {
            print( "ERROR! unknown event type\n" );
            return;
        }
    }
}

// real event types
class MoveEvent extends Event
{
    public var mLiving : Game.Living;
    public var mOffset : Game.Point;
    public var mDirection : int32;

    public static var NORTH : int32 = 1;
    public static var WEST : int32 = 2;
    public static var SOUTH : int32 = 3;
    public static var EAST : int32 = 4;

    public function new( living : Game.Living,
                         offset : Game.Point )
    {
        mLiving = living;
        mOffset = offset;
    }

    public function new( living : Game.Living,
                         direction : int32 )
    {
        mLiving = living;
        mDirection = direction;
    }
}

class ExitEvent extends Event
{
    public var mPlayer : Game.PlayerInfo;

    public function new( player : Game.PlayerInfo )
    {
        mPlayer = player;
    }
}

class SayEvent extends Event
{
    public var mPlayer : Game.PlayerInfo;
    public var mMsg : String;

    public function new( player : Game.PlayerInfo, msg : String )
    {
        mPlayer = player;
        mMsg = msg;
    }
}

class AttackEvent extends Event
{
    public var mSource : Game.Living;
    public var mTarget : Game.Living;

    public function new( source : Game.Living, target : Game.Living ) : void
    {
        mSource = source;
        mTarget = target;
    }
}

class GenerateMobEvent extends Event
{
    public var mCount : int32;

    public function new( count: int32 ) : void
    {
        mCount = count;
    }
}

class MobEnterRoomEvent extends Event
{
    public var mMob : Game.Mob;
    public var mRoom : Game.Room;

    public function new( mob : Game.Mob,
                         room : Game.Room ) : void
    {
        mMob = mob;
        mRoom = room;
    }
}

class PlayerAttackEvent extends Event
{
    public var mPlayer : Game.PlayerInfo;
    public var mMobId : int32;

    public function new( player : Game.PlayerInfo,
                         mobId : int32 ) : void
    {
        mPlayer = player;
        mMobId = mobId;
    }
}

class MobAttackEvent extends Event
{
    public var mMob : Game.Mob;
    public var mPlayer : Game.PlayerInfo;

    public function new( mob : Game.Mob,
                         player : Game.PlayerInfo ) : void
    {
        mMob = mob;
        mPlayer = player;
    }
}

class PlayerDeadEvent extends Event
{

    public var mPlayer : Game.PlayerInfo;

    public function new( player : Game.PlayerInfo ) : void
    {
        mPlayer = player;
    }
}

class PlayerRebirthEvent extends Event
{
    public var mPlayer : Game.PlayerInfo;

    public function new( player : Game.PlayerInfo ) : void
    {
        mPlayer = player;
    }
}

// real listeners
class ExitEventListener// extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        var exitEvent : ExitEvent = cast<ExitEvent>(event);

        var player : Game.PlayerInfo = exitEvent.mPlayer;
        var domain : Domain = Server.ConnectionSystem.sPlayerDomainTable.get( player );

        // remove player and mapped domain in connection system
        Server.ConnectionSystem.sDomainPlayerTable.remove( domain );
        Server.ConnectionSystem.sPlayerDomainTable.remove( player );

        // remove player object from game
        Server.gGameState.remove( player );
    }
}

class GenerateMobEventListener extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        var generateMobEvent : GenerateMobEvent = cast<GenerateMobEvent>(event);
        for ( var i = 0; i < generateMobEvent.mCount; ++i )
        {
            var mob = Game.MobGenerator.gen();
            Server.ObjectSystem.addMob( mob );
        }
    }
}

class SayEventListener extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        var sayEvent : SayEvent = cast<SayEvent>( event );

        print( "broadcast: \"" + sayEvent.mMsg + "\"\n" );
        Server.ConnectionSystem.broadcast( sayEvent.mPlayer.name + " says: " + sayEvent.mMsg );
    }
}

class MoveEventListener extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        var moveEvent = cast<MoveEvent>( event );
        var living = moveEvent.mLiving;

        // if there any players in room, then mob don't leave
        if ( isa<Game.Mob>(living) && living.mRoom.hasPlayers() )
            return;

        // if mob is nearby a player, don't move
        //if ( isa<Game.Mob>( moveEvent.mLiving ) )
        //{
        //    var players = Server.gGameState.players();
        //    for ( var p in players )
        //    {
        //        var dist = thor.math.fabs(moveEvent.mLiving.position.row - p.position.row) +
        //                   thor.math.fabs(moveEvent.mLiving.position.col - p.position.col);

        //        if ( dist < 2.0 )
        //            return;
        //    }
        //}

        var successful : bool = Server.ObjectSystem.move(living, moveEvent.mDirection);
        if ( isa<Game.Mob>( living ) )
            return;

        var player = cast<Game.PlayerInfo>( living );
        if ( !successful )
        {
            Server.ConnectionSystem.send( player, "invalid move" );
            //Server.ConnectionSystem.send( player, "\n" + Server.ObjectSystem.getMapString( player ) );
        }
    }
}

class MobEnterRoomEventListener extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        var e = cast<MobEnterRoomEvent>( event );

        var mob = e.mMob;
        var room = e.mRoom;

        for ( var player in room.mPlayers )
        {
            // notify player
            var dest = Server.ConnectionSystem.getDomain( player );
            @remote { domain = dest }
            Client.enterSameRoom( mob.getNameId(), mob.id );
        }
    }
}

class PlayerAttackEventListener extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        var e = cast<PlayerAttackEvent>(event);

        var player = e.mPlayer;
        var room = player.mRoom;
        var mobId = e.mMobId;

        // find mob to attack in room
        var found : Game.Mob = null;
        for ( var mob in room.mMobs )
        {
            if ( mob.id == mobId )
            {
                found = mob;
                break;
            }
        }

        if ( found == null )
            return;

        // update mob's hp
        var displayHp : int32 = ( player.attack > found.life ? 0 : found.life - player.attack );
        found.life = displayHp;

        var dest = Server.ConnectionSystem.getDomain(player);

        @remote { domain = dest }
        Client.attackMobMsg( found.getNameId(), displayHp, player.attack );

        // mob was dead by attack
        if ( displayHp == 0 )
        {
            found.mRoom.leave( found );
            Server.gGameState.remove( found );
        }
    }
}

class MobAttackEventListener extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        var e = cast<MobAttackEvent>(event);

        var player = e.mPlayer;
        var mob = e.mMob;

        // update mob's hp
        var displayHp : int32 = ( mob.attack > player.life ? 0 : player.life - mob.attack );
        player.life = displayHp;

        var dest = Server.ConnectionSystem.getDomain(player);

        @remote { domain = dest }
        Client.attackedByMobMsg( mob.getNameId(), displayHp, mob.attack );

        // player was dead
        if ( displayHp == 0 )
            pushEvent( new PlayerDeadEvent(player) );
    }
}

class PlayerDeadEventListener extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        print( "player dead\n" );
        var e = cast<PlayerDeadEvent>(event);

        var player = e.mPlayer;
        var room = player.mRoom;

        room.leave( player );
        Server.gGameState.remove( player );

        var rebirthIssuer = Util.Timer.oneShot( 5000,
                                                lambda() : void {
                                                    pushEvent( new PlayerRebirthEvent(player) );
                                                });
        rebirthIssuer.start();
    }
}

class PlayerRebirthEventListener extends EventListener
{
    public virtual function performed( event : Event ) : void
    {
        print( "player rebirth\n" );

        var e = cast<PlayerRebirthEvent>(event);

        var player = e.mPlayer;

        player.life = 20;
        Server.gGameState.add( player );

        var dest = Server.ConnectionSystem.getDomain(player);
        @remote { domain = dest }
        Client.RebirthMsg();
    }
}

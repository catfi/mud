import thor.container;
import thor.util;

class MobName
{
    private var mString : String;
    private var mId : int32;

    private static var sAllMobName : thor.container.Vector<String> = new thor.container.Vector<String>;
    private static var sGen : thor.util.Random<int32, thor.util.Uniform> = null;

    public function getString() : String
    {
        return mString;
    }

    public function getId() : int32
    {
        return mId;
    }

    public static function gen() : MobName
    {
        if ( sAllMobName.size() == 0 ) init();

        var id : int32 = sGen.next();
        var string : String = sAllMobName.get( id );

        return new MobName( id, string );
    }

    public static function getString( id : int32 ) : String
    {
        if ( sAllMobName.size() == 0 ) init();

        return sAllMobName.get( id );
    }

    public static function isMobName( name : String ) : bool
    {
        for ( var i = 0; i < sAllMobName.size(); ++i )
        {
            if ( sAllMobName.get( i ).isEqual( name ) )
                return true;
        }
        return false;
    }

    private function new( id : int32, string : String )
    {
        mId = id;
        mString = string;
    }

    private static function init()
    {
        // assert( sAllMobName.size() == 0 );
        initMobName();
        sGen = new thor.util.Random<int32, thor.util.Uniform>( 0, cast<int32>(sAllMobName.size()-1) );
    }

    private static function initMobName() : void
    {
        sAllMobName.push_back( "Abiondarg" );
        sAllMobName.push_back( "Alastor" );
        sAllMobName.push_back( "Aliorumnas" );
        sAllMobName.push_back( "Altair" );
        sAllMobName.push_back( "Amduscias" );
        sAllMobName.push_back( "Amphisbaena" );
        sAllMobName.push_back( "Anaconda" );
        sAllMobName.push_back( "Andras" );
        sAllMobName.push_back( "Arabaki" );
        sAllMobName.push_back( "Arachne" );
        sAllMobName.push_back( "Archer" );
        sAllMobName.push_back( "Azaghal" );
        sAllMobName.push_back( "Bael" );
        sAllMobName.push_back( "Balloon" );
        sAllMobName.push_back( "Banshee" );
        sAllMobName.push_back( "Barbariccia" );
        sAllMobName.push_back( "Basilisk" );
        sAllMobName.push_back( "Bats" );
        sAllMobName.push_back( "Beehive" );
        sAllMobName.push_back( "Biphron" );
        sAllMobName.push_back( "Bitterfly" );
        sAllMobName.push_back( "Blade" );
        sAllMobName.push_back( "Buer" );
        sAllMobName.push_back( "Bugbear" );
        sAllMobName.push_back( "Cagnazzo" );
        sAllMobName.push_back( "Catoblepas" );
        sAllMobName.push_back( "Centipod" );
        sAllMobName.push_back( "Cerberus" );
        sAllMobName.push_back( "Chronomage" );
        sAllMobName.push_back( "Cockatrice" );
        sAllMobName.push_back( "Coppelia" );
        sAllMobName.push_back( "Corpseweed" );
        sAllMobName.push_back( "Cthulhu" );
        sAllMobName.push_back( "Curly" );
        sAllMobName.push_back( "Cyclops" );
        sAllMobName.push_back( "Decarabia" );
        sAllMobName.push_back( "Demon" );
        sAllMobName.push_back( "Devil" );
        sAllMobName.push_back( "Dhuron" );
        sAllMobName.push_back( "Diplocephalus" );
        sAllMobName.push_back( "Dodo" );
        sAllMobName.push_back( "Dogether" );
        sAllMobName.push_back( "Dracula" );
        sAllMobName.push_back( "Draghignazzo" );
        sAllMobName.push_back( "Dragonfly" );
        sAllMobName.push_back( "Dryads" );
        sAllMobName.push_back( "Dullahan" );
        sAllMobName.push_back( "Durga" );
        sAllMobName.push_back( "Eagle" );
        sAllMobName.push_back( "Ectoplasm" );
        sAllMobName.push_back( "Efreet" );
        sAllMobName.push_back( "Elgiza" );
        sAllMobName.push_back( "Enkidu" );
        sAllMobName.push_back( "Erinys" );
        sAllMobName.push_back( "Executioner" );
        sAllMobName.push_back( "Fenrir" );
        sAllMobName.push_back( "Fishman" );
        sAllMobName.push_back( "Forneus" );
        sAllMobName.push_back( "Frog" );
        sAllMobName.push_back( "Gaap" );
        sAllMobName.push_back( "Gaibon" );
        sAllMobName.push_back( "Gargoyles" );
        sAllMobName.push_back( "Gelso" );
        sAllMobName.push_back( "Ghosts" );
        sAllMobName.push_back( "Ghouls" );
        sAllMobName.push_back( "Gi-Lee" );
        sAllMobName.push_back( "Gladiator" );
        sAllMobName.push_back( "Golem" );
        sAllMobName.push_back( "Gorgon" );
        sAllMobName.push_back( "Gremlin" );
        sAllMobName.push_back( "Guardian" );
        sAllMobName.push_back( "Guillotiner" );
        sAllMobName.push_back( "Gurkha" );
        sAllMobName.push_back( "Hammer-Hammer" );
        sAllMobName.push_back( "Harpy" );
        sAllMobName.push_back( "Hellhound" );
        sAllMobName.push_back( "Hippogryph" );
        sAllMobName.push_back( "Homunculus" );
        sAllMobName.push_back( "Hunchback" );
        sAllMobName.push_back( "Imp" );
        sAllMobName.push_back( "Jin" );
        sAllMobName.push_back( "Knight" );
        sAllMobName.push_back( "Larva" );
        sAllMobName.push_back( "Laura" );
        sAllMobName.push_back( "Lerajie" );
        sAllMobName.push_back( "Lightkeeper" );
        sAllMobName.push_back( "Lilim" );
        sAllMobName.push_back( "Lilith" );
        sAllMobName.push_back( "Lion" );
        sAllMobName.push_back( "Lossoth" );
        sAllMobName.push_back( "Lubicant" );
        sAllMobName.push_back( "Maggot" );
        sAllMobName.push_back( "Malachi" );
        sAllMobName.push_back( "Malacoda" );
        sAllMobName.push_back( "Malphas" );
        sAllMobName.push_back( "Man-Eater" );
        sAllMobName.push_back( "Mandragora" );
        sAllMobName.push_back( "Manticore" );
        sAllMobName.push_back( "Marionette" );
        sAllMobName.push_back( "Merman" );
        sAllMobName.push_back( "Mimic" );
        sAllMobName.push_back( "Minotaur" );
        sAllMobName.push_back( "Mist" );
        sAllMobName.push_back( "Mollusca" );
        sAllMobName.push_back( "Mothman" );
        sAllMobName.push_back( "Mummies" );
        sAllMobName.push_back( "Mushussu" );
        sAllMobName.push_back( "Necromancer" );
        sAllMobName.push_back( "Needles" );
        sAllMobName.push_back( "Nemesis" );
        sAllMobName.push_back( "Nightmare" );
        sAllMobName.push_back( "Nominon" );
        sAllMobName.push_back( "Nyx" );
        sAllMobName.push_back( "Orc" );
        sAllMobName.push_back( "Orobourous" );
        sAllMobName.push_back( "Owl" );
        sAllMobName.push_back( "Paranthropus" );
        sAllMobName.push_back( "Persephone" );
        sAllMobName.push_back( "Phantom" );
        sAllMobName.push_back( "Pixie" );
        sAllMobName.push_back( "Poltergeist" );
        sAllMobName.push_back( "Procel" );
        sAllMobName.push_back( "Quetzalcoatl" );
        sAllMobName.push_back( "Raven" );
        sAllMobName.push_back( "Ripper" );
        sAllMobName.push_back( "Rycuda" );
        sAllMobName.push_back( "Salomé" );
        sAllMobName.push_back( "Scarecrow" );
        sAllMobName.push_back( "Schmoo" );
        sAllMobName.push_back( "Sirens" );
        sAllMobName.push_back( "Skeledragon" );
        sAllMobName.push_back( "Skelerang" );
        sAllMobName.push_back( "Skeletons" );
        sAllMobName.push_back( "Slaughterer" );
        sAllMobName.push_back( "Slime" );
        sAllMobName.push_back( "Slinger" );
        sAllMobName.push_back( "Slogra" );
        sAllMobName.push_back( "Soulless" );
        sAllMobName.push_back( "Spartacus" );
        sAllMobName.push_back( "Specter" );
        sAllMobName.push_back( "Spine" );
        sAllMobName.push_back( "Spirits" );
        sAllMobName.push_back( "Spriggan" );
        sAllMobName.push_back( "Stolas" );
        sAllMobName.push_back( "Succubus" );
        sAllMobName.push_back( "Sylph" );
        sAllMobName.push_back( "Tanjelly" );
        sAllMobName.push_back( "Thief" );
        sAllMobName.push_back( "Thornweed" );
        sAllMobName.push_back( "Toad" );
        sAllMobName.push_back( "Tombstone" );
        sAllMobName.push_back( "Treant" );
        sAllMobName.push_back( "Triton" );
        sAllMobName.push_back( "Tsuchinoko" );
        sAllMobName.push_back( "Ukoback" );
        sAllMobName.push_back( "Une" );
        sAllMobName.push_back( "Unicorn" );
        sAllMobName.push_back( "Valkyrie" );
        sAllMobName.push_back( "Vampire" );
        sAllMobName.push_back( "Vapula" );
        sAllMobName.push_back( "Vassago" );
        sAllMobName.push_back( "Warg" );
        sAllMobName.push_back( "Werebat" );
        sAllMobName.push_back( "Werecat" );
        sAllMobName.push_back( "Werejaguar" );
        sAllMobName.push_back( "Wereskeleton" );
        sAllMobName.push_back( "Weretiger" );
        sAllMobName.push_back( "Werewolf" );
        sAllMobName.push_back( "Wight" );
        sAllMobName.push_back( "Witches" );
        sAllMobName.push_back( "Wizard" );
        sAllMobName.push_back( "Wraith" );
        sAllMobName.push_back( "Wyrm" );
        sAllMobName.push_back( "Wyvern" );
        sAllMobName.push_back( "Yeti" );
        sAllMobName.push_back( "Yorick" );
        sAllMobName.push_back( "Zacchino" );
        sAllMobName.push_back( "Zombie" );
    }
}


class MobGenerator
{
    private static var id : int32 = 0;

    public static function gen() : Mob
    {
        return new Mob( ++id, MobName.gen() );
    }
}

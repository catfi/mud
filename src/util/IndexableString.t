@native
class IndexableString extends MutableString
{
    @native
    public function new():void;

    @native
    public virtual function delete():void;

    @native
    public function addAscii( a_ascii:int8 ): IndexableString;

    @native
    public function get( index : int32 ) : int64;

    @native
    public function set( index : int32, value : int64 ) : void;
}

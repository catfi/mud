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
    public function getEncodedNumAt( a_index:int32 ): int64;
}

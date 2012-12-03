#!/usr/bin/python

ts_template = """
@native { include="thor/lang/Array.h" }
class Array%dD<T> extends Object implements GarbageCollectable
{
	@native
	private function new():void;
	
	@native
	public function new(%s):void;
	
	@native
	public function get(%s):T;
	
	@native
	public function set(%s, v:T):void;
	
	@native
	public function size(idx : int64):int64;
	
	@native
	private virtual function getContainedObjects(o: CollectableObject) : void;
	
	private var _internal1:int64;

    %s
}

"""

fout = open('arr.t', 'w')

def args(arg_prefix_name, length) :
    result = ''
    for i in range(length) :
        if i != 0 :
            result += ', '
        result += arg_prefix_name + '_' + str(i) + ' : int64'
    return result

def size_member(length) :
    result = ''
    for i in range(length) :
        result += 'private var _size_%d : int64;\n    ' % (i,)
    return result

for i in range(2, 12) :
    t = ts_template % (i, args('size', i), args('idx', i), args('idx', i), size_member(i))
    fout.write(t)

fout.close()

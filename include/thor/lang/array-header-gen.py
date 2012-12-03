#!/usr/bin/python

h_template = """
template<typename T>
class Array%dD : public thor::lang::Object, public thor::lang::GarbageCollectable
{
	typedef typename std::conditional<std::is_class<T>::value, T*, T>::type value_type;

	Array%dD() : _data(NULL)
	{ }

public:
	Array%dD(%s)
	{
        %s
		_data = (value_type*)::malloc(sizeof(value_type)*all_size());
	}

	~Array%dD()
	{
		::free((void*)_data); _data = NULL;
        %s
	}

	value_type get(%s)
	{
        size_t index = calculate_index(%s);
        return _data[index];
	}

	void set(%s, value_type v)
	{
        size_t index = calculate_index(%s);
        _data[index] = v;
	}

    int64 size(int64 idx)
	{
		%s
	}

private:
    size_t calculate_index(%s)
    {
        %s
    }

    size_t all_size()
    {
        return %s;
    }

	virtual void getContainedObjects(thor::lang::CollectableObject* collect_object)
	{
		// Skip if the value_type is primitive
		if (std::is_class<T>::value)
		{
			for(int i=0;i<all_size();++i)
			{
				thor::lang::detail::addObjectToGCHelper<std::is_class<T>::value>::add(collect_object, _data[i]);
			}
		}
	}

	value_type* _data;
    %s
};

"""

def params(arg_prefix_name, length) :
    result = ''
    for i in range(length) :
        if i != 0 :
            result += ', '
        result += 'int64 ' + arg_prefix_name + '_' + str(i)
    return result

def args(pat, length) :
    result = ''
    for i in range(length) :
        if i != 0 :
            result += ', '
        result += pat % (i, )
    return result

def cal_index(length) :
    result = 'size_t result = 0;\n        '
    for i in range(length - 1) :
        result += 'result += idx_%d; result *= _size_%d;\n        ' % (i, i + 1)
    result += 'result += idx_%d;        ' % (length - 1)
    result += 'return result;'
    return result
    
def arr_assign(pat, length) :
    result = ''
    for i in range(length) :
        result += pat % (i, i)
    return result

def return_size(length) :
    result = ''
    for i in range(length) :
        result += 'if (idx == %d) return _size_%d;\n        ' % (i, i)
    return result

def join(pat, deli, length) :
    result = ''
    for i in range(length) :
        if i != 0 :
            result += deli
        result += pat % (i, )
    return result

fout = open('ArrayND.h', 'w')

for i in range(2, 12) :
    t = h_template % (i, # class decl
                      i, # ctor()
                      i, args('int64 size_%d', i), arr_assign('_size_%d = size_%d;\n        ', i), # ctor(...)
                      i, join('_size_%d = 0;', '\n        ', i), # dtor
                      args('int64 idx_%d', i), args('idx_%d', i), # get
                      args('int64 idx_%d', i), args('idx_%d', i), # set
                      return_size(i), # size
                      args('int64 idx_%d', i), cal_index(i), # calculate_index
                      join('_size_%d', ' * ', i), # all_size
                      join('size_t _size_%d;', '\n    ', i) # _size member
                     )
    fout.write(t)

fout.close()

/**
 * Copyright (C) 2008-2012 Zillians, Inc. <http://www.zillians.com/>
 *
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Affero General Public License, version 3,
 * as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * See the GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef THOR_UTIL_COLLECTIONS_H_
#define THOR_UTIL_COLLECTIONS_H_

#include "Thor.h"
#include "thor/lang/Language.h"

#include <algorithm>
#include <iterator>
#include <functional>
#include <memory>
#include <type_traits>

namespace thor { namespace util {

namespace detail {

    template < typename T >
    struct remove_reference_const
    {
        typedef typename std::remove_const<
                             typename std::remove_reference<T>::type
                         >::type type;
    };

    template < typename Collection >
    class collection_traits
    {
        template <typename Element, typename Index>
        static
        typename remove_reference_const<Element>::type
        getter_element( Element (Collection::*)( Index ) );

        template <typename Element, typename Index>
        static
        typename remove_reference_const<Index>::type
        getter_index( Element (Collection::*)( Index ) );

        template <typename Element, typename Index>
        static
        typename remove_reference_const<Element>::type
        setter_element( void (Collection::*)( Index, Element ) );

        template <typename Element, typename Index>
        static
        typename remove_reference_const<Index>::type
        setter_index( void (Collection::*)( Index, Element ) );

        template <typename Size>
        static
        typename remove_reference_const<Size>::type
        size_return( Size (Collection::*)() );

        static_assert( std::is_same< decltype(size_return(&Collection::size)),
                                     decltype(getter_index(&Collection::get))
                                   >::value, "the return types of size() and get() functions are mismatch" );

        static_assert( std::is_same< decltype(getter_index(&Collection::get)),
                                     decltype(setter_index(&Collection::set))
                                   >::value, "the return types of get() and set() functions are mismatch" );

        static_assert( std::is_same< decltype(getter_element(&Collection::get)),
                                     decltype(setter_element(&Collection::set))
                                   >::value, "the element types provide by get() and set() are ambiguous" );

    public:

        typedef decltype( getter_element(&Collection::get) ) element_type;
        typedef decltype( getter_index(&Collection::get) ) index_type;
        typedef index_type size_type;
    };

    template < typename Collection >
    class access_proxy
    {
    public:
        typedef typename collection_traits<Collection>::element_type value_type;
        typedef typename collection_traits<Collection>::index_type size_type;

    private:
        Collection * collection;
        size_type index;

    public:
        access_proxy() = delete;
        access_proxy( access_proxy const & p )
        : collection( p.collection ), index( p.index )
        { }

        access_proxy( Collection * c, size_type i )
        : collection( c ), index( i )
        { }

        operator value_type() const
        {
            return collection->get( index );
        }

        access_proxy &
        operator=( value_type const & value )
        {
            collection->set( index, value );
            return *this;
        }

        access_proxy &
        operator=( access_proxy const & p )
        {
            collection->set( index, (value_type)p );
            return *this;
        }
    };

    template < typename Collection >
    void swap( access_proxy<Collection> lhs, access_proxy<Collection> rhs )
    {
        typedef typename collection_traits<Collection>::element_type Element;

        Element tmp = lhs;
        lhs = rhs;
        rhs = tmp;
    }

    template < typename Collection >
    struct random_access_iterator_adaptor
    {
        typedef typename collection_traits<Collection>::element_type value_type;
        typedef ptrdiff_t difference_type;
        typedef value_type * pointer;
        typedef value_type & reference;
        typedef std::random_access_iterator_tag iterator_category;

        typedef typename collection_traits<Collection>::index_type size_type;

    private:
        Collection * collection;
        size_type index;

    public:
        random_access_iterator_adaptor() : collection( 0 ), index( 0 ) { }
        random_access_iterator_adaptor( random_access_iterator_adaptor const & ) = default;
        random_access_iterator_adaptor( Collection * c, size_type i )
        : collection( c ), index( i )
        { }

        random_access_iterator_adaptor &
        operator+=( difference_type n )
        {
            index += n;

            return *this;
        }

        random_access_iterator_adaptor &
        operator-=( difference_type n )
        {
            return *this += -n;
        }

        random_access_iterator_adaptor
        operator+( difference_type n )
        {
            random_access_iterator_adaptor tmp = (*this);
            tmp += n;
            return tmp;
        }

        random_access_iterator_adaptor
        operator-( difference_type n )
        {
            random_access_iterator_adaptor tmp = (*this);
            tmp -= n;
            return tmp;
        }

        difference_type
        operator-( random_access_iterator_adaptor const & rhs )
        {
            return index - rhs.index;
        }

        access_proxy<Collection>
        operator []( difference_type n )
        {
            return *(*this + n);
        }

        bool
        operator <( random_access_iterator_adaptor const & rhs )
        {
            return index < rhs.index;
        }

        bool
        operator >( random_access_iterator_adaptor const & rhs )
        {
            return index > rhs.index;
        }

        bool
        operator >=( random_access_iterator_adaptor const & rhs )
        {
            return !(*this < rhs);
        }

        bool
        operator <=( random_access_iterator_adaptor const & rhs )
        {
            return !(*this > rhs);
        }

        random_access_iterator_adaptor &
        operator ++()
        {
            ++index;
            return *this;
        }

        random_access_iterator_adaptor
        operator ++(int)
        {
            random_access_iterator_adaptor tmp = *this;
            ++(*this);
            return tmp;
        }

        random_access_iterator_adaptor &
        operator --()
        {
            --index;
            return *this;
        }

        random_access_iterator_adaptor
        operator --(int)
        {
            random_access_iterator_adaptor tmp = *this;
            --(*this);
            return tmp;
        }

        bool
        operator ==( random_access_iterator_adaptor const & rhs )
        {
            return (collection == rhs.collection) && (index == rhs.index);
        }

        bool
        operator !=( random_access_iterator_adaptor const & rhs )
        {
            return !(*this == rhs);
        }

        access_proxy<Collection>
        operator *()
        {
            return access_proxy<Collection>( collection, index );
        }
    };

    struct CollectionsHelper
    {
        template < typename Collection >
        static
        random_access_iterator_adaptor<Collection>
        beginOf( Collection * collection )
        {
            return random_access_iterator_adaptor<Collection>(collection, 0);
        }

        template < typename Collection >
        static
        random_access_iterator_adaptor<Collection>
        endOf( Collection * collection )
        {
            return random_access_iterator_adaptor<Collection>(collection, collection->size());
        }
    };

    template < typename T >
    struct less : std::less<T>
    { };

    template < typename T >
    struct less<T*>
    {
        bool
        operator()( T * lhs, T * rhs )
        {
            return lhs->compareTo( rhs ) < 0;
        }
    };

    template < typename Compare >
    struct less_adaptor
    {
        Compare * const comp;

        less_adaptor( Compare * comp )
        : comp( comp )
        { }

        template < typename T, typename U >
        bool operator()( T lhs, U rhs ) {
            return comp->compare( lhs, rhs ) < 0;
        }
    };

    template < typename T >
    struct equal_to : std::equal_to<T>
    { };

    template < typename T >
    struct equal_to<T*>
    {
        bool
        operator()( T * lhs, T * rhs )
        {
            return lhs->compareTo( rhs ) == 0;
        }
    };

    template < typename ForwardIterator, typename ForwardIterator2, typename Compare >
    void inplace_merge( ForwardIterator first, ForwardIterator middle,
                        ForwardIterator last, ForwardIterator2 buffer, Compare comp )
    {
        using namespace std;

        typename iterator_traits<ForwardIterator2>::difference_type n = distance(first, last);

        ForwardIterator begin = first, second = middle;
        ForwardIterator2 output = buffer;
        while( first != middle && second != last )
        {
            if( comp(*first, *second) )
                *output++ = *first++;
            else if( comp(*second, *first) )
                *output++ = *second++;
            else
                *output++ = *first++;
        }

        while( first != middle ) *output++ = *first++;
        while( second != last ) *output++ = *second++;

        copy( buffer, output, begin );
    }

} // namespace detail

template < typename Collection >
void sort( Collection * collection )
{
    using namespace detail;

    typedef typename collection_traits<Collection>::element_type element_type;

    std::sort( CollectionsHelper::beginOf(collection),
               CollectionsHelper::endOf(collection),
               less<element_type>() );
}

template < typename Collection, typename Compare >
void sort( Collection * collection, Compare * compare )
{
    using namespace detail;

    std::sort( CollectionsHelper::beginOf(collection),
               CollectionsHelper::endOf(collection),
               less_adaptor<Compare>(compare) );
}

template < typename Collection, typename Size >
void partialSort( Collection * collection, Size middle )
{
    using namespace detail;

    typedef typename collection_traits<Collection>::element_type element_type;

    std::partial_sort( CollectionsHelper::beginOf(collection),
                       CollectionsHelper::beginOf(collection) + middle,
                       CollectionsHelper::endOf(collection),
                       less<element_type>() );
}

template < typename Collection, typename Size, typename Compare >
void partialSort( Collection * collection, Size middle, Compare * compare )
{
    using namespace detail;

    std::partial_sort( CollectionsHelper::beginOf(collection),
                       CollectionsHelper::beginOf(collection) + middle,
                       CollectionsHelper::endOf(collection),
                       less_adaptor<Compare>(compare) );
}

template < typename Collection >
bool isAscending( Collection * collection )
{
    using namespace detail;

    auto begin = CollectionsHelper::beginOf(collection),
         end = CollectionsHelper::endOf(collection);

    if( begin == end ) return true;

    typedef typename collection_traits<Collection>::element_type element_type;
    less<element_type> less;

    for( auto previous = begin++; begin != end; )
    {
        if( less(*begin++, *previous++) )
            return false;
    }

    return true;
}

template < typename Collection, typename Compare >
bool isAscending( Collection * collection, Compare * compare )
{
    using namespace detail;

    auto begin = CollectionsHelper::beginOf(collection),
         end = CollectionsHelper::endOf(collection);

    if( begin == end ) return true;

    less_adaptor<Compare> less(compare);

    for( auto previous = begin++; begin != end; )
    {
        if( less(*begin++, *previous++) )
            return false;
    }

    return true;
}

template < typename Collection >
void reverse( Collection * collection )
{
    using namespace detail;

    std::reverse( CollectionsHelper::beginOf(collection),
                  CollectionsHelper::endOf(collection) );
}

template < typename Collection1, typename Collection2 >
void copy( Collection1 * destination, Collection2 * source )
{
    using namespace detail;

    std::copy( CollectionsHelper::beginOf(source),
               CollectionsHelper::endOf(source),
               CollectionsHelper::beginOf(destination) );
}

template < typename Collection >
void stableSort( Collection * collection )
{
    using namespace detail;
    using namespace std;

    typedef typename collection_traits<Collection>::element_type element_type;
    less<element_type> cmp;

    typedef random_access_iterator_adaptor<Collection> Iterator;
    Iterator begin = CollectionsHelper::beginOf(collection),
             end = CollectionsHelper::endOf(collection);

    typedef typename Iterator::value_type value_type;
    typedef typename Iterator::difference_type difference_type;
    typedef typename Iterator::pointer pointer;

    pair< pointer, difference_type > p = get_temporary_buffer<value_type>( distance(begin, end) );

    for( typename Iterator::size_type merge_size = 1; merge_size < collection->size(); merge_size *= 2 )
    {
        Iterator merge_begin, merge_middle, merge_end;
        merge_begin = merge_middle = merge_end = begin;

        while( merge_middle < end )
        {
            advance( merge_middle, merge_size );
            advance( merge_end, merge_size*2 );

            if( end < merge_end ) merge_end = end;

            inplace_merge( merge_begin, merge_middle, merge_end, p.first, cmp );

            merge_begin = merge_middle = merge_end;
        }
    }

    return_temporary_buffer( p.first );
}

template < typename Collection, typename Compare >
void stableSort( Collection * collection, Compare * compare )
{
    using namespace detail;
    using namespace std;

    less_adaptor<Compare> cmp(compare);

    typedef random_access_iterator_adaptor<Collection> Iterator;
    Iterator begin = CollectionsHelper::beginOf(collection),
             end = CollectionsHelper::endOf(collection);

    typedef typename Iterator::value_type value_type;
    typedef typename Iterator::difference_type difference_type;
    typedef typename Iterator::pointer pointer;

    pair< pointer, difference_type > p = get_temporary_buffer<value_type>( distance(begin, end) );

    for( typename Iterator::size_type merge_size = 1; merge_size < collection->size(); merge_size *= 2 )
    {
        Iterator merge_begin, merge_middle, merge_end;
        merge_begin = merge_middle = merge_end = begin;

        while( merge_middle < end )
        {
            advance( merge_middle, merge_size );
            advance( merge_end, merge_size*2 );

            if( end < merge_end ) merge_end = end;

            inplace_merge( merge_begin, merge_middle, merge_end, p.first, cmp );

            merge_begin = merge_middle = merge_end;
        }
    }

    return_temporary_buffer( p.first );
}

template < typename Collection, typename Size >
void rotate( Collection * collection, Size step )
{
    using namespace detail;
  
    auto begin = CollectionsHelper::beginOf(collection),
         middle = CollectionsHelper::beginOf(collection),
         end = CollectionsHelper::endOf(collection);
                  
    typename collection_traits<Collection>::size_type size = std::distance(begin, end);

    std::advance( middle, (size - step) % size );
    
    std::rotate( begin, middle, end );
}

template < typename Collection, typename OldVal, typename NewVal >
bool replaceAll( Collection * collection, OldVal * oldVal, NewVal * newVal )
{
    using namespace detail;

    auto begin = CollectionsHelper::beginOf(collection),
         end = CollectionsHelper::endOf(collection);

    typedef typename collection_traits<Collection>::element_type element_type;
    less<element_type> less;

    bool found = false;
    for( ; begin != end; ++begin )
    {
        if( oldVal == 0 )
        {
            *begin = 0;
            found = true;
        }
        else if( !less(*begin,oldVal) && !less(oldVal, *begin) )
        {
            *begin = newVal;
            found = true;
        }
    }
    return found;
}

template < typename Collection, typename Element >
int64 binarySearch( Collection * collection, Element key )
{
    using namespace detail;

    typedef typename collection_traits<Collection>::element_type element_type;

    auto begin = CollectionsHelper::beginOf(collection),
         end = CollectionsHelper::endOf(collection);
    auto range = std::equal_range( begin, end,
                                   key, less<element_type>() );

    // greater than all elements
    if( range.first == end ) return collection->size();

    // less than all elements
    if( range.second == begin ) return 0;

    return std::distance(begin, range.first);
}

template < typename Collection, typename Element, typename Compare >
int64 binarySearch( Collection * collection, Element key, Compare * compare )
{
    using namespace detail;

    auto begin = CollectionsHelper::beginOf(collection),
         end = CollectionsHelper::endOf(collection);
    auto range = std::equal_range( begin, end,
                                   key, less_adaptor<Compare>(compare) );

    // greater than all elements
    if( range.first == end ) return collection->size();

    // less than all elements
    if( range.second == begin ) return 0;

    return std::distance(begin, range.first);
}

template < typename Collection1, typename Collection2 >
int64 indexOfSubList( Collection1 * source, Collection2 * target )
{
    using namespace detail;

    auto target_length = target->size();
    auto remain_length = source->size();

    if( remain_length < target_length ) return -1;

    typedef typename collection_traits<Collection1>::element_type element_type;
    equal_to<element_type> equal_to;

    auto source_begin = CollectionsHelper::beginOf(source);

    auto target_begin = CollectionsHelper::beginOf(target),
         target_end = CollectionsHelper::endOf(target);

    for( auto current = source_begin; target_length <= remain_length; ++current, --remain_length )
    {
        if( !equal_to(*current,*target_begin) ) continue;

        if( std::equal( target_begin, target_end, current, equal_to ) )
            return std::distance(source_begin, current);
    }

    return -1;
}

template < typename Collection, typename Element >
int64 indexOf( Collection * collection, Element element )
{
    using namespace detail;

    auto begin = CollectionsHelper::beginOf(collection),
         end = CollectionsHelper::endOf(collection);

    typedef typename collection_traits<Collection>::element_type element_type;

    auto found = std::find_if( begin, end, std::bind( equal_to<element_type>(), std::placeholders::_1, element ) );

    if( found == end ) return -1;

    return std::distance( begin, found );
}

template < typename Collection1, typename Collection2 >
int64 lastIndexOfSubList( Collection1 * source, Collection2 * target )
{
    using namespace detail;

    auto target_length = target->size();
    auto remain_length = source->size();

    if( remain_length < target_length ) return -1;

    typedef typename collection_traits<Collection1>::element_type element_type;
    equal_to<element_type> equal_to;

    auto source_begin = CollectionsHelper::beginOf(source),
         source_end = CollectionsHelper::endOf(source);

    auto target_begin = CollectionsHelper::beginOf(target),
         target_end = CollectionsHelper::endOf(target);

    auto current = source_end;
    std::advance(current, -target_length);

    for( ; target_length <= remain_length; --current, --remain_length )
    {
        if( !equal_to(*current,*target_begin) ) continue;

        if( std::equal( target_begin, target_end, current, equal_to ) )
            return std::distance(source_begin, current);
    }

    return -1;
}

template < typename Collection, typename Element >
int64 lastIndexOf( Collection * collection, Element element )
{
    using namespace detail;

    auto begin = CollectionsHelper::beginOf(collection),
         end = CollectionsHelper::endOf(collection);

    typedef typename collection_traits<Collection>::element_type element_type;
    equal_to<element_type> equal_to;

    auto size = collection->size();
    for( ; 0 < size; --size )
    {
        if( equal_to( *--end, element ) )
            return std::distance( begin, end );
    }

    return -1;
}


} } 

#endif

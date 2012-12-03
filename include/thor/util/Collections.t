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
import . = thor.unmanaged;
import . = thor.lang;

@cpu
@native { include="thor/util/Collections.h" }
function sort<CollectionType>( collection: CollectionType ) : void;

@cpu
@native { include="thor/util/Collections.h" }
function sort<CollectionType, Compare>( collection: CollectionType, compare: Compare ) : void;

@cpu
@native { include="thor/util/Collections.h" }
function stableSort<CollectionType>( collection: CollectionType ) : void;

@cpu
@native { include="thor/util/Collections.h" }
function stableSort<CollectionType, Compare>( collection: CollectionType, compare: Compare ) : void;

@cpu
@native { include="thor/util/Collections.h" }
function partialSort<CollectionType,Size>( collection: CollectionType, middle: Size ) : void;

@cpu
@native { include="thor/util/Collections.h" }
function partialSort<CollectionType,Size, Compare>( collection: CollectionType, middle: Size, compare: Compare ) : void;

@cpu
@native { include="thor/util/Collections.h" }
function isAscending<CollectionType>( collection: CollectionType ) : bool;

@cpu
@native { include="thor/util/Collections.h" }
function isAscending<CollectionType, Compare>( collection: CollectionType, compare: Compare ) : bool;

@cpu
@native { include="thor/util/Collections.h" }
function reverse<CollectionType>( collection: CollectionType ) : void;

@cpu
@native { include="thor/util/Collections.h" }
function shuffle<CollectionType>( collection: CollectionType ) : void;

@cpu
@native { include="thor/util/Collections.h" }
function shuffle<CollectionType, RandomType>( collection: CollectionType, random: RandomType ) : void;

@cpu
@native { include="thor/util/Collections.h" }
function copy<CollectionType1, CollectionType2>( destination: CollectionType1, source: CollectionType2 ) : void;

@cpu
function fill<CollectionType,Element>( collection: CollectionType, element: Element ) : void
{
    var idx : int64;
    for( idx = 0; idx < collection.size(); ++idx )
        collection.set( idx, element ); 
}

@cpu
function nCopies<CollectionType,Element>( n: int64, element: Element ) : CollectionType
{
    var collection: CollectionType = new CollectionType;
    for( ; 0 < n; --n )
        collection.add( element );
    return collection;
}

@cpu
@native { include="thor/util/Collections.h" }
function rotate<CollectionType,Size>( collection: CollectionType, step: Size ) : void;

@cpu
@native { include="thor/util/Collections.h" }
function replaceAll<CollectionType,OldVal,NewVal>( collection: CollectionType, oldVal: OldVal, newVal: NewVal ) : bool;

@cpu
@native { include="thor/util/Collections.h" }
function binarySearch<CollectionType,Element>( collection: CollectionType, key: Element ) : int64;

@cpu
@native { include="thor/util/Collections.h" }
function binarySearch<CollectionType,Element,Compare>( collection: CollectionType, key: Element, compare: Compare ) : int64;

@cpu
@native { include="thor/util/Collections.h" }
function indexOfSubList<CollectionType1,CollectionType2>( source: CollectionType1, target: CollectionType2 ) : int64;

@cpu
@native { include="thor/util/Collections.h" }
function lastIndexOfSubList<CollectionType1,CollectionType2>( source: CollectionType1, target: CollectionType2 ) : int64;

@cpu
@native { include="thor/util/Collections.h" }
function indexOf<CollectionType,Element>( collection: CollectionType, element: Element ) : int64;

@cpu
@native { include="thor/util/Collections.h" }
function lastIndexOf<CollectionType,Element>( collection: CollectionType, element: Element ) : int64;

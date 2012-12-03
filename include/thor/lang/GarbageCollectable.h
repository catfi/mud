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

#ifndef THOR_LANG_GARBAGECOLLECTABLE_H_
#define THOR_LANG_GARBAGECOLLECTABLE_H_

#include "Thor.h"
#include <type_traits>
#include <vector>

namespace thor { namespace lang {

// Define this structure to ease the mangling
// PS. we do not make CollectableObject inherit from Object. If we do so, we need to link to libsystem.so for ts-vm
// which turns out to be ugly.
struct CollectableObject
{
	std::vector<void*> objects;
};

struct GarbageCollectable
{
	virtual void getContainedObjects(CollectableObject* collect_object) = 0;
};

namespace detail {

template<bool IsClass>
struct addObjectToGCHelper {
	template<typename T>
	inline static void add(CollectableObject* collect_object, T t)
	{
		collect_object->objects.push_back((void*)t);
	}
};

template<>
struct addObjectToGCHelper<false>
{
	template<typename T>
	inline static void add(CollectableObject* collect_object, T t)
	{
	}
};

} // detail

} }


#endif /* THOR_LANG_GARBAGECOLLECTABLE_H_ */

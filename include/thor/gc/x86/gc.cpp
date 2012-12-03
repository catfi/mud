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

#include "thor/gc/gc.h"
#include "framework/service/object/ObjectServiceMT.h"
#include "framework/service/object/gc/GarbageCollectorBufferMT.h"

namespace thor {

extern zillians::framework::service::ObjectServiceMT* gObjectService;

namespace gc {

using namespace thor::lang;
using namespace thor::container;

int64 getGenerationId()
{
    return gObjectService->getGCGenerationId();
}

bool isGCWorking()
{
    return gObjectService->isGCWorking();
}

void setGCEnable(bool enable)
{
	gObjectService->setGCEnable(enable);
}

void getActiveObjectInternal(Vector<Object>* objects)
{
	gObjectService->getActiveObjectInternal(objects);
}

} }

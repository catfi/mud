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

#ifndef THOR_LANG_FLAG_H_
#define THOR_LANG_FLAG_H_

#include "Thor.h"
#include "thor/lang/Language.h"
#include "thor/lang/String.h"
#include <type_traits>
#include <vector>
#include <map>

namespace thor { namespace lang {

class Flag : public thor::lang::Object
{
public:
	Flag();
	virtual ~Flag();

public:
	void createInteger(String* name, String* description, bool required);
	void createFloat(String* name, String* description, bool required);
	void createString(String* name, String* description, bool required);

	void positional(String* name);
	bool parse();
	bool has(String* name);

	int64 lookupInteger(String* name);
	double lookupFloat(String* name);
	String* lookupString(String* name);

	String* help();

public:
	void addOption(const std::wstring& name, void* option);

private:
	std::vector<void*>* option_parsers;
	void* variable_map_impl;
	void* options_list_impl;
};

} }

#endif /* THOR_LANG_FLAG_H_ */

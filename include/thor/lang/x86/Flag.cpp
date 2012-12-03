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

#include "thor/lang/Flag.h"
#include "framework/service/runtime/RuntimeServiceBufferMT.h"

#define BOOST_SPIRIT_UNICODE

#include <boost/spirit/include/qi.hpp>
#include <boost/spirit/include/phoenix.hpp>
#include <boost/spirit/repository/include/qi_distinct.hpp>
#include <boost/spirit/repository/include/qi_iter_pos.hpp>
#include <boost/spirit/include/qi_omit.hpp>
#include <boost/fusion/adapted/std_pair.hpp>
#include <boost/bind.hpp>
#include <strstream>
#include <iomanip>

namespace qi = boost::spirit::qi;
namespace unicode = boost::spirit::unicode;
namespace phoenix = boost::phoenix;

namespace thor {

extern zillians::framework::service::RuntimeServiceBufferMT* gRuntimeServiceBuffer;

namespace lang {

namespace detail {

struct key_comparer
{
    bool operator()(const std::wstring& a, const std::wstring& b) const
    {
        return a.compare(b) < 0;
    }
};

enum class FlagOptionType { INTEGER, FLOAT, STRING };

typedef std::map<std::wstring, void*, key_comparer> variable_map_t;
typedef std::vector<std::tuple<std::wstring, std::wstring, FlagOptionType, bool>> options_list_t;

struct FlagOption {
	FlagOption() : specified(false) { }
	FlagOption(long long int i) : specified(true), value(i) { }
	FlagOption(double f) : specified(true), value(f) { }
	FlagOption(const std::wstring& s) : specified(true), value(s) { }

	bool specified;
	boost::variant<long long int, double, std::wstring> value;
};

void add_option_integer(Flag* flag, const std::wstring& key, long long int value)
{
	flag->addOption(key, new FlagOption(value));
}

void add_option_integer_optional(Flag* flag, const std::wstring& key, const boost::optional<long long int>& value)
{
	flag->addOption(key, value.is_initialized() ? new FlagOption(*value) : new FlagOption());
}

void add_option_float(Flag* flag, const std::wstring& key, double value)
{
	flag->addOption(key, new FlagOption(value));
}

void add_option_float_optional(Flag* flag, const std::wstring& key, const boost::optional<double>& value)
{
	flag->addOption(key, value.is_initialized() ? new FlagOption(*value) : new FlagOption());
}

void add_option_string(Flag* flag, const std::wstring& key, std::wstring value)
{
	flag->addOption(key, new FlagOption(value));
}

void add_option_string_optional(Flag* flag, const std::wstring& key, const boost::optional<std::wstring>& value)
{
	flag->addOption(key, value.is_initialized() ? new FlagOption(*value) : new FlagOption());
}

}

Flag::Flag()
{
	option_parsers = new std::vector<void*>();

	auto string_parser = new qi::rule<std::wstring::iterator, std::wstring()>();
	(*string_parser) = (qi::lit(L'"') > *(unicode::char_ - qi::lit(L'"') ) > qi::lit(L'"')) | (+(unicode::char_ - unicode::space )) ;
	option_parsers->push_back((void*)string_parser);

	auto space_parser = new qi::rule<std::wstring::iterator>();
	(*space_parser) = +unicode::space;
	option_parsers->push_back((void*)space_parser);

	variable_map_impl = (void*)(new detail::variable_map_t());
	options_list_impl = (void*)(new detail::options_list_t());
}

Flag::~Flag()
{
	delete (detail::options_list_t*)options_list_impl;
	delete (detail::variable_map_t*)variable_map_impl;
	for(auto i = option_parsers->begin(); i != option_parsers->end(); ++i)
	{
		delete (qi::rule<std::wstring::iterator, std::wstring()>*)(*i);
	}
	option_parsers->clear();
	delete option_parsers;
}

void Flag::createInteger(String* name, String* description, bool required)
{
	detail::options_list_t* options_list = (detail::options_list_t*)options_list_impl;
	options_list->push_back(std::make_tuple(*name->data, *description->data, detail::FlagOptionType::INTEGER, required));

	auto parser = new qi::rule<std::wstring::iterator>;
	String::string_type::size_type split = name->data->find(L'.');
	if(split != String::string_type::npos)
	{
		String::string_type key_complete(*name->data, 0, split);
		String::string_type key_abbreviate(*name->data, split+1, String::string_type::npos);

		if(required)
		{
//			(*parser) = ((qi::lit(L"--") >> qi::lit(key_complete)) >> qi::long_long) [ boost::bind(detail::add_option_integer, this, key_complete, _1) ] |
//						(qi::lexeme[ (qi::lit(L"-") >> qi::lit(key_abbreviate)) >> (qi::omit[unicode::space] >> qi::long_long) ]) [ boost::bind(detail::add_option_integer, this, key_complete, _1) ];
			(*parser) = ((qi::lit(L"--") >> qi::lit(key_complete)) >> qi::lit(L'=')  >> qi::long_long)|
						((qi::lit(L"-") >> qi::lit(key_abbreviate)) >> (qi::omit[*unicode::space] >> qi::long_long));
		}
		else
		{
			(*parser) = ((qi::lit(L"--") >> qi::lit(key_complete)) >> -(qi::lit(L'=') >> qi::long_long)) [ boost::bind(detail::add_option_integer_optional, this, key_complete, _1) ] |
						((qi::lit(L"-") >> qi::lit(key_abbreviate)) >> -(qi::omit[*unicode::space] >> qi::long_long)) [ boost::bind(detail::add_option_integer_optional, this, key_complete, _1) ];
		}
	}
	else
	{
		if(required)
			(*parser) = ((qi::lit(L"--") >> qi::lit(*name->data)) >> qi::lit(L'=') >> qi::long_long) [ boost::bind(detail::add_option_integer, this, *name->data, _1) ];
		else
			(*parser) = ((qi::lit(L"--") >> qi::lit(*name->data)) >> -(qi::lit(L'=') >> qi::long_long)) [ boost::bind(detail::add_option_integer_optional, this, *name->data, _1) ];
	}

	option_parsers->push_back((void*)parser);
}

void Flag::createFloat(String* name, String* description, bool required)
{
	detail::options_list_t* options_list = (detail::options_list_t*)options_list_impl;
	options_list->push_back(std::make_tuple(*name->data, *description->data, detail::FlagOptionType::FLOAT, required));

	auto parser = new qi::rule<std::wstring::iterator>;
	String::string_type::size_type split = name->data->find(L'.');
	if(split != String::string_type::npos)
	{
		String::string_type key_complete(*name->data, 0, split);
		String::string_type key_abbreviate(*name->data, split+1, String::string_type::npos);

		if(required)
		{
			(*parser) = ((qi::lit(L"--") >> qi::lit(key_complete)) >> qi::lit(L'=') >> qi::double_) [ boost::bind(detail::add_option_float, this, key_complete, _1) ] |
						((qi::lit(L"-") >> qi::lit(key_abbreviate)) >> (qi::omit[*unicode::space] >> qi::double_)) [ boost::bind(detail::add_option_float, this, key_complete, _1) ];
		}
		else
		{
			(*parser) = ((qi::lit(L"--") >> qi::lit(key_complete)) >> -(qi::lit(L'=') >> qi::double_)) [ boost::bind(detail::add_option_float_optional, this, key_complete, _1) ] |
						((qi::lit(L"-") >> qi::lit(key_abbreviate)) >> -(qi::omit[*unicode::space] >> qi::double_)) [ boost::bind(detail::add_option_float_optional, this, key_complete, _1) ];
		}
	}
	else
	{
		if(required)
			(*parser) = ((qi::lit(L"--") >> qi::lit(*name->data)) >> qi::lit(L'=') >> qi::double_) [ boost::bind(detail::add_option_float, this, *name->data, _1) ];
		else
			(*parser) = ((qi::lit(L"--") >> qi::lit(*name->data)) >> -(qi::lit(L'=') >> qi::double_)) [ boost::bind(detail::add_option_float_optional, this, *name->data, _1) ];
	}

	option_parsers->push_back((void*)parser);
}

void Flag::createString(String* name, String* description, bool required)
{
	detail::options_list_t* options_list = (detail::options_list_t*)options_list_impl;
	options_list->push_back(std::make_tuple(*name->data, *description->data, detail::FlagOptionType::STRING, required));

	auto parser = new qi::rule<std::wstring::iterator>;
	String::string_type::size_type split = name->data->find(L'.');

	qi::rule<std::wstring::iterator, std::wstring()>& string_parser = *((qi::rule<std::wstring::iterator, std::wstring()>*)(*option_parsers)[0]);

	if(split != String::string_type::npos)
	{
		String::string_type key_complete(*name->data, 0, split);
		String::string_type key_abbreviate(*name->data, split+1, String::string_type::npos);

		if(required)
		{
			(*parser) = ((qi::lit(L"--") >> qi::lit(key_complete)) >> qi::lit(L'=') >> string_parser) [ boost::bind(detail::add_option_string, this, key_complete, _1) ] |
						((qi::lit(L"-") >> qi::lit(key_abbreviate)) >> (qi::omit[*unicode::space] >> string_parser)) [ boost::bind(detail::add_option_string, this, key_complete, _1) ];
		}
		else
		{
			(*parser) = ((qi::lit(L"--") >> qi::lit(key_complete)) >> -(qi::lit(L'=') >> string_parser)) [ boost::bind(detail::add_option_string_optional, this, key_complete, _1) ] |
						((qi::lit(L"-") >> qi::lit(key_abbreviate)) >> -(qi::omit[*unicode::space] >> string_parser)) [ boost::bind(detail::add_option_string_optional, this, key_complete, _1) ];
		}
	}
	else
	{
		if(required)
			(*parser) = ((qi::lit(L"--") >> qi::lit(*name->data)) >> qi::lit(L'=') >> string_parser) [ boost::bind(detail::add_option_string, this, *name->data, _1) ];
		else
			(*parser) = ((qi::lit(L"--") >> qi::lit(*name->data)) >> -(qi::lit(L'=') >> string_parser)) [ boost::bind(detail::add_option_string_optional, this, *name->data, _1) ];
	}

	option_parsers->push_back((void*)parser);
}

int64 Flag::lookupInteger(String* name)
{
	detail::variable_map_t* variable_map = (detail::variable_map_t*)variable_map_impl;
	auto it = variable_map->find(*name->data);
	if(it != variable_map->end())
	{
		return boost::get<long long int>(((detail::FlagOption*)it->second)->value);
	}
	else
	{
		// TODO throw exception if exception is implemented in our system
	}

	return 0;
}

double Flag::lookupFloat(String* name)
{
	detail::variable_map_t* variable_map = (detail::variable_map_t*)variable_map_impl;
	auto it = variable_map->find(*name->data);
	if(it != variable_map->end())
	{
		return boost::get<double>(((detail::FlagOption*)it->second)->value);
	}
	else
	{
		// TODO throw exception if exception is implemented in our system
	}

	return 0.0;
}

String* Flag::lookupString(String* name)
{
	detail::variable_map_t* variable_map = (detail::variable_map_t*)variable_map_impl;
	auto it = variable_map->find(*name->data);
	if(it != variable_map->end())
	{
		String* s = String::create();
		s->data->append(boost::get<std::wstring>(((detail::FlagOption*)it->second)->value));
		return s;
	}
	else
	{
		// TODO throw exception if exception is implemented in our system
		return NULL;
	}
}


void Flag::addOption(const std::wstring& name, void* option)
{
	detail::variable_map_t* variable_map = (detail::variable_map_t*)variable_map_impl;
	variable_map->insert(std::make_pair(name, option));
}

void Flag::positional(String* name)
{
	// TODO implement positional argument
}

bool Flag::parse()
{
	qi::rule<std::wstring::iterator>* last_rule = NULL;
	for(int i=1;i<option_parsers->size();++i)
	{
		qi::rule<std::wstring::iterator>* rule = (qi::rule<std::wstring::iterator>*)(*option_parsers)[i];
		if(!last_rule)
			last_rule = rule;
		else
		{
			qi::rule<std::wstring::iterator>* next_rule = new qi::rule<std::wstring::iterator>();
			(*next_rule) = (*last_rule) | (*rule);
			last_rule = next_rule;
		}
	}

	qi::rule<std::wstring::iterator> start;
	start = *(*last_rule) > qi::eoi;

	qi::grammar<std::wstring::iterator> grammer(start);

	try {
		std::wstring args = gRuntimeServiceBuffer->getArguments();
		auto begin = args.begin(); auto end = args.end();

		bool result = qi::parse(begin, end, grammer);
		if(!result || begin != end)
		{
			return false;
		}
	}
	catch(...) {
		return false;
	}

	return true;
}

bool Flag::has(String* name)
{
	detail::variable_map_t* variable_map = (detail::variable_map_t*)variable_map_impl;
	if(variable_map->find(*name->data) != variable_map->end())
		return true;
	else
		return false;
}

String* Flag::help()
{
	std::wstringstream ss;
	ss << L"Usage: ts-vm [vm-options] [entry] --args [options]" << std::endl;
	ss << std::endl;
	ss << L"Allowed options:" << std::endl;

#define OPTION_KEY_WIDTH 30
#define OPTION_LINE_WIDTH 80
#define OPTION_DESC_WIDTH (OPTION_LINE_WIDTH-OPTION_KEY_WIDTH)

	detail::options_list_t* options_list = (detail::options_list_t*)options_list_impl;
	for(auto i = options_list->begin(); i != options_list->end(); ++i)
	{
		// std::get<0> => the option name
		// std::get<1> => the option description
		// std::get<2> => the option value type
		// std::get<3> => the option value require flag
		std::wstringstream ss_temp;
		if(std::get<3>(*i))
		{
			ss_temp << L"   --" << std::get<0>(*i) << L"=";
		}
		else
		{
			ss_temp << L"   --" << std::get<0>(*i) << L"[=";
		}

		switch(std::get<2>(*i))
		{
		case detail::FlagOptionType::INTEGER: ss_temp << L"INTEGER"; break;
		case detail::FlagOptionType::FLOAT: ss_temp << L"FLOAT"; break;
		case detail::FlagOptionType::STRING: ss_temp << L"STRING"; break;
		default: break;
		}

		if(std::get<3>(*i))
		{
			ss_temp << L" ";
		}
		else
		{
			ss_temp << L"] ";
		}

		std::wstring prefix = ss_temp.str();
		ss << std::setw(OPTION_KEY_WIDTH) << std::left << prefix;

		bool cursor_reset = false;
		if(prefix.length() > OPTION_KEY_WIDTH) { ss << std::endl; cursor_reset = true; }

		std::wstring desc = std::get<1>(*i);
		while(desc.length() > OPTION_DESC_WIDTH)
		{
			if(cursor_reset) ss << std::setw(OPTION_KEY_WIDTH) << L" ";
			ss << desc.substr(0, OPTION_DESC_WIDTH) << std::endl;
			cursor_reset = true;

			desc = desc.substr(OPTION_DESC_WIDTH, std::wstring::npos);
		}

		if(cursor_reset) ss << std::setw(OPTION_KEY_WIDTH) << L" ";
		ss << desc << std::endl;
	}

	ss << std::endl;

	String* s = String::create();
	s->data->append(ss.str());

	return s;
}

} }

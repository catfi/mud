#
# Copyright (C) 2008-2012 Zillians, Inc. <http://www.zillians.com/>
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License, version 3,
# as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.
#
# See the GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

thorscript_add_usecase_test_target(
		TARGET thorscript-compiler-usecase-domain-basic
		ENTRY server_main
		OPTIONS --transport="tcp://*:1234" -s 
		)

zillians_add_test_to_subject(SUBJECT thorscript-compiler-usecase-test-domain TARGET thorscript-compiler-usecase-domain-basic)

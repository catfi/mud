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

#ifndef NATIVE_THREAD_INPUT_H
#define NATIVE_THREAD_INPUT_H

#include <thread>
#include <mutex>
#include "Thor.h"
#include "thor/lang/String.h"

class NativeThreadInput : public thor::lang::Object
{
public:
    NativeThreadInput();
    virtual ~NativeThreadInput();
    void start();
    void setLastInput();
    thor::lang::String* getInput();

private:
    void enterInputLoop();

    std::thread * mThread;
    std::mutex * mMutex;
    thor::lang::String * mInputString;
    bool mLastInput;
};

#endif /* NATIVE_THREAD_INPUT_H */

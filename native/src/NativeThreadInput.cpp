#include <iostream>
#include <cstdio>
#include <atomic>
#include "NativeThreadInput.h"

using namespace thor;
using namespace thor::lang;

using namespace Util;

NativeThreadInput::NativeThreadInput()
    : mThread( nullptr )
    , mMutex( new std::mutex() )
    , mInputString( String::create() )
    , mLastInput( false )
{}

NativeThreadInput::~NativeThreadInput()
{
    delete mThread;
    delete mMutex;
}

void NativeThreadInput::start()
{
    mThread = new std::thread(&NativeThreadInput::enterInputLoop, this);
}

void NativeThreadInput::setLastInput()
{
    mLastInput = true;
}

void NativeThreadInput::enterInputLoop()
{
    while ( !mLastInput )
    {
        String temp;
        std::getline( std::wcin, *(temp.data) );

        mMutex->lock();
        *(mInputString->data) = *(temp.data);
        mMutex->unlock();
    }
}

String* NativeThreadInput::getInput()
{
    String * obj = nullptr;
    obj = String::create();

    mMutex->lock();
    if ( mInputString->length() != 0 )
    {
        *(obj->data) = *(mInputString->data);
        *(mInputString->data) = L"";
    }
    mMutex->unlock();

    return obj;
}

#define _GLIBCXX_USE_NANOSLEEP

#include <thread>
#include <chrono>
#include "Sleep.h"

void Util::sleep_for_msec(thor::int32 msec)
{
    std::this_thread::sleep_for(std::chrono::milliseconds(msec));
}

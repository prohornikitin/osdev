#pragma once
#include <stdint.h>

class Lock
{
public:
	Lock();

	void tryToLockWrite();
	void tryToLockRead();

private:
	uint64_t info;

	void lockWrite();
	void lockRead();
	
};
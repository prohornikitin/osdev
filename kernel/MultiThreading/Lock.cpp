#include <MultiThreading/Lock.h>

Lock::Lock()
 : info(0){}


void Lock::tryToLockWrite() {
	while(info > 0) {
		//asm("int timer");
	}
	this->lockWrite();
}

void Lock::tryToLockRead() {
	while(info%2 == 1) {
		//asm("int timer");
	}
	this->lockRead();
}


void Lock::lockWrite() {
	info = 1;
}

void Lock::	lockRead() {
	++info;
}
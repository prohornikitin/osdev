#include <MultiThreading/Lock.h>

struct CpuDomain
{
	uint64_t domainId;
	CpuDomain* Childs;
	CpuDomain* parent;
	Lock lock;
};
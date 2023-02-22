#include <types.h>

namespace 4kb {

struct Pml4Entry {
    u64 present : 1;
    u64 canWrite : 1;
    u64 accesibleByAll : 1;
    u64 writeThrough : 1;
    u64 cacheDisabled : 1;
    u64 accessed : 1;
    u64 available1 : 1;
    u64 reserved1 : 1 = 0;
    u64 available2 : 4;
    u64 addr : 36;
    u64 reserved : 4 = 0;
    u64 available3 : 11;
    u64 disableExecution : 1;
}__attribute__((packed));


struct Pml3Entry {
    u64 present : 1;
    u64 canWrite : 1;
    u64 accesibleByAll : 1;
    u64 writeThrough : 1;
    u64 cacheDisabled : 1;
    u64 accessed : 1;
    u64 available1 : 1;
    u64 reserved1 : 1 = 0;
    u64 available2 : 4;
    u64 addr : 36;
    u64 reserved : 4 = 0;
    u64 available3 : 11;
    u64 disableExecution : 1;
}__attribute__((packed));


struct Pml2Entry {
    u64 present : 1;
    u64 canWrite : 1;
    u64 accesibleByAll : 1;
    u64 writeThrough : 1;
    u64 cacheDisabled : 1;
    u64 accessed : 1;
    u64 available1 : 1;
    u64 reserved1 : 1 = 0;
    u64 available2 : 4;
    u64 addr : 36;
    u64 reserved : 4 = 0;
    u64 available3 : 11;
    u64 disableExecution : 1;
}__attribute__((packed));


struct Pml1Entry {
    u64 present : 1;
    u64 canWrite : 1;
    u64 accesibleByAll : 1;
    u64 writeThrough : 1;
    u64 cacheDisabled : 1;
    u64 accessed : 1;
    u64 dirty : 1;
    u64 pat : 1;
    u64 global : 1;
    u64 available2 : 3;
    u64 addr : 36;
    u64 reserved : 4 = 0;
    u64 available3 : 11;
    u64 disableExecution : 1;
}__attribute__((packed));

}
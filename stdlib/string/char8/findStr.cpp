#include <string.h>

char*
str::findStr(const char* source, const char* substring) {
    for(size_t i=0; substring[i]!=0; ++i) {
        if(compareN(source+i, substring, len(substring)) == 0) {
            return (char*)(source+i);
        }
    }
    return nullptr;
}
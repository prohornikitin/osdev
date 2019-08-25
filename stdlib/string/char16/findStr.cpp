#include <string.h>


char16_t*
str::findStr(const char16_t* source, const char16_t* substring) {
    for(size_t i=0; substring[i]!=0; ++i) {
        if(compareN(source+i, substring, len(substring)) == 0) {
            return (char16_t*)source+i;
        }
    }
    return nullptr;
}
#include <string.h>

char32_t*
str::findStr(const char32_t* source, const char32_t* substring) {
    for(size_t i=0; substring[i]!=0; ++i) {
        if(compare(source, substring)==0) {
            return (char32_t*)source+i;
        }
    }
    return nullptr;
}
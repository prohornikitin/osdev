#include <string.h>

char32_t*
str::findChar(const char32_t* source, char32_t c) {
    for(size_t i=0; source[i]!=0; ++i) {
        if(source[i] == c) {
            return (char32_t*)(source+i);
        }
    }
    return nullptr;
}
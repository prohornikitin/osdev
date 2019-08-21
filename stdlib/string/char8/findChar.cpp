#include <string.hpp>

char*
str::findChar(const char* source, char c) {
    for(size_t i=0; source[i]!=0; ++i) {
        if(source[i] == c) {
            return (char*)(source+i);
        }
    }
    return nullptr;
}
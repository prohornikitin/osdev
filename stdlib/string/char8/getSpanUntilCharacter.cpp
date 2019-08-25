#include <string.h>

size_t
str::getSpanUntilCharacter(const char* str0, const char* str1) {
    for(size_t i=0; str0[i]!=0; ++i) {
        for(size_t j=0; str1[j]!=0; ++j) {
            if(str0[i] == str1[j]) {
                return i;
            }
        }
    }
    return i;
}
#include <string.hpp>

char16_t
str::compareN(const char16_t* str0, const char16_t* str1, size_t n) {
    size_t i=0;
    --n;
    while(str0[i]==str1[i] && i<n){
        ++i;
    }
    return str0[i] - str1[i];
}
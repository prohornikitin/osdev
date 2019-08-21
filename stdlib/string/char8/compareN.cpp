#include <string.hpp>

char
str::compareN(const char* str0, const char* str1, size_t n) {
    size_t i=0;
    --n;
    while(str0[i]==str1[i] && i<n){
        ++i;
    }
    return str0[i] - str1[i];
}
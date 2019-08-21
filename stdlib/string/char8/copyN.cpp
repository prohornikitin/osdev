#include <string.hpp>

void
str::copyN(char* destination, const char* source, size_t n) {
    for(size_t i=0; i<n; ++i) {
        destination[i] = source[i];
    }
}
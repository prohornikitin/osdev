#include <string.hpp>

void
str::concatenateN(char* destination, const char* source, size_t n) {
    size_t destinationLen = len(destination);
	size_t i;
    for(i=0; i<n; ++i) {
        destination[destinationLen+i] = source[i];
    }
    destination[destinationLen+i] = 0;
}
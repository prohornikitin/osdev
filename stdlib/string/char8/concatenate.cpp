#include <string.h>

void 
str::concatenate(char* destination, const char* source) {
	size_t destinationLen = len(destination);
	size_t i;
    for(i=0; source[i]!=0; ++i) {
        destination[destinationLen+i] = source[i];
    }
    destination[destinationLen+i] = 0;
}


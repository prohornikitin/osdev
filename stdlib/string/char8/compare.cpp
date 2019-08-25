#include <string.h>

char
str::compare(const char* str0, const char* str1) {
	size_t i=0;
	while(str0[i]==str1[i] && str0[i]!=0 && str1[i]!=0){
	    ++i;
	}
	return str0[i] - str1[i];
}
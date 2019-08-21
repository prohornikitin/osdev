#include <string.hpp>

char16_t
str::compare(const char16_t* str0, const char16_t* str1) {
	size_t i=0;
	while(str0[i]==str1[i] && str0[i]!=0 && str1[i]!=0){
	    ++i;
	}
	return str0[i] - str1[i];
}
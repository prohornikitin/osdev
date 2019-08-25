#pragma once



#include <stddef.h>
#include <stdint.h>

#ifdef DYNAMIC_MEMORY_ALLOCATION
    #include "string/string_class.hpp"
#endif

//typedef uint8_t char8_t ;


namespace str {
    size_t len(const char* str);
    size_t len(const char16_t* str);
    size_t len(const char32_t* str);

    char compare(const char* str0, const char* str1);
    char16_t compare(const char16_t* str0, const char16_t* str1);
    char32_t compare(const char32_t* str0, const char32_t* str1);

    char compareN(const char* str0, const char* str1, size_t n);
    char16_t compareN(const char16_t* str0, const char16_t* str1, size_t n);
    char32_t compareN(const char32_t* str0, const char32_t* str1, size_t n);

    char* findStr(const char* source, const char* substring);
    char16_t* findStr(const char16_t* source, const char16_t* substring);
    char32_t* findStr(const char32_t* source, const char32_t* substring);

    char* findChar(const char* source, char c);
    char16_t* findChar(const char16_t* source, char16_t c);
    char32_t* findChar(const char32_t* source, char32_t c);

    void concatenate(char* destination, const char* source);
    void concatenate(char16_t* destination, const char16_t* source);
    void concatenate(char32_t* destination, const char32_t* source);

    void concatenateN(char* destination, const char* source, size_t n);
    void concatenateN(char16_t* destination, const char16_t* source, size_t n);
    void concatenateN(char32_t* destination, const char32_t* source, size_t n);

    void copy(char* destination, const char* source);
    void copy(char16_t* destination, const char16_t* source);
    void copy(char32_t* destination, const char32_t* source);

    void copyN(char* destination, const char* source, size_t n);
    void copyN(char16_t* destination, const char16_t* source, size_t n);
    void copyN(char32_t* destination, const char32_t* source, size_t n);

	size_t getSpanUntilCharacter(const char* str0, const char* str1);
	size_t getSpanUntilCharacter(const char16_t* str0, const char16_t* str1);
	size_t getSpanUntilCharacter(const char32_t* str0, const char32_t* str1);

	size_t getSpanOfCharacterSet(const char* str0, const char* str1);
	size_t getSpanOfCharacterSet(const char16_t* str0, const char16_t* str1);
	size_t getSpanOfCharacterSet(const char32_t* str0, const char32_t* str1);

}



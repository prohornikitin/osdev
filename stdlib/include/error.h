#pragma once

#include <stdint.h>

namespace error {
    extern const char* codesDecryptions[];

    const char* codeToStr(uint_fast32_t code);
    int errno();
}

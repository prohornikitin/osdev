#include <error.hpp>
#include <stdint.h>

namespace error {
    const char* codesDecryptions[] = {
        "There is no error"
    };

    const char* codeToStr(uint_fast32_t code) {
        return codesDecryptions[code];
    }
}

#pragma once

#include <stdlib/string.hpp>
#include <stdlib/memory/memory.hpp>

template<typename CharT = char>
class String {
    public:
        static const long long notFound = -1;

        String() {
            data = NULL;
            this->capacity = 0;
            this->reserve(1);
            data[0] = 0;
            this->length = 0;
        }

        String(const CharT* str){
            this->length = str::len(str);
            this->capacity = 0;
            data = NULL;
            this->reserve(this->length+1);
            for(size_t i=0; str[i]!=0; ++i) {
                data[i] = str[i];
            }
        }

        String(const String<CharT>& str){
            this->length = str.getLength();
            this->capacity = 0;
            data = NULL;
            this->reserve(this->length+1);
            for(size_t i=0; str[i]!=0; ++i) {
                data[i] = str[i];
            }
        }

        const CharT*
        getData() const {
            return this->data;
        }

        void updateLength() {
            size_t i=0;
            while (data[i]!=0)
            {
                ++i;
            }
            this->length = i;
        }

        void
        operator=(const CharT* str) {
            this->reserve(str::len(str) + 1);
            this->length = this->capacity-1;
            str::copy(data, str);
            data[this->length] = 0;
        }

        void
        operator=(const String<CharT>& str) {
            this->reserve(str.getLength()+1);
            this->length = this->capacity-1;
            for(size_t i=0; str[i]!=0; ++i) {
                data[i] = str[i];
            }
            data[this->length] = 0;
        }

        void
        operator=(CharT c) {
            this->data[0] = c;
            this->data[1] = 0;
        }

        CharT&
        operator[](long long index) {
            index = indexToPositive(index);
            return data[index];
        }

        CharT
        operator[](long long index) const {
            return data[index];
        }

        friend String<CharT>
        operator+(String<CharT>& first, String<CharT>& second) {
            String<CharT> newFirst = first;
            newFirst += second;
            return newFirst;
        }

        friend String<CharT>
        operator+(String<CharT>& first, const CharT* second) {
            String<CharT> newFirst = first;
            newFirst += second;
            return newFirst;
        }

        /*friend std::ostream&
        operator<<(std::ostream& stream, const String<CharT>& obj)
        {
            stream << obj.getData();
            return stream;
        }

        friend std::istream&
        operator>>(std::istream& stream, const String<CharT>& obj)
        {
            stream >> obj.getData();
            return stream;
        }*/

        void
        operator+=(String<CharT>& str)
        {
            this->reserve(this->getLength() + str.getLength() +1);
            for(size_t i=0; i<=str.getLength(); ++i) {
                this->data[i+this->length] = str[i];
            }
            this->length += str.getLength();
        }



        void
        operator+=(const CharT* str) {
            const size_t strLength = str::len(str);
            this->reserve(this->getLength() + strLength + 1);
            for(size_t i=0; i<strLength; ++i) {
                data[i+this->length] = str[i];
            }
            this->length += strLength;
            data[this->length] = 0;
        }

        bool
        operator==(const String<CharT>& str) {
            if(str.getLength() != this->length) {
                return false;
            }
            for(size_t i=0; i<str.getLength(); ++i) {
                if(data[i] != str[i]) {
                    return false;
                }
            }
            return true;
        }

        bool
        operator==(const CharT* str) {
            if(this->length != str::len(str)) {
                return false;
            }
            for(size_t i=0; (i<str::len(str)); ++i) {
                if(data[i] != str[i]) {
                    return false;
                }
            }
            return true;
        }


        void
        reserve(size_t size) {
            if(size > this->capacity) {
                this->capacity = size;
                data = static_cast<CharT*>(mem::reallocate(data, size*sizeof(CharT)));
                //mem::reallocate(data, newSize*sizeof(CharT));
            }
        }


        size_t
        getCapacity() const {
            return capacity;
        }

        bool
        isEmpty() const {
            return length==0;
        }

        size_t
        getLength() const {
            return this->length;
        }

        String<CharT>
        slice(long long startIndex, long long endIndex) {
            startIndex = indexToPositive(startIndex);
            endIndex = indexToPositive(endIndex);

            String<CharT> substring;
            substring.reserve(endIndex - startIndex+1);
            for(long long i=startIndex; i<=endIndex; ++i) {
                substring[i-startIndex] = data[i];
            }
            substring[endIndex - startIndex+1] = 0;
            substring.updateLength();
            return substring;
        }


        long long
        find(String what) {
            for(long long i=0; i<this->length; ++i) {
                if(this->slice(i, i+what.getLength()) == what) {
                    return i;
                }
            }
            return this->notFound;
        }

        long long
        find(CharT what) {
            long long i = 0;
            while(i<this->length && data[i]!=what) {
                ++i;
            }
            if(data[i] == what) {
                return i;
            }
            return this->notFound;
        }



        ~String() {
            mem::free(data);
        }


    private:
        CharT* data;
        size_t length;
        size_t capacity;

        long long indexToPositive(long long& index) {
            if (index < 0) {
                return (this->length + index);
            }
            return index;
        }



};
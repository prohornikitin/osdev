#include <cstdint>


template <class T, size_t N>
class Array
{
public:
	Array() {
		
	}

	T& operator[](size_t index) {
		return data[index];
	}

	~Array();
private:
	T data [N];
};
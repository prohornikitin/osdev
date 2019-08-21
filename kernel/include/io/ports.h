#pragma once

#include <stdint.h>

extern "C" uint16_t writeByteToPort(uint8_t data, uint16_t port);
extern "C" uint8_t readByteFromPort(uint16_t port);

extern "C" void writeWordToPort(uint16_t data, uint16_t port);
extern "C" uint16_t readWordFromPort(uint16_t port);

extern "C" void writeDwordToPort(uint32_t data, uint16_t port);
extern "C" uint32_t readDwordFromPort(uint16_t port);


class Port
{
public:
	Port(uint16_t port);

	uint8_t getNumber() {
		return this->port;
	}

	void writeByte(uint8_t data);
	uint8_t readByte();
	void writeWord(uint16_t data);
	uint16_t readWord();
	void writeDword(uint32_t data);
	uint32_t readDword();

	~Port();
private:
	uint16_t port;
};

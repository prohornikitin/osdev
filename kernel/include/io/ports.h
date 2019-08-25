#pragma once

#include <stdint.h>

extern "C" uint16_t writeByteToPort(uint8_t data, uint16_t port_number);
extern "C" uint8_t readByteFromPort(uint16_t port_number);

extern "C" void writeWordToPort(uint16_t data, uint16_t port_number);
extern "C" uint16_t readWordFromPort(uint16_t port_number);

extern "C" void writeDwordToPort(uint32_t data, uint16_t port_number);
extern "C" uint32_t readDwordFromPort(uint16_t port_number);


class Port
{
public:
	Port(uint16_t port_number);

	uint8_t getNumber() {
		return this->port_number;
	}

	void writeByte(uint8_t data);
	uint8_t readByte();
	void writeWord(uint16_t data);
	uint16_t readWord();
	void writeDword(uint32_t data);
	uint32_t readDword();

	~Port();
private:
	uint16_t port_number;
};

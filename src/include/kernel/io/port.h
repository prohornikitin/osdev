#pragma once

#include <stdint.h>


class Port
{
public:
	Port(uint16_t port);
	uint8_t getNumber();
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

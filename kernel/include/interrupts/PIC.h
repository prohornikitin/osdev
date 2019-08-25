#pragma once

#include <stdint.h>
#include <io/ports.h>



class PIC
{
public:
	PIC();

	void disable();
	void remap(uint8_t master_offset, uint8_t slave_offset);
	void maskIRQ(uint8_t line);
	void maskAllIRQs();

	~PIC();
		
private:
	Port master_command;
	Port slave_command;
	Port master_data;
	Port slave_data;
	const static uint8_t ICW1_INIT = 0x10;
	const static uint8_t ICW1_ICW4 = 0x01;
	const static uint8_t ICW4_8086 = 0x01;
};

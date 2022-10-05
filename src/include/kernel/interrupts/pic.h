#pragma once

#include <stdint.h>
#include <io/port.h>

class Pic
{
public:
	Pic();
	~Pic();

	void disable();
	void remap(uint8_t master_offset, uint8_t slave_offset);
	void maskIrq(uint8_t line);
	void maskAllIrq();
private:
	Port master_command;
	Port slave_command;
	Port master_data;
	Port slave_data;
};

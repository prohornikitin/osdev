#include <interrupts/PIC.h>

PIC::PIC() : 
	master_command(0x20),
	slave_command(0xA0),
	master_data(0x21),
	slave_data(0xA1) {}

void PIC::disable() {
	master_data.writeByte(0xff);
	slave_data.writeByte(0xff);
}

void PIC::remap(uint8_t master_offset, uint8_t slave_offset) {
	uint8_t master_mask, slave_mask;
 
	master_mask = this->master_data.readByte();
	slave_mask = this->slave_data.readByte();
 	
 	master_command.writeByte(ICW1_INIT | ICW1_ICW4);
 	slave_command.writeByte(ICW1_INIT | ICW1_ICW4);

 	master_data.writeByte(master_offset);
 	slave_data.writeByte(slave_offset);
 	master_data.writeByte(4);
 	slave_data.writeByte(2);

 	master_data.writeByte(ICW4_8086);
 	slave_data.writeByte(ICW4_8086);

 	master_data.writeByte(master_mask);
 	slave_data.writeByte(slave_mask);
}

void PIC::maskIRQ(uint8_t line) {
	Port* port;
    uint8_t value;
 
    if(line < 8) {
        port = &master_data;
    } else {
        port = &slave_data;
        line -= 8;
    }
    value = (port->readByte() | (1 << line));
    port->writeByte(value);
}

void PIC::maskAllIRQs() {
	for(int i=0; i<16; ++i) {
		this->maskIRQ(i);
	}
}

PIC::~PIC() {

}
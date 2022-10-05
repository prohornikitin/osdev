
#include <io/port.h>

extern "C" void writeDwordToPort(uint32_t data, uint16_t port_number);
extern "C" uint32_t readDwordFromPort(uint16_t port_number);


Port::Port(uint16_t port) {
	this->port = port;
}

uint8_t Port::getNumber() {
	return this->port;
}

void Port::writeByte(uint8_t data) {
	asm("outb %0, %1" : : "a"(data), "Nd"(this->port));
}

uint8_t Port::readByte() {
	uint8_t ret;
	asm("inb %1, %0"
                   : "=a"(ret)
                   : "Nd"(this->port) );
	return ret;
}

void Port::writeWord(uint16_t data) {
	asm("outw %0, %1" : : "a"(data), "Nd"(this->port));
}

uint16_t Port::readWord() {
	uint16_t ret;
	asm("inw %1, %0"
                   : "=a"(ret)
                   : "Nd"(this->port) );
	return ret;
}


void Port::writeDword(uint32_t data) {
	writeDwordToPort(this->port, data);
}

uint32_t Port::readDword() {
	return readDwordFromPort(this->port);
}

Port::~Port() {}
	

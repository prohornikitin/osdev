#include <io/ports.h>


Port::Port(uint16_t port_number) {
	this->port_number = port_number;
}

void Port::writeByte(uint8_t data) {
	writeByteToPort(this->port_number, data);
}

uint8_t Port::readByte() {
	return readByteFromPort(this->port_number);
}

void Port::writeWord(uint16_t data) {
	writeWordToPort(this->port_number, data);
}

uint16_t Port::readWord() {
	return readWordFromPort(this->port_number);
}

void Port::writeDword(uint32_t data) {
	writeDwordToPort(this->port_number, data);
}

uint32_t Port::readDword() {
	return readDwordFromPort(this->port_number);
}

Port::~Port() {

}
	

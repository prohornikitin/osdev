#include <io/ports.h>


Port::Port(uint16_t port) {
	this->port = port;
}

void Port::writeByte(uint8_t data) {
	writeByteToPort(this->port, data);
}

uint8_t Port::readByte() {
	return readByteFromPort(this->port);
}

void Port::writeWord(uint16_t data) {
	writeWordToPort(this->port, data);
}

uint16_t Port::readWord() {
	return readWordFromPort(this->port);
}

void Port::writeDword(uint32_t data) {
	writeDwordToPort(this->port, data);
}

uint32_t Port::readDword() {
	return readDwordFromPort(this->port);
}

Port::~Port() {

}
	

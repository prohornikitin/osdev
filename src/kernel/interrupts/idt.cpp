#include <interrupts/idt.h>
#include <gdt.h>
#include <stddef.h>

struct IdtPointer {
	uint16_t limit;
	uint64_t base;
}__attribute__((packed));



static IdtEntry idt[256];
static IdtPointer pointer;




void fillIdtEntry(IdtEntry entry, int num) {
	idt[num] = entry;
}

void loadIdt() {
	pointer.base = (uint64_t)idt;
	pointer.limit = sizeof(idt) - 1;
	asm("lidt %0" : : "m"(pointer));
}

IdtEntry::IdtEntry() {}

IdtEntry::IdtEntry(void (*handler_ptr)(void), GateType gate_type) {
	uint64_t ptr = (size_t) handler_ptr;
	this->offset_1 = ptr & 0xFFFF;
	this->offset_2 = (ptr >> 16) & 0xFFFF;
	this->offset_3 = (ptr >> 32) & 0xFFFFFFFF;

	this->present = 1;
	this->privilege_level = 0;
	
	this->selector = gdt::CODE;
	this->gate_type = (uint8_t) gate_type;
}
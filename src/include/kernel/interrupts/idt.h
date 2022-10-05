#include <gdt.h>



class IdtEntry {
public:
	enum class GateType : uint8_t {
		INTERRUPT = 0b1110,
		TRAP = 0b1111,
	};

	IdtEntry();
	IdtEntry(void (*handler_ptr)(void), GateType gate_type);

private:
	uint16_t offset_1;        // offset bits 0..15
	uint16_t selector;        // a code segment selector in GDT or LDT
	uint8_t  zero;            // unused, set to 0
	uint8_t gate_type : 4;
	uint8_t privilege_level : 2;
	uint8_t zero1 : 1;
	uint8_t present : 1;
	uint16_t offset_2;     		   // offset bits 16..31
	uint32_t offset_3;        // offset bits 32..63
	uint32_t zero2;            // reserved
}__attribute__((packed));


void loadIdt();
void fillIdtEntry(IdtEntry entry, int num);
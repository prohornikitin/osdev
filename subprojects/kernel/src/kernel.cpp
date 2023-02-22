#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include <interrupts/pic.h>
#include <terminals/text_terminal.h>
#include <interrupts/idt.h>


extern "C" void picDisable(void) {
	Pic pic;
	pic.remap(32,40);
	pic.maskAllIrq();
	pic.disable();
}



void exception(const char* str) {
	terminal::TextTerminal term;
	term.clearScreen();
	term.write(str);
	for(;;) {
		asm("hlt");
	}
}

void handleInterrupt0(void) {
	exception("Zero division error");
}
void handleInterrupt1(void) {
	exception("Debug exception");
}
void handleInterrupt2(void) {
	exception("Non-maskable interrupt");
}
void handleInterrupt3(void) {
	exception("Breakpoint exception");
}
void handleInterrupt4(void) {
	exception("Overflow exception");
}
void handleInterrupt5(void) {
	exception("Bound Range Exceeded");
}
void handleInterrupt6(void) {
	exception("Invalid Opcode");
}
void handleInterrupt7(void) {
	exception("Device Not Available");
}
void handleInterrupt8(void) {
	exception("Double Fault");
}
void handleInterrupt10(void) {
	exception("Invalid TSS");
}
void handleInterrupt11(void) {
	exception("Segment Not Present");
}
void handleInterrupt12(void) {
	exception("Stack-Segment Fault");
}
void handleInterrupt13(void) {
	exception("General Protection Fault");
}
void handleInterrupt14(void) {
	exception("Page Fault");
}
void handleInterrupt16(void) {
	exception("x87 Floating-Point Exception");
}
void handleInterrupt17(void) {
	exception("Alignment Check");
}
void handleInterrupt18(void) {
	exception("Machine Check");
}
void handleInterrupt19(void) {
	exception("SIMD Floating-Point Exception");
}
void handleInterrupt20(void) {
	exception("Virtualization Exception");
}
void handleInterrupt21(void) {
	exception("Control Protection Exception");
}
void handleInterrupt28(void) {
	exception("Hypervisor Injection Exception");
}
void handleInterrupt29(void) {
	exception("VMM Communication Exception");
}
void handleInterrupt30(void) {
	exception("Security Exception");
}


extern "C" void fillIdt(void) {
	fillIdtEntry(IdtEntry(&handleInterrupt0, IdtEntry::GateType::TRAP), 0);
	fillIdtEntry(IdtEntry(&handleInterrupt1, IdtEntry::GateType::TRAP), 1);
	fillIdtEntry(IdtEntry(&handleInterrupt2, IdtEntry::GateType::TRAP), 2);
	fillIdtEntry(IdtEntry(&handleInterrupt3, IdtEntry::GateType::TRAP), 3);
	fillIdtEntry(IdtEntry(&handleInterrupt4, IdtEntry::GateType::TRAP), 4);
	fillIdtEntry(IdtEntry(&handleInterrupt5, IdtEntry::GateType::TRAP), 5);
	fillIdtEntry(IdtEntry(&handleInterrupt6, IdtEntry::GateType::TRAP), 6);
	fillIdtEntry(IdtEntry(&handleInterrupt7, IdtEntry::GateType::TRAP), 7);
	fillIdtEntry(IdtEntry(&handleInterrupt8, IdtEntry::GateType::TRAP), 8);
	fillIdtEntry(IdtEntry(&handleInterrupt10, IdtEntry::GateType::TRAP), 10);
	fillIdtEntry(IdtEntry(&handleInterrupt11, IdtEntry::GateType::TRAP), 11);
	fillIdtEntry(IdtEntry(&handleInterrupt12, IdtEntry::GateType::TRAP), 12);
	fillIdtEntry(IdtEntry(&handleInterrupt13, IdtEntry::GateType::TRAP), 13);
	fillIdtEntry(IdtEntry(&handleInterrupt14, IdtEntry::GateType::TRAP), 14);
	fillIdtEntry(IdtEntry(&handleInterrupt16, IdtEntry::GateType::TRAP), 16);
	fillIdtEntry(IdtEntry(&handleInterrupt17, IdtEntry::GateType::TRAP), 17);
	fillIdtEntry(IdtEntry(&handleInterrupt18, IdtEntry::GateType::TRAP), 18);
	fillIdtEntry(IdtEntry(&handleInterrupt19, IdtEntry::GateType::TRAP), 19);
	fillIdtEntry(IdtEntry(&handleInterrupt20, IdtEntry::GateType::TRAP), 20);
	fillIdtEntry(IdtEntry(&handleInterrupt21, IdtEntry::GateType::TRAP), 21);
	fillIdtEntry(IdtEntry(&handleInterrupt28, IdtEntry::GateType::TRAP), 28);
	fillIdtEntry(IdtEntry(&handleInterrupt29, IdtEntry::GateType::TRAP), 29);
	fillIdtEntry(IdtEntry(&handleInterrupt30, IdtEntry::GateType::TRAP), 30);
	loadIdt();
}

extern "C" void kernelMain(void) {
	//~ terminal::TextTerminal term;
	//~ term.clearScreen();
	//~ term.write("hello");
}





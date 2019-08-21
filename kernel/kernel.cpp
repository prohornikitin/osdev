#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>




#include <terminals/text_terminal.h>
//#include <error.h>
#include <memory.h>
#include <string.h>
#include <interrupts/PIC.h>




extern "C" void test(void) {
	using namespace terminal;
	TextTerminal terminal;
	terminal.setColor(color::light_grey, color::black);
	terminal.clearScreen();
	terminal.write("dza");
}


extern "C" void kernelMain(void) {
	test();
	PIC pic;
	pic.remap(32,40);
	pic.maskAllIRQs();
	pic.disable();
}





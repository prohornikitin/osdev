bits 32

%include "check/long_mode_support.nasm"
%include "check/avx_support.nasm"
%include "check/apic_support.nasm"
%include "check/msr_support.nasm"

global runAllChecks

runAllChecks:
	call checkLongmodeSupport
	call checkApicSupport
	call checkMsrSupport
	call checkAvxSupport
	ret

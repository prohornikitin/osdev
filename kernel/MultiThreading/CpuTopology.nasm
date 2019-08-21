global CpuTopology.logicalCoreBits
global CpuTopology.coreBits

section .bss

CpuTopology:
	.logicalCoreBits:
		resb 1
	.coreBits:
		resb 1

CpuDomain:
	.lock
		resq 1
	.domainId:
		resd 1
	.parentDomain:
		resq 1
	.

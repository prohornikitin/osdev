extern CpuTopology.logicalCoreBits
extern CpuTopology.coreBits
extern detectCpuVendor

global identifyCpuTopology

identifyCpuTopology:
	mov eax, 1
	cpuid
	shr rbx, 0x10
	push rbx
	call detectCpuVendor
	pop rbx
	cmp eax, 'cAMD' ;part of "AuthenticAMD"
	je amdTopology

intelTopology:
	xor eax, eax
	cpuid
	cmp eax, 0x1F

	mov eax, 0xB
	mov ebx, 0x1F
	cmovge eax, ebx
	xor ecx, ecx
	cpuid
	and ax, 0x0F
	mov [CpuTopology.logicalCoreBits], ax

	inc ecx
	cpuid
	and ax, 0x0F
	sub ax, [CpuTopology.logicalCoreBits]
	mov [CpuTopology.coreBits], ax

	ret





amdTopology:
	push rdi
	mov [CpuTopology.logicalCoreBits], bl
	mov rax, 0x80000008
	cpuid
	mov edi, ecx
	shr ecx, 12
	cmp ecx, 0
	jle .coreBitsIn0_7
	.coreBitsIn12_15:
		and ecx, 0x0F
		mov [CpuTopology.coreBits], cl
		shr byte [CpuTopology.logicalCoreBits], cl
		mov [CpuTopology.logicalCoreBits], bl
		pop rdi
		ret
	.coreBitsIn0_7:
		xor rax, rax
		call roundUpToPowerOf2
		mov [CpuTopology.coreBits], al
		mov cl, [CpuTopology.coreBits]
		shr byte [CpuTopology.logicalCoreBits], cl
		mov [CpuTopology.logicalCoreBits], bl
		pop rdi
		ret



roundUpToPowerOf2:
	mov eax, 1
	.tryToRoundUp:
		shl eax, 1
		cmp edi, eax
		jl .tryToRoundUp
	ret
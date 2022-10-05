global writeDwordToPort
global readDwordFromPort


writeDwordToPort:
	mov dx, di
	mov eax, esi
	out dx, eax
	ret

readDwordFromPort:
	mov dx, di
	in eax, dx
	ret
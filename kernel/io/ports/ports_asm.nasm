
global writeByteToPort
global readByteFromPort

global writeWordToPort
global readWordFromPort

global writeDwordToPort
global readDwordFromPort


writeByteToPort:
	mov dx, di
	mov ax, si
	out dx, al
	ret

writeWordToPort:
	mov dx, di
	mov ax, si
	out dx, ax
	ret

writeDwordToPort:
	mov dx, di
	mov eax, esi
	out dx, eax
	ret

readByteFromPort:
	mov dx, di
	in al, dx
	ret

readWordFromPort:
	mov dx, di
	in ax, dx
	ret

readDwordFromPort:
	mov dx, di
	in eax, dx
	ret
bits 32

global allocateAcpiMemRegion

extern multiboot2_findStructByType
extern printErrorNumber

;TODO:
allocateAcpiMemRegion: ;multiboot2 struct pointer should be in EDI
	mov esi, 8
	call multiboot2_findStructByType
	cmp eax, 0


	ret





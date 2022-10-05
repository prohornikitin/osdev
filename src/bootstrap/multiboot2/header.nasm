section .multiboot_header

;align 8
header_start:
    dd 0xE85250D6                ; Magic number for multiboot 2
    dd 0                         ; Architecture (i386, protected mode)
    dd header_end - header_start ; Header length
    dd 0x100000000 - (0xE85250D6 + 0 + (header_end - header_start)) ; Checksum

	;align 8
	;.framebuffer_tag:
;		dw 5
;		dw 0
;		dd 20
;		dd 1920 ; width
;		dd 1080  ; height
;		dd 4*8


	align 8
	.end_tag:
		dw 0    ; Type
	    dw 0    ; Flags
	    dd 8    ; Size
header_end:
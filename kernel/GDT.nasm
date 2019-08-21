;%include "kernel/include/TSS.nasm"
%include "TSS.nasm"

global GDT.Data
global GDT.Code
global GDT.Pointer
global GDT.TSS




section .rodata
	GDT:                           ; Global Descriptor Table (64-bit).
        .Null: equ $ - GDT         ; The null descriptor.
            dw 0xFFFF                    ; Limit (low).
            dw 0                         ; Base (low).
            db 0                         ; Base (middle)
            db 0                         ; Access.
            db 1                         ; Granularity.
            db 0                         ; Base (high).
        .Code: equ $ - GDT         ; The code descriptor.
            dw 0                         ; Limit (low).
            dw 0                         ; Base (low).
            db 0                         ; Base (middle)
            db 10011010b                 ; Access (exec/read).
            db 10101111b                 ; Granularity, 64 bits flag, limit19:16.
            db 0                         ; Base (high).
            dd 0                         ; Base (very high)
            dd 0                         ; Reserved
        .Data: equ $ - GDT         ; The data descriptor.
            dw 0                         ; Limit (low).
            dw 0                         ; Base (low).
            db 0                         ; Base (middle)
            db 10010010b                 ; Access (read/write).
            db 00000000b                 ; Granularity.
            db 0                         ; Base (high).
            dd 0                         ; Base (very high)
            dd 0                         ; Reserved
        .TSS: equ $ - GDT
            dw 104-1                     ; Limit (low).
            dw (TSS & 0xFFFF)                       ; Base (low).
            db ((TSS >> 16) & 0xFF)               ; Base (middle).
            db 10001001b                 ; Access (read/write).
            db 00000000b                 ; Flags, all flags disabled exactly.
            db ((TSS >> 24) & 0xFF)               ; Base (high)
            dd ((TSS >> 32) & 0xFFFFFFFF)               ; Base (very high)
            dd 0                         ; Reserved
        .Pointer:                    ; The GDT-pointer.
            dw $ - GDT - 1             ; Limit.
            dq GDT                     ; Base.
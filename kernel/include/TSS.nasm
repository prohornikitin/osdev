

section .bss
    ring0_stack_top:
        resb 4096
    ring0_stack_bottom:
    ring1_stack_top:
        resb 4096
    ring1_stack_bottom:
    ring2_stack_top:
        resb 4096
    ring2_stack_bottom:


section .text

global setupTss

TSS equ 0x8000

setupTss:
  mov ax, GDT.TSS
  ltr ax

  .fillTss:
    mov rdi, TSS+4
    mov QWORD [rdi], ring0_stack_top
    add rdi, 8
    mov QWORD [rdi], ring1_stack_top
    add rdi, 8
    mov QWORD [rdi], ring2_stack_top
    add rdi, 16
    mov QWORD [rdi], 1;IST1
    add rdi, 8
    mov QWORD [rdi], 1;IST2
    add rdi, 8
    mov QWORD [rdi], 1;IST3
    add rdi, 8
    mov QWORD [rdi], 1;IST4
    add rdi, 8
    mov QWORD [rdi], 1;IST5
    add rdi, 8
    mov QWORD [rdi], 1;IST6
    add rdi, 8
    mov QWORD [rdi], 1;IST7
    add rdi, 18
    mov WORD [rdi], 2;IO_MAP_BASE_ADDRESS
    ret
  ;  TSS:
  ;    dd 0
  ;    dq ring0_stack_top
  ;    dq ring1_stack_top
  ;    dq ring2_stack_top
  ;    dq 0
  ;    dq 1;IST1
  ;    dq 1;IST2
  ;    dq 1;IST3
  ;    dq 1;IST4
  ;    dq 1;IST5
  ;    dq 1;IST6
  ;    dq 1;IST7
  ;    dq 0
  ;    dw 0
  ;    dw 2;IO_MAP_BASE_ADDRESS
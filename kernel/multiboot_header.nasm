section .multiboot_header

header_start:
    dd 0xE85250D6                ; магическое число (multiboot 2)
    dd 0                         ; архитектура 0 (защищённый режим i386)
    dd header_end - header_start ; длина заголовка
    ; контрольная сумма
    dd 0x100000000 - (0xE85250D6 + 0 + (header_end - header_start))

    ; требуюется завершающий тэг
    dw 0    ; тип
    dw 0    ; флаги
    dd 8    ; размер
header_end:
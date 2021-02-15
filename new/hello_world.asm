[bits 16]     ; tell assembler that we're in 16 bit mode
[org 0x7c00]  ; organize from 0x7c00 memory location where BIOS will load

.start:        ; start label from where our code starts

    xor ax, ax  ;set ax register to 0
    mov ds, ax  ;set data segment(ds) to 0
    mov es, ax  ;set extra segment(es) to 0
    mov bx, 0x8000

    mov si, hello_world   ;point hello_world to source index
    call print_string


    hello_worlddb 'Hello, World!', 13, 0

.print_string:
    mov ah, 0x0E

.repeat_next_char:
    lodsb
    cmp al, 0
    je .done_print
    int 0x10
    jmp .repeat_next_char

.done_print:
    ret

    times (510-($-$$)) db 0x00
    dw 0xAA55
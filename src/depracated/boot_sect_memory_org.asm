[org 0x7c00]
mov ah, 0x0e

; a1
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

; a2
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

; a3
mov al, "3"
int 0x10
mov bx, the_secret
move bx, 0x
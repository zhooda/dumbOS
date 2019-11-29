;
; Simple boot sec that demonstrates addressing
;
move ah, 0xe		; int 10/ah = 0eh -> scrolling teletype BIOS routine

; first attempt
mov al, the_secret
int 0x10		; does this print an X?

; second attempt
mov al, [the_secret]
int 0x10		; does this print an X?

; third attempt
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10		; does this print an X?

; fourth attempt
mov al, [0x7c1e]
int 0x10		; does this print an X?

the_secret:
	db "X"

; padding and magic BIOS number

times 510-($-$$) db 0
dw 0xaa55

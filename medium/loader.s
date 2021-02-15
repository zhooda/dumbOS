.set MAGIC, 0x1badb002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
	.long MAGIC
	.long FLAGS
	.long CHECKSUM



.section .text
.extern kernelMain
.global loader

loader:
	mov $kernel_stack, %esp   //setting the stack pointer
	call callConstructors
	push %eax
	push %ebx
	call kernelMain           //calling the kernelMain

_stop:                        //extra precaution to keep running
	cli
	hlt
	jmp_stop

.section .bss
.space 2*1024*1024;
kernel_stack:

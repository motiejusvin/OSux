[bits 16]
[org 0x7c00]

KERNEL_OFFSET equ 0x1000 
mov [BOOT_DRIVE],dl 


;stack
mov bp,0x9000
mov sp,bp

call load_kernel
call to32

jmp $

%include "disk.asm"
%include "gdt.asm"
%include "boomshakalaka32.asm"

[bits 16]
load_kernel:
    mov bx,KERNEL_OFFSET
    mov dh,2
    mov dl,[BOOT_DRIVE]
    call load_disk
    ret

[bits 32]
tobits32:
    call KERNEL_OFFSET
    jmp $


BOOT_DRIVE db 0

times 510 - ($-$$) db 0   ;padding for bootloader

dw 0xaa55 ;magic

[bits 16]
[org 0x7c00]

KERN_OFF equ 0x1000 ;kernel offset

mov [BOOT_DRIVE],dl ;bios set drive


;stack
mov bp,0x9000
mov sp,bp 

call load_kernel
call tobits32

jmp $

%include "disk.asm"
%include "gdt.asm"
%include "boomshakalaka32.asm"
[bits 16]
init_disp:
    ;this is where i will write all my interupts for display
    mov ah,00
    mov al,0x06
    int 0x10
    mov bh,0x0
    mov cx,0x3
    mov dx,0x3
    mov al,0x1
    mov ah,0x0c
    int 0x10
    cli
    ret 
[bits 16]
load_kernel:
    call init_disp
    mov bx,KERN_OFF
    mov dh,2
    mov dl,[BOOT_DRIVE]
    call load_disk
    ret

[bits 32]
tobits32:
    call KERN_OFF
    jmp $

BOOT_DRIVE db 0

times 510 - ($-$$) db 0   ;padding for bootloader

dw 0xaa55 ;magic

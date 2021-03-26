bits 32                     ;Nasm identification - 32bit

section .text               
    ;multiboot spec,for grub
    ;dd = double word = 4bytes
    align 4
    dd 0x1BADB002           ;magic
    dd 0x00                 ;flags
    dd - (0x1BADB002 + 0x00);checksum. m+f+c should be zero ig 


global start                ;nasm directive for starting
extern kmain                ;method defined in C file

start:
    cli                     ;block interrupts
    mov esp, stack_space    ;set stack pointer
    call kmain              ;call to main method
    hlt                     ;halt the cpu


section .bss                ;bss section
resb 8192                   ;8kb for stack
stack_space:

section .video
bits 16

global vmain
vmain:
    mov ah,0x0e
    mov al,'!'
    int 0x10    
    ret

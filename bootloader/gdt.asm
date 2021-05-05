;This is a gdt table for 32bit protected mode
;global desctriptor table

gdt_start:
    dq 0x0 ;dq- define quadword - 16bits

;code segment
gdt_code:
    dw 0xffff       ;segment length,bits 0,15
    dw 0x0          ;segment base, bits 0-15
    db 0x0          ;segment base, bits 16-23 
    db 0b10011010   ;flags (8 bitos)
    db 0b11001111   ;flags (4 bitos) + segmnt length,bits 16-19
    db 0x0          ;segment base,last bits
;data segment
gdt_data:
    dw 0xffff       ;length bits 0-15
    dw 0x0          ;bits 0-15
    db 0x0          ;16-23
    db 0b10010010   ;flag (8 bitos)
    db 0b11001111   ;flag (8 bitos) + same stuff
    db 0x0          ;segment base,last bits

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1 ;size (16 bitos)
    dd gdt_start               ;address (32 bitos)

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start


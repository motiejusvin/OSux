;disk managament

load_disk:
    pusha ;general register to stack
    push dx
    
    mov ah, 0x02 ;read mode
    mov al, dh   ; read dh to get nubmer of sectors
    mov cl, 0x02 ;read from second sector
    mov ch, 0x00 ;cylinder zero
    mov dh, 0x00 ;head 0
    ;dl is input
    ;ex:bx is a buffer pointer that is set
    
    int 0x13
    jc disk_loop ;jc caarry from cmp
    pop dx       ;original sector
    cmp al, dh   ; al is now number of sectors
    jne disk_loop;jne jumpo if not equal 
    popa         ;pop all gen registers
    ret          ; 

disk_loop:
    jmp $

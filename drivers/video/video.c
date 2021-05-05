#include "../../include/kernel.h"



char *vidptr = (char *)0xb8000; 

void e(void){
    extern void vmain;
    vmain;
    return; 
}
void clearc(void) {
    unsigned int i = 0;  // self-explatinory
    unsigned int j = 0;

    while (j < 80 * 25 * 2) {
        vidptr[j] = ' ';              
        vidptr[j + 1] = 0x07 + 0x10;  
        j = j + 2;
    } 
    j = 0;
}

void kprint(char *messg, unsigned int line) {
    int pos = 0;
    unsigned int i = 0;
    i = (line * 80 * 2);
    while (messg[pos] != '\0') {
        vidptr[i] = messg[pos]; 
        vidptr[i + 1] = WHITE + 0x10;
        ++pos;
        i = i + 2;
    }
    return;
}





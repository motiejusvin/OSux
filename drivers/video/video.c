#include "../../include/kernel.h"


void kprint(char messg[], unsigned int line) { 
    char *vidptr = (char *)0xb8000; 
    int pos = 0;
    unsigned int i = 0;
    i = (line * 80 * 2);
    while (messg[pos] != '\0') {
        vidptr[i] = messg[pos]; 
        vidptr[i + 1] = BLACK + WHITE;
        ++pos;
        i = i + 2;
    }
}



void clearc() { 
    char *vvidptr = (char *)0xb8000; 
    unsigned int i = 0;  // self-explatinory
    unsigned int j = 0;
    while (j < 80 * 25 * 2) {
        vvidptr[j] = ' ';              
        vvidptr[j + 1] = BLACK+WHITE;  
        j = j + 2;
    } 
}




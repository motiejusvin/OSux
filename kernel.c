
#include "kernel.h"

char *vidptr = (char *)0xb8000;



void clearc(void) {
    unsigned int i = 0;  // self-explatinory
    unsigned int j = 0;
    
    // clears screen because: 25lines,80columns and 2bytes each
    while (j < 80 * 25 * 2) {
        vidptr[j] = ' ';              // blank char
        vidptr[j + 1] = 0x07 + 0x10;  // atribute-byte - light grey on black
        j = j + 2;
    }
    j = 0;
}

void kprint(char *messg, unsigned int line) {
    int pos = 0;
    unsigned int i = 0;

    i = (line * 80 * 2);  // 80columns,2 bytes and you get your place
    while (messg[pos] != '\0') {
        vidptr[i] = messg[pos];  // printline
        vidptr[i + 1] = WHITE + 0x10;
        ++pos;
        i = i + 2;
    }
    return;
}

void kmain(void) {
    const char *str = "kernel hey";  // string constant
    unsigned int i = 0;              // self-explatinory
    unsigned int j = 0;              // self-explanitory
    clearc();
    kprint("Heyyy", 1);
    return;
}

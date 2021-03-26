//main kernel void
void kmain(void) {
    const char *str = "Kernel pog";  // string constant
    char *vidptr = (char *)0xb8000;  // video memory from here
    unsigned int i = 0;              // self-explatinory
    unsigned int j = 0;              // self-explanitory

    // clears screen because: 25lines,80columns and 2bytes each
    while (j < 80 * 25 * 2) {
        vidptr[j] = ' ';       // blank char
        vidptr[j + 1] = 0x07;  // atribute-byte - light grey on black
        j = j + 2;
    }
    j = 0;

    // writing string to video mem
    while (str[j] != '\0') {
        vidptr[i] = str[j];  // asci character
        vidptr[i + 1] = 0x07;
        //gives character black bg and light and light grey fg
        
        ++j;
        i=i+2;
    }
    return;
}

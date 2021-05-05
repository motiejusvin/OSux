#ifndef KERNEL_H
#define KERNEL_H

void kprint(char messg[],unsigned int line);
void clearc();
enum colors{
    WHITE = 0x0F,
    YELLOW = 0x0E,
    LIGHT_MAGENTA = 0x0D,
    LIGHT_RED = 0x0C,
    LIGHT_CYAN = 0x0B,
    LIGHT_GREEN = 0x0A,
    LIGHT_BLUE = 0x09,
    DARK_GRAY = 0x08,
    LIGHT_GRAY = 0x07,
    BROWN = 0x06,
    MAGENTA = 0x05,
    RED = 0x04,
    CYAN = 0x03,
    GREEN = 0x02,
    BLUE = 0x01,
    BLACK = 0x00
};

#endif

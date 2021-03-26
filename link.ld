OUTPUT_FORMAT(elf32-i386)
ENTRY(start)
SECTIONS
{
    . = 0x100000; /*code starts at 0x100000*/
    .text : { *(.text) } /*every "*.text" file.and text starts at . + text*/
    .data : { *(.data) }
    .bss  : { *(.bss) }
}

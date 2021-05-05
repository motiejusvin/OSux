CFLAGS= -fno-pie -m32 -ffreestanding -c 
ASMFLAGS = -i bootloader/

all: run

video.o: drivers/video/video.c
	gcc $(CFLAGS) $< -o video.o
kernel.bin: kernel.o kernelc.o video.o 
	ld -m elf_i386 -o $@ -Ttext 0x1000 $^ --oformat binary
kernel.o: kernel.asm
	nasm kernel.asm -f elf -o $@
kernelc.o: kernel.c
	gcc -fno-pie -m32 -ffreestanding -c kernel.c -o $@
mbr.bin: bootloader/boot16.asm
	nasm $(ASMFLAGS) $< -f bin -o $@ 
os-image.bin: mbr.bin kernel.bin
	cat $^ > $@
run: os-image.bin
	qemu-system-i386 -fda $<

clean:
	rm -r kernel.bin kernel.o kernelc.o video.o os-image.bin 



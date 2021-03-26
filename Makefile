all: kernel.asm kernel.c link.ld
	nasm -f elf32 kernel.asm -o kasm.o
	gcc -m32 -c kernel.c -o kernc.o
	ld -m elf_i386 -T link.ld -o kernel kasm.o kernc.o
	rm -r kasm.o kernc.o 
run: kernel
	qemu-system-i386 -kernel kernel

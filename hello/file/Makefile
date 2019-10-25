all: main.out

main.o: main.S
	nasm -f elf32 main.S

main.out: main.o
	ld -m elf_i386 main.o -o main.out

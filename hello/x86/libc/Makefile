all: main.out

main.o: main.S
	nasm -f elf32 main.S

main.out: main.o
	gcc -m32 -static -o main.out main.o

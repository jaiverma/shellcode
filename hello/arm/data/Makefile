all: main.out

main.o: main.S
	arm-linux-gnueabihf-as main.S -o main.o

main.out: main.o
	arm-linux-gnueabihf-ld main.o -o main.out

# Shellcode

This is junk.

## Misc

Dump `.text` section of binary to a file with `objcopy`. This is good for extracting shellcode out of a `.o` or `.out` file.

```sh
$ objcopy main.o --dump-section .text=main.text.bin
```


Run binary with `socat`.

```sh
$ socat TCP-LISTEN:1234,reuseaddr,fork EXEC:"./a.out"
```

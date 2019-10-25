global _start
section .text
    _start:
        mov eax, 4          ; syscall number for 'write'
        mov ebx, 1          ; fd = stdout
        mov ecx, message    ; char *buf
        mov edx, 13         ; len(buf)
        int 0x80
        mov eax, 1          ; 'exit' syscall
        xor ebx, ebx        ; return 0
        int 0x80

section .data
    message:
        db "Hello World", 10

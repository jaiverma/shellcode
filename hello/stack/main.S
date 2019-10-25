global _start
section .text
    _start:
        xor eax, eax
        push eax            ; push '\0' byte
        push 0x0a646c72     ; push 'hello world\n'
        push 0x6f77206f
        push 0x6c6c6568
        mov eax, 4          ; syscall number for 'write'
        mov ebx, 1          ; fd = stdout
        mov ecx, esp        ; char *buf
        mov edx, 12         ; len(buf)
        int 0x80
        mov eax, 1          ; 'exit' syscall
        xor ebx, ebx        ; return 0
        int 0x80

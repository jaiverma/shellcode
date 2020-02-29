extern puts
extern exit

global main 
section .text
    main:
        push ebp
        mov ebp, esp
        sub esp, 0x10
        mov esi, message
        mov [esp], esi
        call puts
        mov esi, 0
        mov [esp], esi
        call exit

section .data
    message:
        db "Hello World", 10

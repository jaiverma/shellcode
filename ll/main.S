extern malloc
extern free
extern printf
extern exit

global main
section .text
    new_node:
        push esi
        mov edi, [esp+0x8]
        push 8
        call malloc
        pop esi
        mov [eax], edi
        mov dword [eax+4], 0
        pop esi
        ret

    add_node:
        push esi
        mov edi, [esp+0x8]      ; linked list head
        mov esi, [esp+0xc]      ; pointer to new node
        cmp dword [edi], 0      ; if head is NULL
        je empty
        jmp not_empty
    empty:
        mov [edi], esi
        jmp finally
    not_empty:
        mov edi, [edi]
        cmp dword [edi+4], 0    ; if node->next == NULL
        je null
        jmp not_null
    null:
        mov [edi+4], esi
        jmp finally
    not_null:
        push esi                ; new node
        add edi, 4
        push edi                ; new head
        call add_node
        pop ecx
        pop esi
        jmp finally
    finally:
        pop esi
        ret

    print_ll:
        push ebp
        mov ebp, esp
        sub esp, 0x10
        mov edi, [ebp+8]
        cmp edi, 0
        je return
        mov dword [esp], format
        mov ecx, [edi]
        mov [esp+4], ecx
        call printf
        add edi, 4
        mov edi, [edi]
        mov [esp], edi
        call print_ll
        jmp return
    return:
        leave
        ret

    main:
        push ebp
        mov ebp, esp
        sub esp, 0x40
        mov dword [ebp-4], 0          ; linked list head
        mov esi, ebp;
        sub esi, 4

        mov dword [esp], 1
        call new_node

        mov [esp], esi                ; head
        mov [esp+0x4], eax            ; new node
        call add_node

        mov dword [esp], 2
        call new_node

        mov [esp], esi                ; head
        mov [esp+0x4], eax            ; new node
        call add_node

        mov dword [esp], 3
        call new_node

        mov [esp], esi                ; head
        mov [esp+0x4], eax            ; new node
        call add_node

        mov dword [esp], 4
        call new_node

        mov [esp], esi                ; head
        mov [esp+0x4], eax            ; new node
        call add_node

        mov ecx, [esi]
        mov [esp], ecx
        call print_ll

        mov dword [esp], 0
        call exit

section .data
    format:
        db "%d "

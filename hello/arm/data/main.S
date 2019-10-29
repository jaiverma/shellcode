.global _start
.text
    _start:
        mov r0, #1          @ r0 = int fd (stdout)
        ldr r1, =message    @ r1 = const char *buf
        ldr r2, =len        @ r2 = size_t count
        mov r7, #4          @ r7 = syscall number (4 = write)
        swi 0

        mov r0, #0          @ r0 = int error_code
        mov r7, #1          @ r7 = syscall number (1 = exit)
        swi 0

.data
    message:
        .asciz "hello world\n"
    len = .-message

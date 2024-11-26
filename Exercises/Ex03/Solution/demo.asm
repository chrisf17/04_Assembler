section .data
    myString db 'Hello, World!', 0xA   ; Define the string with a newline at the end

section .text
global _start

_start:
    ; sys_write system call
    mov eax, 4          ; sys_write system call number
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, myString   ; pointer to the string
    mov edx, 14         ; length of the string (including newline)
    int 0x80            ; call kernel

    ; sys_exit system call
    mov eax, 1          ; sys_exit system call number
    xor ebx, ebx        ; return 0 status
    int 0x80            ; call kernel

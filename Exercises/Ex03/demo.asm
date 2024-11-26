section .data
    myString db 'Hello, World!', 0xA, 0    ; Define your string here

section .text
global _start

_start:
    ; Write your code to print myString here

    

    ; Exit the program

    mov eax, 1 ; system call number (sys_exit)
    mov ebx, 0 ; exit code
    int 0x80 ; call kernel


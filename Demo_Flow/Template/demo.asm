section .data ; Data section

section .bss ; Uninitialized data section

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    xor ebx, ebx ; Clear the ebx register


    ; Exit the program
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
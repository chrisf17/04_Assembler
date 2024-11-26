section .data ; Data section
    
section .bss ; Uninitialized data section

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    ; TODO: Look at the readme.md file for the task

    mov eax, 2
    mov ebx, 5
    add ebx, eax
    ; Exit the program and check the result using echo $? (should be 7)
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
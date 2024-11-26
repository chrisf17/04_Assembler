section .data

section .bss

section .text

global _start

_start:
    ; Load the number 5 into eax
    
    ; Add the number 7 to eax

    ; Move eax value to ebx register - This will be the return value of the program
    
    ; Exit the program
    mov eax, 1
    int 0x80
    
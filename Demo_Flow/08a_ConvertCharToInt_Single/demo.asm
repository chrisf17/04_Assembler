section .data ; Data section
    number_char  db '4'

section .bss ; Uninitialized data section

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    ; TODO: What is the numeric value of number_char multiplied by 2
   
    movzx eax, byte [number_char]   ; Load the value of number_char into eax as a byte from a char variable using movzx (zero extend) 
    ;sub eax, 48
    sub eax, '0'                    ; Subtract the value of '0' from the value of number_char to get the numeric value
    imul eax, eax, 2                ; Multiply the value of eax by 2

    mov ebx, eax       ; Load the value of result into ebx for the return value

    ; Exit the program
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
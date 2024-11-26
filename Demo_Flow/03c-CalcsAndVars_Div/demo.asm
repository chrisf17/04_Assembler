section .data ; Data section

number dd 10 ; Declare a byte variable with the value 5
divisor dd 3 ; Declare a byte variable with the value 2

section .bss ; Uninitialized data section

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    xor ebx, ebx ; Clear the ebx register
    xor edx, edx ; Clear the edx register

    mov eax, [number]       ; Load the value of number into eax
    mov ebx, [divisor]      ; Load the divisor into ebx
    div ebx                 ; Multiply eax by ebx, result gets stored in eax

    mov ebx, eax       ; Load the value of result into ebx for the return value

_Exit:
    ; Exit the program and check the result using echo $? (should be 8)
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
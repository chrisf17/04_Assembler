section .data ; Data section

number dd 4 ; Declare a byte variable with the value 5
multiplier dd 2 ; Declare a byte variable with the value 2

section .bss ; Uninitialized data section
result resd 1 ; Declare a byte variable with the value 0

section .text ; Code section

global _start ; Entry point for the program

_start:

    mov eax, [number]       ; Load the value of number into eax
    mov ebx, [multiplier]   ; Load the multiplier into ebx
    ; TODO: Multiply eax by ebx, result gets stored in eax
    
    mov [result], eax       ; Move eax into result
    
    mov ebx, [result]       ; Load the value of result into ebx for the return value

    ; Exit the program and check the result using echo $? (should be 8)
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
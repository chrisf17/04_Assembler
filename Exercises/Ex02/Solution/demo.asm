section .data
    num1 dd 10      ; First number
    num2 dd 5       ; Second number

section .bss
    result resd 1     ; To store result

section .text

global _start

_start:
    ; Load value of num1 into eax
    mov eax, [num1]
    ; Add the value of num2 to eax
    add eax, [num2]
    
    ; Store the result in the result variable
    mov [result], eax

    
    
    ; Exit the program
    mov eax, 1
    mov ebx, [result]
    int 0x80
    
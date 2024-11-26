section .data
    num1 dd 10      ; First number
    num2 dd 5       ; Second number

section .bss
    result resd 1     ; To store result

section .text

global _start

_start:
    ; Load value of num1 into eax

    ; Add the value of num2 to eax

    ; Store the result in eax back to the result variable
    
    ; Exit the program with the result return code. Check its 15!
    mov eax, 1
    mov ebx, [result]
    int 0x80
    
section .data ; Data section

firstNum dd 3 ; Declare a byte variable with the value 5
secondNum dd 6 ; Declare a byte variable with the value 2

section .bss ; Uninitialized data section

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    mov eax, [firstNum]
    cmp eax, [secondNum]                      ; Compare the value in eax with value of secondNum
    jg .firstNumIsGreater                     ; Jump if greater
    mov ebx, [secondNum]                      ; Move the value of secondNum into ebx
          
    jmp _Exit                                 ; Jump to the exit label

.firstNumIsGreater:
    mov ebx, [firstNum]

_Exit:
    ; Exit the program and check the result using echo $? (should be 8)
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
section .data ; Data section

duration db 5 ; Declare a byte variable with the value 5

section .bss ; Uninitialized data section
result resb 1 ; Declare a byte variable with the value 0

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    ; TODO: Try this out in debug with gdb
    ; gdb ./demo
    ; break _start
    ; run
    ; si
    ; i r eax
    ; x &duration
    ; si
    ; i r eax
    mov eax, duration ; Move the address of the duration variable in the eax register
    
    mov eax, [duration]  ; Move the value of the duration variable in the eax register

    mov ebx, 7 ; Move the literal value 7 into the ebx register (Register im
    
    ; TODO: Use sub to subtract the values in eax and ebx and store the result in ebx
    
    ; TODO: Move the result in ebx to the result variable for no reason whatsoever!
    
    ; Exit the program and check the result using echo $? (should be 2)
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
section .data ; Data section

section .bss ; Uninitialized data section

section .text ; Code section

global _start ; Entry point for the program

_start:
    
   
    ; TODO: Store the value 2 in the eax register
   
    ; TODO: Store the value 5 in the ebx register

    
    ; TODO: Add the values in eax and ebx and store the result in ebx
    
    ; Exit the program and check the result using echo $? (should be 7)
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
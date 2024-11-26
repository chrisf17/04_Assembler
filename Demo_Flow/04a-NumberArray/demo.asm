section .data ; Data section

durations_array db 5, 3, 2, 9, 1 ; Declare a byte array variable with the sum 20
durations_length db 5 ; Declare a byte variable with the value 5 or use a sentinel such as 0

section .bss ; Uninitialized data section

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    xor ebx, ebx ; Clear the ebx register
    xor eax, eax ; Clear the eax register

    ; Add first and third durations_array elements together and store the result in ebx
    ; Result should be 14

    mov eax, ?   ; Load the durations_array element 0 into eax
    mov ebx, ?     ; Load the durations_array element 3 into ebx
 
    add ebx, eax   ; Add the value in eax to ebx
    
    ; Exit the program
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
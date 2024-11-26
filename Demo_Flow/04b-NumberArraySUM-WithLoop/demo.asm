section .data ; Data section

durations_array db 5, 3, 2, 9, 1 ; Declare a byte array variable with the sum 20
durations_length db 5 ; Declare a byte variable with the value 5 or use a sentinel such as 0

section .bss ; Uninitialized data section

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    xor ebx, ebx ; Clear the ebx register
    xor eax, eax ; Clear the eax register
    xor ecx, ecx ; Clear the ecx register
    
    ; TODO: Sum the values in the numbers array and store the result in the ebx register
    
    mov ecx, [durations_length]     ; Load the length of the array into ecx
    mov esi, durations_array        ; Load the address of the array into esi

.sum_loop:
    mov eax, [esi]            ; Load byte at [esi] into eax (could also use movzx or lodsb)
    add ebx, eax              ; Add the value in al to ebx
    inc esi                   ; Increment esi to point to the next byte in the array
    dec ecx                   ; Decrement ecx to keep track of remaining elements
    cmp ecx, 0
    jne .sum_loop

; alternative loop using lodsb   
;.sum_loop:
;    lodsb                     ; Load string byte at [esi] into al (lowest 8 bits of eax) and increment esi
;    add ebx, eax              ; Add the value in al to ebx
;    loop .sum_loop             ; Decrement ecx and repeat if ecx != 0
 
    
    ; Exit the program
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
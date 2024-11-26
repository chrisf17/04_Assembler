section .data
    numbers dd  20, 23, 35, 33   ; Array of double words

section .text
    global _start

_start:
    mov ecx, 4       ; Set ECX to the number of elements in the array
    xor ebx, ebx     ; Initialize sum register to zero
    mov esi, numbers ; Point ESI to the start of the numbers array

_loop_start:
    
    ; Write code to sum the numbers in the numbers array here
    ; Ensure the sum is returned in ebx

    ; Exit the program
    mov eax, 1
    int 0x80

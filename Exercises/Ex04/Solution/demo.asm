section .data
    numbers dd  20, 23, 35, 33   ; Array of double words

section .text
    global _start

_start:
    mov ecx, 4       ; Set ECX to the number of elements in the array
    xor ebx, ebx     ; Initialize sum register to zero
    mov esi, numbers ; Point ESI to the start of the array

_loop_start:
    add ebx, [esi]   ; Add the double word at [esi] to EBX
    add esi, 4       ; Move to the next double word in the array
    loop _loop_start ; Decrement ECX and loop if ECX != 0

    ; Continue with the rest of your program here
    ; EBX now contains the sum of the array elements

    ; Exit the program
    mov eax, 1
    int 0x80

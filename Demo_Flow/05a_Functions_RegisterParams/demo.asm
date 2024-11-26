section .data

section .text

global _start

_start:
    mov eax, 8       ; Load first parameter into EAX
    mov ebx, 4       ; Load second parameter into EBX
    call addition

    ; EAX now contains the result
    ; For demonstration, move the result to EBX
    mov ebx, eax

    ; Exit the program
    mov eax, 1        ; System call number for sys_exit
    int 0x80          ; Call the kernel

addition:
    ; Adds EAX and EBX, result in EAX
    ; eax is used to store the return value
    add eax, ebx 
    ret

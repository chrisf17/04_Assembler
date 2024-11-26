section .data ; Data section

section .bss ; Uninitialized data section

section .text ; Code section

global _start ; Entry point for the program

_start:
    

    push 8    ; pass 8 as the first parameter
    push 4    ; pass 4 as the second parameter
    call addition

    add esp, 8

    mov ebx, eax
    ; Exit the program
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel

addition:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]   ; Load the first parameter into eax
    add eax, [ebp + 12]  ; Add the second parameter to eax

    pop ebp
    ret
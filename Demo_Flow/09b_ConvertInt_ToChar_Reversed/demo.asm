section .data ; Data section
    number dd 123               ; Number to convert

section .bss ; Uninitialized data section
    output_char resb 2          ; Buffer to store the digit + newline

section .text ; Code section

global _start ; Entry point for the program

_start:
    mov eax, [number]    ; Load the number into EAX

.again:
    mov ebx, 10                 ; Divisor for decimal conversion
    xor edx, edx                ; Clear EDX for division
    div ebx                     ; Divide EAX by 10 (quotient in EAX, remainder in EDX)

    add edx, 48                 ; Convert remainder (EDX) to ASCII 
    mov [output_char], dl       ; Store the ASCII character (dl is the lower 8 bits of edx register)
    mov [output_char+1], byte 0xA ; Add newline character
    
    push eax                   ; Save the quotient on the stack because we will overwire it in print statement below

    ; Print the character
    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 is stdout
    mov ecx, output_char        ; Address of the character to print
    mov edx, 2                  ; Length of the message
    int 0x80                    ; Call the kernel

    pop eax                     ; Restore the quotient from the stack after we have printed the character

    cmp eax, 0                  ; Check if EAX (quotient) is zero
    jne .again                   ; If not zero, repeat the loop

.done:
    ; Exit the program
    mov eax, 1                  ; System call number for exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call the kernel

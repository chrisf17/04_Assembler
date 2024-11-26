section .data ; Data section
    number dd 2468               ; Number to convert

section .bss ; Uninitialized data section
   
section .text ; Code section

global _start ; Entry point for the program

_start:
    mov eax, [number]    ; Load the number into EAX

    push 0xA
    mov esi, 1

.divide_loop:
    mov ebx, 10                ; Divisor for decimal conversion
    xor edx, edx                ; Clear EDX for division
    div ebx                     ; Divide EAX by 10 (quotient in EAX, remainder in EDX)
                                ; eax = eax // 10   (quotient)
                                ; edx = eax % 10   (remainder) 
    add edx, 48                 ; Convert remainder (EDX) to ASCII
    
    push edx                    ; Save the quotient on the stack
    inc esi                     ; Increment the counter to keep track of the number of digits
    cmp eax, 0                  ; Check if EAX (quotient) is zero when it is we are done
    jne .divide_loop             ; If not zero, repeat the loop

.print_loop: ; Print the digits on the stack in reverse order

    mov eax, 4                  ; System call number for sys_write
    mov ebx, 1                  ; File descriptor 1 is stdout
    mov ecx, esp                ; Address of the character to print at the top of the stack
    mov edx, 1                  ; Length of the message
    int 0x80                    ; Call the kernel

    pop eax                     ; pop the printed character off the stack
    dec esi                     ; Decrement the character counter
    cmp esi, 0                  ; Check if we have printed all the characters
    jne .print_loop

.done:

    ; Print the character

   ; Exit the program
    mov eax, 1                  ; System call number for exit
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call the kernel

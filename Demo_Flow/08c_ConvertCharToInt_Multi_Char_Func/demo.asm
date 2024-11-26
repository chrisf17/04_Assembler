section .data ; Data section
    number_string db '123', 0 ; Null-terminated string
    number dd 0              ; Variable to store the result (optional)

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    mov eax, number_string   ; Move the address of the string into EAX
    call stoi                ; Call the stoi function to convert the string to an integer
    mov [number], eax        ; Store the converted value in the number variable

    mov ebx, eax

_exit:

    ; For demonstration, let's exit with the converted value as the exit code
    mov eax, 1               ; System call number for sys_exit
    int 0x80                 ; Call the kernel

    
stoi:

    push ebx                 ; Preserve EBX on the stack
    push esi                 ; Preserve ESI on the stack

    mov esi, eax             ; Move the address of the string into ESI
    xor ebx, ebx             ; Clear EBX to hold the accumulated integer value

.convert_loop:
    movzx eax, byte [esi]    ; Load the next character into EAX and zero-extend
    cmp eax, 0               ; Check if it's the null terminator
    je .conversion_done       ; If null terminator, exit loop

    sub eax, '0'             ; Convert ASCII character to digit

    imul ebx, ebx, 10        ; Multiply accumulated value by 10
    add ebx, eax             ; Add the current digit to accumulated value

    inc esi                  ; Move to the next character in the string
    jmp .convert_loop         ; Repeat the loop

.conversion_done:
    
    mov eax, ebx             ; Move the accumulated value into EAX
    
    pop esi                  ; Restore ESI from the stack
    pop ebx                  ; Restore EBX from the stack    

    ret    


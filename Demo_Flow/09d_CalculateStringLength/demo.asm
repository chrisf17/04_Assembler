section .data ; Data section
    number_string db 'Hello World', 0 ; Null-terminated string

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    mov eax, number_string   ; Move the address of the string into EAX
    call strlen                ; Call the stoi function to convert the string to an integer
 
    mov ebx, eax

_exit:

    ; For demonstration, let's exit with the converted value as the exit code
    mov eax, 1               ; System call number for sys_exit
    int 0x80                 ; Call the kernel

    
strlen:

    push ebx                 ; Preserve EBX on the stack
    push esi                 ; Preserve ESI on the stack
    push edi                 ; Preserve EDI on the stack

    mov esi, eax             ; Move the address of the string into ESI
    mov edi, eax
    xor ebx, ebx             ; Clear EBX to hold the accumulated integer value

.loop:
    movzx eax, byte [esi]    ; Load the next character into EAX and zero-extend
    cmp eax, 0               ; Check if it's the null terminator
    je .strlen_done       ; If null terminator, exit loop

    inc esi                  ; Move to the next character in the string
    jmp .loop         ; Repeat the loop

.strlen_done:
    
    sub esi, edi
    mov eax, esi             ; Move the accumulated value into EAX
    
    pop edi
    pop esi                  ; Restore ESI from the stack
    pop ebx                  ; Restore EBX from the stack    

    ret    


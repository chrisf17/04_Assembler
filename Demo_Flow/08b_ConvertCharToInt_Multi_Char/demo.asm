section .data ; Data section
    number_string db '123', 0 ; Null-terminated string
    number dd 0              ; Variable to store the result (optional)

section .text ; Code section

global _start ; Entry point for the program

_start:
    mov esi, number_string   ; Point ESI to the start of the string
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
    ; At this point, EBX contains the integer value converted from the string
    ; You can store it in 'number' if needed
    
    mov [number], ebx

    ; For demonstration, let's exit with the converted value as the exit code
    mov eax, 1               ; System call number for sys_exit
    mov ebx, ebx             ; Use the converted number as the exit code
    int 0x80                 ; Call the kernel


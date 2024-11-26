section .data ; Data section

greeting db 'Hello, Welcome to Deep Mind!', 0xA, 0xA, 0x  ; The string to print with a newline character and a 0 or Null terminator character to mark the end of the string
name_query db 'What is your name? ', 0x  ; The string to print with a newline character and a 0 or Null terminator character to mark the end of the string
second_greeting db 0xA, 'Hello, ', 0x  ; The string to print with a newline character and a 0 or Null terminator character to mark the end of the string

section .bss ; Uninitialized data section
firstName resb 100 ; Reserve 100 bytes for the first name

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    xor ebx, ebx ; Clear the ebx register

    ; Print greeting to the console
    mov eax, 4          ; System call number for sys_write
    mov ebx, 1          ; File descriptor 1 is stdout
    mov ecx, greeting   ; Pointer to the message to write
    mov edx, 30         ; Length of the message in chars 
    int 0x80            ; Call the kernel

    ; Print name query to the console
    mov eax, 4          ; System call number for sys_write
    mov ebx, 1          ; File descriptor 1 is stdout
    mov ecx, name_query   ; Pointer to the message to write
    mov edx, 19         ; Length of the message in chars 
    int 0x80            ; Call the kernel

    ; Read name from stdin
    mov eax, 3          ; System call number for sys_read
    mov ebx, 0          ; File descriptor 0 is stdin
    mov ecx, firstName   ; Pointer to the buffer to read into
    mov edx, 100        ; Maximum number of bytes to read
    int 0x80            ; Call the kernel

    ; Print second greeting to the console
    mov eax, 4          ; System call number for sys_write
    mov ebx, 1          ; File descriptor 1 is stdout
    mov ecx, second_greeting   ; Pointer to the message to write
    mov edx, 9         ; Length of the message in chars 
    int 0x80            ; Call the kernel

    ; Print name to the console
    mov eax, 4          ; System call number for sys_write
    mov ebx, 1          ; File descriptor 1 is stdout
    mov ecx, firstName   ; Pointer to the message to write
    mov edx, 100         ; Length of the message in chars 
    int 0x80            ; Call the kernel

    ; Exit the program
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
section .data ; Data section

message db 'Hello, World!', 0xA, 0x  ; The string to print with a newline character and a 0 or Null terminator character to mark the end of the string
message_chars db 'H', 'e', 'l', 'l', 'o', ',', ' ', 'W', 'o', 'r', 'l', 'd', '!', 0xA, 0x ; The string to print with a newline character and a 0 or Null terminator character to mark the end of the string
section .bss ; Uninitialized data section

section .text ; Code section

global _start ; Entry point for the program

_start:
    
    xor ebx, ebx ; Clear the ebx register

    ; Print "Hello, World!" to the console
    mov eax, 4          ; System call number for sys_write
    mov ebx, 1          ; File descriptor 1 is stdout
    mov ecx, message   ; Pointer to the message to write
    mov edx, 11         ; Length of the message in chars (not quite long enough!)
    int 0x80            ; Call the kernel

    ; Exit the program
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
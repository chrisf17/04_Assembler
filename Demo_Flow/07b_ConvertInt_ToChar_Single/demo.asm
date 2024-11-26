section .data ; Data section
    number  db 4

section .bss ; Uninitialized data section
    output_char resb 2

section .text ; Code section

global _start ; Entry point for the program

_start:
    
  
    movzx eax, byte [number]        ; Load the value of duration into eax as a byte from a char variable using movzx (zero extend) 
    inc eax                         ; Increment the value of eax by 1
    ; add eax, 48
    add eax, '0'                    ; Add the value of '0' to number to get the ASCII value

    mov [output_char], al           ; Move the value of eax into output_char
    mov [output_char+1], byte 0xA   ; Add a newline character to the end of the string


    ; Print output_char to the console
    mov eax, 4              ; System call number for sys_write
    mov ebx, 1              ; File descriptor 1 is stdout
    mov ecx, output_char    ; Pointer to the message to write
    mov edx, 2              ; Length of the message in chars 
    int 0x80                ; Call the kernel


    ; Exit the program
    mov eax, 1  ; System call number for exit
    int 0x80    ; Call the kernel
    
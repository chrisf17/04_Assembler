section .data
    myString db 'Hello, world!', 0  ; Null-terminated string

section .text
global _start


_start:
    
   ; Calculate the leng of myString using a strLen function you define
   ; Pass myString to the function in eax
   ; The length of myString should also be returned in eax

    ;EBX, ESI, EDI, EBP

    ; Print myString
    mov edx, eax     ; Mov the Length of myString to edx
    mov eax, 4       ; System call number for write
    mov ebx, 1       ; File descriptor (stdout)
    mov ecx, myString ; Address of myString    
    int 0x80         ; Call the kernel

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80 

   ; Print myString
    mov edx, eax     ; Mov the Length of myString to edx
    mov eax, 4       ; System call number for write
    mov ebx, 1       ; File descriptor (stdout)
    mov ecx, myString ; Address of myString    
    int 0x80         ; Call the kernel

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data ; Data section

section .bss ; Uninitialized data section

section .text ; Code section

global _start ; Entry point for the program

_start:
    
     mov ebx, 5   ; Store the value 5 in the ebx register this stores the return code for the process
                 ; After the process is done, the return code can be checked using echo $?

    ; Exit the program and check the result using echo $? (should be 5)
    mov eax, 1  ; System call number for exit
    int 0x80    ; Interrupt Vector to switch from User Mode to Kernel mode
                ; eax is checked which tells the Kernel to execute the exit syscall
    
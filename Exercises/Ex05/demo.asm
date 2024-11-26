section .data

section .text
global _start


_start:

    ; Pass parameters
    mov eax, 5  ; First number
    mov ebx, 10 ; Second number

    call add_numbers
    ; After call eax should contain the sum result

    mov ebx, eax  ; mov result to ebx as return code

    ; Exit the program
    mov eax, 1
    
    int 0x80


; Function: add_numbers
; Description: Adds two integers
; Parameters: eax - first integer, ebx - second integer
; Returns: sum in eax

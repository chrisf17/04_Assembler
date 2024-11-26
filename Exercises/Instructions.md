# Exercise - NASM Assembler Programming

## Exercises General Instructions

* You will be working through as many of the Exercises as you can manage.
* There are likely more exercises than you will be able to complete in the time
* Complete as many as you can and leave the rest for self study

#### Instructions

1. Open Each exercise folder (eg Ex01) in a terminal window
1. Type ```wsl``` to load Windows subsystem for Linux (WSL)
1. Type ```make``` to compile and link the source
1. Run the code by typing ```./demo```
1. Interrogate the return code by typing ```echo $?```

---
### Exercise 1: Basic Literal Arithmetic
**Objective:** Create a program in NASM that adds two numbers and returns the result. 

Look at the starter code below found in ```Ex01\demo.asm```

* Follow the comment instructions (prefixed with ```;```) and add code to satisfy requirements
* You can consult the solution in the Solution folder
* Build and execute the code using the instructions above in a WSL console

---
### Exercise 2: Basic Static Data Arithmetic
**Objective:** Create a program in NASM that adds two numbers and returns the result. 

In this exercise you will perform an add operation using two data value stored in static memory.

The data values are declared as:

```asm
section .data
    num1 dd 10      ; First number
    num2 dd 5       ; Second number

section .bss
    result resd 1     ; To store result
```

Where the 
* ```.data``` section stores initialised data (with an initial value) and
* ```.bss``` section stores unitialised data (no initial value)

You will need to use direct addressing because you want the contents of the data variable num1 not the address of the variable

```nasm
mov eax, num1      ; Copies the address of num1 into register eax
mov eax, [num1]    ; Copies the value of num1 (eg 10) into register eax
```

Look at the starter code found in ```Ex02\demo.asm```

* Follow the comment instructions and add code to satisfy requirements
* You can consult the solution in the Solution folder
* Build and execute the code using the instructions above in a WSL console

---
### Exercise 3: Print a Custom String to Console in NASM

**Objective:**
Write a NASM assembly program to print a predefined string to the console.

Access the code in Ex01\demo.asm and follow the build and run instructions above

**Requirements:**
1. Define a string buffer in the data section of your program.
2. Use the `sys_write` system call to print the string to the console.
3. Ensure the program exits cleanly using the `sys_exit` system call.

**Steps:**
1. **Setup the Data Section:**
   - Define a string in the `.data` section of your program.
   - Remember to include the null character at the end of your string.

2. **Write the Code Section:**
   - Use the `_start` label for your entry point.
   - Load the necessary system call numbers and arguments into the appropriate registers.
   - Make the `sys_write` system call to print your string.
   - Use the `sys_exit` system call to exit the program.

3. **System Calls:**
   - For `sys_write`, use system call number `4`. Load the file descriptor for stdout (`1`) into `ebx`, the pointer to your string into `ecx`, and the string length into `edx`.
   - For `sys_exit`, use system call number `1`. Load the exit code (typically `0`) into `ebx`.


4. **Build, Run and Verify:**
   - Build and Run your compiled program and verify that it prints the string to the console.

**Example Template:**
```nasm
section .data
    myString db 'Hello, World!', 0xA, 0    ; Define your string here

section .text
global _start

_start:
    ; Write your code to print the string here

    ; Exit the program
```

**Expected Outcome:**
The students should be able to write a program that prints "Hello, World!" or their chosen string to the console and exits cleanly.

**Hints:**
- Remember the importance of the null character at the end of your string for proper string handling.
- Pay attention to the correct use of registers for system calls.
- Ensure proper cleanup and program exit.


---
### Exercise 4: Data Handling
**Objective:** Manipulate a data array.

Look at the code below ...

```asm
section .data
    array dd 1, 2, 3, 4, 5  ; Array of integers

section .text
global _start

_start:
    ; Move data between registers
    mov eax, 5
    mov ebx, eax

    ; Array manipulation
    
    ; Read the first element of array into ebx
    mov ebx, [array]

    ; add the second element of array into ebx    
    add ebx, [array]

    ; Exit the program
    mov eax, 1
    int 0x80
```

Now change the code so that:
1. You add the second element of the array to ebx giving a result of 3 in the return code
    * Build, Execute and Verify
1. You add the fifth element of the array to ebx giving a result of 6 in the return code
    * Build, Execute and Verify


---
### Exercise 5: Use loop to sum the values in an array

Follow the instructions in Ex04\demo.asm

* Build and run
* The return code from the running app should be ```111```

## Challenge

### Exercise 6: Addition Function
**Objective:** Write a function 

Write a function called add_numbers that takes two integer parameters and returns their sum.

* Paramater passing is via registers eax and ebx
* return result in eax

1. Use Ex06\demo.asm
2. Result should be 15

---
### Exercise 7: Write a strLen function

1. Using Ex07\demo.asm
2. Complete the code by writing and calling a strLen function to calculate the length of null terminated strings
3. Folowing the comment instructions

There is no provided solution for this exercise 
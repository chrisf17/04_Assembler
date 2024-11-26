# Using GDB

**`gdb` (GNU Debugger)** is a powerful tool for debugging programs, especially those written in low-level languages like assembly. It allows you to inspect and control the execution of a program, set breakpoints, step through code, examine memory, registers, and more. It's particularly useful in malware analysis and reverse engineering, where understanding the low-level behavior of a program is crucial.

### Basic `gdb` Workflow

Let's assume you're working with a NASM x86 32-bit assembly program called `example_program`. Here's how to use `gdb` to analyze and debug it.

### 1. **Compile the Assembly Code with Debug Information**

To use `gdb`, you need to compile your program with debugging information. In NASM, this is done by passing the `-g` flag during assembly and linking.

```bash
nasm -f elf32 -g -F dwarf -o example_program.o example_program.asm
ld -m elf_i386 -o example_program example_program.o
```

- **`-g`**: Enables debugging information.
- **`-F dwarf`**: Specifies the format of the debug information (DWARF format).

### 2. **Start `gdb`**

Start `gdb` with the program you want to debug:

```bash
gdb demo
```

This opens the `gdb` interface with your program loaded.

### 3. **Common `gdb` Commands**

Once inside `gdb`, you can use various commands to interact with and analyze the program:

#### a. **Run the Program**

To run the program inside `gdb`, use the `run` command:

```bash
(gdb) run
```

This will start executing the program. If your program crashes (e.g., with a segmentation fault), `gdb` will stop and show you the point where the crash happened.

#### b. **Setting Breakpoints**

You can set breakpoints to pause execution at specific points in the program. This allows you to examine the state of the program (registers, memory, etc.) before or after certain instructions.

- Set a breakpoint at a specific function or label:

```bash
(gdb) break _start
```

This will stop execution at the `_start` label in your program.

- Set a breakpoint at a specific memory address:

```bash
(gdb) break *0x80483f0
```

This will break at memory address `0x80483f0`.

#### c. **Stepping Through the Program**

Once a breakpoint is hit, you can step through the program instruction by instruction to observe its behavior:

- **`stepi`** or **`si`**: Step one instruction, including stepping into functions.

```bash
(gdb) stepi
```

- **`nexti`** or **`ni`**: Step over the next instruction (skip over function calls).

```bash
(gdb) nexti
```

#### d. **Examining Registers**

You can inspect the contents of CPU registers, such as `eax`, `ebx`, `ecx`, and `edx`, to see how data is being manipulated at a low level:

```bash
(gdb) info registers
```

This will display the current values of all registers.

#### e. Examining variables

```bash
(gdb) info variables
```
Displaying:
```bash
All defined variables:

Non-debugging symbols:
0x0804a000  age_in_years
0x0804a001  __bss_start
0x0804a001  _edata
0x0804a004  _end
```
#### f. **Examining Memory**

You can view the contents of memory at specific addresses. This is useful for inspecting variables or following pointers.

- Display memory at a specific address:

```bash
(gdb) x/10x 0x80483f0
```

This will display 10 words (32-bit values) of memory starting at address `0x80483f0` in hexadecimal.

- View memory in ASCII (useful for inspecting strings):

```bash
(gdb) x/s 0x8048500
```

### 4. **Debugging a Segmentation Fault**

If your program crashes with a segmentation fault (segfault), `gdb` will automatically stop at the point of the fault. You can use `gdb` to investigate why the fault occurred:

- **Run the Program**:

```bash
(gdb) run
```

If a segfault occurs, `gdb` will display a message like:

```text
Program received signal SIGSEGV, Segmentation fault.
```

- **Check the Current Instruction**:

You can inspect the current instruction and memory address that caused the segfault:

```bash
(gdb) info registers
```

This will show you the values of the registers, and you can check if an invalid memory access occurred.

- **Examine Memory**:

If the segfault was caused by an invalid memory access, you can use the `x` command to check what is at the address that caused the fault.

### 5. **Using Disassembly**

You can disassemble parts of the program to see the actual assembly instructions being executed:

- **Disassemble the Current Function**:

```bash
(gdb) disassemble
```

This will show the assembly code of the current function or label.

- **Disassemble a Specific Memory Range**:

```bash
(gdb) disassemble 0x80483f0, 0x8048400
```

This will disassemble the code between the specified memory addresses.

### 6. **Analyzing System Calls in Assembly Programs**

If your NASM program makes system calls (like file I/O or process management), you can examine the `eax` register before each `int 0x80` instruction to identify which system call is being made.

For example, if you have the following in your NASM code:

```nasm
mov eax, 4    ; sys_write
mov ebx, 1    ; file descriptor (stdout)
mov ecx, msg  ; message to write
mov edx, len  ; message length
int 0x80      ; make the system call
```

You can use `gdb` to stop at the `int 0x80` instruction, inspect `eax` (to confirm the system call number), and check the arguments in `ebx`, `ecx`, and `edx`.

```bash
(gdb) break *0x80483f7  # Break at the address of the system call
(gdb) run
(gdb) info registers     # Check the values of eax, ebx, ecx, and edx
(gdb) stepi              # Step over the system call
```

### 7. **Exiting `gdb`**

To exit `gdb`, use the `quit` command:

```bash
(gdb) quit
```

You will be prompted to confirm if the program is still running.

### Summary of Common `gdb` Commands

- **run**: Start the program.
- **break <location>**: Set a breakpoint at a function, label, or memory address.
- **stepi (si)**: Step through the program one instruction at a time.
- **nexti (ni)**: Step over the next instruction.
- **info registers**: Show the values of CPU registers.
- **x /<n><format> <address>**: Examine memory.
- **backtrace**: Show the current call stack.
- **disassemble**: Disassemble the current function or memory range.
- **quit**: Exit `gdb`.

### Practical Example: Debugging a NASM Program with a Segfault

```nasm
section .text
    global _start

_start:
    ; Cause a segmentation fault by writing to an invalid address
    mov dword [0x0], 123  ; Writing to address 0x0, which is illegal
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; status 0
    int 0x80              ; syscall
```

#### Steps:

1. **Compile and Link**:

```bash
nasm -f elf32 -g -F dwarf -o segfault.o segfault.asm
ld -m elf_i386 -o segfault segfault.o
```

2. **Run in `gdb`**:

```bash
gdb ./segfault
(gdb) run
```

Output:

```text
Program received signal SIGSEGV, Segmentation fault.
0x08048060 in _start ()
```

3. **Analyze the Registers**:

```bash
(gdb) info registers
```

Check the instruction and memory address that caused the segmentation fault.

4. **Fix the Code**:

You now know that writing to `0x0` caused the fault, so you can adjust your program accordingly.

### Conclusion

`gdb` is an indispensable tool for debugging NASM assembly programs. It allows you to:
- **Set breakpoints** at specific instructions.
- **Step through the program** one instruction at a time.
- **Inspect the contents of registers and memory**.
- **Identify segmentation faults** and other errors.

By using `gdb`, you can gain deep insights into the behavior of your assembly programs, making it easier to diagnose and fix issues.
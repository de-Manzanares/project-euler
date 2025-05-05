; Project Euler - Even Fibonacci Numbers
; https://projecteuler.net/problem=2
; NASM, x86-64 Linux

section .data

SYS_exit      equ 60
EXIT_SUCCESS  equ 0

LIMIT equ 4000000

section .text

global _start
_start:

initRegisters:
mov r8,   0       ; fib_n
mov r9,   1       ; fib_n+1
mov r10,  0       ; tmp
mov r11, LIMIT    ; limit
mov r12,  0       ; sum

nextFib:
mov r10, r8       ; sum into temp
add r10, r9
mov r8, r9        ; shift r10>r9>r8
mov r9, r10       ; r9 holds current fib 

testLimit:
cmp r9, r11       ; if current fib >= LIMIT,
jge exit          ; exit

testParity:
bt r9, 0
jnc isEven
jmp nextFib

isEven:
add r12, r9
jmp nextFib

exit:
mov rax, SYS_exit
mov rdi, EXIT_SUCCESS
syscall

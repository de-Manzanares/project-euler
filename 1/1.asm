; Project Euler - Multiples of 3 or 5
; https://projecteuler.net/problem=1
; NASM, x86-64 Linux

section .text

global _start
_start:

xor   r9,   r9    ; result 
mov   rcx,  999

sumLoop:
jmp   checkThree
jmp   checkFive
afterAdd:
loop  sumLoop
jmp   exit

checkThree:
mov   r8d,  3
xor   edx,  edx 
mov   eax,  ecx 
div   r8d 
cmp   edx,  0
je    add
jmp   checkFive
  
checkFive:
mov   r8d,  5
xor   edx,  edx 
mov   eax,  ecx 
div   r8d 
cmp   edx,  0
je    add
jmp   afterAdd

add:
add   r9,   rcx
jmp   afterAdd 

exit:
mov     rax, 60
mov     rdi, 0
syscall


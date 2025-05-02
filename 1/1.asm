section .data

sum dq 0

section .text

global _start
_start:

  mov ecx, 999

sumLoop:
  jmp checkThree
  jmp checkFive
  afterAdd:
    loop sumLoop

jmp exit

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
  add [sum], ecx
  jmp afterAdd 

exit:
  mov     rax, 60
  mov     rdi, 0
  syscall


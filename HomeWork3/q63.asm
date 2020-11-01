;PROGRAM TEMPLATE
.model small
.stack 100h
.data

A   dw   20,30,50,100
n equ 4
sum dw 0


.code
mov ax,@data
mov ds,ax
mov si,0
loopy:
cmp si, n
je sof
mov ax,a[si]
add sum,ax
jo sof
jc sof
inc si
jmp loopy
sof:
mov cx,sum
.exit   
end    

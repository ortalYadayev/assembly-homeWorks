.model small
.stack 100h
.data

A   db   25,30,100,100
n equ 4
sum db 0


.code
mov ax,@data
mov ds,ax
mov si,0
loopy:
cmp si, n
je sof
mov al,a[si]
add sum,al
jo sof
jc sof
inc si
jmp loopy
sof:
mov bl,sum
.exit   
end    

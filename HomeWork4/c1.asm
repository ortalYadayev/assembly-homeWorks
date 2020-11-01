.model  small
.stack   100h
.data
a db 00000000b

.code
mov ax,@data
mov ds,ax
mov dx,0
mov bx,0
looploop:
	cmp bx,8
	je next
	ror a,1
	jc cont
	inc dx
cont:
	inc bx
	jmp looploop
next:
	mov	ah,	2
	add dx,48
	int	21h
.exit
end
.model  small
.stack   100h
.data
num  dw 3243
.code
mov	ax,	@data
mov	ds,	ax
mov dx,num
push dx
call printnum

.exit
printnum proc near	
push bp
mov bp,sp
mov	ax,	[bp+4]
mov	bx,	10
mov	cx,	0
mov si, ax
next:	cwd
	idiv	bx
	cmp	dx,	0
	jge	cont
	neg	dx
cont:
	add	dl,	48
	push       dx
	inc	cx
    cmp	ax,	0
	jz	sof
	jmp         next
sof:	
	cmp	si,	0
	jge	soff
	push '-'
	inc	cx
soff:
	cmp       cx,0
	jz           ext
	pop	dx
	mov	ah,2
	int	21h
	dec	cx
	jmp 	soff
ext:
pop bp
ret 2
printnum endp

end
	
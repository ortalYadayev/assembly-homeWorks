.model  small
.stack   100h
.data
a db 10,-15,8
n equ 3

numS db  7 dup(' '),'$'

.code
mov ax,@data
mov ds,ax
	
mov di,0
loopi:
	mov ah,0
	mov al,0
	cmp di,n-1
	je next
	mov ah,a[di]
	mov al,a[di+1]
	cmp ah,al
	jg cont
	inc di
	jmp loopi
cont:
	mov a[di],al
	mov a[di+1],ah
	inc di
	jmp loopi
	
next:
	mov di,0 ;points to a
	mov cl,0 ;counter
	
myLoop:
	mov	al,	a[di]
	mov	bl,	10
	mov	si,	offset numS+5
	
	cmp al,0
	jge next1
	neg al

next1:
	mov ah,0
	div	bl
	add	ah,	48
	mov	[si],	ah
	dec	si
    cmp	al,	0
	jne	next1
	
	cmp	a[di],0
	jge	sof
	mov	byte ptr[si],	'-'
	dec si
	
sof:
	inc si
	mov	ah,	9
	mov	dx,	si
	int	21h
	
	
	inc cl
	add di,1
	cmp cl,N
	jne myLoop
.exit
end
;PROGRAM TEMPLATE
.model small
.stack 100h
.data

A   db   -12,-7,57,20
n equ 4
numS db  4 dup(' '),'$'
x db ' ','$'

.code
mov ax,@data
mov ds,ax
mov si,0
loopi:
	mov ah,0
	mov al,0
	cmp si,n-1
	je next
	mov al,a[si]
	mov ah,a[si+1]
	cmp al,ah
	ja cont
	inc si
	jmp loopi
cont:
	mov a[si+1],al
	mov a[si],ah
	inc si
	jmp loopi
next:

	mov di,0
	mov cl,0
	mov si,0
myLoop:
	mov	al,	a[di]
	mov	bl,	10
	mov	si,	offset numS+3
next1:	
	mov ah,0
	div	bl
	add	ah,	48
	mov	[si],	ah
	dec	si
    cmp	al,	0
	jne	next1
	mov bh, a[di]
	inc si
	mov	dx,	si
	mov	ah,	9
	int	21h
	cmp cl,n-1
	je label1
	mov	dx,	offset x
	mov	ah,	9
	int	21h
label1:
	
	inc cl
	inc di
	cmp cl,N
	jne myLoop
.exit   
end    

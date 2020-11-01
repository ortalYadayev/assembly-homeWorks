.model small
.stack 100h
.data

A   db   255,3,5,9
B	db	-11,4,6,8
n1 equ 4
n2 equ 4
n3 equ n1+n2
C db (n3) dup (' ')
numS db  4 dup(' '),'$'
x db ' ','$'

.code
mov ax,@data
mov ds,ax

mov si,0;a pointer
mov di,0;b pointer
mov bx,0;c pointer
mov cx,0;counter
loopy:
	cmp cx,n3
	je next1
	cmp si, n1
	je BC
	cmp di,n2
	je AC
	mov al,a[si]
	mov ah,b[di]
	cmp al,ah
	jg BC
AC:
	mov c[bx],al;2nd iterration check
	inc cx
	inc bx
	inc si
	jmp loopy
BC:
	mov c[bx],ah
	inc cx
	inc bx
	inc di
	jmp loopy

next1:
	mov bh, n3
	add bh , n3
	mov di,0;set di pointer
	mov cl,0 ;set cl counter 
	mov si,0;changed
	myLoop:
	mov	al,	[di];al=a[di]
	mov	bl,	10;bx=10
	mov	si,	offset numS+3;
	
	cmp al,0
	jge next
	neg al

next:	
	
	mov ah,0
	cbw
	idiv	bl;lost in stack
	add	ah,	48;dl
	mov	[si],	ah
	dec	si
    cmp	al,	0
	jne	next
	
	
	cmp	byte ptr [di],0
	jge	sof
	mov	byte ptr[si],	'-'
	dec si
	
sof:
	inc si
	mov	dx,	si
	mov	ah,	9
	int	21h
	dec bh
	cmp cl,bh
	je label1
	mov	dx,	offset x
	mov	ah,	9
	int	21h
	label1:
	inc bh
	inc cl
	inc di
	cmp cl,bh
	jne myLoop
.exit   
end    

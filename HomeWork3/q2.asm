.model  small
.stack   100h
.data
num dw  -32768
numS db  6 dup(' '),'$'
 
.code
	mov	ax,	@data
	mov	ds,	ax

	mov	ax,	num
	mov	bx,	10
	mov	si,	offset numS+5

next:	
	mov dx,0
	div	bx
	add	dl,	48
	mov	[si],	dl
	dec	si
    cmp	ax,	0
	jne	next
	
	inc si
	mov	ah,	9
	mov	dx,	si
	int	21h
	.exit
end
	
		
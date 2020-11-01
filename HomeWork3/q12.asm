;PROGRAM TEMPLATE
.model small
.stack 100h
.data
	A   db   '     This      is     a          test     $'
	B   db   100 dup('$')

.code
	mov ax,@data
	mov ds,ax
	cmp a[si],' '
	jne cont1
myloop:
	cmp a[si],'$'
	je next
	cmp a[si],' '
	je cont
	inc si
	jmp myloop
cont:
	cmp a[si+1],' '
	jne cont1
	inc si
	jmp myloop
cont1:
	cmp a[si+1],'$'
	je next
	inc cx
	inc si
	jmp myloop
next:

.exit   
end    

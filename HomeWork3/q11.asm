;PROGRAM TEMPLATE
.model small
.stack 100h
.data
	A   db   '     This      is     a          test     $'
	B   db   100 dup('$')

.code
	mov ax,@data
	mov ds,ax
	mov cx,0
	mov si,0
myloop:
	cmp A[si],'$'
	je next
	cmp A[si],' '
	je cont
	inc si
	jmp myloop
	cont:
	inc cx
	inc si
	jmp myloop
next:


.exit   
end    

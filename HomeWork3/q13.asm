;PROGRAM TEMPLATE
.model small
.stack 100h
.data
	A   db   '     This      is     a          test     $'
	B   db   100 dup('$')

.code
	mov ax,@data
	mov ds,ax
	MOV BX,0
	MOV SI,0
myloop:
	mov al,a[bx]
	mov b[si],al 
	inc si
	inc bx
	cmp a[bx],'$'
	jne myloop
	
.exit   
end    

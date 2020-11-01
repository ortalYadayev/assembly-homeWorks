.model small
.stack 100h
.data
a dw 1110001010100011b
myStr db 4 dup(' '),'$'
.code
mov ax,@data
mov ds,ax
mov si,offset myStr+3
mov dx,0fh
mov bx,a
myLoop:
	mov ax,bx
	and ax,dx
	cmp ax,9
	jg printlet
	add ax,48
cont:
	mov [si],al
	shr bx,4

	dec si
	cmp si,offset myStr-1
	jne myLoop
	jmp sof
printlet:
	add ax,55
	jmp cont
sof:
	mov dx,offset myStr
	mov ah,9 
	int 21h
.exit
end
.model  small
.stack   100h
.data
a dw 1100100000010011b
yes db 'yes$'
no db 'no$'

.code
mov ax,@data
mov ds,ax
mov dx,a
mov bx,0
myloop:
	cmp bx,8
	je nextyes
	mov ax,0
	shr dl,1
	adc al,0
	shl dh,1
	adc ah,0
	cmp ah,al
	jne nextno
	inc bx
	jmp myloop
nextno:
	mov ah,9
	mov dx, offset no
	int 21h
	jmp sof
nextyes:
	mov ah,9
	mov dx, offset yes
	int 21h
sof:

.exit
end
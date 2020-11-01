.model  small
.stack   100h
.data
a dw 12,5,8,-1,4
b dw -2,9,0,18,3
c dw 5 dup(?)
n dw 5
str2 db ," $"
str3 db 10,13,"$"

.code
mov	ax,	@data
mov	ds,	ax
mov ax,offset a
push ax
mov bx, offset b
push bx
mov dx,offset c
push dx
mov dx,n
push dx
call sum_array

mov ax,offset a
push ax
call print_array
mov ah,9
mov dx,offset str3
int 21h
mov bx, offset b
push bx
call print_array
mov ah,9
mov dx,offset str3
int 21h
mov dx,offset c
push dx
call print_array

.exit
sum_array proc near
	push bp
	mov bp,sp
	mov cx,0 ;counter of loop
	mov bx,0 ;counter of arrays
myloop:
	push bx
	mov si,[bp+10]
	mov di,[bp+8]
	push [si+bx]
	push [di+bx]
	call sum_two_num
	mov si,[bp+6]
	pop bx
	mov [si+bx],dx
	inc bx
	inc bx
	mov ax,[bp+4]
	inc cx
	cmp cx,ax
	jne myloop
	pop bp
	ret 8
sum_array endp

sum_two_num proc near ;סכום שני מספרים
	push bp
	mov bp,sp
	mov bx,[bp+4]
	mov dx,[bp+6]
	add dx,bx
	pop bp
	ret 4
sum_two_num endp


print_array proc near
	push bp
	mov bp,sp
	
	mov dx,0 ;counter of arrays
	mov bx,0 ;counter of loop
	
loopi:
	mov si,[bp+4]
	mov ax,[si+bx]
	push dx
	push bx
	push ax
	call printnum
	mov ah,9
	mov dx,offset str2
	int 21h
	pop bx
	inc bx
	inc bx
	pop dx
	inc dx
	cmp dx,5
	jne loopi
pop bp
ret 4
print_array endp

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
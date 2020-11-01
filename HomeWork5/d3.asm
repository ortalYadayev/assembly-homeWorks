.model  small
.stack   100h
.data
n dw 5
str1 db 'hellowwo  hellow world hellow  hellow$'
str2 db 'hellow$'
str3 db 'xxyyxyx$'
.code
	mov	ax,	@data
	mov	ds,	ax
	mov es, ax
	push offset str1
	push offset str2
	call q31
	push ax
	call printnum
	call newline
	
	push offset str1
	call q32
	push ax
	call printnum
	call newline
	
	push offset str3
	push 'x'
	push 'y'
	call q33
	push ax
	call printnum
.exit
q33 proc near
	push bp
	mov bp,sp
	mov bx,0
	mov si,[bp+8]
	mov ax,[bp+6]
	mov cx,[bp+4]
e1:
	cmp byte ptr [si],al
	jz exchnge
	cmp byte ptr [si],'$'
	jz thissof
	inc si
	jmp e1
exchnge:
	mov byte ptr [si], cl
	inc si
	inc bl
	jmp e1
thissof:
	mov ax,0
	mov al,bl
	pop bp
	ret 6
q33 endp
	
	
q32 proc near
	push bp
	mov bp,sp
	mov si,[bp+4]
	mov cx,0
	cmp byte ptr [si],' '
	jz w1
	inc cx
w1:
	cmp byte ptr [si],' '
	jz w2
	cmp byte ptr [si],'$'
	jz siamnu
	inc si
	jmp w1
w2:
	inc si
	cmp byte ptr [si], ' '
	jne newWord
	cmp byte ptr [si],'$'
	jz siamnu
	jmp w1
newWord:
	inc cx
	jmp w1
siamnu:	
	mov ax,cx
	pop bp
	ret 2
q32 endp
	
	
q31 proc near
	cld
	push bp
	mov bp,sp
	mov dx,0
	mov si,[bp+6]
	mov di,0
copyto:
	lodsb
	stosb
	cmp byte ptr [si-1],'$'
	jz next1
	jmp copyto
next1:
	mov cl,0
	mov si,[bp+4]
	mov di,0
next2:
	cmp byte ptr [si],'$'
	jz plus
	cmp byte ptr es:[di],'$'
	jz sofff
	cmpsb
	je same
	mov si,[bp+4]
	jmp next2
same:
	jmp	next2
plus:
	mov si,[bp+4]
	inc cl
	jmp next2
sofff:
	mov ax,0
	mov al,cl
	pop bp
	ret 4
q31 endp


printnum proc near
	push bp
	mov bp,sp
	mov ax,[bp+04]
	mov	bx,	10

	mov	cx,	0

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
	cmp word ptr [bp+4],	0
	jge	soff
	push       '-'
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
	
newline proc near
	mov dh, 0dh
    mov dl, 0ah 
    mov ah, 2
    int 21h  

    mov ah, 2
    mov dl, 0dh
    int 21h
	ret
 newline endp
end
	
		
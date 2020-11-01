.model  small
.stack   100h
.data
a db 12,5,'A',0fh,-1
k db 2

.code
mov ax,@data
mov ds,ax
mov bl,k
ourloop:
cmp bl,0
je next
dec bl
mov si,5
mov ax,0
shl a[si-1],1
adc ax,0
dec si
inloop:
	cmp si,0
	je ourloop
	shl a[si-1],1
	add [si-1],ax
	mov ax,0
	adc ax,0
	dec si
	jmp inloop
next:

.exit
end
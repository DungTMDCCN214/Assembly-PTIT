.model small
.stack 100h

.data
    msg db 13,10,'Fibonacci($'
    n db ?
    closes db ') = $'
    
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 1
    int 21h
    sub al, '0'
    mov n, al

    mov ah, 9
    lea dx, msg
    int 21h
    
    mov dl, n
    add dl, '0'
    mov ah, 2
    int 21h
    
    lea dx, closes
    mov ah, 9
    int 21h

    cmp n, 0
    je fib0
    cmp n, 1
    je fib1

    mov cx, 0
    mov dx, 1
    mov bl, n
    dec bl

calc_loop:
    mov ax, dx
    add ax, cx
    mov cx, dx
    mov dx, ax
    dec bl
    jnz calc_loop
    jmp print

fib0:
    mov dx, 0
    jmp print
    
fib1:
    mov dx, 1

print:
    add dx, '0'
    mov ah, 2
    int 21h

    mov ax, 4Ch
    int 21h
main endp

end main


; (ax + b) / (cx - d) ; a = 1 , b = 2 , c = 1, d = 2
.model small
.stack 100h

.data
    x dw ?
    y dw ? 
    crlf db 13,  10 , '$'
    res1 dw ?
    res2 dw ? 
    tbao dw 'So chia la 0, khong chia duoc$'
.code 

MAIN Proc
    mov ax , @data
    mov ds ,ax
    
    call nhapSo
    mov res1 , ax
    mov res2, ax
    add res1, 2  
    
    sub res2, 2
    mov bx , res2  
    
    cmp res2 , 0
    je tb
    
    call endl
    
    mov dx , 0 
    div bx 
    call inSo
    
    tb:
       lea dx , tbao
       mov ah,9 
       int 21h 
    
    mov ah, 4ch 
    int 21h
MAIN Endp

nhapSo Proc
    mov x , 0 
    mov y,0
    mov bx, 10
    
    nhap:
        mov ah,1
        int 21h
        
        cmp al , 13
        je nhapXong
        
        sub al , '0'
        mov ah,0
        mov y , ax  
        mov ax , x
        mul bx
        add ax , y
        mov x , ax 
        jmp nhap
    nhapXong:
    mov ax , x    
    ret
nhapSo Endp

inSo Proc
    mov bx, 10 
    mov cx , 0 
    push ax
    push bx 
    push cx
    push dx
    lap:
        mov dx , 0
        div bx
        add dx , '0' 
        push dx
        
        inc cx
        cmp ax , 0
        jg lap
    hienThi: 
        pop dx
        mov ah,2 
        int 21h
        loop hienThi 
        
    pop dx
    pop cx
    pop bx
    pop ax
    
    ret
inSo Endp 

endl Proc
    push ax 
    push dx 
    
    lea dx , crlf 
    mov ah,9
    int 21h
    
    pop dx
    pop ax
    ret
endl Endp


END MAIN
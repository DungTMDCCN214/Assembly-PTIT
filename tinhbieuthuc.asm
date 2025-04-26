; t = (((a*x - b)*x - c)*x + d
.model small
.stack 100h

.data   
    a dw 4 
    b dw 3
    c dw 2
    d dw 1
    x dw ?
    y dw ? 
    x1 dw ?
    crlf db 13, 10 , '$' 
.code
MAIN Proc
    mov ax , @data
    mov ds , ax
    
    call nhapSo
    ;mov ah,1
    ;int 21h
     
    ;sub al , '0'
    
    ;mov ah, 0
    ;call nhapSo
    mov x1 , ax   ; ax = x1
    mul a   ; a * x
    sub ax , b
    
    mul x1
    sub ax , c
    mul x1
    add ax , d 
    call endl
    call inSo
    
    
    mov ah,4ch
    int 21h
    
MAIN Endp
nhapSo Proc  
    mov x, 0
    mov y ,0 
    mov bx, 10
    nhap:
        mov ah,1
        int 21h
        
        cmp al , 13
        je nhapXong
        
        sub al, '0' 
        
        mov ah, 0
        mov y , ax 
               
        mov ax , x
        mul bx 
        add ax, y
        
        mov x , ax
        jmp nhap
    nhapXong:
    mov ax , x     
    ret
nhapSo Endp

inSo Proc 
    push  ax 
    push bx
    push cx
    push dx
    
    
    mov bx , 10
    mov cx , 0
    
    lap:
        mov dx, 0
        div bx 
        push dx
        
        inc cx
        
        cmp ax, 0
        jg lap
    
    hienthi:
        pop dx
        add dl , '0'
        
        mov ah,2 
        int 21h
        loop hienthi
    pop dx 
    pop cx
    pop bx 
    pop ax    
    ret
inSo Endp

endl Proc
    push ax
    push dx
    
    mov ah, 9
    lea dx , crlf 
    int 21h
    
    pop dx 
    pop ax
    
    ret
endl Endp

END MAIN
    
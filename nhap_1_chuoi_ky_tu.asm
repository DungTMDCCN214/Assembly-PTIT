.model small
.stack 100h
.data
    max_len db 100          ; So ky tu toi da co the nhap
    act_len db ?            ; So ky tu thuc te nhap vao
    buffer db 100 dup('$')  ; Bo dem chua chuoi nhap
    prompt db 'Nhap vao 1 chuoi: $'
    newline db 13, 10, '$'  ; Xuong dong
.code
main proc
    ; Khoi tao
    mov ax, @data
    mov ds, ax
    
    ; Hien thi loi nhac
    mov ah, 09h
    lea dx, prompt
    int 21h
    
    ; Nhap chuoi tu ban phim
    mov ah, 0Ah
    lea dx, max_len         ; DX tro den cau truc bo dem
    int 21h
    
    ; Xuong dong
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; Hien thi chuoi da nhap
    ; Tinh toan dia chi bat dau chuoi
    mov bl, act_len         ; Do dai thuc cua chuoi
    mov bh, 0
    mov si, bx
    mov buffer[si+2], '$'   ; Them ky tu ket thuc chuoi
    
    mov ah, 09h
    lea dx, buffer          ; DX tro den chuoi can in
    int 21h
    
    ; Ket thuc chuong trinh
    mov ah, 4Ch
    int 21h
main endp
end main
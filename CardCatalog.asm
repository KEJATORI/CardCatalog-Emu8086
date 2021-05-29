include emu8086.inc
.model small
.stack
.data
    color db 3eh 
    
    titlegen db '  000     0    0000   0000       000     0    00000    0    0       000    000 ', 10, 13,
             db ' 0   0   0 0   0   0  0   0     0   0   0 0     0     0 0   0      0   0  0   0', 10, 13,
             db ' 0      0   0  0  0   0   0     0      0   0    0    0   0  0      0   0  0    ', 10, 13,
             db ' 0      00000  000    0   0     0      00000    0    00000  0      0   0  0 000', 10, 13,
             db ' 0   0  0   0  0  0   0   0     0   0  0   0    0    0   0  0      0   0  0   0', 10, 13,
             db '  000   0   0  0   0  0000       000   0   0    0    0   0  00000   000    000 ', 10, 13,
          
             db '                                                                               ', 10, 13,
             db '          000   00000  0   0  00000  0000     0    00000   000   0000          ', 10, 13,
             db '         0   0  0      00  0  0      0   0   0 0     0    0   0  0   0         ', 10, 13,
             db '         0      0000   0 0 0  0000   0   0  0   0    0    0   0  0   0         ', 10, 13,
             db '         0 000  0      0  00  0      0000   00000    0    0   0  0000          ', 10, 13,
             db '         0   0  0      0   0  0      0  0   0   0    0    0   0  0  0          ', 10, 13,
             db '          000   00000  0   0  00000  0   0  0   0    0     000   0   0         ', 10, 13, 
             db '                                                                               ', 10, 13, '$'
    
    authorCardX db '                                Author Card Catalog                ', 13, 10,
                db '                                                                   ', 13, 10,
                db '             ||||||||||||||||||||||||||||||||||||||||||||||||||||||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||  PS3557                                          ||', 13, 10,
                db '             ||  .R5355      Grisham, John                       ||', 13, 10, 
                db '             ||  PS3557                                          ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||       The Firm 1st. ed.                          ||', 13, 10,
                db '             ||       Organized crime--Fiction                   ||', 13, 10,
                db '             ||       New York:  Doubleday, c1991.               ||', 13, 10,
                db '             ||       421p. ; 24cm.                              ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||         1. Government investigatiors--Fiction.   ||', 13, 10,
                db '             ||         2. Origanized crime--Fiction.            ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||||||||||||||||||||||||||||||||||||||||||||||||||||||', 13, 10, '$'
            
    titleCardX  db '                                 Title Card Catalog                ', 13, 10,
                db '                                                                   ', 13, 10,
                db '             ||||||||||||||||||||||||||||||||||||||||||||||||||||||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||  PS3557                                          ||', 13, 10,
                db '             ||  .R5355    The Firm 1st. ed.                     ||', 13, 10, 
                db '             ||  PS3557                                          ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||       Grisham, John                              ||', 13, 10,
                db '             ||       Organized crime--Fiction                   ||', 13, 10,
                db '             ||       New York:  Doubleday, c1991.               ||', 13, 10,
                db '             ||       421p. ; 24cm.                              ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||         1. Government investigatiors--Fiction.   ||', 13, 10,
                db '             ||         2. Origanized crime--Fiction.            ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||||||||||||||||||||||||||||||||||||||||||||||||||||||', 13, 10, '$'
            
                    
    subjectCardX db '                               Subject Card Catalog               ', 13, 10,
                db '                                                                   ', 13, 10,
                db '             ||||||||||||||||||||||||||||||||||||||||||||||||||||||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||  PS3557     Organized crime--Fiction             ||', 13, 10,
                db '             ||  .R5355                                          ||', 13, 10, 
                db '             ||  PS3557                                          ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||       Grisham, John                              ||', 13, 10,
                db '             ||       The Firm 1st. ed.                          ||', 13, 10,
                db '             ||       New York:  Doubleday, c1991.               ||', 13, 10,
                db '             ||       421p. ; 24cm.                              ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||         1. Government investigatiors--Fiction.   ||', 13, 10,
                db '             ||         2. Origanized crime--Fiction.            ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||||||||||||||||||||||||||||||||||||||||||||||||||||||', 13, 10, '$'
    
             
    cursorlocation db 14         
    previouslocation db 14  

    mainmenu db '                           [ ] About Card Catalog                  ', 10, 13,
             db '                           [ ] Types of Card Catalog               ', 10, 13,
             db '                           [ ] Example of Card Catalog             ', 10, 13,
             db '                           [ ] Generate a Card Catalog             ', 10, 13,
             db '                           [ ] Exit                                ', 10, 13, '$'      
    mainmenuchoice db 0
    
    about    db '                    A library catalog (or library catalogue in     ', 10, 13,
             db '                 British English) is a register of all bibliographic', 10, 13,
             db '                 items found in a library or group of libraries,   ', 10, 13,
             db '                 such as a network of libraries at several         ', 10, 13,
             db '                 locations. A catalog for a group of libraries     ', 10, 13,
             db '                 is also called a union catalog.                   ', 10, 13, '$'
    
    types    db '                                Author catalog                     ', 10, 13,
             db '                 Use the author catalogue when you know the author ', 10, 13,
             db '                 (or editor) of a book.                            ', 10, 13,
             db '                                Title catalog                      ', 10, 13,
             db '                 Use the title catalog when you know the title     ', 10, 13,
             db '                 of a book.                                        ', 10, 13,
             db '                                Subject Catalog                    ', 10, 13, 
             db '                 Organizes all of the library holdings by the main ', 10, 13,
             db '                 subjects of the title.                            ', 10, 13, '$'
    
            
    generate db '                           [ ] Author Card                         ', 10, 13,
             db '                           [ ] Title Card                          ', 10, 13,
             db '                           [ ] Subject Card                        ', 10, 13,
             db '                           [ ] Previous Card                       ', 10, 13,
             db '                           [ ] Main Menu                           ', 10, 13, '$'
             
    generatechoice db 0       
    
    previouschoice db 0
    
    emptycursor db ' $'
    
    prompt      db "                               Card Catalog                     ", 10, 13,
                db 10, 13,
                db "      Author's Name           :", 10, 13,
                db 10, 13,
                db "      Book's Title            :", 10, 13,
                db 10, 13,
                db "      Book's Subject          :", 10, 13,
                db 10, 13,
                db "      Classification Number   :", 10, 13, 
                db 10, 13,
                db "      Location Symbol         :", 10, 13,
                db 10, 13,
                db "      Publisher               :", 10, 13,
                db 10, 13,
                db "      Copyright Year          :", 10, 13,
                db 10, 13,
                db "      Book's Pagination       :", 10, 13,
                db 10, 13,
                db "      Book's Size in cm       :", 10, 13,
                db 10, 13,
                db "      Related Book 1 & Genre  :", 10, 13,
                db 10, 13,
                db "      Related Book 2 & Genre  :", 10, 13, '$'  
                
    template    db '                                                                   ', 13, 10,
                db '             ||||||||||||||||||||||||||||||||||||||||||||||||||||||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10, 
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||                                                  ||', 13, 10,
                db '             ||||||||||||||||||||||||||||||||||||||||||||||||||||||', 13, 10, '$'
                
                
    penter      db '<<Press Enter To Continue>>             ', 13, 10, '$'
                
    author    db 50, 51 dup('$')
    b_title   db 50, 51 dup('$')
    subject   db 50, 51 dup('$') 
    classnum  db 20, 21 dup('$')
    locsym    db 20, 21 dup('$')
    publisher db 50, 51 dup('$') 
    copdate   db 20, 21 dup('$')      
    b_page    db 20, 21 dup('$')
    size      db 20, 21 dup('$')
    rel1      db 50, 51 dup('$')
    rel2      db 50, 51 dup('$')
    
     
    
     
.code
;||||||||||||||||||||||||||||||||||||||||||
;              macro screen
;||||||||||||||||||||||||||||||||||||||||||

get_string macro str
    
    mov ah, 0ah
    lea dx, str
    int 21h    
    
endm

print_string macro str 
    
    lea dx, str
    add dx, 02
    mov ah, 09h
    int 21h  
    
endm
    
print_var macro str 
    
    lea dx, str
    mov ah, 09h
    int 21h 
    
endm

get_keystroke macro 
    
    mov ah, 00h
    int 16h  
    
endm


;||||||||||||||||||||||||||||||||||||||||||
;              main screen
;||||||||||||||||||||||||||||||||||||||||||
                                                                        
main proc
    mov ax, @data
    mov ds, ax  
    
    call set_cursor_box
       
main_loop:
   
    call clear_screen
    call mm_screen    
    
    
    cmp mainmenuchoice, 1
    je mm_1

    cmp mainmenuchoice, 2
    je mm_2
    
    cmp mainmenuchoice, 3
    je mm_3
    
    cmp mainmenuchoice, 4
    je mm_4
    
    cmp mainmenuchoice, 5
    je mm_5
    
mm_1:
    call clear_screen
    call about_screen
    jmp main_loop
    
mm_2:
    call clear_screen
    call types_screen
    jmp main_loop
    
mm_3:
    call example_screen
    jmp main_loop

mm_4:
    call clear_screen
    call generate_loop
    jmp main_loop

mm_5:    
    
    mov ah, 4ch
    int 21h 
    ret
    
main endp

;||||||||||||||||||||||||||||||||||||||||||
;              generate screen
;||||||||||||||||||||||||||||||||||||||||||

generate_loop proc

gen_loop:
   
    call clear_screen
    call g_screen
    
    cmp generatechoice, 1
    je gen_1

    cmp generatechoice, 2
    je gen_2
    
    cmp generatechoice, 3
    je gen_3
    
    cmp generatechoice, 4
    je gen_4
    
    cmp generatechoice, 5
    je gen_5
    
    
gen_1:
    call clear_screen
    call get_data
    call author_screen
    jmp gen_loop
    
gen_2:
    call clear_screen
    call get_data
    call title_screen
    jmp gen_loop
    
gen_3:
    call clear_screen
    call get_data
    call subject_screen
    jmp gen_loop
    
gen_4:
    call clear_screen
    call previous_screen
    jmp gen_loop

gen_5:    
    
    ret
generate_loop endp    



;||||||||||||||||||||||||||||||||||||||||||
;              clear screen
;||||||||||||||||||||||||||||||||||||||||||

clear_screen proc 
    
    mov ah, 00h
    mov al, 02h
    int 10h
    
                   ; set colors     
    MOV AH, 06h    ; Scroll up function
    XOR AL, AL     ; Clear entire screen
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    MOV DX, 1F58H  ; lower right corner DH=row, DL=column 
    MOV BH, color    ; Red Yellow
    INT 10H
    
    ret   
clear_screen endp


;||||||||||||||||||||||||||||||||||||||||||
;              set cursor box screen
;||||||||||||||||||||||||||||||||||||||||||


set_cursor_box proc 
    
    mov ch, 0
 	mov cl, 7
 	mov ah, 1
 	int 10h   
 	
 	ret
set_cursor_box endp



;||||||||||||||||||||||||||||||||||||||||||
;              main menu screen
;||||||||||||||||||||||||||||||||||||||||||

mm_screen proc 
    
    print_var titlegen
    
    print_var mainmenu

mm_keyloop:

    mov dl, cursorlocation
    gotoxy 28, dl
      
    get_keystroke
    
    cmp ah, 48h
    je mm_up
    
    cmp ah, 50h
    je mm_down
    
    cmp ah, 1ch
    je mm_end
    
    jmp mm_keyloop
     
mm_down:
    cmp cursorlocation, 18
    je mm_keyloop 
    inc cursorlocation
    jmp mm_keyloop  


mm_up:
    cmp cursorlocation, 14
    je mm_keyloop
    dec cursorlocation
    jmp mm_keyloop

mm_end:
    mov ah, cursorlocation
    sub ah, 13
    mov mainmenuchoice, ah
    mov cursorlocation, 14
    ret

mm_screen endp

;||||||||||||||||||||||||||||||||||||||||||
;              generate screen
;||||||||||||||||||||||||||||||||||||||||||

g_screen proc
    print_var titlegen
    
    print_var generate    
    
g_keyloop:
    
    mov dl, cursorlocation
    gotoxy 28, dl
      
    get_keystroke

    cmp ah, 48h
    je g_up
    
    cmp ah, 50h
    je g_down
           
    cmp ah, 1ch
    je g_end
    
    jmp g_keyloop
     
g_down:
    cmp cursorlocation, 18
    je g_keyloop 
    inc cursorlocation
    jmp g_keyloop  


g_up:
    cmp cursorlocation, 14
    je g_keyloop
    dec cursorlocation
    jmp g_keyloop

g_end:
    mov ah, cursorlocation
    sub ah, 13
    mov bl, generatechoice
    mov previouschoice, bl
    mov generatechoice, ah
    mov cursorlocation, 14 
    ret

g_screen endp  

;||||||||||||||||||||||||||||||||||||||||||
;              generate screen
;||||||||||||||||||||||||||||||||||||||||||
previous_screen proc
    cmp previouschoice, 1
    je prev_1
    
    cmp previouschoice, 2
    je prev_2
    
    cmp previouschoice, 3
    je prev_3

prev_1:
    call author_screen
    jmp prev_end
    
prev_2:
    call title_screen
    jmp prev_end
    
prev_3:
    call subject_screen    
    jmp prev_end
      
prev_end:    
    ret    
previous_screen endp    


;||||||||||||||||||||||||||||||||||||||||||
;              about screen
;||||||||||||||||||||||||||||||||||||||||||

about_screen proc
        
    print_var titlegen
    
    print_var about
    
    gotoxy 28, 22
    print_var penter
    
about_loop:
    
    get_keystroke
    
    cmp ah, 1ch
    je  about_end
    jmp about_loop
        
about_end:    
    
    ret
about_screen endp


;||||||||||||||||||||||||||||||||||||||||||
;              types screen
;||||||||||||||||||||||||||||||||||||||||||

types_screen proc

    print_var titlegen
 
    print_var types

    gotoxy 28, 23
    print_var penter
    
types_loop:
    
    get_keystroke
    
    cmp ah, 1ch
    je  tpyes_end
    jmp types_loop
        
tpyes_end:    
    
    ret

types_screen endp



;||||||||||||||||||||||||||||||||||||||||||
;              example screen
;||||||||||||||||||||||||||||||||||||||||||

example_screen proc
    
    call clear_screen
    print_var authorCardX
    
    gotoxy 28, 23
    print_var penter
    
    get_keystroke
    
    call clear_screen
    print_var titleCardX
    
    gotoxy 28, 23
    print_var penter
    
    get_keystroke
    
    call clear_screen
    print_var subjectCardX
    
    gotoxy 28, 23
    print_var penter
    
    get_keystroke
    
    ret    
    
example_screen endp

;||||||||||||||||||||||||||||||||||||||||||
;              get data screen
;||||||||||||||||||||||||||||||||||||||||||
get_data proc
    call reset_data
    call clear_screen
    print_var prompt
    
    gotoxy 32, 2
    get_string author
    
    gotoxy 32, 4
    get_string b_title
    
    gotoxy 32, 6
    get_string subject
        
    gotoxy 32, 8
    get_string classnum
     
    gotoxy 32, 10
    get_string locsym
    
    gotoxy 32, 12
    get_string publisher

    gotoxy 32, 14
    get_string copdate
    
    gotoxy 32, 16
    get_string b_page
    
    gotoxy 32, 18
    get_string size
    
    gotoxy 32, 20
    get_string rel1
    
    gotoxy 32, 22
    get_string rel2
    
    ret
get_data endp      

;||||||||||||||||||||||||||||||||||||||||||
;              reset data screen
;||||||||||||||||||||||||||||||||||||||||||

reset_data proc
    gotoxy 36, 13
    
    print 'LOADING'
    
    gotoxy 28, 14
    
    print 219
    print 219
    
    lea di, author
    mov cx, 49
author_loop:
    mov [di], '$'
    inc di
    loop author_loop
    
    print 219
    print 219
    
    lea di, b_title
    mov cx, 49
b_title_loop:
    mov [di], '$'
    inc di
    loop b_title_loop
    
    lea di, subject
    mov cx, 49
subject_loop:
    mov [di], '$'
    inc di
    loop subject_loop
    
    print 219
    print 219
    
    lea di, classnum
    mov cx, 19
classnum_loop:
    mov [di], '$'
    inc di
    loop classnum_loop
    
    print 219
    print 219
    
    lea di, locsym
    mov cx, 19
locsym_loop:
    mov [di], '$'
    inc di
    loop locsym_loop
    
    print 219
    print 219
    
    lea di, publisher
    mov cx, 49
publisher_loop:
    mov [di], '$'
    inc di
    loop publisher_loop
    
    print 219
    print 219
    
    lea di, copdate
    mov cx, 19
copdate_loop:
    mov [di], '$'
    inc di
    loop copdate_loop
    
    print 219
    print 219
    
    lea di, b_page
    mov cx, 19
b_page_loop:
    mov [di], '$'
    inc di
    loop b_page_loop
    
    print 219
    print 219
    
    lea di, size
    mov cx, 19
size_loop:
    mov [di], '$'
    inc di
    loop size_loop
    
    print 219
    print 219
    
    lea di, rel1
    mov cx, 49
rel1_loop:
    mov [di], '$'
    inc di
    loop rel1_loop
    
    print 219
    print 219
    
    lea di, rel2
    mov cx, 49
rel2_loop:
    mov [di], '$'
    inc di
    loop rel2_loop
    
    print 219
    print 219
    
    ret    
reset_data endp


;||||||||||||||||||||||||||||||||||||||||||
;              author screen
;||||||||||||||||||||||||||||||||||||||||||

author_screen proc
    
    call clear_screen
    print_var template
    
    gotoxy 28, 3
    print_string author
    
    gotoxy 22, 8
    print_string b_title
    
    gotoxy 22, 9
    print_string subject     
         
    
    gotoxy 17, 3
    print_string locsym
    
    gotoxy 17, 4
    print_string classnum
    
    gotoxy 17, 5
    print_string copdate
    
    gotoxy 22, 10
    print_string publisher
    
    gotoxy 22, 11
    print_string b_page
    gotoxy 27, 11
    print ';'
    gotoxy 28, 11
    print_string size   
    
    gotoxy 24, 13
    print '1. '
    gotoxy 26, 13
    print_string rel1    
    
    gotoxy 24, 14
    print '2. '
    gotoxy 26, 14
    print_string rel2      
    
    gotoxy 28, 23
    print_var penter
    
    get_keystroke
     
    ret    
author_screen endp

;||||||||||||||||||||||||||||||||||||||||||
;              title screen
;||||||||||||||||||||||||||||||||||||||||||

title_screen proc
    
    call clear_screen
    print_var template
    
    gotoxy 22, 8
    print_string author
    
    gotoxy 28, 3
    print_string b_title
    
    gotoxy 22, 9
    print_string subject     
         
    
    gotoxy 17, 3
    print_string locsym
    
    gotoxy 17, 4
    print_string classnum
    
    gotoxy 17, 5
    print_string copdate
    
    gotoxy 22, 10
    print_string publisher
    
    gotoxy 22, 11
    print_string b_page
    gotoxy 27, 11
    print ';'
    gotoxy 28, 11
    print_string size   
    
    gotoxy 24, 13
    print '1. '
    gotoxy 26, 13
    print_string rel1    
    
    gotoxy 24, 14
    print '2. '
    gotoxy 26, 14
    print_string rel2      
    
    gotoxy 28, 23
    print_var penter
    
    get_keystroke

    ret
title_screen endp


;||||||||||||||||||||||||||||||||||||||||||
;              subject screen
;||||||||||||||||||||||||||||||||||||||||||

subject_screen proc
    
    call clear_screen
    print_var template
    
    gotoxy 22, 9
    print_string author
    
    gotoxy 22, 8
    print_string b_title
    
    gotoxy 28, 3
    print_string subject     
         
    
    gotoxy 17, 3
    print_string locsym
    
    gotoxy 17, 4
    print_string classnum
    
    gotoxy 17, 5
    print_string copdate
    
    gotoxy 22, 10
    print_string publisher
    
    gotoxy 22, 11
    print_string b_page
    gotoxy 27, 11
    print ';'
    gotoxy 28, 11
    print_string size   
    
    gotoxy 24, 13
    print '1. '
    gotoxy 26, 13
    print_string rel1    
    
    gotoxy 24, 14
    print '2. '
    gotoxy 26, 14
    print_string rel2      
    
    gotoxy 28, 23
    print_var penter
    
    get_keystroke
    
     
    ret
subject_screen endp



end
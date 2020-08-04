.model medium    ; a directive to store space in memory for program.
    org 100h            ; To set assembler location counter
	include emu8086.inc ; A library to help in finding some macros directives.
	define_scan_num     ; A macros directive to input a multivalued digit from keyboard to cx register.
	define_print_num    ; A macros directive to print out the number in the ax register
	define_print_num_uns;
	define_print_string ; 
	.data
	   
  
  
    msg db "Hello,this is a 3 * 3 matrix computation $"
    msg1 db "What would you like your first row of matrix1 to be $" 
    msg4 db "What would you like your first row of matrix2 to be $"
    msg2 db "What would you like your second row of matrix to be $"
    msg3 db "What would you like your third row of matrix to be  $"
    opmsg db "Enter operation you desire to execute (+,-,*) $"
    nummsg db "What number would wish to evaluate the matrix by $"
    msgmul db "* $"
    msgadd db "+ $"
    msgsub db "- $"
    msgdiv db "/ $"
    msgequ db "= $"
    
     
     array1 dw 9 dup(?)     ; The first array to be initialized by user.
     array2 dw 9 dup(?)     ; The second array to be initialized by user.
     array3 dw 9 dup(?)
     resarray1 dw 9 dup(?)   ; The array to be filled by mathematical calculation
     resarray2 dw 9 dup(?)   ;
     resarray3 dw 9 dup(?)
                                           
     firstdigit dw ?
     seconddigit dw ?
     lastdigit dw ?
     operand db ?
     decima dw ?           
     opnum dw ?                         
               

            .code       ;code directive (the beginning of instructons.)
            main proc   ;base function contains all the other subfunctions and instructions for this program.
                           
     gotoxy 20,0
     lea dx,msg
     mov ah,9h
     int 21h 
     
     gotoxy 0,2         ;A row column macros parameter that sets the postion of the cursor.
     lea dx, msg1
     mov ah,9h
     int 21h
     
     jmp input1
     input1:
            lea bx, array1      ;get the address of array1 and stores in bx
            gotoxy 2,3
            
            call scan_num       ;prompts user for the integer and stores it in the cx register.
            mov firstdigit,cx   ;moves the data from cx and stores it in the dx
            
            gotoxy 4,3
            call scan_num       ;prompts user for the integer and stores in cx register
            mov seconddigit,cx  ;moves the data from cx and stores it in dx
            
            gotoxy 6,3          
            call scan_num       ;prompts user for integer and stores in cx
            mov lastdigit,cx    ;moves the data from cx and stores it in dx
            
            mov dx,firstdigit
            mov [bx],dx 
            add bx,2d  
            
            mov dx,seconddigit
            mov [bx],dx
            add bx,2d  
            
            mov dx,lastdigit 
            mov [bx],dx
            
     gotoxy 0,5
     lea dx, msg2
     mov ah,9h
     int 21h
     
     jmp input2
     input2:  
     
            add bx,2d           ;gets the address of array2 and stores it in bx
            gotoxy 2,6
            
            call scan_num       ;prompts user for integer and stores in cx
            mov firstdigit,cx   ;
            
            gotoxy 4,6          ;
            call scan_num       ;
            mov seconddigit,cx  ;
            
            gotoxy 6,6          ;
            call scan_num       ;
            mov lastdigit,cx    ;
            
            mov dx,firstdigit   ;
            mov [bx],dx         ;
            add bx,2d           ;
            
            mov dx, seconddigit ;
            mov [bx],dx         ;
            add bx, 2d          ;
            
            mov dx,lastdigit    ;
            mov [bx],dx         ;
            
     gotoxy 0,8
     lea dx,msg3
     mov ah,9h
     int 21h
     
     jmp input3
     input3:
     
            add bx,2d           ;
            gotoxy 2,9          ;
            
            call scan_num       ;
            mov firstdigit,cx   ;
            
            gotoxy 4,9          ;
            call scan_num       ;
            mov seconddigit,cx  ;
            
            gotoxy 6,9          ;
            call scan_num       ;
            mov lastdigit,cx    ;
            
            mov dx,firstdigit
            mov [bx],dx
            add bx,2d
            
            mov dx,seconddigit ;
            mov [bx],dx        ;
            add bx, 2d
            
            mov dx,lastdigit   ;
            mov [bx],dx        ;  
            
            mov ah, 0d
            int 10h
            
            mov al, 3
            int 10h
            
     gotoxy 0,2
     lea dx, msg4
     mov ah,9h
     int 21h
     
     jmp input21
     input21:
     
            lea bx,array2
            gotoxy 2,3
     
            call scan_num
            mov firstdigit,cx
            
            gotoxy 4,3
            call scan_num
            mov seconddigit,cx
     
            gotoxy 6,3
            call scan_num
            mov lastdigit,cx
     
            mov dx,firstdigit
            mov [bx],dx
            add bx,2d
            
            mov dx,seconddigit
            mov [bx],dx
            add bx,2d
            
            mov dx,lastdigit
            mov [bx],dx
            
     gotoxy 0,5
     lea dx,msg2
     mov ah,9h
     int 21h
     jmp input22
     
     input22: 
            add bx,2d
            gotoxy 2,6
            
            call scan_num
            mov firstdigit,cx
            
            gotoxy 4,6
            call scan_num
            mov seconddigit,cx
            
            gotoxy 6,6
            call scan_num
            mov lastdigit,cx       
            
            mov dx,firstdigit
            mov [bx],dx
            add bx,2d
            
            mov dx,seconddigit
            mov [bx],dx
            add bx,2d
            
            mov dx,lastdigit
            mov [bx],dx 
            
     gotoxy 0,8
     lea dx,msg3
     mov ah,9h
     int 21h       
            
     jmp input23
     input23:       
            add bx,2d
            gotoxy 2,9
                   
            call scan_num
            mov firstdigit,cx
            
            gotoxy 4,9
            call scan_num
            mov seconddigit,cx
            
            gotoxy 6,9
            call scan_num
            mov lastdigit,cx
          
            mov dx,firstdigit
            mov [bx],dx
            add bx,2d
            
            mov dx,seconddigit
            mov [bx],dx
            add bx,2d
            
            mov dx,lastdigit
            mov [bx],dx
            
            mov ah,0
            int 10h
            mov al,3
            int 10h
            
     gotoxy 0,1
     lea dx,opmsg 
     mov ah,9h
     int 21h
     
     mov ah,1h
     int 21h
     
     mov operand, al  
       
     cmp operand, '+'
     je sum          
     
     cmp operand, '*'
     je domul
     
     cmp operand, '/'
     je divt
     
     cmp operand, '-'
     je subt
     
     sum:   
            gotoxy 4,1
            lea dx, msgadd
            mov ah,9h
            int 21h
            
            mov ax,array1
            add ax,array2
            mov resarray1,ax
            
            mov ax,[array1+2]
            add ax,[array2+2]
            mov [resarray1+2],ax 
            
            mov ax,[array1+4]
            add ax,[array2+4]
            mov [resarray1+4],ax
            
            mov ax,[array1+6]
            add ax,[array2+6]
            mov [resarray1+6],ax
            
            mov ax,[array1+8]
            add ax,[array2+8]
            mov [resarray1+8],ax
            
            mov ax,[array1+10]
            add ax,[array2+10]
            mov [resarray1+10],ax
            
            mov ax,[array1+12]
            add ax,[array2+12]
            mov [resarray1+12],ax
            
            mov ax,[array1+14]
            add ax,[array2+14]
            mov [resarray1+14],ax
            
            mov ax,[array1+16]
            add ax,[array2+16]
            mov [resarray1+16],ax                       
            
            jmp displayres
            
     subt:       
           gotoxy 4,1   
           lea dx ,msgadd
           mov ah,9h
           int 21h
           
           mov ax,array1 
           sub ax,array2
           mov resarray1,ax
           
           mov ax,[array1+2]
           sub ax,[array2+2] 
           mov [resarray1+2],ax
           
           mov ax,[array1+4]
           sub ax,[array2+4]
           mov [resarray1+4],ax
                                 
                                 
           mov ax,[array1+6] 
           sub ax,[array2+6] 
           mov [resarray1+6],ax
           
           mov ax,[array1+8] 
           sub ax,[array2+8]  
           mov [resarray1+8],ax
           
           mov ax,[array1+10]
           sub ax,[array2+10] 
           mov [resarray1+10],ax
           
           
           mov ax,[array1+12] 
           sub ax,[array2+12] 
           mov [resarray1+12],ax
           
           mov ax,[array1+14] 
           sub ax,[array2+14] 
           mov [resarray1+14],ax
           
           mov ax,[array1+16]
           sub ax,[array2+16] 
           mov [resarray1+16],ax
           
           jmp displayres 
           
    
     divt:
     
     
           gotoxy 18,22   
           lea dx,msgdiv
           mov ah,9h
           int 21h
           
           mov ax,array1 
           idiv opnum
           mov resarray1,ax
           
           mov ax,[array1+2]
           idiv opnum 
           mov [resarray1+2],ax
           
           mov ax,[array1+4]
           idiv opnum 
           mov [resarray1+4],ax
                                 
           mov ax,array2 
           idiv opnum
           mov resarray2,ax
           
           mov ax,[array2+2]
           idiv opnum 
           mov [resarray2+2],ax
           
           mov ax,[array2+4]
           idiv opnum 
           mov [resarray2+4],ax
           
           mov ax,array3 
           idiv opnum
           mov resarray3,ax
           
           mov ax ,[array3+2]
           idiv opnum 
           mov [resarray3+2],ax
           
           mov ax,[array1+4]
           idiv opnum 
           mov [resarray3+4],ax 
           
           jmp displayres
    domul:
    
    
           mov ax,array1
           mul array2 
           mov firstdigit,ax 
           mov ax,[array1+2]
           mul [array2+6]
           mov seconddigit,ax
           mov ax,[array1+4]
           mul [array2+12]
           mov lastdigit,ax
           mov ax,firstdigit
           add ax,seconddigit
           add ax,lastdigit
           mov [resarray1],ax
           
           mov ax,array1
           mul [array2+2] 
           mov firstdigit,ax 
           mov ax,[array1+2]
           mul [array2+8]
           mov seconddigit,ax
           mov ax,[array1+4]
           mul [array2+14]
           mov lastdigit,ax
           mov ax,firstdigit
           add ax,seconddigit
           add ax,lastdigit
           mov [resarray1+2],ax
           
           mov ax,array1
           mul [array2+4] 
           mov firstdigit,ax 
           mov ax,[array1+2]
           mul [array2+10]
           mov seconddigit,ax
           mov ax,[array1+4]
           mul [array2+16]
           mov lastdigit,ax
           mov ax,firstdigit
           add ax,seconddigit
           add ax,lastdigit
           mov [resarray1+4],ax 
             
           mov ax,[array1+6]
           mul array2 
           mov firstdigit,ax 
           mov ax,[array1+8]
           mul [array2+6]
           mov seconddigit,ax
           mov ax,[array1+10]
           mul [array2+12]
           mov lastdigit,ax
           mov ax,firstdigit
           add ax,seconddigit
           add ax,lastdigit
           mov [resarray1+6],ax  
              
           mov ax,[array1+6]
           mul [array2+2] 
           mov firstdigit,ax 
           mov ax,[array1+8]
           mul [array2+8]
           mov seconddigit,ax
           mov ax,[array1+10]
           mul [array2+14]
           mov lastdigit,ax
           mov ax,firstdigit
           add ax,seconddigit
           add ax,lastdigit
           mov [resarray1+8],ax  
           
           mov ax,[array1+6]
           mul [array2+4] 
           mov firstdigit,ax 
           mov ax,[array1+8]
           mul [array2+10]
           mov seconddigit,ax
           mov ax,[array1+10]
           mul [array2+16]
           mov lastdigit,ax
           mov ax,firstdigit
           add ax,seconddigit
           add ax,lastdigit
           mov [resarray1+10],ax  
           
               
           mov ax,[array1+12]
           mul array2 
           mov firstdigit,ax 
           mov ax,[array1+14]
           mul [array2+6]
           mov seconddigit,ax
           mov ax,[array1+16]
           mul [array2+12]
           mov lastdigit,ax
           mov ax,firstdigit
           add ax,seconddigit
           add ax,lastdigit
           mov [resarray1+12],ax 
           
           mov ax,[array1+12]
           mul [array2+2]
           mov firstdigit,ax 
           mov ax,[array1+14]
           mul [array2+8]
           mov seconddigit,ax
           mov ax,[array1+16]
           mul [array2+14]
           mov lastdigit,ax
           mov ax,firstdigit
           add ax,seconddigit
           add ax,lastdigit
           mov [resarray1+14],ax  
           
           mov ax,[array1+12]
           mul [array2+4] 
           mov firstdigit,ax 
           mov ax,[array1+14]
           mul [array2+10]
           mov seconddigit,ax
           mov ax,[array1+16]
           mul [array2+16]
           mov lastdigit,ax
           mov ax,firstdigit
           add ax,seconddigit
           add ax,lastdigit
           mov [resarray1+16],ax
           
           jmp displayres
           
   displayres:        
          mov ah,00
          
          
          gotoxy 11,10
          mov dl , operand
          mov ah , 2h  
          int 21h
          ;call printx
          
          ;gotoxy 1,10
         ; mov ax ,opnum
         ;call print_num
          
          gotoxy 3,8
          mov ax,array1
          call print_num
          
          gotoxy 6,8
          mov ax,[array1+2]
          call print_num
          
          gotoxy 9,8
          mov ax,[array1+4] 
          call print_num 
          
          gotoxy 3,10
          mov ax,[array1+6]
          call print_num
          
          gotoxy 6,10
          mov ax,[array1+8]
          call print_num
          
          gotoxy 9,10
          mov ax,[array1+10] 
          call print_num
                       
          gotoxy 3,12
          mov ax ,[array1+12]
          call print_num
          
          gotoxy 6,12
          mov ax,[array1+14]
          call print_num
          
          gotoxy 9,12
          mov ax,[array1+16]  
          call print_num 
          
         gotoxy 13,8
         mov ax,array2 
         call print_num 
         
         gotoxy 16,8
         mov ax,[array2+2]  
         call print_num
         
         gotoxy 19,8
         mov ax,[array2+4] 
         call print_num 
         
         gotoxy 13,10
         mov ax,[array2+6] 
         call print_num 
         
         gotoxy 16,10
         mov ax,[array2+8] 
         call print_num
         
         gotoxy 19,10
         mov ax,[array2+10] 
         call print_num
         
         gotoxy 13,12
         mov ax,[array2+12] 
         call print_num 
         
         gotoxy 16,12
         mov ax,[array2+14]  
         call print_num
         
         gotoxy 19,12
         mov ax,[array2+16]
         call print_num     
         
         gotoxy 21,10
         lea dx,msgequ
         mov ah,9h
         int 21h
         
         gotoxy 23,8
         mov ax,resarray1
         call print_num 
         
         gotoxy 26,8
         mov ax,[resarray1+2]  
         call print_num
         
         gotoxy 29,8
         mov ax,[resarray1+4] 
         call print_num 
         
         gotoxy 23,10
         mov ax,[resarray1+6] 
         call print_num 
         
         gotoxy 26,10
         mov ax,[resarray1+8] 
         call print_num
         
         gotoxy 29,10
         mov ax,[resarray1+10] 
         call print_num
         
         gotoxy 23,12
         mov ax, [resarray1+12] 
         call print_num 
         
         gotoxy 26,12
         mov ax,[resarray1+14]  
         call print_num
         
         gotoxy 29,12
         mov ax,[resarray1+16]
         call print_num
                      
 endp    
            ret
        endp
 end main
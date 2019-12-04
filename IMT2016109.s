	PRESERVE8 
    THUMB 
    AREA    |.text|,CODE,READONLY 
    EXPORT __main
	IMPORT printMsg4p
	IMPORT printMsg2p	
    IMPORT printMsghead			
    ENTRY 
	
__main    FUNCTION
	
		VLDR.F32 S20,=0.5
		MOV R12,#0 ;counter
		MOV R11,#1 ;constant
		MOV R7,#1
		B AND0
		
		;B printMsg4p
AND0	VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=0	;x2
		VLDR.F32 S21,=0	;x3
		ADD R12,R12,R11
		B ANDlo
		LTORG
		
AND1	VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=0	;x2
		VLDR.F32 S21,=1	;x3
		ADD R12,R12,R11
		B ANDlo
ANDlo	VLDR.F32 S10,=-0.2 ;bias
		VLDR.F32 S11,=-0.1 ;w0
		VLDR.F32 S12,=0.2	;w1
		VLDR.F32 S13,=0.2	;w2
		B ANDlo1
		LTORG
ANDlo1	VMUL.F32 S16,S21,S13;z=w1x1+w2x2+w3x3
		VMUL.F32 S17,S11,S14
		VMUL.F32 S18,S12,S15
		VADD.F32 S19,S16,S17
		VADD.F32 S19,S19,S18
		VADD.F32 S19,S19,S10
		VMOV.F32 S2,S19
		B main		
AND2	VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=1	;x2
		VLDR.F32 S21,=0	;x3
		ADD R12,R12,R11
		B ANDlo
	
AND3	VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=1	;x2
		VLDR.F32 S21,=1	;x3
		ADD R12,R12,R11
		B ANDlo

		
		
		MOV R12,#0 ;counter
		MOV R11,#1 ;constant
		CMP R7,#2
		BEQ OR0
		;B printMsg4p
OR0		
		MOV R12,#0 ;counter
		MOV R11,#1 ;constant
		VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=0	;x2
		VLDR.F32 S21,=0	;x3
		ADD R12,R12,R11
		B ORlo
		
		
OR1		VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=0	;x2
		VLDR.F32 S21,=1	;x3
		ADD R12,R12,R11
		B ORlo
		
OR2		VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=1	;x2
		VLDR.F32 S21,=0	;x3
		ADD R12,R12,R11
		B ORlo
	
OR3		VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=1	;x2
		VLDR.F32 S21,=1	;x3
		ADD R12,R12,R11
		B ORlo


		CMP R7,#3
		BEQ NOTlo
		B main9
		
	

ORlo	VLDR.F32 S10,=-0.1 ;bias
		VLDR.F32 S11,=-0.1 ;w0
		VLDR.F32 S12,=0.7	;w1
		VLDR.F32 S13,=0.7	;w3
		B ORlo1
		LTORG
ORlo1	VMUL.F32 S16,S21,S13 ;z=w1x1+w2x2+w3x3+bias
		VMUL.F32 S17,S11,S14
		VMUL.F32 S18,S12,S15
		VADD.F32 S19,S16,S17
		VADD.F32 S19,S19,S18
		VADD.F32 S19,S19,S10
		VMOV.F32 S2,S19		
		B main
NOT0		
		MOV R12,#0 ;counter
		MOV R11,#1 ;constant
		VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=0	;x2
		ADD R12,R12,R11
		B NOTlo
		
		
NOT1		VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=0	;x2
		ADD R12,R12,R11
		B NOTlo
		


NOTlo	VLDR.F32 S10,=0.1 ;bias
		B NOTlo1
		LTORG
NOTlo1	VLDR.F32 S11,=0.5 ;w0
		VLDR.F32 S12,=0.7	;w1
		;VLDR.F32 S13,=0.7
		VMUL.F32 S16,S14,S11
		VMUL.F32 S17,S15,S12;z=w1x1+w2x2+bias
		;VMUL.F32 S18,S12,S12
		VADD.F32 S19,S16,S17
		VADD.F32 S19,S19,S10
		VMOV.F32 S2,S19		
		B main
		
main9		CMP R7,#4
		BEQ NANDlo
		
		;CMP R7,#5
		;BEQ NORlo
		
		;CMP R7,#6
		;BEQ XORlo
		
		;CMP R7,#7
		;BEQ XNORlo

		MOV R12,#0 ;counter
		MOV R11,#1 ;constant
		MOV R7,#5
		CMP R7,#4
		BEQ NAND0
		;B printMsg4p
NAND0	
		MOV R12,#0 ;counter
		MOV R11,#1 ;constant
		VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=0	;x2
		VLDR.F32 S21,=0	;x3
		ADD R12,R12,R11
		B NANDlo
		
		
NAND1	VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=0	;x2
		VLDR.F32 S21,=1	;x3
		ADD R12,R12,R11
		B NANDlo
		
NAND2	VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=1	;x2
		VLDR.F32 S21,=0	;x3
		ADD R12,R12,R11
		B NANDlo
	
NAND3	VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=1	;x2
		VLDR.F32 S21,=1	;x3
		ADD R12,R12,R11
		B NANDlo

NANDlo	VLDR.F32 S10,=0.3 ;bias
		VLDR.F32 S11,=0.6 ;w0
		VLDR.F32 S12,=-0.8	;w1,w2
		VLDR.F32 S13,=-0.8
		B NANDlo1
		LTORG	
NANDlo1	VMUL.F32 S16,S21,S13
		VMUL.F32 S17,S11,S14;z=w1x1+w2x2+w3x3+bias
		VMUL.F32 S18,S12,S15
		VADD.F32 S19,S16,S17
		VADD.F32 S19,S19,S18
		VADD.F32 S19,S19,S10
		VMOV.F32 S2,S19		
		B main

	
		
		MOV R7,#5
		CMP R7,#1
		BEQ NOR0
		;B printMsg4p
NOR0	MOV R12,#0 ;counter
		MOV R11,#1 ;constant
		VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=0	;x2
		VLDR.F32 S21,=0	;x3
		ADD R12,R12,R11
		B NORlo
		
		
NOR1	VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=0	;x2
		VLDR.F32 S21,=1	;x3
		ADD R12,R12,R11
		B NORlo
		
NOR2	VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=1	;x2
		VLDR.F32 S21,=0	;x3
		ADD R12,R12,R11
		B NORlo
	
NOR3	VLDR.F32 S14,=1 ;x1
		VLDR.F32 S15,=1	;x2
		VLDR.F32 S21,=1	;x3
		ADD R12,R12,R11
		B NORlo

NORlo	VLDR.F32 S10,=0.1 ;bias
		VLDR.F32 S11,=0.5 ;w0
		VLDR.F32 S12,=-0.7	;w1,w2
		VLDR.F32 S13,=-0.7
		VMUL.F32 S16,S21,S13
		VMUL.F32 S17,S11,S14
		VMUL.F32 S18,S12,S15;z=w1x1+w2x2+w3x3+bias
		VADD.F32 S19,S16,S17
		VADD.F32 S19,S19,S18
		VADD.F32 S19,S19,S10
		VMOV.F32 S2,S19		
		B main
		

XORlo	VLDR.F32 S10,=1 ;bias
		VLDR.F32 S11,=-5 ;w0
		VLDR.F32 S12,=20	;w1,w2
		VLDR.F32 S13,=10
		VMUL.F32 S16,S21,S13
		VMUL.F32 S17,S11,S14
		VMUL.F32 S18,S12,S15;z=w1x1+w2x2+w3x3+bias
		VADD.F32 S19,S16,S17
		VADD.F32 S19,S19,S18
		VADD.F32 S19,S19,S10
		VMOV.F32 S2,S19		
		B main
XNORlo	VLDR.F32 S10,=1 ;bias
		VLDR.F32 S11,=-5 ;w0
		VLDR.F32 S12,=20	;w1,w2
		VLDR.F32 S13,=10
		VMUL.F32 S16,S21,S13
		VMUL.F32 S17,S11,S14
		VMUL.F32 S18,S12,S15;z=w1x1+w2x2+w3x3+bias
		VADD.F32 S19,S16,S17
		VADD.F32 S19,S19,S18
		VADD.F32 S19,S19,S10
		VMOV.F32 S2,S19		
		B main		
main	BL exploop
templo1	BL sigloop	
templo  B final
final	CMP R7,#1
		BEQ final1
		CMP R7,#2
		BEQ final2
		CMP R7,#3
		BEQ final3
		CMP R7,#4
		B fin01

final1	
		VCMP.F32 S0,S20
		VMRS APSR_nzcv, FPSCR
		BLE zero1
		B one1
one1	CMP R12,#1
		BEQ ou111
		CMP R12,#2
		BEQ ou112
		CMP R12,#3
		BEQ ou113
		CMP R12,#4
		BEQ ou114
		
zero1	CMP R12,#1
		BEQ ou101
		CMP R12,#2
		BEQ ou102
		CMP R12,#3
		BEQ ou103
		CMP R12,#4
		BEQ ou104
		
ou111	MOV R0,#1
		B AND1
ou112	MOV R1,#1
		B AND2
ou113	MOV R2,#1
		B AND3
ou114	MOV R3,#1
		MOV R7,#2
		BL printMsg4p
		B OR0
ou101	MOV R0,#0
		B AND1
ou102	MOV R1,#0
		B AND2
ou103	MOV R2,#0
		B AND3
ou104	MOV R3,#0
		MOV R7,#2
		BL printMsg4p
		B OR0
final2	
		VCMP.F32 S0,S20
		VMRS APSR_nzcv, FPSCR
		BLE zero2
		B one2
one2	CMP R12,#1
		BEQ ou211
		CMP R12,#2
		BEQ ou212
		CMP R12,#3
		BEQ ou213
		CMP R12,#4
		BEQ ou214
		
zero2	CMP R12,#1
		BEQ ou201
		CMP R12,#2
		BEQ ou202
		CMP R12,#3
		BEQ ou203
		CMP R12,#4
		BEQ ou204
		
ou211	MOV R0,#1
		B OR1
ou212	MOV R1,#1
		B OR2
ou213	MOV R2,#1
		B OR3
ou214	MOV R3,#1
		MOV R7,#3
		BL printMsg4p
		B NAND0
ou201	MOV R0,#0
		B OR1
ou202	MOV R1,#0
		B OR2
ou203	MOV R2,#0
		B OR3
ou204	MOV R3,#0
		MOV R7,#3
		BL printMsg4p
		B NAND0
			
final3	
		VCMP.F32 S0,S20
		VMRS APSR_nzcv, FPSCR
		BLE zero3
		B one3
one3	CMP R12,#1
		BEQ ou311
		CMP R12,#2
		BEQ ou312
		CMP R12,#3
		BEQ ou313
		CMP R12,#4
		BEQ ou314
		
zero3	CMP R12,#1
		BEQ ou301
		CMP R12,#2
		BEQ ou302
		CMP R12,#3
		BEQ ou303
		CMP R12,#4
		BEQ ou304
		
ou311	MOV R0,#1
		B NAND1
ou312	MOV R1,#1
		B NAND2
ou313	MOV R2,#1
		B NAND3
ou314	MOV R3,#1
		BL printMsg4p
		B NOR0
ou301	MOV R0,#0
		B NAND1
ou302	MOV R1,#0
		B NAND2
ou303	MOV R2,#0
		B NAND3
ou304	MOV R3,#0
		MOV R7,#4
		BL printMsg4p
		B NOR0
fin01 	BEQ final4
		CMP R7,#5
		BEQ final5
final4	
		VCMP.F32 S0,S20
		VMRS APSR_nzcv, FPSCR
		BLE zero4
		B one4
one4	CMP R12,#1
		BEQ ou411
		CMP R12,#2
		BEQ ou412
		CMP R12,#3
		BEQ ou413
		CMP R12,#4
		BEQ ou414
		
zero4	CMP R12,#1
		BEQ ou401
		CMP R12,#2
		BEQ ou402
		CMP R12,#3
		BEQ ou403
		CMP R12,#4
		BEQ ou404
		
ou411	MOV R0,#1
		B NOR1
ou412	MOV R1,#1
		B NOR2
ou413	MOV R2,#1
		B NOR3
ou414	MOV R3,#1
		MOV R7,#5
		BL printMsg4p
		B NOT0
ou401	MOV R0,#0
		B AND1
ou402	MOV R1,#0
		B AND2
ou403	MOV R2,#0
		B AND3
ou404	MOV R3,#0
		MOV R7,#5
		BL printMsg4p
		B NOT0	
		
final5	VCMP.F32 S0,S20
		VMRS APSR_nzcv, FPSCR
		BLE zero6
		B one6	
	
one6	CMP R12,#1
		BEQ ou611
		CMP R12,#2
		BEQ ou612
		
zero6	CMP R12,#1
		BEQ ou601
		CMP R12,#2
		BEQ ou602
		
ou611	MOV R0,#1
		B NOT1
ou612	MOV R1,#1
		BL printMsg2p

ou601	MOV R0,#0
		B NOT1
ou602	MOV R1,#0
		B printMsg2p
		


		
stop    B stop
sigloop PUSH {R6,LR}
		VLDR.F32 S4,=1 ;temp
		VADD.F32 S3,S0,S4
		VDIV.F32 S0,S0,S3;e^x/(1+e^x)	
		;B templo
		SUB LR,#0x1
		POP {R6,LR}
		BX LR
exploop	PUSH {R8,LR}
		MOV R9,#10;Number of terms in the seires
        MOV R10,#1;counter 
        VLDR.F32 S0,=1;Value of e in every iteration 
        VLDR.F32 S1,=1;temp variable 
        ;VLDR.F32 S2,=5;value of x 
LOOP1   CMP R10,R9;Compare counter and N  
        BLE LOOP;if the neg flag is set then loop
        ;B templo1;else stop
		SUB LR,#1
		POP {R8,LR}
		BX LR
			
LOOP    VMUL.F32 S1,S1, S2; t = t*x 
        VMOV.F32 S5,R10; 
        VCVT.F32.U32 S5, S5;
        VDIV.F32 S1,S1,S5; 
        VADD.F32 S0,S0,S1;
        ADD R10,R10,#1;
        B LOOP1;		
        ENDFUNC 
        END

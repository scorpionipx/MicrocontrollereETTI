#include p16f887.inc

i 		equ 0x20
j 		equ 0x21
N 		equ 0x22
c1 		equ 0x23
c2 		equ 0x24
c1_2 	equ 0x25
c2_2 	equ 0x26
c0_2 	equ 0x27

org 0x00
goto main
org 0x10

main:
	BSF STATUS, RP0 ; 	portul 1
	CLRF TRISD;			pinii D iesire
	BCF STATUS,RP0;		portul 0
	
	MOVLW D'10'
	MOVWF N;			N=10
	CLRF i;				i=0
	
	TriCresc:
		MOVLW D'1'
		MOVWF j;			j=1;
		
		;verificam daca i=0 pentru a nu fi nevoie sa intram in Loop1TriCresc
		MOVF i,1;			i=i;
		BTFSC STATUS, Z			
			GOTO Loop0TriCresc	;z=1 daca i=0
								;z=0 daca i=1
								
		;stam in "1" pana cand j il depaseste pe i
		Loop1TriCresc:
			BSF PORTD,7			; pin7 port D pe '1'
			CALL delay_20ms
			INCF j,1			; j++
			MOVF j,0			; W=j
			SUBWF i,0 			; W=i-j
			BTFSC STATUS,C 		
				GOTO Loop1TriCresc		;c=1 daca i-j>=0
										;c=0 daca i-j<0 
		
		
		;verificam daca j a depasit pe N, ceea ce ne spune ca a ajuns la valoarea maxima a PVM
		MOVF j,0		;W=j
		SUBWF N,0		;W=N-j
		BTFSS STATUS,C		
			GOTO SfTriCresc
			
		;stam in '0' pana j	il depaseste pe N
		Loop0TriCresc:
			BCF PORTD,7			;pinul 7 port D pe '0'
			CALL delay_20ms
			INCF j,1			;j++
			MOVF j,0			;W=j
			SUBWF N,0			;W=N-j
			BTFSC STATUS,C
				GOTO Loop0TriCresc		;c=1 N-j>=0
										;c=0 N-j<0
			
		;Incrementam i si ne reintoarcem la inceputul codului	
		INCF i,1	;i++
		MOVF i,0	;W=i
		SUBWF N,0	;W=N-i
		BTFSC STATUS,C
			GOTO TriCresc	;c=1 N-i>=0
							;c=0 N-i<0
							
	SfTriCresc:


	
	TriDescresc:
	
		
		MOVLW D'1'
		MOVWF j;			j=1;
		


	;verificam daca i=0 pentru a nu fi nevoie sa intram in Loop1TriCresc
		MOVF i,1;			i=i;
		BTFSC STATUS, Z			
			GOTO Loop0TriDescresc	;z=1 daca i=0
								;z=0 daca i=1
		
		;stam in "1" pana cand j il depaseste pe i
		Loop1TriDescresc
			BSF PORTD,7			; pin7 port D pe '1'
			CALL delay_20ms
			INCF j,1			; j++
			MOVF j,0			; W=j
			SUBWF i,0 			; W=i-j
			BTFSC STATUS,C 		
				GOTO Loop1TriDescresc		;c=1 daca i-j>=0
											;c=0 daca i-j<0 
		
	
								
		;stam in '0' pana j	il depaseste pe N						
		Loop0TriDescresc:
			BCF PORTD,7			;pinul 7 port D pe '0'
			CALL delay_20ms
			INCF j,1			;j++
			MOVF j,0			;W=j
			SUBWF N,0			;W=N-j
			BTFSC STATUS,C
				GOTO Loop0TriDescresc		;c=1 N-j>=0
			;Decrementam i si ne reintoarcem la inceputul codului	
		DECF i,1	;i--
		MOVF i,0	;W=i
		BTFSS STATUS,Z
			GOTO TriDescresc	;z=0 i != 0
								;z=1 i == 0			
								
															
										
				
	SfTriDescresc:									
		
			
			
; PARTEA A DOUA 		

TriCresc2:
		MOVLW D'1'
		MOVWF j;			j=1;
		
		;verificam daca i=0 pentru a nu fi nevoie sa intram in Loop1TriCresc
		MOVF i,1;			i=i;
		BTFSC STATUS, Z			
			GOTO Loop0TriCresc2	;z=1 daca i=0
								;z=0 daca i=1
								
		;stam in
		Loop1TriCresc2:
			BSF PORTD,7			; pin7 port D pe '1'
			CALL delay_20ms
			INCF j,1			; j++
			MOVF j,0			; W=j
			SUBWF i,0 			; W=i-j
			BTFSC STATUS,C 		
				GOTO Loop1TriCresc2		;c=1 daca i-j>=0
										;c=0 daca i-j<0 "1" pana cand j il depaseste pe i
		
		
		;verificam daca j a depasit pe N, ceea ce ne spune ca a ajuns la valoarea maxima a PVM
		MOVF j,0		;W=j
		SUBWF N,0		;W=N-j
		BTFSS STATUS,C		
			GOTO SfTriCresc2
			
		;stam in '0' pana j	il depaseste pe N
		Loop0TriCresc2:
			BCF PORTD,7			;pinul 7 port D pe '0'
			CALL delay_20ms
			INCF j,1			;j++
			MOVF j,0			;W=j
			SUBWF N,0			;W=N-j
			BTFSC STATUS,C
				GOTO Loop0TriCresc2		;c=1 N-j>=0
										;c=0 N-j<0
			
		;Incrementam i si ne reintoarcem la inceputul codului	
		INCF i,1	;i++
		MOVF i,0	;W=i
		SUBWF N,0	;W=N-i
		BTFSC STATUS,C
			GOTO TriCresc2	;c=1 N-i>=0
							;c=0 N-i<0
							
	SfTriCresc2:

	CALL delay_2sec

	TriDescresc2:	
		
		MOVLW D'1'
		MOVWF j;			j=1;
		
	
		;verificam daca i este mai mare decat N
		MOVF i,0		; W=i
		SUBWF N,0 		; W=N-i
		BTFSS STATUS, C	
			GOTO Loop1TriDescresc2	;c=0 daca N-i<0
									;c=1 daca N-j>=0
		
		;stam in
		Loop1TriDescresc2
			BSF PORTD,7			; pin7 port D pe '1'
			CALL delay_20ms
			INCF j,1			; j++
			MOVF j,0			; W=j
			SUBWF i,0 			; W=i-j
			BTFSC STATUS,C 		
				GOTO Loop1TriDescresc2		;c=1 daca i-j>=0
											;c=0 daca i-j<0 "1" pana cand j il depaseste pe i
		
		;verificam daca i=0 pentru a nu fi nevoie sa intram in Loop1TriCresc
		MOVF i,1;			i=i;
		BTFSC STATUS, Z			
			GOTO Loop0TriDescresc2	;z=1 daca i=0
								;z=0 daca i=1
								
		;stam in '0' pana j	il depaseste pe N						
		Loop0TriDescresc2:
			BCF PORTD,7			;pinul 7 port D pe '0'
			CALL delay_20ms
			INCF j,1			;j++
			MOVF j,0			;W=j
			SUBWF N,0			;W=N-j
			BTFSC STATUS,C
				GOTO Loop0TriDescresc2		;c=1 N-j>=0
				
		;Decrementam i si ne reintoarcem la inceputul codului	
		DECF i,1	;i--
		MOVF i,0	;W=i
		BTFSS STATUS,Z
			GOTO TriDescresc2	;z=0 i != 0
								;z=1 i == 0			
								
										
				
	SfTriDescresc2:									
		





	NOP

delay_20ms:
	MOVLW D'2'
	MOVWF c1		;c1=20
	
	LoopC1:
		MOVLW D'10'
		MOVWF c2		;c2=250
		
		LoopC2:
			NOP				;1CM 
			DECFSZ c2,1		;1-2CM	;C2-- pana cand ajunge la 0 si executa urmatoarea linie,
									;sare peste daca ajunge la valoarea 0 
			GOTO LoopC2		;2CM
		DECFSZ c1,1
		GOTO LoopC1
RETURN

delay_2sec:
MOVLW D'10'
MOVWF c0_2					;c0_2= 100
LoopC0_2:
	MOVLW D'20'
	MOVWF c1_2				;c1_0=20
	
	LoopC1_2:
		MOVLW D'10'
		MOVWF c2_2			;c2_0=250
		
		LoopC2_2:
			NOP				;1CM 
			DECFSZ c2_2,1		;1-2CM	;C2-- pana cand ajunge la 0 si executa urmatoarea linie,
									;sare peste daca ajunge la valoarea 0 
			GOTO LoopC2_2		;2CM
		DECFSZ c1_2,1
		GOTO LoopC1_2
	DECFSZ c0_2,1
	GOTO LoopC0_2

RETURN
end
	
		
							
			
				
									
			
		
		
	
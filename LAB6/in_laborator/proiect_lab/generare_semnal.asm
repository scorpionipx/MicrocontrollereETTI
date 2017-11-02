#include p16f84.inc

i equ 0x20; contor generare semnal

main:
	BSF STATUS, RP0; pozitionare bank 1
	MOVLW B'11111110'
	MOVWF TRISB; RB0 output
	BCF STATUS, RP0; revenire in bank 0
	
	MOVLW D'5'
	MOVWF i
	
	LOOP:
		BSF PORTB, 0; set 1 to RB0
		NOP; keep 1 on RB0
		NOP; keep 1 on RB0
	
		BCF PORTB, 0; set 0 to RB0
		NOP; keep 0 on RB0
		NOP; keep 0 on RB0
		NOP; keep 0 on RB0
	
		BSF PORTB, 0; set 1 to RB0
		NOP; keep 1 on RB0
	
		BCF PORTB, 0; set 0 to RB0

		DECFSZ i, 1
		GOTO LOOP

	NOP
	end


	

	
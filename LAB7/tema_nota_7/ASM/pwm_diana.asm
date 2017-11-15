#include p16f84.inc

i equ 0x20
j equ 0x21

main:
	BSF STATus, RP0; pozitionare bank 1
	MOVLW B'00111111'
	MOVWF TRISB; RB6, RB7 output
	BCF STATus, RP0; revenire in bank 0
	
	MOVLW D'5'
	MOVWF i

	MOVLW B'00000000'
	MOVWF PORTB

	BSF PORTB, RB6

	MAIN_LOOP:
		
		BCF PORTB, RB7
		CALL _delay_50us
		BSF PORTB, RB7
		CALL _delay_50us
		BCF PORTB, RB6
		CALL _delay_50us
		BCF PORTB, RB7
		CALL _delay_50us
		BSF PORTB, RB6

		DECFSZ i, 1
			GOTO MAIN_LOOP
		GOTO END_OF_PROGRAM

	_delay_50us:
		
		MOVLW D'9'
		MOVWF j
		
		loop_j:
			NOP
			NOP
			DECFSZ j, 1
			GOTO loop_j
			RETURN

	END_OF_PROGRAM:
		end


	
#include p16f887.inc

; f_osc = 4MHz
; 1 CM = 1 us

i equ 0x20
j equ 0x21

main:

	BSF STATUS, RP0; pozitionare bank 1
	BCF STATUS, RP1; pozitionare bank 1

	MOVLW B'11111111'
	MOVWF TRISB; RB0 input

	MOVLW D'0'
	MOVWF TRISD; RD0 output

	BSF STATUS, RP0; pozitionare bank 3
	BSF STATUS, RP1; pozitionare bank 3

	CLRF ANSEL
	CLRF ANSELH

	BCF STATUS, RP1; pozitionare bank 1
	BCF STATUS, RP0; revenire in bank 0
	
	MOVLW D'0'
	MOVWF PORTB 
	MOVWF PORTD

	semnal_10HZ:
		NOP
		;BSF PORTD, RD0
		;MOVLW D'255'
		MOVLW B'11111111'
		MOVWF PORTD
		CALL delay_100ms
		;BCF PORTD, RD0
		CLRF PORTD
		CALL delay_100ms
		BTFSC PORTB, RB0
			GOTO semnal_10HZ
		GOTO change_to_5
		
	semnal_5HZ:
		NOP
		;BSF PORTD, RD0
		MOVLW D'255'
		MOVWF PORTD
		CALL delay_100ms
		CALL delay_100ms
		CALL delay_100ms
		CALL delay_100ms
		;BCF PORTD, RD0
		CLRF PORTD
		CALL delay_100ms
		CALL delay_100ms
		CALL delay_100ms
		CALL delay_100ms
		BTFSC PORTB, RB0
			GOTO semnal_5HZ
		GOTO change_to_10

change_to_10:
	CALL delay_100ms
	CALL delay_100ms
	CALL delay_100ms
	CALL delay_100ms
	GOTO semnal_10HZ

change_to_5:
	CALL delay_100ms
	CALL delay_100ms
	CALL delay_100ms
	CALL delay_100ms
	GOTO semnal_5HZ

delay_100ms:
	MOVLW D'50'
	MOVWF j

	loop_j:
		MOVLW D'249'
		MOVWF i
	loop_i:
		NOP
		DECFSZ i,1
			GOTO loop_i
		DECFSZ j, 1
			GOTO loop_j
	RETURN

end
		
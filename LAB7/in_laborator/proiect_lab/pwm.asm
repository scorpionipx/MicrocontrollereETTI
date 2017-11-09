; fosc = 4MHz
; 1 cm = 4 tacte
; 1 sec = 10^6 cm
; 1 cm = 1 us
; 1 ms = 1000 cm

#include p16f84.inc

i equ 0x20
j equ 0x21

main:
	BSF STATUS, RP0
	MOVLW B'00001111'
	MOVWF TRISB
	BCF STATUS, RP0
	
	MOVLW D'10'
	MOVWF i

LOOP_PWM:
	NOP
	BSF PORTB, 5
	CALL delay_1ms
	NOP 
	NOP
	NOP
	NOP

	NOP
	BCF PORTB, 5
	CALL delay_1ms
	NOP

	DECFSZ i, 1
	GOTO LOOP_PWM
	NOP
	

delay_1ms:
	MOVLW D'198'
	MOVWF j
	
	loop_j:
		NOP
		NOP
		DECFSZ j, 1
		GOTO loop_j
		RETURN

end
	
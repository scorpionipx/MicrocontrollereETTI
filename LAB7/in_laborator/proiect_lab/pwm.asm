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
	
	BTFSC PORTB, 0
	GOTO button_apasat
	
button_neapasat:	
	BSF PORTB, 5
	CALL delay_1ms

	BCF PORTB, 5
	CALL delay_1ms

	DECFSZ i, 1
	GOTO button_end
	NOP
	
button_apasat:
	
	BSF PORTB, 5
	CALL delay_third_ms
	BCF PORTB, 5
	CALL delay_third_ms
	CALL delay_third_ms

button_end:
	DECFSZ i,1
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

delay_half_ms:

	MOVLW D'99'
	MOVWF j
	
	loop_ji:
		NOP
		NOP
		DECFSZ j, 1
		GOTO loop_ji
		RETURN

delay_third_ms:

	MOVLW D'67'
	MOVWF j
	
	loop_jiy:
		NOP
		NOP
		DECFSZ j, 1
		GOTO loop_jiy
		RETURN

end
	
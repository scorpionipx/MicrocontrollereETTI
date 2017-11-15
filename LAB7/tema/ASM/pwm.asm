; 	Enunt tema nota 10: sa se implementeze un program ASM capabil sa 
; genereze un semnal PWM cu factor de umplere variabil. Semnalul va
; generat pe pinul RB7 al portului B. Schimbarea factorului de umplere 
; se va face cu ajutorul unui buton a carui stare este citita pe pinul
; RB0 al portului B. Perioada semnalului PWM este de 1ms. Se vor 
; configura urmatorii factori de umplere: 0, 1/5, 2/5, 3/5, 4/5, 1.
; Se considera ca uC-ul foloseste un cristal de quartz de 4MHz => 
; 1 CM = 1us

#include p16f84.inc

#define BUTTON RB0
#define SIGNAL RB7

main:
	BSF STATUS, RP0; pozitionare bank 1
	MOVLW B'01111111'
	MOVWF TRISB; RB0 input, RB7 output 
	BCF STATUS, RP0; revenire in bank 0
	
	MOVLW D'0'
	MOVWF PORTB 

	PWM_0:
		BTFSC PORTB, BUTTON
			GOTO PWM_1_5
		GOTO PWM_0

	PWM_1_5:
		BSF PORTB, SIGNAL
		call DELAY_200US

		BCF PORTB, SIGNAL
		call DELAY_800US

		BTFSC PORTB, BUTTON
			GOTO PWM_2_5
		GOTO PWM_1_5

	PWM_2_5:
		BSF PORTB, SIGNAL
		call DELAY_400US

		BCF PORTB, SIGNAL
		call DELAY_600US

		BTFSC PORTB, BUTTON
			GOTO PWM_3_5
		GOTO PWM_2_5

	PWM_3_5:
		BSF PORTB, SIGNAL
		call DELAY_600US

		BCF PORTB, SIGNAL
		call DELAY_400US

		BTFSC PORTB, BUTTON
			GOTO PWM_4_5
		GOTO PWM_3_5

	PWM_4_5:
		BSF PORTB, SIGNAL
		call DELAY_600US

		BCF PORTB, SIGNAL
		call DELAY_400US

		BTFSC PORTB, BUTTON
			GOTO PWM_1
		GOTO PWM_4_5

	PWM_1:
		BTFSC PORTB, BUTTON
			GOTO PWM_0
		GOTO PWM_1
		
	DELAY_200US:
		MOVLW D'39'
		ADDLW D'255'
		BTFSC STATUS, Z
			RETURN
		GOTO DELAY_200US
		

NOP
end

	
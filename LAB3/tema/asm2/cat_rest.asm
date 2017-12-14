#include p16f84.inc

; Enunt: sa se implementeze un program ASM care sa calculeze catul si restul 
; impartirii numarului x la numarul y prin scaderi repetate.
; ScorpionIPX

;assign memory for variables
x equ 0x20
y equ 0x21
cat equ 0x22
rest equ 0x23

main:

	; assign values to variables

	MOVLW D'20'; W <- 20 - acumulator gets value 20
	MOVWF x;n <- W, - x gets acumulator's value

	MOVLW D'3'; W <- 0 - acumulator gets value 0
	MOVWF y;y <- W - y gets acumulator's value

	MOVLW D'0'; W <- 0 - acumulator gets value 0
	MOVWF cat;cat <- W - cat gets acumulator's value

	MOVLW D'0'; W <- 0 - acumulator gets value 0
	MOVWF rest;rest <- W - rest gets acumulator's value

	NOP;

	;if (x - y >= 0) => carry = 1

	calculate:

		MOVF y, 0; load coef into acumulator
		SUBWF x, 0; x = x - y
		NOP;
		BTFSS STATUS, C;check if carry; C = 0, position of carry flag bit
		GOTO end_calculate; if (x - y >= 0), results are not calculated
		NOP;
		
		
		INCF cat; increment cat's value
		MOVWF x; x = x - y

		NOP;
		GOTO calculate
	
	end_calculate:
		MOVF x, 0;
		MOVWF rest;
		NOP
	end

	


	
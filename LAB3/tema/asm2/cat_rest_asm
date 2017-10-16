#include p16f84.inc

; Enunt: Sa se scrie un program ASM care sa calculeaza suma 1 + 2 + 3 + ... + n,
; unde n este un numar predefinit.
; ScorpionIPX

;assign memory for variables
n equ 0x20; last coef to be added
s equ 0x21; calculated sum
c equ 0x22; coef to be added

main:
	; assign values to variables
	MOVLW D'5'; W <- 9 - acumulator gets value 9
	MOVWF n;n <- W, - x gets acumulator value

	MOVLW D'0'; W <- 0 - acumulator gets value 0
	MOVWF s;s <- W - c gets acumulator value

	;MOVLW D'0'; W <- 0 - acumulator gets value 0
	MOVWF c;c <- W - c gets acumulator value
	NOP;


	;if (n - c >= 0) => carry = 1
	DECF n; decrement n for easier implementation
	calculate_sum:
		MOVF c, 0; load coef into acumulator
		SUBWF n, 0; W = n - c
		BTFSS STATUS, C;check if carry; C = 0, position of carry flag bit
		GOTO end_calculate_sum; if (n - c >= 0), sum is not calclated
		INCF c; increment coeficient
		NOP;
		MOVF c, 0; load coef into acumulator
		NOP;
		ADDWF s, 1; add acumulator to sum's value
		GOTO calculate_sum
		NOP;
	
	end_calculate_sum:
		NOP
	end

	


	
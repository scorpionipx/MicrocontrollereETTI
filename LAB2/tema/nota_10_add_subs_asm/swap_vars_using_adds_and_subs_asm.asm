#include p16f84.inc

; Enunt: Sa se scrie un program ASM care sa interschimbe valorile a doua
; variabile. Restricite: nu se poate folosi o variabila intermediara.
; ScorpionIPX

;assign memory for variables
x equ 0x20
y equ 0x21

main:
	; assign values to variables
	MOVLW D'13'; W <- 13 - acumulator get value 13
	MOVWF x;x <- W - x gets acumulator value

	MOVLW D'10'; W <- 10 - acumulator get value 10
	MOVWF y;y <- W - y gets acumulator value

	NOP;no operation, usefull for breakpoints

	; swap variables' values
	ADDWF x, 1;x <- x + y 
	SUBWF x, 0;W <- W - x
	MOVWF y;y = w
	SUBWF x,1;x <- x - w

	NOP;no operation, usefull for breakpoints

	end
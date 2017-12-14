#include p16f84.inc

<<<<<<< HEAD:LAB2/tema_nota_10.asm
; Enunt: Sa se scrie un program ASM care sa interschimbe valorile a doua
; variabile. Restricite: nu se poate folosi o variabila intermediara.
; ScorpionIPX
=======
void main(void)
{
	unsigned char x, y;
>>>>>>> b5f1a7a66a4a20029bfa1d10edcb9d1c5110c46d:LAB2/tema_nota_10.c

;assign memory for variables
x equ 0x20
y equ 0x21

<<<<<<< HEAD:LAB2/tema_nota_10.asm
main:
	; assign values to variables
	MOVLW D'13'; W <- 13 - acumulator get value 13
	MOVWF x;x <- W - x gets acumulator value

	MOVLW D'10'; W <- 10 - acumulator get value 10
	MOVWF y;y <- W - y gets acumulator value

	NOP;no operation, usefull for breakpoints

	; swap variables' values
	XORWF x, 1; x = W(=y) XOR x
	NOP;no operation, usefull for breakpoints

	MOVF x, 0
	XORWF y, 1
	NOP;no operation, usefull for breakpoints

	MOVF y,0
	XORWF x, 1; W = y XOR x
	NOP;no operation, usefull for breakpoints

	end
=======
	x ^= y;
	y ^= x;
	x ^=y;
}
>>>>>>> b5f1a7a66a4a20029bfa1d10edcb9d1c5110c46d:LAB2/tema_nota_10.c

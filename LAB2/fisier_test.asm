#include p16f84.inc

;assign memory for variables
;x is equivalent of memoriy zone 0x20, similar to C/C++ #define
x equ 0x20
y equ 0x21
s equ 0x22

;instructions description
;========================
;MOVLW C - move constant into acumulator, C = constant
;MOVWF Reg - move acumulator into register, Reg = register
;MOVF Reg, d - move register
;              d = 1 => destination is register
;              d = 0 => destination is acumulator
;usefull for testing if reg is zero

;ADDLW C - sum with constant, result saved into acumulator <=> W += C
;ADDWF Reg, d - d = 0 => destination is W(acumulator)
;               d = 1 => destination is register

;main program label
main:
	MOVLW D'100'; W <- 100 - acumulator get value 100
	MOVWF x;x <- W - x gets acumulator value

	MOVLW D'150'; W <- 150 - acumulator get value 100
	MOVWF y;y <- W - y gets acumulator value

	MOVF x, 0; move x to acumulator, W = x
	ADDWF y, 0; W = x + y (W has x value from previous instruction)

	MOVWF s; s = W, move sum rsult into s

	NOP;no operation, usefull for breakpoints

	end
	
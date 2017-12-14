#include p16f84.inc

;assign memory for variables
;x is equivalent of memoriy zone 0x20, similar to C/C++ #define
x equ 0x20
y equ 0x21
s equ 0x22; store sum.sub of x and y
aux equ 0x23; used for exchange

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

;SUBLW C - Substract acumulator from constant <=> C - W, result is stored into W(acumulator)
;SUBWF Reg, d - Substracy acumulator from register <=> Reg - W
;               d = 0, result stored into acumulator
;               d = 1, result stored into register 

;BTFSC Reg, bit_position - bit test file skip clear => test a bit of a register and skip if it is zero [bit_position = 0, 1, ..., 7]
;BTFSS Reg, bit_position - 

;main program label
main:
	; assign values to variables
	MOVLW D'200'; W <- 200 - acumulator get value 100
	MOVWF x;x <- W - x gets acumulator value

	MOVLW D'156'; W <- 156 - acumulator get value 100
	MOVWF y;y <- W - y gets acumulator value

	; calculate sum/sub

	MOVF x, 0; move x to acumulator, W = x
	;ADDWF y, 0; W = x + y (W has x value from previous instruction)
	SUBWF y, 0; W = x - y (W has x value from previous instruction)

	MOVWF s; s = W, move sum/substract result into s

	NOP;no operation, usefull for breakpoints

	;end

; exchange variables if x > y
; same as check if x - y > 0 or y - x < 0
; if x - y >= 0 => carry = 1
; if x - y < 0 => c = 0

; implemented testing if x - y < 0 => x must be put into acumulator 
	MOVF x, 0; W = x
	SUBWF y, 0; W = y - x
	BTFSC STATUS, C; C = 0, position of carry flag bit	
	GOTO end_exchange;skip echange function
;exchange fucton label
exchange:
	MOVF x, 0;W = x
	MOVWF aux;aux = W

	MOVF y, 0;W = y
	MOVWF x;x = W(y)

	MOVF aux, 0;W = aux
	MOVWF y;y = W(aux)
end_exchange:
	NOP; no operation
	end
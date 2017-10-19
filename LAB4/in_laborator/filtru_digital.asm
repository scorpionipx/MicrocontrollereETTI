#include p16f84.inc

yh equ 0x20
yl equ 0x21

x0 equ 0x22
x1 equ 0x23
x2 equ 0x24

Ra equ 0x25
Rb equ 0x26
i  equ 0x27

ORG 0x00    ; rulare in relocable
GOTO main   ; in relocable nu se poate folosi fereastra Watch
ORG 0x10    ;

main:
	MOVLW D'100'
	MOVWF x0

	MOVLW D'50'
	MOVWF x1

	MOVLW D'25'
	MOVWF x2

	CLRF yh
	CLRF yl

	NOP;

	MOVF x0, 0
	MOVWF Ra ; Ra = x0

	MOVLW D'6'
	MOVWF Rb ; Rb = 6

	CALL PRODUS

	NOP;

	MOVF x1, 0
	MOVWF Ra ; Ra = x1

	MOVLW D'6'
	MOVWF Rb; Rb = 6

	CALL PRODUS

	NOP;

	MOVF x2, 0
	MOVWF Ra ; Ra = x2

	MOVLW D'4'
	MOVWF Rb; Rb = 6

	CALL PRODUS

	BCF STATUS, C
	RRF yh, 1 ;nu se mai sterge carry, acesta se va muta in yl
	RRF yl, 1

	BCF STATUS, C
	RRF yh, 1 ;nu se mai sterge carry, acesta se va muta in yl
	RRF yl, 1

	BCF STATUS, C
	RRF yh, 1 ;nu se mai sterge carry, acesta se va muta in yl
	RRF yl, 1

	BCF STATUS, C
	RRF yh, 1 ;nu se mai sterge carry, acesta se va muta in yl
	RRF yl, 1

	; se pot sterge cei 4 biti de carry prin AND 0b00001111

	NOP;
	GOTO END_

PRODUS:
	MOVF Rb, 0
	MOVWF i
LOOP:
	MOVF Ra, 0
	ADDWF yl, 1
	BTFSC STATUS, C
		INCF yh, 1
	DECFSZ i, 1
	GOTO LOOP
	RETURN
	NOP
END_:
	NOP;
	end

	
	
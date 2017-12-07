#include p16f887.inc

; a-b < 0 => c = 0
; a-b >= 0 => c = 1

i  equ 0x20
j  equ 0x21
N  equ 0x22
c1 equ 0x23
c2 equ 0x24

org 0x00
goto main
org 0x10

main:
	BSF STATUS, RP0; bank 1
	CLRF TRISD; port D iesire
	BCF STATUS, RP0; bank 0
	MOVLW D'10'; W = 10
	MOVWF N; N = 10
	CLRF i; i = 0
	
triunghi_crescator:
	MOVLW D'1'; W = 1
	MOVWF j; j = 1
	MOVF i, 1; i = i, pentru a verifica flagul Z
	BTFSC STATUS,Z
		GOTO loop_0_triunghi

loop_1_triunghi:
	BSF PORTD, 7; PD7 high
	CALL delay_20ms; wait 20 ms
	INCF j, 1; j++
	MOVF j,0; W = j
	SUBWF i, 0
	BTFSC STATUS, C;
		GOTO loop_1_triunghi	
	MOVF j, 0; W = j
	BTFSS STATUS, C
		GOTO sfarsit_triunghi_crescator


loop_0_triunghi:
	BCF PORTD ,7; PD7 low
	INCF j, 1; j++
	MOVF j, 0; W = j
	SUBWF N, 0;
	BTFSC STATUS, C
		GOTO loop_0_triunghi

	INCF i, 1; i++
	MOVF i, 0; W = i
	SUBWF N, 0;
	BTFSC STATUS, C
		GOTO triunghi_crescator
	
sfarsit_triunghi_crescator:
	NOP

delay_20ms:
	MOVLW D'20'; W = 20
	MOVWF c1; c1 = 20
	LOOP_c1:
		MOVLW D'250'; W = 250
		MOVWF c2; c2 = 250
	LOOP_c2:
		DECFSZ c2, 1
		GOTO LOOP_c2
	DECFSZ c1,1; c1--
		GOTO LOOP_c1
	RETURN

end
	

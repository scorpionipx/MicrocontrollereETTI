#include p16f887.inc

Ra equ 0x20;
Rb equ 0x25; A5 bank1
Rc equ 0x20; 120 bank2

main:
	BCF STATUS, RP1
	BCF STATUS, RP0; {0, 0} -> pozitionare in bank0
	
	MOVLW D'200'
	MOVWF Ra

	BCF STATUS, RP1
	BSF STATUS, RP0; {0, 1} -> pozitionare in bank1

	MOVLW D'150'
	MOVWF Rb
	
	BCF STATUS, RP1
	BCF STATUS, RP0; {0, 0} -> pozitionare in bank0

	ADDWF Ra, 0; W += Ra
	
	BSF STATUS, RP1
	BCF STATUS, RP0; {1, 0} -> pozitionare in bank2

	MOVWF Rc
	RRF Rc, 1
	NOP
	
	end



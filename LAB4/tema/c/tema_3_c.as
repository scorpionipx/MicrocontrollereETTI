opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F84
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_calc_Y
	FNCALL	_calc_Y,___wmul
	FNROOT	_main
psect	text135,local,class=CODE,delta=2
global __ptext135
__ptext135:
	file	"tema_3_c.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??___wmul
??___wmul:	; 0 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	ds	2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	ds	2
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	2
	global	?_calc_Y
?_calc_Y:	; 2 bytes @ 0x6
	global	calc_Y@coef_1
calc_Y@coef_1:	; 1 bytes @ 0x6
	ds	1
	global	calc_Y@_y
calc_Y@_y:	; 2 bytes @ 0x7
	ds	2
	global	??_calc_Y
??_calc_Y:	; 0 bytes @ 0x9
	ds	10
	global	calc_Y@coef_0
calc_Y@coef_0:	; 1 bytes @ 0x13
	ds	1
	global	calc_Y@result
calc_Y@result:	; 2 bytes @ 0x14
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x16
	ds	1
	global	main@y0
main@y0:	; 2 bytes @ 0x17
	ds	2
	global	main@y1
main@y1:	; 2 bytes @ 0x19
	ds	2
	global	main@x0
main@x0:	; 1 bytes @ 0x1B
	ds	1
	global	main@x1
main@x1:	; 1 bytes @ 0x1C
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x1D
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66     30      30

;;
;; Pointer list with targets:

;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?_calc_Y	int  size(1) Largest target is 1
;;		 -> calc_Y@coef_0(BANK0[1]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_calc_Y
;;   _calc_Y->___wmul

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 8     8      0     322
;;                                             22 BANK0      8     8      0
;;                             _calc_Y
;; ---------------------------------------------------------------------------------
;; (1) _calc_Y                                              16    13      3     182
;;                                              6 BANK0     16    13      3
;;                             ___wmul
;; ---------------------------------------------------------------------------------
;; (2) ___wmul                                               6     2      4      92
;;                                              0 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _calc_Y
;;     ___wmul
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            0      0       0       0        0.0%
;;EEDATA              40      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               42     1E      1E       3       45.5%
;;ABS                  0      0       0       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 29 in file "D:\Home\Embedded\AVR\MicrocontrollereETTI\LAB4\tema\c\filtru.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   29[BANK0 ] unsigned char 
;;  y1              2   25[BANK0 ] int 
;;  y0              2   23[BANK0 ] int 
;;  x1              1   28[BANK0 ] unsigned char 
;;  x0              1   27[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  168[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       7
;;      Temps:          0       1
;;      Totals:         0       8
;;Total ram usage:        8 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_calc_Y
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\Home\Embedded\AVR\MicrocontrollereETTI\LAB4\tema\c\filtru.c"
	line	29
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	30
	
l1419:	
;filtru.c: 30: char x0 = 15;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@x0)
	line	31
;filtru.c: 31: char x1 = 7;
	movlw	(07h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@x1)
	line	32
;filtru.c: 32: int y0 = 3;
	movlw	low(03h)
	movwf	(main@y0)
	movlw	high(03h)
	movwf	((main@y0))+1
	line	33
	
l1421:	
;filtru.c: 33: int y1 = 0;
	clrf	(main@y1)
	clrf	(main@y1+1)
	line	35
	
l1423:	
# 35 "D:\Home\Embedded\AVR\MicrocontrollereETTI\LAB4\tema\c\filtru.c"
NOP ;#
psect	maintext
	line	37
	
l1425:	
;filtru.c: 37: for(unsigned char i = 0; i< 5; i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@i)
	
l1427:	
	movlw	(05h)
	subwf	(main@i),w
	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l1431
u2220:
	goto	l170
	
l1429:	
	goto	l170
	line	38
	
l169:	
	line	39
	
l1431:	
;filtru.c: 38: {
;filtru.c: 39: y1 = calc_Y(x0, x1, y0);
	movf	(main@x1),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_calc_Y)
	movf	(main@y0+1),w
	clrf	1+(?_calc_Y)+01h
	addwf	1+(?_calc_Y)+01h
	movf	(main@y0),w
	clrf	0+(?_calc_Y)+01h
	addwf	0+(?_calc_Y)+01h

	movf	(main@x0),w
	fcall	_calc_Y
	bcf	status, 5	;RP0=0, select bank0
	movf	(1+(?_calc_Y)),w
	clrf	(main@y1+1)
	addwf	(main@y1+1)
	movf	(0+(?_calc_Y)),w
	clrf	(main@y1)
	addwf	(main@y1)

	line	41
	
l1433:	
;filtru.c: 41: y0 = y1;
	movf	(main@y1+1),w
	clrf	(main@y0+1)
	addwf	(main@y0+1)
	movf	(main@y1),w
	clrf	(main@y0)
	addwf	(main@y0)

	line	42
	
l1435:	
# 42 "D:\Home\Embedded\AVR\MicrocontrollereETTI\LAB4\tema\c\filtru.c"
NOP ;#
psect	maintext
	line	37
	
l1437:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l1439:	
	movlw	(05h)
	subwf	(main@i),w
	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l1431
u2230:
	
l170:	
	line	45
# 45 "D:\Home\Embedded\AVR\MicrocontrollereETTI\LAB4\tema\c\filtru.c"
NOP ;#
psect	maintext
	line	46
	
l171:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_calc_Y
psect	text136,local,class=CODE,delta=2
global __ptext136
__ptext136:

;; *************** function _calc_Y *****************
;; Defined at:
;;		line 49 in file "D:\Home\Embedded\AVR\MicrocontrollereETTI\LAB4\tema\c\filtru.c"
;; Parameters:    Size  Location     Type
;;  coef_0          1    wreg     const unsigned char 
;;  coef_1          1    6[BANK0 ] const unsigned char 
;;  _y              2    7[BANK0 ] const int 
;; Auto vars:     Size  Location     Type
;;  coef_0          1   19[BANK0 ] const unsigned char 
;;  result          2   20[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2    6[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       3
;;      Locals:         0       3
;;      Temps:          0      10
;;      Totals:         0      16
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___wmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text136
	file	"D:\Home\Embedded\AVR\MicrocontrollereETTI\LAB4\tema\c\filtru.c"
	line	49
	global	__size_of_calc_Y
	__size_of_calc_Y	equ	__end_of_calc_Y-_calc_Y
	
_calc_Y:	
	opt	stack 6
; Regs used in _calc_Y: [wreg+status,2+status,0+btemp+1+pclath+cstack]
;calc_Y@coef_0 stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(calc_Y@coef_0)
	line	50
	
l1409:	
;filtru.c: 50: int result = 38 * coef_0 - 29 * coef_1 - 22 * _y;
	movf	(calc_Y@_y+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(calc_Y@_y),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(016h)
	movwf	0+(?___wmul)+02h
	movlw	high(016h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	comf	(0+(?___wmul)),w
	movwf	(??_calc_Y+0)+0
	comf	(1+(?___wmul)),w
	movwf	((??_calc_Y+0)+0+1)
	incf	(??_calc_Y+0)+0,f
	skipnz
	incf	((??_calc_Y+0)+0+1),f
	movf	(calc_Y@coef_1),w
	movwf	(??_calc_Y+2)+0
	clrf	(??_calc_Y+2)+0+1
	movf	0+(??_calc_Y+2)+0,w
	movwf	(?___wmul)
	movf	1+(??_calc_Y+2)+0,w
	movwf	(?___wmul+1)
	movlw	low(01Dh)
	movwf	0+(?___wmul)+02h
	movlw	high(01Dh)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	comf	(0+(?___wmul)),w
	movwf	(??_calc_Y+4)+0
	comf	(1+(?___wmul)),w
	movwf	((??_calc_Y+4)+0+1)
	incf	(??_calc_Y+4)+0,f
	skipnz
	incf	((??_calc_Y+4)+0+1),f
	movf	(calc_Y@coef_0),w
	movwf	(??_calc_Y+6)+0
	clrf	(??_calc_Y+6)+0+1
	movf	0+(??_calc_Y+6)+0,w
	movwf	(?___wmul)
	movf	1+(??_calc_Y+6)+0,w
	movwf	(?___wmul+1)
	movlw	low(026h)
	movwf	0+(?___wmul)+02h
	movlw	high(026h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(??_calc_Y+4)+0,w
	addwf	(0+(?___wmul)),w
	movwf	(??_calc_Y+8)+0
	movf	1+(??_calc_Y+4)+0,w
	skipnc
	incf	1+(??_calc_Y+4)+0,w
	addwf	(1+(?___wmul)),w
	movwf	1+(??_calc_Y+8)+0
	movf	0+(??_calc_Y+0)+0,w
	addwf	0+(??_calc_Y+8)+0,w
	movwf	(calc_Y@result)
	movf	1+(??_calc_Y+0)+0,w
	skipnc
	incf	1+(??_calc_Y+0)+0,w
	addwf	1+(??_calc_Y+8)+0,w
	movwf	1+(calc_Y@result)
	line	51
	
l1411:	
;filtru.c: 51: result >>= 5;
	movlw	05h
	movwf	btemp+1
u2215:
	rlf	(calc_Y@result+1),w
	rrf	(calc_Y@result+1),f
	rrf	(calc_Y@result),f
	decfsz	btemp+1,f
	goto	u2215
	line	52
	
l1413:	
;filtru.c: 52: return result;
	movf	(calc_Y@result+1),w
	clrf	(?_calc_Y+1)
	addwf	(?_calc_Y+1)
	movf	(calc_Y@result),w
	clrf	(?_calc_Y)
	addwf	(?_calc_Y)

	goto	l174
	
l1415:	
	goto	l174
	line	53
	
l1417:	
# 53 "D:\Home\Embedded\AVR\MicrocontrollereETTI\LAB4\tema\c\filtru.c"
NOP ;#
psect	text136
	line	54
	
l174:	
	return
	opt stack 0
GLOBAL	__end_of_calc_Y
	__end_of_calc_Y:
;; =============== function _calc_Y ends ============

	signat	_calc_Y,12410
	global	___wmul
psect	text137,local,class=CODE,delta=2
global __ptext137
__ptext137:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.81\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[BANK0 ] unsigned int 
;;  multiplicand    2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       4
;;      Locals:         0       2
;;      Temps:          0       0
;;      Totals:         0       6
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_calc_Y
;; This function uses a non-reentrant model
;;
psect	text137
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.81\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 6
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l1397:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l1399
	line	6
	
l183:	
	line	7
	
l1399:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2171
	goto	u2170
u2171:
	goto	l184
u2170:
	line	8
	
l1401:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l184:	
	line	9
	movlw	01h
	
u2185:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u2185
	line	10
	
l1403:	
	movlw	01h
	
u2195:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u2195
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2201
	goto	u2200
u2201:
	goto	l1399
u2200:
	goto	l1405
	
l185:	
	line	12
	
l1405:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l186
	
l1407:	
	line	13
	
l186:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
psect	text138,local,class=CODE,delta=2
global __ptext138
__ptext138:
	global	btemp
	btemp set 04Eh

	DABS	1,78,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

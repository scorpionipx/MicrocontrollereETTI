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
	FNCALL	_main,_produs
	FNROOT	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
	file	"filtru_digital_c.as"
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
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_produs
?_produs:	; 2 bytes @ 0x0
	global	produs@Rb
produs@Rb:	; 1 bytes @ 0x0
	ds	2
	global	??_produs
??_produs:	; 0 bytes @ 0x2
	ds	2
	global	produs@Ra
produs@Ra:	; 1 bytes @ 0x4
	ds	1
	global	produs@prod
produs@prod:	; 2 bytes @ 0x5
	ds	2
	global	produs@i
produs@i:	; 1 bytes @ 0x7
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x8
	ds	1
	global	main@y
main@y:	; 2 bytes @ 0x9
	ds	2
	global	main@x0
main@x0:	; 1 bytes @ 0xB
	ds	1
	global	main@x1
main@x1:	; 1 bytes @ 0xC
	ds	1
	global	main@x2
main@x2:	; 1 bytes @ 0xD
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66     14      14

;;
;; Pointer list with targets:

;; ?_produs	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_produs

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 6     6      0     187
;;                                              8 BANK0      6     6      0
;;                             _produs
;; ---------------------------------------------------------------------------------
;; (1) _produs                                               8     6      2     114
;;                                              0 BANK0      8     6      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _produs
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
;;STACK                0      0       1       2        0.0%
;;BANK0               42      E       E       3       21.2%
;;ABS                  0      0       0       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 6 in file "D:\Documents\Facultate\Anul IV\Microcontrollere\LAB4\in_laborator\filtru_digita_cl.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  y               2    9[BANK0 ] unsigned int 
;;  x2              1   13[BANK0 ] unsigned char 
;;  x1              1   12[BANK0 ] unsigned char 
;;  x0              1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       5
;;      Temps:          0       1
;;      Totals:         0       6
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_produs
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\Documents\Facultate\Anul IV\Microcontrollere\LAB4\in_laborator\filtru_digita_cl.c"
	line	6
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	10
	
l1355:	
;filtru_digita_cl.c: 7: unsigned char x0, x1, x2;
;filtru_digita_cl.c: 8: unsigned int y;
;filtru_digita_cl.c: 10: x0 = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@x0)
	line	11
;filtru_digita_cl.c: 11: x1 = 50;
	movlw	(032h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@x1)
	line	12
;filtru_digita_cl.c: 12: x2 = 25l;
	movlw	(019h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@x2)
	line	13
	
l1357:	
# 13 "D:\Documents\Facultate\Anul IV\Microcontrollere\LAB4\in_laborator\filtru_digita_cl.c"
NOP ;#
psect	maintext
	line	15
	
l1359:	
;filtru_digita_cl.c: 15: y = produs(x0, 6);
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_produs)
	movf	(main@x0),w
	fcall	_produs
	bcf	status, 5	;RP0=0, select bank0
	movf	(1+(?_produs)),w
	clrf	(main@y+1)
	addwf	(main@y+1)
	movf	(0+(?_produs)),w
	clrf	(main@y)
	addwf	(main@y)

	line	16
	
l1361:	
;filtru_digita_cl.c: 16: y += produs(x1,6);
	movlw	(06h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_produs)
	movf	(main@x1),w
	fcall	_produs
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_produs)),w
	addwf	(main@y),f
	skipnc
	incf	(main@y+1),f
	movf	(1+(?_produs)),w
	addwf	(main@y+1),f
	line	17
	
l1363:	
;filtru_digita_cl.c: 17: y += produs(x2, 4);
	movlw	(04h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_produs)
	movf	(main@x2),w
	fcall	_produs
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_produs)),w
	addwf	(main@y),f
	skipnc
	incf	(main@y+1),f
	movf	(1+(?_produs)),w
	addwf	(main@y+1),f
	line	19
	
l1365:	
;filtru_digita_cl.c: 19: y >>= 4;
	movlw	04h
	
u2195:
	clrc
	rrf	(main@y+1),f
	rrf	(main@y),f
	addlw	-1
	skipz
	goto	u2195
	line	21
	
l1367:	
# 21 "D:\Documents\Facultate\Anul IV\Microcontrollere\LAB4\in_laborator\filtru_digita_cl.c"
NOP ;#
psect	maintext
	line	22
	
l169:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_produs
psect	text102,local,class=CODE,delta=2
global __ptext102
__ptext102:

;; *************** function _produs *****************
;; Defined at:
;;		line 25 in file "D:\Documents\Facultate\Anul IV\Microcontrollere\LAB4\in_laborator\filtru_digita_cl.c"
;; Parameters:    Size  Location     Type
;;  Ra              1    wreg     unsigned char 
;;  Rb              1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  Ra              1    4[BANK0 ] unsigned char 
;;  prod            2    5[BANK0 ] unsigned int 
;;  i               1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       2
;;      Locals:         0       4
;;      Temps:          0       2
;;      Totals:         0       8
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text102
	file	"D:\Documents\Facultate\Anul IV\Microcontrollere\LAB4\in_laborator\filtru_digita_cl.c"
	line	25
	global	__size_of_produs
	__size_of_produs	equ	__end_of_produs-_produs
	
_produs:	
	opt	stack 7
; Regs used in _produs: [wreg+status,2+status,0]
;produs@Ra stored from wreg
	line	27
	bcf	status, 5	;RP0=0, select bank0
	movwf	(produs@Ra)
	
l1339:	
;filtru_digita_cl.c: 26: unsigned char i;
;filtru_digita_cl.c: 27: unsigned int prod = 0;
	clrf	(produs@prod)
	clrf	(produs@prod+1)
	line	28
	
l1341:	
;filtru_digita_cl.c: 28: for(i=Rb;i>0;i--)
	movf	(produs@Rb),w
	movwf	(??_produs+0)+0
	movf	(??_produs+0)+0,w
	movwf	(produs@i)
	
l1343:	
	movf	(produs@i),f
	skipz
	goto	u2171
	goto	u2170
u2171:
	goto	l1347
u2170:
	goto	l1351
	
l1345:	
	goto	l1351
	line	29
	
l172:	
	line	30
	
l1347:	
;filtru_digita_cl.c: 29: {
;filtru_digita_cl.c: 30: prod += Ra;
	movf	(produs@Ra),w
	movwf	(??_produs+0)+0
	clrf	(??_produs+0)+0+1
	movf	0+(??_produs+0)+0,w
	addwf	(produs@prod),f
	skipnc
	incf	(produs@prod+1),f
	movf	1+(??_produs+0)+0,w
	addwf	(produs@prod+1),f
	line	28
	
l1349:	
	movlw	low(01h)
	subwf	(produs@i),f
	movf	(produs@i),f
	skipz
	goto	u2181
	goto	u2180
u2181:
	goto	l1347
u2180:
	goto	l1351
	
l173:	
	line	32
	
l1351:	
;filtru_digita_cl.c: 31: }
;filtru_digita_cl.c: 32: return prod;
	movf	(produs@prod+1),w
	clrf	(?_produs+1)
	addwf	(?_produs+1)
	movf	(produs@prod),w
	clrf	(?_produs)
	addwf	(?_produs)

	goto	l174
	
l1353:	
	line	33
	
l174:	
	return
	opt stack 0
GLOBAL	__end_of_produs
	__end_of_produs:
;; =============== function _produs ends ============

	signat	_produs,8314
psect	text103,local,class=CODE,delta=2
global __ptext103
__ptext103:
	global	btemp
	btemp set 04Eh

	DABS	1,78,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

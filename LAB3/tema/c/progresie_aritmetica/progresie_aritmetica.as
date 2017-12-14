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
	FNROOT	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
	file	"progresie_aritmetica.as"
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
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	1
	global	main@sum
main@sum:	; 1 bytes @ 0x1
	ds	1
	global	main@n
main@n:	; 1 bytes @ 0x2
	ds	1
	global	main@c
main@c:	; 1 bytes @ 0x3
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66      4       4

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     4      0      71
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
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
;;STACK                0      0       0       2        0.0%
;;BANK0               42      4       4       3        6.1%
;;ABS                  0      0       0       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 9 in file "D:\Documents\Facultate\Anul IV\Microcontrollere\LAB3\tema\c\progresie_aritmetica\progresie_aritmetica.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  c               1    3[BANK0 ] unsigned char 
;;  n               1    2[BANK0 ] unsigned char 
;;  sum             1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       3
;;      Temps:          0       1
;;      Totals:         0       4
;;Total ram usage:        4 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\Documents\Facultate\Anul IV\Microcontrollere\LAB3\tema\c\progresie_aritmetica\progresie_aritmetica.c"
	line	9
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+status,0]
	line	12
	
l1315:	
;progresie_aritmetica.c: 10: unsigned char n, sum;
;progresie_aritmetica.c: 12: n = 7;
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@n)
	line	13
	
l1317:	
;progresie_aritmetica.c: 13: sum = 0;
	clrf	(main@sum)
	line	15
	
l1319:	
;progresie_aritmetica.c: 15: for(char c = 0; c <= n; c++)
	clrf	(main@c)
	goto	l1323
	line	16
	
l168:	
	line	17
	
l1321:	
;progresie_aritmetica.c: 16: {
;progresie_aritmetica.c: 17: sum += c;
	movf	(main@c),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@sum),f
	line	15
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@c),f
	goto	l1323
	
l167:	
	
l1323:	
	movf	(main@c),w
	subwf	(main@n),w
	skipnc
	goto	u2151
	goto	u2150
u2151:
	goto	l1321
u2150:
	
l169:	
	line	20
# 20 "D:\Documents\Facultate\Anul IV\Microcontrollere\LAB3\tema\c\progresie_aritmetica\progresie_aritmetica.c"
NOP ;#
psect	maintext
	line	21
	
l170:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
psect	maintext
	global	btemp
	btemp set 04Eh

	DABS	1,78,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

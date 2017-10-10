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
	file	"tema_nota_10_adunari_scaderi_c.as"
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
	global	main@x
main@x:	; 1 bytes @ 0x1
	ds	1
	global	main@y
main@y:	; 1 bytes @ 0x2
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66      3       3

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
;; (0) _main                                                 3     3      0      93
;;                                              0 BANK0      3     3      0
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
;;BANK0               42      3       3       3        4.5%
;;ABS                  0      0       0       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 4 in file "D:\Documents\Facultate\Anul IV\Microcontrollere\LAB2\tema\nota_10_add_sub\swap_vars_using_adds_and_subs.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  y               1    2[BANK0 ] unsigned char 
;;  x               1    1[BANK0 ] unsigned char 
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
;;      Locals:         0       2
;;      Temps:          0       1
;;      Totals:         0       3
;;Total ram usage:        3 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\Documents\Facultate\Anul IV\Microcontrollere\LAB2\tema\nota_10_add_sub\swap_vars_using_adds_and_subs.c"
	line	4
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+status,0]
	line	7
	
l1314:	
;swap_vars_using_adds_and_subs.c: 5: unsigned char x, y;
;swap_vars_using_adds_and_subs.c: 7: x = 200;
	movlw	(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@x)
	line	8
;swap_vars_using_adds_and_subs.c: 8: y = 150;
	movlw	(096h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@y)
	line	10
	
l1316:	
# 10 "D:\Documents\Facultate\Anul IV\Microcontrollere\LAB2\tema\nota_10_add_sub\swap_vars_using_adds_and_subs.c"
NOP ;#
psect	maintext
	line	12
	
l1318:	
;swap_vars_using_adds_and_subs.c: 12: x += y;
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@y),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@x),f
	line	13
	
l1320:	
;swap_vars_using_adds_and_subs.c: 13: y = x - y;
	decf	(main@y),w
	xorlw	0ffh
	addwf	(main@x),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@y)
	line	14
	
l1322:	
;swap_vars_using_adds_and_subs.c: 14: x -= y;
	movf	(main@y),w
	subwf	(main@x),f
	line	16
	
l1324:	
# 16 "D:\Documents\Facultate\Anul IV\Microcontrollere\LAB2\tema\nota_10_add_sub\swap_vars_using_adds_and_subs.c"
NOP ;#
psect	maintext
	line	17
	
l167:	
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

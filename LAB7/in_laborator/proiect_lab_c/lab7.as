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
	global	_RB0
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_RB0	set	48
	global	_RB5
_RB5	set	53
	global	_TRISB
_TRISB	set	134
	file	"lab7.as"
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
	global	main@i
main@i:	; 1 bytes @ 0x1
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66      2       2

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
;; (0) _main                                                 2     2      0      46
;;                                              0 BANK0      2     2      0
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
;;BANK0               42      2       2       3        3.0%
;;ABS                  0      0       0       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 5 in file "D:\Documents\Facultate\Anul IV\Microcontrollere\LAB7\in_laborator\proiect_lab_c\pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    1[BANK0 ] unsigned char 
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
;;      Locals:         0       1
;;      Temps:          0       1
;;      Totals:         0       2
;;Total ram usage:        2 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\Documents\Facultate\Anul IV\Microcontrollere\LAB7\in_laborator\proiect_lab_c\pwm.c"
	line	5
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+status,0]
	line	7
	
l1330:	
;pwm.c: 6: unsigned char i;
;pwm.c: 7: TRISB = 0b00001111;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(134)^080h	;volatile
	line	8
	
l1332:	
;pwm.c: 8: for(i = 0;i < 10; i ++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@i)
	movlw	(0Ah)
	subwf	(main@i),w
	skipc
	goto	u2171
	goto	u2170
u2171:
	goto	l169
u2170:
	goto	l173
	
l1334:	
	goto	l173
	line	9
	
l169:	
	line	10
;pwm.c: 9: {
;pwm.c: 10: if(RB0 == 0)
	btfsc	(48/8),(48)&7
	goto	u2181
	goto	u2180
u2181:
	goto	l171
u2180:
	line	12
	
l1336:	
;pwm.c: 11: {
;pwm.c: 12: RB5 = 1;
	bsf	(53/8),(53)&7
	line	13
	
l1338:	
;pwm.c: 13: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u2207:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u2207
	nop2	;nop
	clrwdt
opt asmopt_on

	line	14
	
l1340:	
;pwm.c: 14: RB5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7
	line	15
;pwm.c: 15: _delay((unsigned long)((1)*(4000000/4000.0)));
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u2217:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u2217
	nop2	;nop
	clrwdt
opt asmopt_on

	line	16
;pwm.c: 16: }
	goto	l1346
	line	17
	
l171:	
	line	19
;pwm.c: 17: else
;pwm.c: 18: {
;pwm.c: 19: RB5 = 1;
	bsf	(53/8),(53)&7
	line	20
	
l1342:	
;pwm.c: 20: _delay((unsigned long)((667)*(4000000/4000000.0)));
	opt asmopt_off
movlw	222
movwf	(??_main+0)+0,f
u2227:
decfsz	(??_main+0)+0,f
	goto	u2227
opt asmopt_on

	line	21
	
l1344:	
;pwm.c: 21: RB5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7
	line	22
;pwm.c: 22: _delay((unsigned long)((1333)*(4000000/4000000.0)));
	opt asmopt_off
movlw	222
movwf	(??_main+0)+0,f
u2237:
	nop2
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u2237
opt asmopt_on

	goto	l1346
	line	23
	
l172:	
	line	24
	
l1346:	
# 24 "D:\Documents\Facultate\Anul IV\Microcontrollere\LAB7\in_laborator\proiect_lab_c\pwm.c"
NOP ;#
psect	maintext
	line	8
	
l1348:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l1350:	
	movlw	(0Ah)
	subwf	(main@i),w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l169
u2190:
	goto	l173
	
l170:	
	line	26
	
l173:	
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

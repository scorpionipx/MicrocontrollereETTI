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
	global	_PORTB
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:
_PORTB	set	6
	global	_TRISB
_TRISB	set	134
	file	"dc_motor_pwm_control_c.as"
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
	global	main@j
main@j:	; 2 bytes @ 0x1
	ds	2
	global	main@i
main@i:	; 2 bytes @ 0x3
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           66      5       5

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
;; (0) _main                                                 5     5      0     590
;;                                              0 BANK0      5     5      0
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
;;BANK0               42      5       5       3        7.6%
;;ABS                  0      0       0       4        0.0%
;;BITBANK0            42      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext

;; *************** function _main *****************
;; Defined at:
;;		line 9 in file "D:\Documents\Facultate\Anul IV\MM\TemeProiect\CristinaPere\proiect\C\cod.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    3[BANK0 ] int 
;;  j               2    1[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, btemp+1
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       4
;;      Temps:          0       1
;;      Totals:         0       5
;;Total ram usage:        5 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\Documents\Facultate\Anul IV\MM\TemeProiect\CristinaPere\proiect\C\cod.c"
	line	9
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg+status,2+btemp+1]
	line	12
	
l1454:	
;cod.c: 10: int i, j;
;cod.c: 12: TRISB = 0b11111110;
	movlw	(0FEh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(134)^080h	;volatile
	line	13
	
l1456:	
;cod.c: 13: PORTB = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	line	18
	
l1458:	
;cod.c: 18: for(i = 0; i < 8; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l1460:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2365
	movlw	low(08h)
	subwf	(main@i),w
u2365:

	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l1464
u2360:
	goto	l1486
	
l1462:	
	goto	l1486
	line	19
	
l169:	
	line	20
	
l1464:	
;cod.c: 19: {
;cod.c: 20: for(j = 0; j < 8; j++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@j)
	clrf	(main@j+1)
	
l1466:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2375
	movlw	low(08h)
	subwf	(main@j),w
u2375:

	skipc
	goto	u2371
	goto	u2370
u2371:
	goto	l1470
u2370:
	goto	l172
	
l1468:	
	goto	l172
	line	21
	
l171:	
	line	22
	
l1470:	
;cod.c: 21: {
;cod.c: 22: if( j <= i)
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@i+1),w
	xorlw	80h
	movwf	(??_main+0)+0
	movf	(main@j+1),w
	xorlw	80h
	subwf	(??_main+0)+0,w
	skipz
	goto	u2385
	movf	(main@j),w
	subwf	(main@i),w
u2385:

	skipc
	goto	u2381
	goto	u2380
u2381:
	goto	l1474
u2380:
	line	24
	
l1472:	
;cod.c: 23: {
;cod.c: 24: PORTB = 1;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(6)	;volatile
	line	25
;cod.c: 25: }
	goto	l1476
	line	26
	
l173:	
	line	28
	
l1474:	
;cod.c: 26: else
;cod.c: 27: {
;cod.c: 28: PORTB = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	goto	l1476
	line	29
	
l174:	
	line	30
	
l1476:	
;cod.c: 29: }
;cod.c: 30: _delay((unsigned long)((200)*(4000000/4000000.0)));
	opt asmopt_off
movlw	66
movwf	(??_main+0)+0,f
u2587:
decfsz	(??_main+0)+0,f
	goto	u2587
	clrwdt
opt asmopt_on

	line	20
	
l1478:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l1480:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2395
	movlw	low(08h)
	subwf	(main@j),w
u2395:

	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l1470
u2390:
	
l172:	
	line	32
# 32 "D:\Documents\Facultate\Anul IV\MM\TemeProiect\CristinaPere\proiect\C\cod.c"
NOP ;#
psect	maintext
	line	18
	
l1482:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1484:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2405
	movlw	low(08h)
	subwf	(main@i),w
u2405:

	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l1464
u2400:
	goto	l1486
	
l170:	
	line	36
	
l1486:	
;cod.c: 33: }
;cod.c: 36: for(i = 0; i < 8; i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@i)
	clrf	(main@i+1)
	
l1488:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2415
	movlw	low(08h)
	subwf	(main@i),w
u2415:

	skipc
	goto	u2411
	goto	u2410
u2411:
	goto	l1492
u2410:
	goto	l1510
	
l1490:	
	goto	l1510
	line	37
	
l175:	
	line	38
	
l1492:	
;cod.c: 37: {
;cod.c: 38: for(j = 0; j < 8; j++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@j)
	clrf	(main@j+1)
	
l1494:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2425
	movlw	low(08h)
	subwf	(main@j),w
u2425:

	skipc
	goto	u2421
	goto	u2420
u2421:
	goto	l1498
u2420:
	goto	l178
	
l1496:	
	goto	l178
	line	39
	
l177:	
	line	40
	
l1498:	
;cod.c: 39: {
;cod.c: 40: if( j <= i)
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@i+1),w
	xorlw	80h
	movwf	(??_main+0)+0
	movf	(main@j+1),w
	xorlw	80h
	subwf	(??_main+0)+0,w
	skipz
	goto	u2435
	movf	(main@j),w
	subwf	(main@i),w
u2435:

	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l1502
u2430:
	line	42
	
l1500:	
;cod.c: 41: {
;cod.c: 42: PORTB = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	line	43
;cod.c: 43: }
	goto	l180
	line	44
	
l179:	
	line	46
	
l1502:	
;cod.c: 44: else
;cod.c: 45: {
;cod.c: 46: PORTB = 1;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(6)	;volatile
	line	47
	
l180:	
	line	48
;cod.c: 47: }
;cod.c: 48: _delay((unsigned long)((200)*(4000000/4000000.0)));
	opt asmopt_off
movlw	66
movwf	(??_main+0)+0,f
u2597:
decfsz	(??_main+0)+0,f
	goto	u2597
	clrwdt
opt asmopt_on

	line	38
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l1504:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2445
	movlw	low(08h)
	subwf	(main@j),w
u2445:

	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l1498
u2440:
	
l178:	
	line	50
# 50 "D:\Documents\Facultate\Anul IV\MM\TemeProiect\CristinaPere\proiect\C\cod.c"
NOP ;#
psect	maintext
	line	36
	
l1506:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1508:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2455
	movlw	low(08h)
	subwf	(main@i),w
u2455:

	skipc
	goto	u2451
	goto	u2450
u2451:
	goto	l1492
u2450:
	goto	l1510
	
l176:	
	line	53
	
l1510:	
;cod.c: 51: }
;cod.c: 53: _delay((unsigned long)((200)*(4000000/4000000.0)));
	opt asmopt_off
movlw	66
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_main+0)+0,f
u2607:
decfsz	(??_main+0)+0,f
	goto	u2607
	clrwdt
opt asmopt_on

	line	54
	
l1512:	
# 54 "D:\Documents\Facultate\Anul IV\MM\TemeProiect\CristinaPere\proiect\C\cod.c"
NOP ;#
psect	maintext
	line	59
	
l1514:	
;cod.c: 59: for(i = 0; i < 8; i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@i)
	clrf	(main@i+1)
	
l1516:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2465
	movlw	low(08h)
	subwf	(main@i),w
u2465:

	skipc
	goto	u2461
	goto	u2460
u2461:
	goto	l1520
u2460:
	goto	l1542
	
l1518:	
	goto	l1542
	line	60
	
l181:	
	line	61
	
l1520:	
;cod.c: 60: {
;cod.c: 61: for(j = 0; j < 8; j++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@j)
	clrf	(main@j+1)
	
l1522:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2475
	movlw	low(08h)
	subwf	(main@j),w
u2475:

	skipc
	goto	u2471
	goto	u2470
u2471:
	goto	l1526
u2470:
	goto	l184
	
l1524:	
	goto	l184
	line	62
	
l183:	
	line	63
	
l1526:	
;cod.c: 62: {
;cod.c: 63: if( j <= i)
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@i+1),w
	xorlw	80h
	movwf	(??_main+0)+0
	movf	(main@j+1),w
	xorlw	80h
	subwf	(??_main+0)+0,w
	skipz
	goto	u2485
	movf	(main@j),w
	subwf	(main@i),w
u2485:

	skipc
	goto	u2481
	goto	u2480
u2481:
	goto	l1530
u2480:
	line	65
	
l1528:	
;cod.c: 64: {
;cod.c: 65: PORTB = 1;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(6)	;volatile
	line	66
;cod.c: 66: }
	goto	l1532
	line	67
	
l185:	
	line	69
	
l1530:	
;cod.c: 67: else
;cod.c: 68: {
;cod.c: 69: PORTB = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	goto	l1532
	line	70
	
l186:	
	line	71
	
l1532:	
;cod.c: 70: }
;cod.c: 71: _delay((unsigned long)((200)*(4000000/4000000.0)));
	opt asmopt_off
movlw	66
movwf	(??_main+0)+0,f
u2617:
decfsz	(??_main+0)+0,f
	goto	u2617
	clrwdt
opt asmopt_on

	line	61
	
l1534:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l1536:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2495
	movlw	low(08h)
	subwf	(main@j),w
u2495:

	skipc
	goto	u2491
	goto	u2490
u2491:
	goto	l1526
u2490:
	
l184:	
	line	73
# 73 "D:\Documents\Facultate\Anul IV\MM\TemeProiect\CristinaPere\proiect\C\cod.c"
NOP ;#
psect	maintext
	line	59
	
l1538:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1540:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2505
	movlw	low(08h)
	subwf	(main@i),w
u2505:

	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l1520
u2500:
	goto	l1542
	
l182:	
	line	78
	
l1542:	
;cod.c: 74: }
;cod.c: 78: PORTB = 1;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(6)	;volatile
	line	79
	
l1544:	
;cod.c: 79: for(i = 0; i < 8 * 8; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l1546:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(040h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2515
	movlw	low(040h)
	subwf	(main@i),w
u2515:

	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l1550
u2510:
	goto	l188
	
l1548:	
	goto	l188
	line	80
	
l187:	
	line	81
	
l1550:	
;cod.c: 80: {
;cod.c: 81: _delay((unsigned long)((200)*(4000000/4000000.0)));
	opt asmopt_off
movlw	66
	bcf	status, 5	;RP0=0, select bank0
movwf	(??_main+0)+0,f
u2627:
decfsz	(??_main+0)+0,f
	goto	u2627
	clrwdt
opt asmopt_on

	line	79
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1552:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(040h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2525
	movlw	low(040h)
	subwf	(main@i),w
u2525:

	skipc
	goto	u2521
	goto	u2520
u2521:
	goto	l1550
u2520:
	
l188:	
	line	84
# 84 "D:\Documents\Facultate\Anul IV\MM\TemeProiect\CristinaPere\proiect\C\cod.c"
NOP ;#
psect	maintext
	line	86
	
l1554:	
;cod.c: 86: for(i = 0; i < 8; i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@i)
	clrf	(main@i+1)
	
l1556:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2535
	movlw	low(08h)
	subwf	(main@i),w
u2535:

	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l1560
u2530:
	goto	l190
	
l1558:	
	goto	l190
	line	87
	
l189:	
	line	88
	
l1560:	
;cod.c: 87: {
;cod.c: 88: for(j = 0; j < 8; j++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@j)
	clrf	(main@j+1)
	
l1562:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2545
	movlw	low(08h)
	subwf	(main@j),w
u2545:

	skipc
	goto	u2541
	goto	u2540
u2541:
	goto	l1566
u2540:
	goto	l192
	
l1564:	
	goto	l192
	line	89
	
l191:	
	line	90
	
l1566:	
;cod.c: 89: {
;cod.c: 90: if( j <= i)
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@i+1),w
	xorlw	80h
	movwf	(??_main+0)+0
	movf	(main@j+1),w
	xorlw	80h
	subwf	(??_main+0)+0,w
	skipz
	goto	u2555
	movf	(main@j),w
	subwf	(main@i),w
u2555:

	skipc
	goto	u2551
	goto	u2550
u2551:
	goto	l1570
u2550:
	line	92
	
l1568:	
;cod.c: 91: {
;cod.c: 92: PORTB = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	line	93
;cod.c: 93: }
	goto	l194
	line	94
	
l193:	
	line	96
	
l1570:	
;cod.c: 94: else
;cod.c: 95: {
;cod.c: 96: PORTB = 1;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(6)	;volatile
	line	97
	
l194:	
	line	98
;cod.c: 97: }
;cod.c: 98: _delay((unsigned long)((200)*(4000000/4000000.0)));
	opt asmopt_off
movlw	66
movwf	(??_main+0)+0,f
u2637:
decfsz	(??_main+0)+0,f
	goto	u2637
	clrwdt
opt asmopt_on

	line	88
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l1572:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2565
	movlw	low(08h)
	subwf	(main@j),w
u2565:

	skipc
	goto	u2561
	goto	u2560
u2561:
	goto	l1566
u2560:
	
l192:	
	line	100
# 100 "D:\Documents\Facultate\Anul IV\MM\TemeProiect\CristinaPere\proiect\C\cod.c"
NOP ;#
psect	maintext
	line	86
	
l1574:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l1576:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2575
	movlw	low(08h)
	subwf	(main@i),w
u2575:

	skipc
	goto	u2571
	goto	u2570
u2571:
	goto	l1560
u2570:
	
l190:	
	line	102
# 102 "D:\Documents\Facultate\Anul IV\MM\TemeProiect\CristinaPere\proiect\C\cod.c"
NOP ;#
psect	maintext
	line	103
	
l195:	
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

#include p16f84.inc

; Enunt: sa se scrie un program ASM in care sa se implementeze filtrul recurent
; definit de relatia: Yn = 1.2 * X0 - 0.9 * X1 - 0.7 Yn-1.

; 	Pentru a nu folosi variabile in format cu virgula mobila, se inmultesc valorile 
; valorile constante cu un factor putere a lui 2. Factorul este putere a lui 2 pentru
; a se folosi instructiuni de shiftare in locul celor de impartire.

; 1.2 * 32 = 38.4 ==> 38
; 0.9 * 32 = 28.8 ==> 29                      S-a ales factorul 32 = 2 ^ 5
; 0.7 * 32 = 22.4 ==> 22

; ScorpionIPX

#define FACTOR D'32'
#define FACTOR_POW D'5'

#define CONSTANT_0 D'38'
#define CONSTANT_1 D'29'
#define CONSTANT_2 D'22'

#define INIT_Y_L D'3'
#define INIT_Y_H D'0'
#define NUM_ITERATION D'5' 

;assign memory for variables
x0 equ 0x20
x1 equ 0x21

y0_L equ 0x22
y0_H equ 0x23

y1_L equ 0x24
y1_H equ 0x25

i equ 0x26

aux_L equ 0x27
aux_H equ 0x28

j equ 0x29


main:
	; assign values to variables

	MOVLW D'15'; W <- 15
	MOVWF x0; x0 <- 15

	MOVLW D'7'; W <- 7
	MOVWF x1; x1 <- 7

	MOVLW INIT_Y_L; W <- INIT_Y_L
	MOVWF y0_L; y0_H <- INIT_Y_L

	MOVLW INIT_Y_H; W <- INIT_Y_H
	MOVWF y0_H; y0_H <- INIT_Y_H

	
	MOVLW D'0'; W <- 0
	MOVWF y1_L; y1_L <- 0
	MOVWF y1_H; y1_H <- 0
	MOVWF aux_L; aux_L <- 0
	MOVWF aux_H; aux_H <- 0

	NOP

	MOVLW NUM_ITERATION; W<- NUM_ITERATION
	MOVWF j; j <- W

	NOP

	MOVF j, 1;
	NOP
	BTFSS j, Z; skip if i is non zero
	GOTO END_

	ITER_LOOP:

		NOP

		CALL CALC_Y

		NOP

		DECFSZ j; if i is zero, skip
		GOTO ITER_LOOP

		GOTO END_

	
	CALC_Y:
		MOVLW D'0'; W <- 0
		MOVWF aux_L; aux_L <- 0
		MOVWF aux_H; aux_H <- 0

		MOVLW CONSTANT_0; W <- CONSTANT_0
		NOP
		MOVWF i; i <- W

		MOVLW D'0'; W <- 0

		NOP

		CALC_T1:
			ADDWF x0, 0; W <_ W + x0
			BTFSC STATUS, C; if overflow, increase auh_H
			INCF aux_H, 1;
			MOVWF aux_L; aux_L = W

			NOP
	
			DECFSZ i
			GOTO CALC_T1
			MOVFW aux_L; W = aux_L
			MOVWF y1_L; y1_L <- W
			MOVFW aux_H; W = aux_H
			MOVWF y1_H; y1_H <- W
	
			MOVLW CONSTANT_1; W <- CONSTANT_1
			NOP
			MOVWF i; i <- W
	
			MOVLW D'0'; W <- 0
			MOVWF aux_L; aux_L <- 0
			MOVWF aux_H; aux_H <- 0
	
			NOP

		CALC_T2:
			NOP
			ADDWF x1, 0; W <_ W + x1
			BTFSC STATUS, C; if overflow, increase auh_H
			INCF aux_H, 1;

			MOVWF aux_L; aux_L = W
			
			NOP
	
			DECFSZ i
			GOTO CALC_T2

			NOP
			COMF aux_H, 1; aux_H = ~aux_H
			COMF aux_L,1; aux_L = ~aux_L
			INCF aux_H, 1; aux_H ++
			INCF aux_L, 1; aux_L++
		
			NOP

			MOVFW aux_H; W <- aux_H
			ADDWF y1_H, 1; y1_H += W
			MOVFW aux_L; W <- aux_L
			ADDWF y1_L, 1; y1_L += W
			
			BTFSC STATUS, C; if overflow, decrease y1_H
			DECF y1_H, 1; y1_H -- 
			NOP
	
			MOVLW CONSTANT_2; W <- CONSTANT_2
			NOP
			MOVWF i; i <- W
	
			MOVLW D'0'; W <- 0
			MOVWF aux_L; aux_L <- 0
			MOVWF aux_H; aux_H <- 0
			NOP
			
		CALC_T3:
			NOP
			MOVFW aux_L; W <- aux_L
			ADDWF y0_L, 0; W <- W + y0_L
			BTFSC STATUS, C; if overflow, increase auh_H
			INCF aux_H, 1;
			
			MOVWF aux_L; aux_L = W
			MOVFW aux_H; W <- aux_H
			ADDWF y1_H, 1; y1_H += W
 			
			DECFSZ i
			GOTO CALC_T3

			NOP
			COMF aux_H, 1; aux_H = ~aux_H
			COMF aux_L,1; aux_L = ~aux_L
			INCF aux_H, 1; aux_H ++
			INCF aux_L, 1; aux_L++
		
			NOP
			MOVFW aux_H; W <- aux_H
			ADDWF y1_H, 1; y1_H += W
			NOP
			MOVFW aux_L; W <- aux_L
			ADDWF y1_L, 1; y1_L += W
			BTFSC STATUS, C; if overflow, decrease y1_H
			DECF y1_H, 1; y1_H -- 
			NOP
			
			

		RETURN
	

	END_:
		NOP
	end
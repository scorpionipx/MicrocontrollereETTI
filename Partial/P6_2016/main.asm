#include p16f887.inc; se foloseste pic16f887 pentru ca are 4 bankuri si poate acoperi cerinta

;alocare memorie pentru variabilele necesare
val equ 0x20; zona de memorie unde vom stoca valoarea citita de pe portul B

main:
	; configurare uC
	BSF STATUS, RP0
	BCF STATUS, RP1; pozitionare bank 1, unde se afla registrul TRISB

	MOVLW B'11111111'; se incarca valoarea in acumulator
	MOVWF TRISB; tot portul B este configurat ca port de intrare (uC va citi semnalele aplicate pe port)
	
	BCF STATUS, RP0
	BCF STATUS, RP1; revenire in bank 0, unde se afla registrul PORTB

	MOVF PORTB, 0; se incarca in acumulator valoarea citita de pe portul B


	BCF STATUS, RP0
	BSF STATUS, RP1; pozitionare bank 2, unde trebuie stocata valoarea citita

	MOVWF val; se incarca valoarea in variabila val -> locatia 0x20 (pe bankul 2)

	ADDLW D'5'; se aduna 5 peste valoarea citita

	BCF STATUS, RP0
	BCF STATUS, RP1; revenire in bank 0, deoarece acolo se afla registrul STATUS

	;verificarea bitului de carry din registrul STATUS (se verifica daca apare depasire)
	BTFSC STATUS, C; daca nu s-a setat bitul de carry, nu se executa instructiunea imediat urmatoare
		GOTO a_aparut_depasire 
	GOTO nu_a_aparut_depasire

	a_aparut_depasire:
		RRF W, 0; impart valoarea la 2

		BSF STATUS, RP0
		BCF STATUS, RP1; pozitionare bank 1, dupa cum se cere in enunt

		MOVWF val; se incarca valoarea in variabila val -> locatia 0x20 (pe bankul 1)		

		GOTO sfarsit_program

	nu_a_aparut_depasire:
		BCF STATUS, RP0
		BSF STATUS, RP1; pozitionare bank 2, locatia initiala a valorii citite
		MOVWF val; se incarca valoarea in variabila val -> locatia 0x20 (pe bankul 2)

		GOTO sfarsit_program	

	sfarsit_program:
		end
	
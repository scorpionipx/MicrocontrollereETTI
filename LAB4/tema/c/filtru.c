#include <htc.h>

/*
	Enunt: sa se scrie un program C in care sa se implementeze filtrul recurent
definit de relatia: Yn = 1.2 * X - 0.9 * X1 - 0.7 Yn-1.
*/

/*
	Pentru a nu folosi variabile in format cu virgula mobila, se inmultesc valorile 
valorile constante cu un factor putere a lui 2. Factorul este putere a lui 2 pentru
a se folosi instructiuni de shiftare in locul celor de impartire.

1.2 * 32 = 38.4 ==> 38
0.9 * 32 = 28.8 ==> 29                      S-a ales factorul 32 = 2 ^ 5
0.7 * 32 = 22.4 ==> 22
*/
#define FACTOR_POW 5

#define CONSTANT_0 38
#define CONSTANT_1 29
#define CONSTANT_2 22

#define INIT_Y 13
#define NUM_ITERATION 5 

int calc_Y(const char coef_0, const char coef_1, const int _y);

int main(void)
{
	char x0 = 15;
	char x1 = 11;
	int y0 = INIT_Y; /* se considera y initial ca avand valoarea INIT_Y */
	int y1 = 0;

	asm("NOP");

	for(unsigned char i = 0; i< NUM_ITERATION; i++)
	{
		y1 = calc_Y(x0, x1, y0);
		
		y0 = y1;
		asm("NOP");
	}

	asm("NOP");
}

int calc_Y(const char coef_0, const char coef_1, const int _y)
{
	int result = CONSTANT_0 * coef_0 - CONSTANT_1 * coef_1 - CONSTANT_2 * _y;
	result >>= FACTOR_POW;
	return result;
	asm("NOP");
}
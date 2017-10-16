#include <htc.h>

/*
 Enunt: Sa se scrie un program C care sa calculeaza suma 1 + 2 + 3 + ... + n,
 unde n este un numar predefinit.
*/

void main(void)
{
	unsigned char n, sum;

	n = 7;
	sum = 0;

	for(char c = 0; c <= n; c++)
	{
		sum += c;
	}	

	asm("NOP"); // use asm instruction
}
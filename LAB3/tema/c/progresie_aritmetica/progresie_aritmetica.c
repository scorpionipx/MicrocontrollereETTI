#include <htc.h>

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
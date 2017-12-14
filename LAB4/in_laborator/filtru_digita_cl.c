#include <htc.h>

unsigned int produs(unsigned char Ra, unsigned char Rb);

void main(void)
{
	unsigned char x0, x1, x2;
	unsigned int y;

	x0 = 100; 
	x1 = 50; 
	x2 = 25;
	asm("NOP");
	
	y = produs(x0, 6);
	y += produs(x1,6);
	y += produs(x2, 4);

	y >>= 4;//impartire la 16
	
	asm("NOP");
}

unsigned int produs(unsigned char Ra, unsigned char Rb)
{
	unsigned char i;
	unsigned int prod = 0;
	for(i=Rb;i>0;i--)
	{
		prod += Ra;
	}
	return prod;
}
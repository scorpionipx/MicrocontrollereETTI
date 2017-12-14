#include <htc.h>

void main(voi)
{
	unsigned char x, y, aux;

	x = 200;
	y = 150;

	if(x>y)
	{
		aux = x;
		x = y;
		y = aux;
	}
	asm("NOP"); // use asm instruction
}
#include <htc.h>

/*
	Enunt: sa se implementeze un program C care sa calculeze catul si restul 
impartirii numarului x la numarul y prin scaderi repetate.
*/

void main(void)
{
	unsigned char x, y, rest, cat;
	x = 20;
	y = 3;

	cat = 0;

	while(x >= y)
	{
		cat ++;
		x -= y;
	}
	rest = x;

	asm("NOP"); // use asm instruction
}
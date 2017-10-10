#include <htc.h>

void main(void)
{
	unsigned char x, y;

	x = 200;
	y = 150;

	asm("NOP"); // use asm instruction

	x += y;
	y = x - y;
	x -= y;

	asm("NOP"); // use asm instruction
}


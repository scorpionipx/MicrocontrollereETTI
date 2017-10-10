#include <htc.h>

void main(void)
{
	unsigned char x, y;

	x = 200;
	y = 150;

	x += y;
	y = x - y;
	x -=y;
}


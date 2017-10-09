#include <htc.h>
#include <pic16f84.h>

void main(voi)
{
	unsigned char x, y;

	x = 200;
	y = 150;

	x ^= y;
	y ^= x;
	x ^=y;
}

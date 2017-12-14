#include <htc.h>

unsigned char Ra@0x20;
unsigned char Rb@0xA5;
unsigned char Rc@0x120;

void main(void)
{
	Ra = 100;
	Rb = 50;
	Rc = (Ra + Rb) >> 1;
	asm("NOP");
}
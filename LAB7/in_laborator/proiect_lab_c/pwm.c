#include <htc.h>
#define _XTAL_FREQ 4000000

void main(void)
{
	unsigned char i;
	TRISB = 0b00001111;
	for(i = 0;i < 10; i ++)
	{
		if(RB0 == 0)
		{
			RB5 = 1;
			__delay_ms(1);
			RB5 = 0;
			__delay_ms(1);
		}
		else
		{
			RB5 = 1;
			__delay_us(667);
			RB5 = 0;
			__delay_us(1333);
		}
		asm("NOP");
	}
}
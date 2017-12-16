#include <htc.h>

#define _XTAL_FREQ 4000000
#define TIME 8
#define SET_RB0 PORTB = 1
#define CLEAR_RB0 PORTB = 0

void main(void)
{
	int i, j;

	TRISB = 0b11111110; // RB0 output
	PORTB = 0;

	// triunghi

	// crescator
	for(i = 0; i < TIME; i++)
	{
		for(j = 0; j < TIME; j++)
		{
			if( j <= i)
			{	
				SET_RB0;
			}
			else
			{
				CLEAR_RB0;
			}
			__delay_us(200);
		}
		asm("NOP");
	}	

	// descrescator
	for(i = 0; i < TIME; i++)
	{
		for(j = 0; j < TIME; j++)
		{
			if( j <= i)
			{	
				CLEAR_RB0;
			}
			else
			{
				SET_RB0;
			}
			__delay_us(200);
		}
		asm("NOP");
	}		

	__delay_us(200);
	asm("NOP");

	// trapez

	// crescator
	for(i = 0; i < TIME; i++)
	{
		for(j = 0; j < TIME; j++)
		{
			if( j <= i)
			{	
				SET_RB0;
			}
			else
			{
				CLEAR_RB0;
			}
			__delay_us(200);
		}
		asm("NOP");
	}	

	// constant
	
	SET_RB0;
	for(i = 0; i < TIME * TIME; i++)
	{
		__delay_us(200);
		
	}
	asm("NOP");
	// descrescator
	for(i = 0; i < TIME; i++)
	{
		for(j = 0; j < TIME; j++)
		{
			if( j <= i)
			{	
				CLEAR_RB0;
			}
			else
			{
				SET_RB0;
			}
			__delay_us(200);
		}
		asm("NOP");
	}		
	asm("NOP");
}
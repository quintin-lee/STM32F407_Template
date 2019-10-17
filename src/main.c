#include "stm32f4xx.h"

void Delay(__IO uint32_t x)
{
	while(x--);
}

int main(void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, ENABLE);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9 | GPIO_Pin_10;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOF, &GPIO_InitStructure);

	while(1) {
		//GPIOD->ODR ^= 0xFFFF;
        GPIO_ToggleBits(GPIOF, GPIO_Pin_9);
        
		Delay(0xFFFFFF);
        GPIO_ToggleBits(GPIOF, GPIO_Pin_10);
	}
}

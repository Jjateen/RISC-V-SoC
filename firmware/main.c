#include <stdint.h>
#include <stdlib.h>
#include <gpio_regs.h>

// assume 5 cycles per empty loop iteration
// assume the clock is 12 MHz, 83.33 ns per clock period
// for 0.5 sec delay we need 6 million cycles
// this means we need 1.2 million iteration

void delay_long()
{

    for (uint64_t i = 0; i < 1000000; i++)
        ;
}

void delay_short()
{

    for (uint64_t i = 0; i < 1; i++)
        ;
}

int main()
{

    GCSR->GPIO_0 = 0;

    while (1)
    {
        GCSR->GPIO_0 = 0b10101;
        delay_short();
        GCSR->GPIO_0 = 0b01010;
        delay_short();
    }
}
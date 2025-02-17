#include <stdint.h>
#include <stdlib.h>

// #define IO_ADDR_START 0x40000000
#define LEDS_START_ADDR 0x40000000
#define LEDS_DATA_REG_OFFSET 0
#define LEDS_DATA_REG *((volatile unsigned int *)(LEDS_START_ADDR + LEDS_DATA_REG_OFFSET))

int main(void)
{

    LEDS_DATA_REG = 0b11011;
    int i = 0;

    while (1)
    {
        if (i == 5)
            i = 0;
        LEDS_DATA_REG = 1 << i;
        i++;
    }

    return 0;
}

#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN PB6
#define BUTTON_PIN PB7

int main(void) {
    DDRB |= (1 << LED_PIN);
    DDRB &= ~(1 << BUTTON_PIN);
    PORTB |= (1 << BUTTON_PIN);

    while (1) {
        if (!(PINB & (1 << BUTTON_PIN))) {
            PORTB |= (1 << LED_PIN);
        } else {
            PORTB &= ~(1 << LED_PIN);
        }
        _delay_ms(100);
    }

    return 0;
}

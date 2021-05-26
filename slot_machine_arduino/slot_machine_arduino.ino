#include "Keyboard.h"

#define BUTTON_PIN 12

uint8_t buttonState = 0;

void setup(void)
{
    Keyboard.begin();
    // Set pin to input
    pinMode(BUTTON_PIN, INPUT);
    // Enable pullup resistor
    digitalWrite(BUTTON_PIN, HIGH);
}

void loop(void)
{
    uint8_t newButtonState;
    newButtonState = digitalRead(BUTTON_PIN);
    if (buttonState != newButtonState) {
        buttonState = newButtonState;
        if (buttonState == 0) {
            Keyboard.write(' ');
        }
    }

    delay(50);
}

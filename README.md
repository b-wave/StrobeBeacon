# LED Strobe / Beacon
Strobe and beacon lights for models using PIC12F1822

![](https://github.com/b-wave/StrobeBeacon/blob/main/StrobeBeacon/Resources/LED_Strobe_Top.png)

This project describes a _realistic-looking_ set of lights for model aircraft. The strobe is typically a white light located at the aft end of the aircraft.  The strobe consists of several quick flashes, repeating after a dark pause. The beacon is a light that flashes once, typically as a red beacon at the top of the airplane's rudder, with a longer on-time duration You can also set up two alternating strobes, such a police or emergency vehicle, where the lights alternate between red and white or red and blue.

## Firmware
The firmware is included in the folder. It is a C source file that was compiled with the  _MPLAB IDE_ V6.00. The .HEX file can be directly programmed, either on the chip itself or using the provided in-circuit programming pins (ICP) on the. If you do not want to compile, you can directly use the provided .HEX file. We used a _TL866 II Plus_ for both. You can use the uploaded StrobeBeacon.X.production.HEX file.

## Hardware

The hardware was developed using KiCAD version 8.0.  
![](https://github.com/b-wave/StrobeBeacon/blob/main/StrobeBeacon/Resources/StrobeBeaconSchematic.jpg)

This is a simple circuit board. All the Gerber files are included, but you can order directly from this project file on OSH Park.com: 

https://oshpark.com/shared_projects/jd6ww6b6




![](https://github.com/b-wave/StrobeBeacon/blob/main/StrobeBeacon/Resources/LED_Strobe_Bottom.png)

## Enhancements
Several features can be added to this.  I will either expand here or make a new repo. 

First to make it useful in an R/C model, the ability to read an R/C receiver's PWM channel can be used switch the strobes on or off. Adding a standard 3-pin 0.1 inch connector allows for direct to an R/C receiver's channel connector. For an Arduino, it is relatively simple to use the pulseIn() from the standard libraries.
```C
byte GetPWM(byte pin)
{
  unsigned long highTime = pulseIn(pin, HIGH, 50000UL);  // 50 millisecond timeout
  unsigned long lowTime = pulseIn(pin, LOW, 50000UL);  // 50 millisecond timeout

  // pulseIn() returns zero on timeout
  if (highTime == 0 || lowTime == 0)
    return digitalRead(pin) ? 100 : 0;  // HIGH == 100%,  LOW = 0%

  return (100 * highTime) / (highTime + lowTime);  // highTime as percentage of total cycle time
}
```

But for a PIC microcontroller it is a little more involved.  We have to use timers and interrrupts.  The CCP1 interrupt can be used to detect the edge. Then the width is timed. 

*Copilot PROMPT: Give an example of pic12f1822 to measure a PWM input*

To measure a PWM input using the PIC12F1822 microcontroller, you can use the Capture/Compare/PWM (CCP) module. Here's a basic example of how you can set it up:

1. Configure the CCP module: Set the CCP module to capture mode to measure the PWM input signal.
2. Configure the Timer: Use Timer1 to capture the PWM signal's period and duty cycle.
3. Capture the PWM signal: Use the CCP module to capture the rising and falling edges of the PWM signal.

Here's a simple code example using MPLAB X IDE and XC8 compiler:
```C
#include <xc.h>

// Configuration bits
#pragma config FOSC = INTOSC    // Oscillator Selection
#pragma config WDTE = OFF       // Watchdog Timer Enable
#pragma config PWRTE = OFF      // Power-up Timer Enable
#pragma config MCLRE = ON       // MCLR Pin Function Select
#pragma config CP = OFF         // Flash Program Memory Code Protection
#pragma config BOREN = ON       // Brown-out Reset Enable
#pragma config CLKOUTEN = OFF   // Clock Out Enable
#pragma config IESO = ON        // Internal/External Switchover Mode
#pragma config FCMEN = ON       // Fail-Safe Clock Monitor Enable

void main(void) {
    // Initialize the oscillator
    OSCCON = 0x70; // Set internal oscillator to 8MHz

    // Configure CCP1 module for capture mode
    CCP1CON = 0x05; // Capture mode, every rising edge

    // Configure Timer1
    T1CON = 0x31; // Timer1 on, prescaler 1:8

    // Enable CCP1 interrupt
    PIE1bits.CCP1IE = 1;
    INTCONbits.PEIE = 1;
    INTCONbits.GIE = 1;
/*
Example of a channel used to control the Strobes 
Strobe AUX (CH8):
            Low     High      PWM%
power on    0       0         0%
switch off  995uS   18882uS   5%
switch on   1988uS  17888uS   10%
*/
    while (1) {
        // Main loop

    }
}

// CCP1 interrupt service routine
void __interrupt() CCP1_ISR(void) {
    if (PIR1bits.CCP1IF) {
        // Capture the PWM signal period and duty cycle
        unsigned int captureValue = CCPR1;
        PIR1bits.CCP1IF = 0; // Clear the interrupt flag
    }
}

```
This code sets up the PIC12F1822 to capture the rising edges of a PWM signal using the CCP1 module and Timer1. You can modify the code to capture both rising and falling edges to measure the duty cycle accurately.

For more details, you can refer to the PIC12F1822 datasheet.
We could also use ranges of PWM to select different modes. 

```C
While (1) {
//main loop
//Note: this assumes the pulse width numbers are predefined

byte mode
	{
 	 byte PWM = GetPWM(PWMPin);
   		 if (PWM < LOWPULSE_WIDTH) mode = 0;  //OFF
     			else if (PWM >=  LOWPULSE_WIDTH && PWM <=  LONGPULSE_WIDTH) mode = 1; //  Beacon/Strobe
     			  else if (PWM > LONGPULSE_WIDTTH) mode = 2; //Strobe/strobe
//... then use the mode byte to control the strobes  the get PWM probabily should be done in the long ( off)  time outs.
	}
}


```

Second, to make a proper navigation lights for a UAV the LEDs must be brighter.  Transistors can be added to the circuit to allow higher voltages for more powerfull the LEDs since navigation beacons should be seen for some distance. 

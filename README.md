# LED Strobe / Beacon
Strobe and beacon lights for models using PIC12F1822

![](https://github.com/b-wave/StrobeBeacon/blob/main/StrobeBeacon/Resources/LED_Strobe_Top.png)

This project describes a _realistic-looking_ set of lights for model aircraft. The strobe is typically a white light located at the aft end of the aircraft.  The strobe consists of several quick flashes, repeating after a dark pause. The beacon is a light that flashes once, typically as a red beacon at the top of the airplane's rudder, with a longer on-time duration You can also set up two alternating strobes, such a police or emergency vehicle, where the lights alternate between red and white or red and blue.

## Firmware
The firmware is included in the folder. It is a C source file that was compiled with the  _MPLAB IDE_ V6.00. The .HEX file can be directly programmed, either on the chip itself or using the provided in-circuit programming pins (ICP) on the. If you do not want to compile, you can directly use the provided .HEX file. We used a _TL866 II Plus_ for both. You can use the uploaded StrobeBeacon.X.production.HEX file.

## Hardware

The hardware was developed using KiCAD version 8.0.  
![](https://github.com/b-wave/StrobeBeacon/blob/main/StrobeBeacon/Resources/StrobeBeaconSchematic.jpg)

This is a simple circuit board. All the Gerber files are included, but you can order directly from this project file on OSH Park.com: https://644db4de5c40a0444-327723bce298e3ff5813fb42baeefbaa.ssl.cf1.rcdn.com/0ba974dadc37eb3494fbccaf378a86d.kicad_pcb



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

But for a PIC microcontroller it is a little more involved.  We have to use timers and interrrupts.  The CCP1 interrupt can be used to detect the edge. Then the width is timed. Here is an example:
```asm
////////////////////////////////////////////////////////////////////////////////
 void interrupt() {

 if(INTCON.F2 == 1) // If Timer 0 interrupt
	{
	INTCON.F2 = 0; // Reset TOIE

	} // END if Timer 0 interrupt

	if(PIR1.F2 == 1) // if CCP1 Edge Detected (CCP1 Interrupt)
	{

	PIR1.F2 = 0; // Reset CCP1IE

	if(CCP1CON.F0 == 1) // if Rising Edge detected
	{
	Leading = CCPR1L| CCPR1H<<8; // Copy CCPR1 to Leading Edge var
	CCP1CON.F0 = 0; // Set to falling edge
	} // END Rising Edge

	else if(CCP1CON.F0 == 0) // If Falling Edge Detected
	{
	Capture = CCPR1L | CCPR1H<<8; // Copy CCPR1 to Falling Edge var
	Capture = Capture - Leading ; // Calculate Pulse Width
	CCP1CON.F0 = 1; // Set to Traling edge
	}// END Falling Edge

	}// END CCP1 Interrupt


}//interrupt
```
We could also use ranges of PWM to select different modes. 

```C
void loop()
byte mode
{
  byte PWM = GetPWM(PWMPin);
    if (PWM < 50) mode = 0;  //OFF
     else if (PWM >= 50 && PWM <= 90) mode = 1; //  Beacon/Strobe
       else if (PWM > 90) mode = 2; //Strobe/strobe
...
}



```

Second, to make a proper navigation lights for a UAV the LEDs must be brighter.  Transistors can be added to the circuit to allow higher voltages for more powerfull the LEDs since navigation beacons should be seen for some distance. 

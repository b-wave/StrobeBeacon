# StrobeBeacon
Strobe and beacon lights for models using PIC12F1822

![](https://github.com/b-wave/StrobeBeacon/blob/main/StrobeBeacon/Resources/LED_Strobe_Top.png)

This project describes a "realistic" looking set of lights for model aircraft  Thhe strobe is typically a whight light located at the aft end of the airctaft. THe strobe consists of severa fast flashes repeating after a dark pause.  The beacon is a light that flashes once, such as a RED beacon at the top of the rudder of an aircraft with a longer on time duration.  You can also set to have two altenating strobes such as in a police or emergency vehicle where the lights are alternating RED/WITE or RED/BLUE strobes.  

## Firmware
The firmware is included in the SOFTWARE folder. It is a C source file that was compiled using MPLAB X IDE V6.00 The .HEX file can be directly programmed, either on the chip directly or using provided in circuit programming pins (ICP) on the PCB.  IF you dont want to compile but directly use the version i have provided the .HEX file.  We used a TL866 II plus for both.You can use the StrobeBeacon.X.production.hex file. 

## Hardware

The hardware was developed using KiCAD version 8.0.  It is simple circuit board.  All the gerber files are also included but you can order dirctly fromthis file at OSH Park.com:

![](https://github.com/b-wave/StrobeBeacon/blob/main/StrobeBeacon/Resources/LED_Strobe_Bottom.png)

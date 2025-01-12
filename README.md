# LED Strobe / Beacon
Strobe and beacon lights for models using PIC12F1822

![](https://github.com/b-wave/StrobeBeacon/blob/main/StrobeBeacon/Resources/LED_Strobe_Top.png)

This project describes a _"realistic"_ looking set of lights for model aircraft. The strobe is typically a WHITE light located at the aft end of the aircraft. The strobe consists of several fast flashes repeating after a dark pause.  The beacon is a light that flashes once, such as a RED beacon at the top of the airplane's rudder of an aircraft with a longer on time duration.  You can also set to have two alternating strobes such as in a police or emergency vehicle where the lights are alternating RED/WHITE or RED/BLUE strobes.  

## Firmware
The firmware is included in the SOFTWARE folder. It is a C source file that was compiled using _MPLAB X IDE_ V6.00 The .HEX file can be directly programmed, either on the chip directly or using provided in circuit programming pins (ICP) on the PCB.  IF you dont want to compile but directly use the version i have provided the .HEX file.  We used a _TL866 II plus_ for both.You can use the StrobeBeacon.X.production.hex file. 

## Hardware

The hardware was developed using KiCAD version 8.0.  It is simple circuit board.  All the gerber files are also included but you can order dirctly fromthis file at OSH Park.com: https://644db4de3505c40a0444-327723bce298e3ff5813fb42baeefbaa.ssl.cf1.rackcdn.com/0ba974dadc37eb349d4fbccaf378a86d.kicad_pcb


![](https://github.com/b-wave/StrobeBeacon/blob/main/StrobeBeacon/Resources/LED_Strobe_Bottom.png)

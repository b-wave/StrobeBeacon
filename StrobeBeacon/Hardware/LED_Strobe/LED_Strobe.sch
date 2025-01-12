EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "Mini LED Strobe Flasher"
Date "2023-02-13"
Rev "0"
Comp "KD6VKF"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_PIC12:PIC12F1822-IMC U1
U 1 1 63EA8ACF
P 5000 3150
F 0 "U1" H 5000 3931 50  0000 C CNN
F 1 "PIC12F1822-IMC" H 5000 3840 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5600 3800 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/41413B.pdf" H 5000 3150 50  0001 C CNN
	1    5000 3150
	1    0    0    -1  
$EndComp
Text Notes 3550 4350 0    50   ~ 0
 * Vdd  1    8 Vss\n * RA5  2    7 RA0/ICSPDAT\n * RA4  3    6 RA1/ICSPCLK\n * RA3  4    5 RA2  
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 63EAAD15
P 3800 3750
F 0 "JP2" H 3800 3955 50  0000 C CNN
F 1 "MOD2" H 3800 3864 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3800 3750 50  0001 C CNN
F 3 "~" H 3800 3750 50  0001 C CNN
	1    3800 3750
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 63EAB581
P 3150 3600
F 0 "JP1" H 3150 3805 50  0000 C CNN
F 1 "MOD1" H 3150 3714 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3150 3600 50  0001 C CNN
F 3 "~" H 3150 3600 50  0001 C CNN
	1    3150 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2950 4000 2550
Wire Wire Line
	4000 2550 4300 2550
Wire Wire Line
	3500 3250 3600 3250
$Comp
L power:GND #PWR04
U 1 1 63EAF734
P 5000 3950
F 0 "#PWR04" H 5000 3700 50  0001 C CNN
F 1 "GND" H 5005 3777 50  0000 C CNN
F 2 "" H 5000 3950 50  0001 C CNN
F 3 "" H 5000 3950 50  0001 C CNN
	1    5000 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3950 5000 3850
$Comp
L power:GND #PWR02
U 1 1 63EB016D
P 3000 3800
F 0 "#PWR02" H 3000 3550 50  0001 C CNN
F 1 "GND" H 3005 3627 50  0000 C CNN
F 2 "" H 3000 3800 50  0001 C CNN
F 3 "" H 3000 3800 50  0001 C CNN
	1    3000 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 63EB0B81
P 7500 3800
F 0 "#PWR03" H 7500 3550 50  0001 C CNN
F 1 "GND" H 7505 3627 50  0000 C CNN
F 2 "" H 7500 3800 50  0001 C CNN
F 3 "" H 7500 3800 50  0001 C CNN
	1    7500 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3600 3000 3750
Connection ~ 3000 3600
$Comp
L power:+VDC #PWR01
U 1 1 63EB14FC
P 4300 2350
F 0 "#PWR01" H 4300 2250 50  0001 C CNN
F 1 "+VDC" H 4300 2625 50  0000 C CNN
F 2 "" H 4300 2350 50  0001 C CNN
F 3 "" H 4300 2350 50  0001 C CNN
	1    4300 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2350 4300 2550
Connection ~ 4300 2550
Wire Wire Line
	4300 2550 5000 2550
$Comp
L Device:LED_Small D1
U 1 1 63EB1F13
P 6850 3150
F 0 "D1" H 6850 3385 50  0000 C CNN
F 1 "WHITE" H 6850 3294 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm_Clear" V 6850 3150 50  0001 C CNN
F 3 "~" V 6850 3150 50  0001 C CNN
	1    6850 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_Small D2
U 1 1 63EB28AD
P 6850 3450
F 0 "D2" H 6850 3685 50  0000 C CNN
F 1 "RED" H 6850 3594 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" V 6850 3450 50  0001 C CNN
F 3 "~" V 6850 3450 50  0001 C CNN
	1    6850 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R2
U 1 1 63EB3300
P 7300 3450
F 0 "R2" V 7505 3450 50  0000 C CNN
F 1 "330" V 7414 3450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 7300 3450 50  0001 C CNN
F 3 "~" H 7300 3450 50  0001 C CNN
	1    7300 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 3150 6750 3150
$Comp
L Device:R_Small_US R1
U 1 1 63EB410E
P 7300 3150
F 0 "R1" V 7505 3150 50  0000 C CNN
F 1 "220" V 7414 3150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P2.54mm_Vertical" H 7300 3150 50  0001 C CNN
F 3 "~" H 7300 3150 50  0001 C CNN
	1    7300 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6950 3150 7200 3150
Wire Wire Line
	6950 3450 7200 3450
Wire Wire Line
	7400 3150 7500 3150
Wire Wire Line
	7500 3150 7500 3450
Wire Wire Line
	7400 3450 7500 3450
Connection ~ 7500 3450
Wire Wire Line
	7500 3450 7500 3800
Wire Wire Line
	5600 3250 6400 3250
Wire Wire Line
	6400 3250 6400 3450
Wire Wire Line
	6400 3450 6750 3450
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 63EC0D2E
P 6300 2700
F 0 "J2" H 6272 2674 50  0000 R CNN
F 1 "Vpp/~MCLR" H 6272 2583 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6300 2700 50  0001 C CNN
F 3 "~" H 6300 2700 50  0001 C CNN
	1    6300 2700
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J1
U 1 1 63EC5C18
P 3300 3050
F 0 "J1" H 3350 3367 50  0000 C CNN
F 1 "ICP" H 3350 3276 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 3300 3050 50  0001 C CNN
F 3 "~" H 3300 3050 50  0001 C CNN
	1    3300 3050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3500 3150 3950 3150
Wire Wire Line
	3500 3050 4400 3050
Wire Wire Line
	3500 2950 4000 2950
Wire Wire Line
	3300 3600 3600 3600
Wire Wire Line
	3600 3600 3600 3250
Connection ~ 3600 3250
Wire Wire Line
	3600 3250 4400 3250
Wire Wire Line
	3950 3750 3950 3150
Connection ~ 3950 3150
Wire Wire Line
	3950 3150 4400 3150
Wire Wire Line
	3000 3750 3650 3750
Connection ~ 3000 3750
Wire Wire Line
	3000 3750 3000 3800
Wire Wire Line
	5600 2700 5600 3050
$Comp
L power:GND #PWR0101
U 1 1 63ED6207
P 5800 2900
F 0 "#PWR0101" H 5800 2650 50  0001 C CNN
F 1 "GND" H 5805 2727 50  0000 C CNN
F 2 "" H 5800 2900 50  0001 C CNN
F 3 "" H 5800 2900 50  0001 C CNN
	1    5800 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3250 3000 3600
Wire Wire Line
	3000 2950 3000 3050
Connection ~ 3000 3250
Connection ~ 3000 3050
Wire Wire Line
	3000 3050 3000 3150
Connection ~ 3000 3150
Wire Wire Line
	3000 3150 3000 3250
Wire Wire Line
	5800 2900 5800 2800
Wire Wire Line
	5800 2800 6100 2800
Wire Wire Line
	5600 2700 6100 2700
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 63FF3BDC
P 5650 3750
F 0 "H1" H 5750 3799 50  0000 L CNN
F 1 "MountingHole_Pad" H 5750 3708 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 5650 3750 50  0001 C CNN
F 3 "~" H 5650 3750 50  0001 C CNN
	1    5650 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3850 5000 3850
Connection ~ 5000 3850
Wire Wire Line
	5000 3850 5000 3750
$EndSCHEMATC

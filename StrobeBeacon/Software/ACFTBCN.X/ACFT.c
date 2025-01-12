/*
 * File:   ACFT.c
 * Author: steve
 * 
 * Simulates Aircraft Strobe/Beacons
 * 
 * 
 * PIC12F1822 PINS:
 * Vdd  1    8 Vss
 * RA5  2    7 RA0/ICSPDAT
 * RA4  3    6 RA1/ICSPCLK
 * RA3  4    5 RA2 
 * Created on February 27, 2023, 9:48 AM
 */

#include <xc.h>
#pragma config FOSC = INTOSC
#pragma config WDTE = OFF
#pragma config MCLRE = ON
#pragma config CLKOUTEN = OFF
#pragma config PLLEN = ON
#define _XTAL_FREQ 32000000


void main(void) { 
      TRISA2 = 1; //RA2 as Input PIN  
      TRISA1 = 1; //RA1 as Input PIN      
      TRISA4 = 0; //RA4 as Output PIN
      TRISA5 = 0; //RA5 as Output PIN
      
      OSCCON = 0b01110000; //32MHz
      ANSELA = 0;
      nWPUEN = 0;
      uint8_t i;
  while(RA1)
  {
  for( i=0; i<4; i++) {    
    RA4 = 1;  // White Strobe LED ON 5
    __delay_ms(10); // 10 millisecond Delay
    RA4 = 0;  // LED OFF 5
    __delay_ms(100); // 10 millisecond Delay  
 }  
//LED 2 Beacon Mode
 if (RA2==1) {
    __delay_ms(200); // 500 millisecond Delay
     RA5 = 1;   //Red Beacon LED on4
    __delay_ms(100); // 500 millisecond Delay
     RA5 = 0;  //LED off4
    __delay_ms(200); // 00 millisecond Delay
    }
 //LED 2 Beacon Mode
 if (RA2==0) {
  for( i=0; i<4; i++) {    
    RA5 = 1;  // White Strobe LED ON 4
    __delay_ms(10); // 10 millisecond Delay
    RA5 = 0;  // LED OFF4
    __delay_ms(100); // 10 millisecond Delay  
        }  
      }
   
  }
    return;
}

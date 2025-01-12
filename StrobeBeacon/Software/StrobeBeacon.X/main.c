/*
 * File:   main.c
 * Author: steve
 *
 * Created on January 18, 2023, 11:21 AM
 * 
 * Simulates Aircraft Strobe/Beacons
 * 
 * 
 * PIC12F1822 PINS:
 * Vdd  1    8 Vss
 * RA5  2    7 RA0/ICSPDAT
 * RA4  3    6 RA1/ICSPCLK
 * RA3  4    5 RA2  
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
      TRISA3 = 1; //RA3 as Input PIN  
      TRISA4 = 0; //RA4 as Output PIN
      TRISA5 = 0; //RA5 as Output PIN
      
      OSCCON = 0b01110000; //32MHz
      ANSELA = 0;
      nWPUEN = 0;
      uint8_t i;
  while(RA3)
  {
  for( i=0; i<4; i++) {    
    RA5 = 1;  // White Strobe LED ON 
    __delay_ms(10); // 10 millisecond Delay
    RA5 = 0;  // LED OFF
    __delay_ms(100); // 10 millisecond Delay  
 }  
//LED 2 Beacon Mode
 if (RA2==1) {
    __delay_ms(200); // 500 millisecond Delay
     RA4 = 1;   //Red Beacon LED on
    __delay_ms(100); // 500 millisecond Delay
     RA4 = 0;  //LED off
    __delay_ms(200); // 00 millisecond Delay
    }
 //LED 2 Beacon Mode
 if (RA2==0) {
  for( i=0; i<4; i++) {    
    RA4 = 1;  // White Strobe LED ON 
    __delay_ms(10); // 10 millisecond Delay
    RA4 = 0;  // LED OFF
    __delay_ms(100); // 10 millisecond Delay  
        }  
      }
   
  }
    return;
}

/*
 * ESP32-based EB104 PA control
 * Project description http://vk6nx.net/06_projects.html
 * https://github.com/VK6NX/VK6NX-EB104-PA-Control
 * Authors: 
 *         ziss
 *         VK6NX 
 * 
 * adc.h for ADS1115
 *
 * ADS1115 library ADS1115_WE by Wolfgang Ewald
 * https://github.com/wollewald/ADS1115_WE     
 *      
 */
 
#ifndef ADC_H_
#define ADC_H_


#include<ADS1115_WE.h> 
#include<Wire.h>
#define I2C_ADDRESS 0x48

ADS1115_WE adc(I2C_ADDRESS);

float fwdVoltageADS0 = 0;       // ADS1115 ads0 (FWD) voltage definition 
float revVoltageADS1 = 0;       // ADS1115 ads1 (REV) voltage definition
float fwdPwrPeakVal = 0;       

float valueSWR;
float valueP;
char DisplayValueSWR[4];
char DisplayValueP[4];

int alertReadyPin = 19;
volatile bool convReady = false;

float rflPwrPercent = 0;
const uint16_t diodeDropVal = 161 / 2;    // Voltage drop on 1N5711 diode
uint16_t adcCnt = 0;
ADS1115_MUX adcChannel = ADS1115_COMP_0_GND;


inline void adcInit() {
  pinMode(alertReadyPin, INPUT_PULLUP);
  Wire.begin(SDA, SCL, 4000000);
  adc.setVoltageRange_mV(ADS1115_RANGE_4096);
  adc.setCompareChannels(adcChannel);
  //adc.setConvRate(ADS1115_8_SPS);
  adc.setConvRate(ADS1115_860_SPS);
  adc.setMeasureMode(ADS1115_SINGLE);
  adc.setAlertPinMode(ADS1115_ASSERT_AFTER_1);
  adc.setAlertPinToConversionReady();
  adc.startSingleMeasurement();
}

inline void adcLoop() {
  if (digitalRead(alertReadyPin) != HIGH) {
    if (adcChannel == ADS1115_COMP_0_GND){
      fwdVoltageADS0 = adc.getResult_mV();
      adcChannel = ADS1115_COMP_1_GND;
      if (fwdPwrPeakVal < fwdVoltageADS0) {
          fwdPwrPeakVal = fwdVoltageADS0;
      }
    }
      else {       
        revVoltageADS1 = adc.getResult_mV();
        adcChannel = ADS1115_COMP_0_GND;
      }
    adc.setCompareChannels(adcChannel);
    adc.clearAlert();
    adc.startSingleMeasurement();
    if (fwdVoltageADS0 >3){
     rflPwrPercent = revVoltageADS1 / fwdVoltageADS0;

    }
    else{
     rflPwrPercent = 0;
    }
    adcCnt++; 
  }
}

void calcSWR() {
  float p = (revVoltageADS1 / fwdVoltageADS0);
  float swr = (1 + p) / (1 - p);
  if (swr != valueSWR) {
    valueSWR = (1 + p) / (1 - p);
  }
}

void calcP() {
/*
polynomial regression 

  https://arachnoid.com/polysolve/

  7Mhz output form: mathematical function:
  f(x) = -6.1665023019137280e+001 * x^0
     +  2.1641797283329125e+000 * x^1
     + -2.6321931392024205e-002 * x^2
     +  1.5518159557484736e-004 * x^3
     + -5.1114144995570026e-007 * x^4
     +  1.0335957125553757e-009 * x^5
     + -1.3451825016533472e-012 * x^6
     +  1.1493752779174179e-015 * x^7
     + -6.4106269882484307e-019 * x^8
     +  2.2467026807903922e-022 * x^9
     + -4.4890936379275662e-026 * x^10
     +  3.8987218748220906e-030 * x^11
  
*/
  float f = fwdPwrPeakVal;
  //  1.8MHz pin
  //  valueP = ;
  //  3.5MHz
  //  valueP = ;
  //  7MHz
 valueP = (- 6.1665023019137280e+001)  + (2.1641797283329125e+000 * f) + ((-2.6321931392024205e-002) * f * f) + (1.5518159557484736e-004 * f * f * f) + ((-5.1114144995570026e-007) * f * f * f * f) + (1.0335957125553757e-009 * f * f * f * f * f) + ((-1.3451825016533472e-012) * f * f * f * f * f * f) + (1.1493752779174179e-015 * f * f * f * f * f * f * f) + ((- 6.4106269882484307e-019) * f * f * f * f * f * f * f * f) + (2.2467026807903922e-022 * f * f * f * f * f * f * f * f * f) + ((-4.4890936379275662e-026) * f * f * f * f * f * f * f * f * f * f) + (3.8987218748220906e-030 * f * f * f * f * f * f * f * f * f * f * f);
 //  10MHz
  // valueP = -2.284773292E-18 * fwd * fwd * fwd * fwd * fwd + 6.096187077E-14 * fwd * fwd * fwd * fwd - 5.203845599E-10 * fwd * fwd * fwd + 3.486612421E-6 * fwd * fwd - 2.221107072E-3 * fwd - 4.359016274E-2;
  //  14MHz
  // valueP = ;
  //  18MHz
  //  valueP = ;
  //  21MHz
  //  valueP = ;
  //  28MHz
  //  valueP = ;
  fwdPwrPeakVal = 0;
}

// **************** ?????????????????????
inline uint8_t adcLpfRaiseCnt() {
  return 4;
}


#endif /* ADC_H_ */

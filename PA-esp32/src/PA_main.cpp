/*
* ESP32-based EB104 PA control
* Project description http://vk6nx.net/06_projects.html
* https://github.com/VK6NX/VK6NX-EB104-PA-Control
* Authors: 
*          VK6NX 
*          ziss
*
*  v0.0.3
*  
* External Libraries
* 1. WebSocketsClient by Markus Sattler (downloadable via PlatformIO)
* 2. MQTT Client https://github.com/plapointe6/EspMQTTClient
* 3. ADS1115 library ADS1115_WE by Wolfgang Ewald https://github.com/wollewald/ADS1115_WE
* 4. ESP8266 Multicast DNS (port of CC3000 Multicast DNS library): Arduino core for the ESP32 by espressif
* 5. WiFiUdp: Library to send/receive UDP packets: Arduino core for the ESP32 by espressif
* 6. Arduino OTA library: Arduino core for the ESP32 by espressif
* 7. TCI library for Arduino by IW7DMH (modified by VK6NX)
*
*
* Color coding for current display 
*       tft.setTextColor(ST77XX_BLUE, ST77XX_BLACK);     // red
*       tft.setTextColor(ST77XX_YELLOW, ST77XX_BLACK);   // light blue
*       tft.setTextColor(ST77XX_GREEN, ST77XX_BLACK);    // green
*       tft.setTextColor(ST77XX_MAGENTA, ST77XX_BLACK);  // purple
*       tft.setTextColor(ST77XX_NORON, ST77XX_BLACK);    // dark red
*       tft.setTextColor(ST77XX_ORANGE, ST77XX_BLACK);   // blue 
*       tft.setTextColor(ST77XX_CYAN, ST77XX_BLACK);     // yellow
*       tft.setTextColor(ST77XX_PTLAR, ST77XX_BLACK);    // dark red
*       tft.setTextColor(ST77XX_WHITE, ST77XX_BLACK);    // white 
*
*/

#include <SPI.h>                          // SPI library
#include <Wire.h>                         // I2C Library (BMx280 and ADS1115)
#include <Adafruit_Sensor.h>              // for BME280
//#include <Adafruit_BME280.h>              // BME280 Library
#include <Adafruit_BMP280.h>              // BMP280 Library same Temp and Pressure but no humidity sensor
#include "adc.h"
#include "mqtt.h"
#include "ota.h"
#include "tftdisplay.h"

#define SEALEVELPRESSURE_HPA (1023.23)     // BMx280 set for Tarneit VIC AU
//Adafruit_BME280 bme;                     // BME280 I2C . Connected SDA=GPI021 SCL=GPI022
Adafruit_BMP280 bmp;                       // BMP280 I2C . Connected SDA=GPI021 SCL=GPI022

unsigned long delayTime;

const int VentRelayPin = 12;                // Temperature relay pin GPI014
const int PTTRelayPin = 14;                 // PTT relay pin GPI012

unsigned long startMillis;                  // for relay switch timer
unsigned long currentMillis;                // for relay switch timer
const unsigned long period = 10000;         // delay for relay switch (in ms)

//OneWire oneWire(22);                      // Define oneWire GPI022 = DS18B20 sensor pin
//DallasTemperature tempSensor(&oneWire);    // Pass our oneWire reference to DS18B20 Temperature sensor

unsigned status;                             // BMx280 status

void setup() {
  tft.initR(INITR_BLACKTAB);                  // initialise TFT screen
  tft.setRotation(1);                         // rotate screen CW 90
  tft.fillScreen(ST77XX_BLACK);
  Serial.begin(115200);
  WiFi.mode(WIFI_STA);                        // Station mode WiFi
  
  //status = bme.begin();
  status = bmp.begin();
  
  pinMode(14, OUTPUT);                        // Initialise Temperature relay pin
  pinMode(12, OUTPUT);                        // Initialise PTT relay pin

  startMillis = millis();
  
  displaySetup();
  otaSetup();
  adcInit();
}

void onConnectionEstablished() {
/*
   MQTT Subscribe and Publish setup
   This function is called once everything is connected (Wifi and MQTT)

   functions on received message are called withing client.subscribe
*/

// Subscribed to "esp32_PA1/band", waiting for band change call
  client.subscribe("esp32-PA1/band", [](const String & payload) {
  });

  // Publish keepalive message for testing purposes
  client.publish("esp32-PA1/keepalive", "ESP32-PA1 ping keepalive"); // You can activate the retain flag by setting the third parameter to true
}

void displaySWRvalue() {                                        // display SWR values
  if (fwdVoltageADS0 <= 3) {
    tft.setTextSize(2);
    tft.setCursor(55, 10);
    tft.setTextColor(ST77XX_GREEN, ST77XX_BLACK);
    tft.println("idle");
  }
  else {
    dtostrf(valueSWR, 3, 2, DisplayValueSWR);
    tft.setTextSize(2);
    tft.setCursor(55, 10);
    tft.setTextColor(ST77XX_GREEN, ST77XX_BLACK);
    tft.print(DisplayValueSWR);
  }
}

void displayPvalue() {                                        // display PWR values
  dtostrf(valueP, 4, 0, DisplayValueP);
  if (fwdVoltageADS0 < 10) {
    tft.setTextSize(2);
    tft.setCursor(55, 35);
    tft.setTextColor(ST77XX_GREEN, ST77XX_BLACK);
    tft.print("0000");
  }
  else {
    tft.setTextSize(2);
    tft.setCursor(55, 35);
    tft.setTextColor(ST77XX_GREEN, ST77XX_BLACK);
    tft.print(DisplayValueP);
  }
}

void displayTempValue() {                            // display PA Temperature values
  if (!status) {                                     // If BMx280 broken or not present
      tft.setTextSize(2);
      tft.setCursor(35, 60);
      tft.setTextColor(ST77XX_YELLOW, ST77XX_BLACK); //
      tft.println("NODATA");                         //
  }
  else {
      tft.setTextSize(2);
      //if (bme.readTemperature() < 50.00) {
      if (bmp.readTemperature() < 50.00) {  
        tft.setCursor(50, 60);
        tft.setTextColor(ST77XX_GREEN, ST77XX_BLACK);
        //tft.print(bme.readTemperature());
        tft.print(bmp.readTemperature());
      }
      //else if (bme.readTemperature() < 75.00) {
      else if (bmp.readTemperature() < 75.00) {  
        tft.setCursor(50, 60);
        tft.setTextColor(ST77XX_YELLOW, ST77XX_BLACK);
        //tft.print(bme.readTemperature());
        tft.print(bmp.readTemperature());
      }
      //else if (bme.readTemperature() < 80.00) {
      else if (bmp.readTemperature() < 80.00) {  
        tft.setCursor(50, 60);
        tft.setTextColor(ST77XX_MAGENTA, ST77XX_BLACK);
        //tft.print(bme.readTemperature());
        tft.print(bmp.readTemperature());
      }
    }   
}

void TempRelay() {                                // Temperature relay
  tft.setTextSize(1);
  if (!status) {                                  // If BME280 broken or not present
    tft.setTextColor(ST77XX_YELLOW, ST77XX_BLACK);//
    tft.setCursor(85, 80);                        //
    tft.println("VENT ON");                       //
    digitalWrite(VentRelayPin, HIGH);             // Vents and pump are constantly ON
  }
  else { 
    //if (bme.readTemperature() > 30.00) {          // Else it is Temp dependent below
    if (bmp.readTemperature() > 27.5) {
      currentMillis = millis();
      if(currentMillis - startMillis >= period){
      tft.setTextColor(ST77XX_YELLOW, ST77XX_BLACK);
      tft.setCursor(85, 80);
      tft.println("VENT ON");
      digitalWrite(VentRelayPin, HIGH);            // Turn Vent Relay ON on 30 C and above
      startMillis = currentMillis;
      }
    }
    else {
      currentMillis = millis();
      if(currentMillis - startMillis >= period){
      digitalWrite(VentRelayPin, LOW);              // Turn Vent Relay OFF below 30 C
      tft.setTextColor(ST77XX_BLACK);
      tft.setCursor(85, 80);
      tft.println("VENT ON");
      startMillis = currentMillis;
      }
    }
  }
}

void PTTRelay() {                   
  tft.setTextSize(1);               
  if (!status) {                                     // If BMx280 broken or not present
    tft.setTextColor(ST77XX_CYAN, ST77XX_BLACK);
    tft.setCursor(85, 95);
    tft.println("N/A");
  }
  else {
    //if (bme.readTemperature() > 75.00) {           // When 75 C reached, PTT relay switch off PTT
    if (bmp.readTemperature() > 75.00) {             // When 75 C reached, PTT relay switch off PTT
    tft.setTextColor(ST77XX_CYAN, ST77XX_BLACK);   // until temperatured reduced below 75
    tft.setCursor(85, 95);
    tft.println("PTT OFF");
    tft.setCursor(95, 105);
    tft.println("TEMP");
    digitalWrite(PTTRelayPin, HIGH);                  // Turn PTT Relay ON
    }
    else {
    digitalWrite(PTTRelayPin, LOW);                   // Turn PTT Relay OFF
    tft.setTextColor(ST77XX_BLACK);
    tft.setCursor(85, 95);
    tft.println("PTT OFF");
    tft.setCursor(95, 105);
    tft.println("TEMP");
    }
  }
}

void displayStatus(){
  if (!status) {                                  // If BMx280 broken or not present
    tft.setTextSize(2);
    tft.setCursor(4, 95);
    tft.setTextColor(ST77XX_CYAN, ST77XX_BLACK);
    tft.println("Failure");
  }
  else {
    if (bmp.readTemperature() < 50.00) {   
      tft.setTextColor(ST77XX_GREEN, ST77XX_BLACK);
      tft.setCursor(4, 95);
      tft.println("Normal");
    }
    if (bmp.readTemperature() > 50.00) {            
      tft.setTextColor(ST77XX_YELLOW, ST77XX_BLACK);
      tft.setCursor(4, 95);
      tft.println("Temp!!"); 
    }
    if (bmp.readTemperature() > 75.00) {           
      tft.setTextColor(ST77XX_CYAN, ST77XX_BLACK);
      tft.setCursor(4, 95);
      tft.println("HiTemp");
    }
  }
}

// FWD voltage display for testing purposes
/*
void displayfwdPwrVal() {
  if (fwdVoltageADS0 <= 3) {
    tft.setTextSize(2);
    tft.setCursor(30, 95);
    tft.setTextColor(ST77XX_GREEN, ST77XX_BLACK);
    tft.println("idle");
  }
  else {
    tft.setTextSize(2);
    tft.setCursor(30, 95);
    tft.setTextColor(ST77XX_GREEN, ST77XX_BLACK);
    tft.println(fwdVoltageADS0, 0);
  }
}
*/



void mqttMessagesBMx(){
  if (!status) {                                  // If BMx280 broken or not present
    client.publish("esp32-PA1/temp", "No DATA");                              
  }
  else {
    //client.publish("esp32-PA1/temp", String(bme.readTemperature()).c_str());
    //client.publish("esp32-PA1/pressure", String(bme.readPressure() / 100.0F).c_str());
    //client.publish("esp32-PA1/altitude", String(bme.readAltitude(SEALEVELPRESSURE_HPA)).c_str());
    //client.publish("esp32-PA1/humidity", String(bme.readHumidity()).c_str());
    client.publish("esp32-PA1/temp", String(bmp.readTemperature()).c_str());
    client.publish("esp32-PA1/pressure", String(bmp.readPressure() / 100.0F).c_str());
    client.publish("esp32-PA1/altitude", String(bmp.readAltitude(SEALEVELPRESSURE_HPA)).c_str());
  }
}

void mqttMessagesPwrSwr(){
  client.publish("esp32-PA1/swr", String(valueSWR).c_str());
  if (fwdVoltageADS0 < 3){
        client.publish("esp32-PA1/pwr", "0");
        client.publish("esp32-PA1/fwd", "0");
        client.publish("esp32-PA1/rev", "0");
        client.publish("esp32-PA1/reflPercent", "0");
        client.publish("esp32-PA1/pwr_peak", "0");
  }
  else {
        client.publish("esp32-PA1/pwr", String(DisplayValueP).c_str());
        client.publish("esp32-PA1/pwr_peak", String(fwdPwrPeakVal).c_str());
        client.publish("esp32-PA1/fwd", String(fwdVoltageADS0, 0).c_str());
        client.publish("esp32-PA1/rev", String(revVoltageADS1, 0).c_str());
        client.publish("esp32-PA1/reflPercent", String(rflPwrPercent, 0).c_str());
        client.publish("esp32-PA111/fwd", String(fwdVoltageADS0, 0)); // for W-V mapping, temporary
  }
}

void sendStatusUpdates() {
	static const unsigned long REFRESH_INTERVAL = 150; // ms
		static unsigned long lastRefreshTime = 0;
		if(millis() - lastRefreshTime >= REFRESH_INTERVAL){
			lastRefreshTime = millis();
      calcSWR();
      calcP();
      displayTempValue();
      displaySWRvalue();
      displayPvalue();      
      mqttMessagesPwrSwr();
      mqttMessagesBMx();
      displayStatus();
      //displayfwdPwrVal();
		}
}

void loop() {
  client.loop();                                            // MQTT Client loop
  ArduinoOTA.handle();                                      // OTA loop
  
  adcLoop();
  sendStatusUpdates();
  TempRelay();
  PTTRelay();
}

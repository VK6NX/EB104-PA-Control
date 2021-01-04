/*
* ESP32-based EB104 PA control
* Project description http://vk6nx.net/06_projects.html
* https://github.com/VK6NX/VK6NX-EB104-PA-Control
* Authors: 
*         ziss
*         VK6NX 
* 
* tftdisplay.h  
* Arduino OTA library: Arduino core for the ESP32 by espressif
*
*/

#ifndef TFTDISPLAY_H_
#define TFTDISPLAY_H_

#include <Adafruit_GFX.h>                 // Core graphics library
#include <Adafruit_ST7735.h>              // Hardware-specific library for ST7735
#include <Adafruit_ST7789.h>              // Hardware-specific library for ST7789

#define TFT_CS        32              // TFT display pin CS
#define TFT_RST        2              // TFT display pin RST
#define TFT_DC        33              // TFT display pin DC
Adafruit_ST7735 tft = Adafruit_ST7735(TFT_CS, TFT_DC, TFT_RST);
uint8_t displayRefreshFlags = 0;
#define DISPLAY_REFRESH_SWR 0x08

void displaySetup(){
  // Displays SWR
  tft.setCursor(5, 10);                       // set text to coordinates 5 = from left, 10 = from top
  tft.setTextColor(ST77XX_YELLOW);
  tft.setTextSize(2);                         // set the font x2
  tft.println("SWR");
  // Displays Power
  tft.setCursor(5, 35);
  tft.setTextColor(ST77XX_YELLOW);
  tft.setTextSize(2);
  tft.println("PWR");
  // Displays W
  tft.setCursor(120, 35);
  tft.setTextColor(ST77XX_YELLOW);
  tft.setTextSize(2);
  tft.println("W");
  // Displays PA Temp
  tft.setCursor(5, 60);
  tft.setTextColor(ST77XX_YELLOW);
  tft.setTextSize(2);
  tft.println("PA");
  tft.setCursor(4, 77);
  tft.setTextColor(ST77XX_YELLOW);
  tft.setTextSize(1);
  tft.println("TEMP");
  // Displays C
  tft.drawCircle(115, 62, 2, ST77XX_YELLOW);
  tft.setCursor(120, 60);
  tft.setTextColor(ST77XX_YELLOW);
  tft.setTextSize(2);
  tft.println("C");
  // Display FWD V 
  //tft.setTextSize(2);
  //tft.setCursor(4, 95);
  //tft.setTextColor(ST77XX_YELLOW);
  //tft.println("FW");
}

#endif /* TFTDISPLAY_H_ */
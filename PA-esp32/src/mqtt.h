/* 
 * ESP32-based EB104 PA control
 * Project description http://vk6nx.net/06_projects.html
 * https://github.com/VK6NX/VK6NX-EB104-PA-Control
 * Authors: 
 *         ziss
 *         VK6NX 
 * 
 * mqtt.h 
 * MQTT Client https://github.com/plapointe6/EspMQTTClient
 *
 */

#ifndef MQTT_H_
#define MQTT_H_

#include "EspMQTTClient.h"            // MQTT Client 


//  ************ Field Ap Express ************ 

EspMQTTClient client(
  "YOUR_SSID",                         // SSID
  "YOUR SSID PASSWORD",   // SSID pass
  "192.168.1.50 CHANGE ME!!!!",                // Server Mac MQTT Broker server ip
  //  "MQTTUsername",            // Can be omitted if not needed
  //  "MQTTPassword",            // Can be omitted if not needed
  "esp32-PA1 CHANGE ME!!!! if needed and replace other vaslues for new name",                // Client name that uniquely identify your device
  1883                           // The MQTT port, default to 1883
);


#endif /* MQTT_H_ */

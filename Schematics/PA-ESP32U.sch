EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "PA/ESP32-32U/ADS1115/RS485/DISP"
Date "2020-12-10"
Rev "1"
Comp "VK6NX"
Comment1 ""
Comment2 "VK6NX"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L pspice:DIODE D1
U 1 1 5FD23B31
P 6800 3000
F 0 "D1" V 6846 2872 50  0000 R CNN
F 1 "1N5817" V 6755 2872 50  0000 R CNN
F 2 "Diode_SMD:D_SMA" H 6800 3000 50  0001 C CNN
F 3 "~" H 6800 3000 50  0001 C CNN
	1    6800 3000
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D2
U 1 1 5FD250A9
P 7300 3000
F 0 "D2" V 7346 2872 50  0000 R CNN
F 1 "1N5817" V 7255 2872 50  0000 R CNN
F 2 "Diode_SMD:D_SMA" H 7300 3000 50  0001 C CNN
F 3 "~" H 7300 3000 50  0001 C CNN
	1    7300 3000
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C11
U 1 1 5FD274C6
P 11250 2950
F 0 "C11" H 11365 2996 50  0000 L CNN
F 1 "0.1uF" H 11365 2905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 11288 2800 50  0001 C CNN
F 3 "~" H 11250 2950 50  0001 C CNN
	1    11250 2950
	-1   0    0    1   
$EndComp
$Comp
L Device:C C10
U 1 1 5FD27F37
P 10050 2950
F 0 "C10" H 9850 2900 50  0000 C CNN
F 1 "22uF" H 9850 3000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10088 2800 50  0001 C CNN
F 3 "~" H 10050 2950 50  0001 C CNN
	1    10050 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2800 7300 2800
$Comp
L Device:C C6
U 1 1 5FD591FA
P 6050 3700
F 0 "C6" H 6165 3746 50  0000 L CNN
F 1 "0.1u" H 6165 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6088 3550 50  0001 C CNN
F 3 "~" H 6050 3700 50  0001 C CNN
	1    6050 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5FD59DA4
P 6050 3300
F 0 "C5" H 6165 3346 50  0000 L CNN
F 1 "0.1u" H 6165 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6088 3150 50  0001 C CNN
F 3 "~" H 6050 3300 50  0001 C CNN
	1    6050 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 4200 6800 4300
Text Notes 9250 5400 0    50   ~ 0
SCL
Text Notes 9250 5700 0    50   ~ 0
SDA
Connection ~ 6800 4300
Connection ~ 7400 4300
Wire Wire Line
	7400 4300 7300 4300
Wire Wire Line
	8150 3550 6800 3550
Wire Wire Line
	8150 3450 7300 3450
Wire Wire Line
	8550 2800 8550 3050
Wire Wire Line
	7300 3200 7300 3450
Connection ~ 7300 3450
Wire Wire Line
	7300 3450 7300 3900
Wire Wire Line
	6800 3200 6800 3550
Connection ~ 6800 3550
Wire Wire Line
	10050 2800 9650 2800
Text Notes 3250 3500 0    50   ~ 0
FWD
Text Notes 3250 3600 0    50   ~ 0
REV
Wire Wire Line
	10150 3650 8950 3650
Wire Wire Line
	9150 5400 10000 5400
Wire Wire Line
	10000 5400 10000 3550
Wire Wire Line
	10000 3550 8950 3550
Wire Wire Line
	9750 3350 8950 3350
Wire Wire Line
	9150 5200 9150 4300
Wire Wire Line
	8550 4300 8550 3950
Wire Wire Line
	7400 4300 8550 4300
Wire Wire Line
	8550 4300 8950 4300
Connection ~ 8550 4300
Connection ~ 8950 4300
Wire Wire Line
	8950 4300 9150 4300
Wire Wire Line
	8950 3750 8950 4300
Wire Wire Line
	6450 4300 6450 3850
Wire Wire Line
	9150 5800 9450 5800
Wire Wire Line
	9450 5800 9450 5200
Wire Wire Line
	9450 5200 9150 5200
$Comp
L power:GNDPWR #PWR01
U 1 1 5FD55153
P 8550 4300
F 0 "#PWR01" H 8550 4100 50  0001 C CNN
F 1 "GNDPWR" H 8554 4146 50  0000 C CNN
F 2 "" H 8550 4250 50  0001 C CNN
F 3 "" H 8550 4250 50  0001 C CNN
	1    8550 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDPWR #PWR02
U 1 1 5FD760FB
P 10050 3100
F 0 "#PWR02" H 10050 2900 50  0001 C CNN
F 1 "GNDPWR" H 10054 2946 50  0000 C CNN
F 2 "" H 10050 3050 50  0001 C CNN
F 3 "" H 10050 3050 50  0001 C CNN
	1    10050 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 4300 7400 6300
Wire Wire Line
	7400 6500 7550 6500
$Comp
L Diode:PMEG3020EH D3
U 1 1 60030019
P 12150 2800
F 0 "D3" H 12150 3000 50  0000 C CNN
F 1 "PMEG3020EH" H 11950 2900 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 12150 2625 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/PMEG3020EH_EJ.pdf" H 12150 2800 50  0001 C CNN
	1    12150 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 600F687B
P 9650 2950
F 0 "C9" H 9765 2996 50  0000 L CNN
F 1 "0.1uF" H 9765 2905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 9688 2800 50  0001 C CNN
F 3 "~" H 9650 2950 50  0001 C CNN
	1    9650 2950
	-1   0    0    1   
$EndComp
Connection ~ 9650 2800
Wire Wire Line
	9650 2800 8550 2800
$Comp
L Regulator_Linear:AMS1117-5.0 U3
U 1 1 60153BF6
P 10600 2800
F 0 "U3" H 10600 2350 50  0000 C CNN
F 1 "AMS1117-5.0" H 10600 2450 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 10600 3000 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 10700 2550 50  0001 C CNN
	1    10600 2800
	-1   0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q2
U 1 1 5FD8E48E
P 5600 6800
F 0 "Q2" H 5805 6846 50  0000 L CNN
F 1 "RFD14N05SM9A" H 5800 6700 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 5750 7050 50  0001 C CIN
F 3 "https://au.mouser.com/datasheet/2/308/RFD14N05SM9A-D-1814924.pdf" H 5600 6800 50  0001 L CNN
	1    5600 6800
	-1   0    0    1   
$EndComp
$Comp
L Device:Q_NMOS_GDS Q1
U 1 1 5FD8AFDA
P 5600 5800
F 0 "Q1" H 5800 5900 50  0000 L CNN
F 1 "RFD14N05SM9A" H 5800 5700 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 5750 6050 50  0001 C CIN
F 3 "https://au.mouser.com/datasheet/2/308/RFD14N05SM9A-D-1814924.pdf" H 5600 5800 50  0001 L CNN
	1    5600 5800
	-1   0    0    1   
$EndComp
Wire Wire Line
	7300 2800 7800 2800
Wire Wire Line
	7800 2800 7800 4900
Wire Wire Line
	7800 4900 7550 4900
Wire Wire Line
	7550 4900 7550 5200
Connection ~ 7300 2800
$Comp
L Device:CP C12
U 1 1 600C0E84
P 11500 2950
F 0 "C12" H 11250 3000 50  0000 L CNN
F 1 "47uF" H 11250 2850 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 11538 2800 50  0001 C CNN
F 3 "~" H 11500 2950 50  0001 C CNN
	1    11500 2950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7550 7000 7550 7250
NoConn ~ 9150 6800
NoConn ~ 9150 6900
NoConn ~ 9150 7000
NoConn ~ 7550 6900
NoConn ~ 7550 6600
NoConn ~ 9150 5600
NoConn ~ 7550 5500
NoConn ~ 7550 5400
NoConn ~ 7550 5300
NoConn ~ 9150 5500
Wire Wire Line
	10900 2800 11250 2800
Connection ~ 11250 2800
$Comp
L ES32-DEVKIT-32D:ADS1115board U2
U 1 1 5FE33096
P 8550 3550
F 0 "U2" H 8550 4231 50  0000 C CNN
F 1 "ADS1115board" H 8550 4140 50  0000 C CNN
F 2 "library:ADS1115boardFP" H 8550 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1113.pdf" H 8500 2650 50  0001 C CNN
	1    8550 3550
	1    0    0    -1  
$EndComp
Connection ~ 9150 4300
Wire Wire Line
	10300 2800 10050 2800
Connection ~ 10050 2800
NoConn ~ 7550 6000
NoConn ~ 7550 6100
Wire Wire Line
	10300 7250 10300 5700
Connection ~ 10300 2800
Wire Wire Line
	6800 3550 6800 3900
$Comp
L Device:C C8
U 1 1 5FD2AE4B
P 7300 4050
F 0 "C8" H 7415 4096 50  0000 L CNN
F 1 "0.1u" H 7415 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 7338 3900 50  0001 C CNN
F 3 "~" H 7300 4050 50  0001 C CNN
	1    7300 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5FD2A202
P 6800 4050
F 0 "C7" H 6915 4096 50  0000 L CNN
F 1 "0.1u" H 6915 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 6838 3900 50  0001 C CNN
F 3 "~" H 6800 4050 50  0001 C CNN
	1    6800 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 4300 6800 4300
Wire Wire Line
	6050 3450 7300 3450
Wire Wire Line
	6050 3550 6800 3550
$Comp
L Device:R_POT RV1
U 1 1 5FEB56DA
P 5500 3300
F 0 "RV1" H 5431 3346 50  0000 R CNN
F 1 "100K" H 5431 3255 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3296W_Vertical" H 5500 3300 50  0001 C CNN
F 3 "~" H 5500 3300 50  0001 C CNN
	1    5500 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3450 5650 3450
Wire Wire Line
	5650 3450 5650 3300
Connection ~ 6050 3450
$Comp
L Device:R_POT RV2
U 1 1 5FEBFD98
P 5500 3700
F 0 "RV2" H 5431 3654 50  0000 R CNN
F 1 "100K" H 5431 3745 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3296W_Vertical" H 5500 3700 50  0001 C CNN
F 3 "~" H 5500 3700 50  0001 C CNN
	1    5500 3700
	1    0    0    1   
$EndComp
Wire Wire Line
	6050 3550 5650 3550
Wire Wire Line
	5650 3550 5650 3700
Connection ~ 6050 3550
Wire Wire Line
	5500 3850 6050 3850
Wire Wire Line
	6050 3850 6450 3850
Connection ~ 6050 3850
Connection ~ 6450 3850
Wire Wire Line
	6450 3850 6450 3150
Wire Wire Line
	5500 3150 6050 3150
Wire Wire Line
	6050 3150 6450 3150
Connection ~ 6050 3150
$Comp
L Device:C C3
U 1 1 5FED36DC
P 4900 3300
F 0 "C3" H 5015 3346 50  0000 L CNN
F 1 "10nF" H 5015 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4938 3150 50  0001 C CNN
F 3 "~" H 4900 3300 50  0001 C CNN
	1    4900 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5FED5752
P 4900 3700
F 0 "C4" H 5015 3746 50  0000 L CNN
F 1 "10nF" H 5015 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4938 3550 50  0001 C CNN
F 3 "~" H 4900 3700 50  0001 C CNN
	1    4900 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3450 4900 3450
Wire Wire Line
	4900 3150 5500 3150
Connection ~ 5500 3150
Wire Wire Line
	5500 3550 4900 3550
Wire Wire Line
	4900 3850 5500 3850
Connection ~ 5500 3850
$Comp
L Device:C C1
U 1 1 5FEE4153
P 4050 3300
F 0 "C1" H 4165 3346 50  0000 L CNN
F 1 "10nF" H 4165 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4088 3150 50  0001 C CNN
F 3 "~" H 4050 3300 50  0001 C CNN
	1    4050 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5FEE4BBE
P 4050 3700
F 0 "C2" H 4165 3746 50  0000 L CNN
F 1 "10nF" H 4165 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4088 3550 50  0001 C CNN
F 3 "~" H 4050 3700 50  0001 C CNN
	1    4050 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3450 4650 3450
Connection ~ 4900 3450
Wire Wire Line
	4350 3450 4050 3450
Wire Wire Line
	4050 3550 4350 3550
Wire Wire Line
	4650 3550 4900 3550
Connection ~ 4900 3550
Wire Wire Line
	4900 3850 4050 3850
Connection ~ 4900 3850
Connection ~ 4900 3150
$Comp
L Device:R R1
U 1 1 5FEE57D6
P 4500 3450
F 0 "R1" V 4400 3400 50  0000 C CNN
F 1 "2K" V 4400 3500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4430 3450 50  0001 C CNN
F 3 "~" H 4500 3450 50  0001 C CNN
	1    4500 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5FF0A020
P 4500 3550
F 0 "R2" V 4600 3500 50  0000 C CNN
F 1 "2K" V 4600 3600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4430 3550 50  0001 C CNN
F 3 "~" H 4500 3550 50  0001 C CNN
	1    4500 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 3150 4900 3150
Wire Wire Line
	4050 3450 3650 3450
Connection ~ 4050 3450
Wire Wire Line
	4050 3550 3650 3550
Connection ~ 4050 3550
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5FF21B43
P 3450 3550
F 0 "J1" H 3558 3831 50  0000 C CNN
F 1 "Conn_01x03_Male" H 3558 3740 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3450 3550 50  0001 C CNN
F 3 "~" H 3450 3550 50  0001 C CNN
	1    3450 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 3650 3650 3850
Wire Wire Line
	3650 3850 4050 3850
Connection ~ 4050 3850
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 5FFBDAD5
P 12500 2900
F 0 "J6" H 12472 2782 50  0000 R CNN
F 1 "Conn 12V" H 12472 2873 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 12500 2900 50  0001 C CNN
F 3 "~" H 12500 2900 50  0001 C CNN
	1    12500 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 4300 10500 4300
Wire Wire Line
	12000 2900 12300 2900
Wire Wire Line
	11250 2800 11500 2800
Connection ~ 11500 2800
Wire Wire Line
	11500 2800 12000 2800
Wire Wire Line
	9650 3100 10050 3100
Connection ~ 10050 3100
Wire Wire Line
	10050 3100 10600 3100
Wire Wire Line
	10600 3100 11250 3100
Connection ~ 10600 3100
Wire Wire Line
	11250 3100 11500 3100
Connection ~ 11250 3100
Wire Wire Line
	11500 3100 12000 3100
Connection ~ 11500 3100
Wire Wire Line
	12000 2900 12000 3100
$Comp
L power:+12V #PWR03
U 1 1 6001A2F0
P 12300 2800
F 0 "#PWR03" H 12300 2650 50  0001 C CNN
F 1 "+12V" H 12315 2973 50  0000 C CNN
F 2 "" H 12300 2800 50  0001 C CNN
F 3 "" H 12300 2800 50  0001 C CNN
	1    12300 2800
	1    0    0    -1  
$EndComp
Connection ~ 10000 5400
Text Notes 11050 5400 0    50   ~ 0
to SCL BME 280
$Comp
L Connector:Conn_01x04_Male J5
U 1 1 60029BF9
P 11000 5500
F 0 "J5" H 11150 5200 50  0000 R CNN
F 1 "Conn_BME/BMP" H 11400 5100 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 11000 5500 50  0001 C CNN
F 3 "~" H 11000 5500 50  0001 C CNN
	1    11000 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10800 5500 10150 5500
Wire Wire Line
	10150 5500 10150 3650
Text Notes 11050 5500 0    50   ~ 0
to SDA BME 280
Text Notes 11050 5600 0    50   ~ 0
to GND BME 280
Text Notes 11050 5700 0    50   ~ 0
to VIN BME 280
Wire Wire Line
	10500 4300 10500 5600
Wire Wire Line
	10500 5600 10800 5600
Connection ~ 10500 4300
Wire Wire Line
	10500 4300 12000 4300
Wire Wire Line
	10300 5700 10800 5700
Connection ~ 10300 5700
Wire Wire Line
	10300 5700 10300 4000
$Comp
L Connector:Conn_01x08_Male J4
U 1 1 6004AFCB
P 7700 8250
F 0 "J4" H 7800 7600 50  0000 C CNN
F 1 "Conn_TFT Display" H 7850 7750 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 7700 8250 50  0001 C CNN
F 3 "~" H 7700 8250 50  0001 C CNN
	1    7700 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 7250 8450 7800
Wire Wire Line
	8450 8050 7900 8050
Wire Wire Line
	7550 7250 8450 7250
Connection ~ 8450 7250
Wire Wire Line
	8450 7250 10300 7250
Wire Wire Line
	12000 4300 12000 7950
Wire Wire Line
	12000 7950 7900 7950
Connection ~ 12000 4300
Text Notes 7500 7950 0    50   ~ 0
GND
Text Notes 7500 8050 0    50   ~ 0
VCC
Text Notes 7500 8150 0    50   ~ 0
SCL
Text Notes 7500 8250 0    50   ~ 0
SDA
Text Notes 7500 8350 0    50   ~ 0
RST
Text Notes 7500 8450 0    50   ~ 0
DC
Text Notes 7500 8550 0    50   ~ 0
CS
Text Notes 7500 8650 0    50   ~ 0
BL
NoConn ~ 7900 8650
Wire Wire Line
	10000 5400 10800 5400
Wire Wire Line
	7900 8150 9450 8150
Wire Wire Line
	9450 8150 9450 6000
Wire Wire Line
	9450 6000 9150 6000
Wire Wire Line
	10150 5700 10150 5500
Wire Wire Line
	9150 5700 10150 5700
Connection ~ 10150 5500
Wire Wire Line
	7900 8250 9550 8250
Wire Wire Line
	9550 8250 9550 5300
Wire Wire Line
	9550 5300 9150 5300
Wire Wire Line
	7900 8350 9950 8350
Wire Wire Line
	9750 3350 9750 5900
Wire Wire Line
	9750 5900 9150 5900
Wire Wire Line
	9950 6100 9150 6100
Wire Wire Line
	9950 6100 9950 8350
Wire Wire Line
	10050 8450 10050 6200
Wire Wire Line
	10050 6200 9150 6200
Wire Wire Line
	7900 8450 10050 8450
Wire Wire Line
	10150 8550 10150 6300
Wire Wire Line
	10150 6300 9150 6300
Wire Wire Line
	7900 8550 10150 8550
Wire Wire Line
	9150 6700 9250 6700
Wire Wire Line
	9250 6700 9250 7400
Wire Wire Line
	9250 7400 6550 7400
Wire Wire Line
	6550 7400 6550 5800
Wire Wire Line
	6550 5800 6400 5800
$Comp
L Device:R R3
U 1 1 5FEE6217
P 6250 5800
F 0 "R3" V 6350 5700 50  0000 C CNN
F 1 "220" V 6350 5850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6180 5800 50  0001 C CNN
F 3 "~" H 6250 5800 50  0001 C CNN
	1    6250 5800
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5FEE76E6
P 6250 6800
F 0 "R4" V 6350 6700 50  0000 C CNN
F 1 "220" V 6350 6850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6180 6800 50  0001 C CNN
F 3 "~" H 6250 6800 50  0001 C CNN
	1    6250 6800
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 6800 6400 7500
Wire Wire Line
	6400 7500 9350 7500
Wire Wire Line
	9350 7500 9350 6600
Wire Wire Line
	9350 6600 9150 6600
Wire Wire Line
	5500 3850 5500 5250
Wire Wire Line
	5500 6600 5500 6350
Wire Wire Line
	5500 6350 5950 6350
Wire Wire Line
	5950 6350 5950 5250
Wire Wire Line
	5950 5250 5500 5250
Connection ~ 5500 5250
Wire Wire Line
	5500 5250 5500 5600
Wire Wire Line
	6100 5800 5800 5800
Wire Wire Line
	6100 6800 5800 6800
Wire Wire Line
	5500 6000 4350 6000
Wire Wire Line
	5500 7000 4400 7000
$Comp
L Relay:SRD-05VDC-SL-C K1
U 1 1 6031E832
P 4100 7200
F 0 "K1" V 3533 7200 50  0000 C CNN
F 1 "SRD-05VDC-SL-C" V 3624 7200 50  0000 C CNN
F 2 "library:Relay_SPD_SONGLE_SRD_Series_Form_C" H 4550 7150 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 4100 7200 50  0001 L CNN
	1    4100 7200
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 7000 3250 7000
Wire Wire Line
	3250 7000 3250 7800
Wire Wire Line
	3250 7800 8450 7800
Connection ~ 8450 7800
Wire Wire Line
	8450 7800 8450 8050
Wire Wire Line
	3800 7400 3800 8300
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 6033F54F
P 4150 6000
F 0 "J3" H 4258 6181 50  0000 C CNN
F 1 "to GND Cooling Pump/Fan" H 3550 6000 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 4150 6000 50  0001 C CNN
F 3 "~" H 4150 6000 50  0001 C CNN
	1    4150 6000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 60340D8A
P 4050 8500
F 0 "J2" V 4100 8250 50  0000 R CNN
F 1 "to PTT" V 3950 8600 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4050 8500 50  0001 C CNN
F 3 "~" H 4050 8500 50  0001 C CNN
	1    4050 8500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3800 8300 4050 8300
NoConn ~ 7550 5600
NoConn ~ 7550 5700
NoConn ~ 7550 5800
NoConn ~ 7550 5900
NoConn ~ 7550 6200
NoConn ~ 7550 6300
NoConn ~ 7550 6400
NoConn ~ 9150 6400
NoConn ~ 9150 6500
Connection ~ 12300 2800
Wire Wire Line
	12000 3100 12000 4300
Connection ~ 12000 3100
Wire Wire Line
	4400 7300 4550 7300
Wire Wire Line
	4550 7300 4550 8300
Wire Wire Line
	4150 8300 4550 8300
$Comp
L ES32-DEVKIT-32D:ESP32-DEVKITC-32U U1
U 1 1 613672CB
P 8350 6100
F 0 "U1" H 8350 7267 50  0000 C CNN
F 1 "ESP32-DEVKITC-32U" H 8350 7176 50  0000 C CNN
F 2 "MODULE_ESP32-DEVKITC-32U" V 8400 5750 50  0001 L BNN
F 3 "" H 8350 6100 50  0001 L BNN
F 4 "Espressif Systems" H 8050 5200 50  0001 L BNN "MANUFACTURER"
F 5 "4" H 8350 6100 50  0001 L BNN "PARTREV"
	1    8350 6100
	1    0    0    -1  
$EndComp
Connection ~ 9150 5200
$Comp
L Connector:Conn_01x04_Female J7
U 1 1 6137D638
P 6850 6700
F 0 "J7" H 6750 6400 50  0000 C CNN
F 1 "RS485 mod IN" V 7050 6750 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6850 6700 50  0001 C CNN
F 3 "~" H 6850 6700 50  0001 C CNN
	1    6850 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7050 6700 7150 6700
Wire Wire Line
	7150 6700 7150 6800
Wire Wire Line
	7150 6800 7050 6800
Wire Wire Line
	7050 6600 7200 6600
Wire Wire Line
	7200 6600 7200 6700
Wire Wire Line
	7200 6700 7550 6700
Wire Wire Line
	7050 6900 7200 6900
Wire Wire Line
	7200 6900 7200 6800
Wire Wire Line
	7200 6800 7550 6800
Text Notes 6750 6600 0    50   ~ 0
R0
Text Notes 6750 6700 0    50   ~ 0
RE
Text Notes 6750 6800 0    50   ~ 0
DE
Text Notes 6750 6900 0    50   ~ 0
DI
Text Notes 7200 6700 0    50   ~ 0
U1RXD
Text Notes 7200 6800 0    50   ~ 0
U1TXD
$Comp
L Connector:Conn_01x04_Female J8
U 1 1 613A1B82
P 13200 3650
F 0 "J8" H 13100 3350 50  0000 C CNN
F 1 "RS485 mod OUT" H 12850 3200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 13200 3650 50  0001 C CNN
F 3 "~" H 13200 3650 50  0001 C CNN
	1    13200 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 613AB2DF
P 13750 3750
F 0 "J9" H 13600 3800 50  0000 R CNN
F 1 "RS485 OUT" H 13722 3723 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 13750 3750 50  0001 C CNN
F 3 "~" H 13750 3750 50  0001 C CNN
	1    13750 3750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 613AC8C3
P 12400 3700
F 0 "R5" V 12500 3700 50  0000 C CNN
F 1 "120" V 12300 3700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 12330 3700 50  0001 C CNN
F 3 "~" H 12400 3700 50  0001 C CNN
	1    12400 3700
	-1   0    0    1   
$EndComp
Wire Wire Line
	12400 3550 12650 3550
Wire Wire Line
	12650 3550 12650 3650
Wire Wire Line
	12650 3650 13000 3650
Wire Wire Line
	12400 3850 12650 3850
Wire Wire Line
	12650 3850 12650 3750
Wire Wire Line
	12650 3750 13000 3750
Wire Wire Line
	13000 3550 13000 3100
Wire Wire Line
	13000 3100 12000 3100
Wire Wire Line
	13000 3850 13000 4000
Wire Wire Line
	13000 4000 10300 4000
Connection ~ 10300 4000
Wire Wire Line
	10300 4000 10300 2800
Wire Wire Line
	13000 3650 13550 3650
Connection ~ 13000 3650
Wire Wire Line
	13000 3750 13550 3750
Connection ~ 13000 3750
Text Notes 13200 3550 0    50   ~ 0
GND
Text Notes 13250 3650 0    50   ~ 0
A
Text Notes 13250 3750 0    50   ~ 0
B
Text Notes 13200 3900 0    50   ~ 0
VCC
$Comp
L Device:C C16
U 1 1 614A9262
P 13550 3900
F 0 "C16" H 13600 3700 50  0000 L CNN
F 1 "0.1u" H 13600 3800 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 13588 3750 50  0001 C CNN
F 3 "~" H 13550 3900 50  0001 C CNN
	1    13550 3900
	1    0    0    -1  
$EndComp
Connection ~ 13550 3750
$Comp
L Device:C C15
U 1 1 614AC84B
P 13550 3500
F 0 "C15" H 13600 3700 50  0000 L CNN
F 1 "0.1u" H 13600 3600 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 13588 3350 50  0001 C CNN
F 3 "~" H 13550 3500 50  0001 C CNN
	1    13550 3500
	1    0    0    -1  
$EndComp
Connection ~ 13550 3650
$Comp
L Device:C C14
U 1 1 614AF44F
P 7200 7050
F 0 "C14" H 7250 6850 50  0000 L CNN
F 1 "0.1u" H 7250 6950 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7238 6900 50  0001 C CNN
F 3 "~" H 7200 7050 50  0001 C CNN
	1    7200 7050
	1    0    0    -1  
$EndComp
Connection ~ 7200 6900
$Comp
L Device:C C13
U 1 1 614B2CC1
P 7200 6450
F 0 "C13" H 7050 6700 50  0000 L CNN
F 1 "0.1u" H 7000 6550 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7238 6300 50  0001 C CNN
F 3 "~" H 7200 6450 50  0001 C CNN
	1    7200 6450
	1    0    0    -1  
$EndComp
Connection ~ 7200 6600
Wire Wire Line
	7300 4200 7300 4300
Connection ~ 7300 4300
Wire Wire Line
	7300 4300 6800 4300
Wire Wire Line
	7200 6300 7400 6300
Connection ~ 7400 6300
Wire Wire Line
	7400 6300 7400 6500
Wire Wire Line
	7200 7200 6700 7200
Wire Wire Line
	6700 7200 6700 6300
Wire Wire Line
	6700 6300 7200 6300
Connection ~ 7200 6300
$EndSCHEMATC

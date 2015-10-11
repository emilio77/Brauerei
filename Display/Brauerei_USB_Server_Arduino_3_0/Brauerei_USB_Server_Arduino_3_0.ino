// Pinbelegung:
// A1 : NTC Sernsor
// A4 : I²C (SDA)
// A5 : I²C (SCL)
// D0 : USB - Rx
// D1 : USB - Tx
// D2 : DS18B20 Sensor
// D4 : Heizung
// D5 : Rührwerk
// D6 : Pumpe
// D7 : Alarm
// D8 : Heizungsschalter
// D9 : Ruehrwerksschalter 
// D10 : Pumpenschalter  
// D11 : Alarmschalter 
// D12 : Automatikschalter 

// Beschreibung des seriellen Strings:
// Serieller String ist immer 19stellig
// Beispiel: C$%"dp/1----------c
// 1.    Zeichen: "C" Startzeichen
// 2.    Zeichen: Relaisstatus
// 3.    Zeichen: Programmstatus und Sensortyp
// 4.    Zeichen: Solltemperatur
// 5.+6. Zeichen: Isttemperatur
// 7.+8. Zeichen: Status der Zusatzfunktionen
// 9.-18.Zeichen: Frei für weitere Funktionen
// 19.   Zeichen: "c" Stopzeichen

#include <Wire.h>               // Kommt von Arduino IDE
#include <LiquidCrystal_I2C.h>  // Kommt von http://arduino-info.wikispaces.com/LCD-Blue-I2C
#include <math.h>               // Kommt von Arduino IDE
#include <OneWire.h>            // Kommt von http://www.pjrc.com/teensy/td_libs_OneWire.html
     
OneWire ds(2);                  // OneWireSensor an Pin 2

LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);  // LCD I2C Adresse einstellen, (addr, en,rw,rs,d4,d5,d6,d7,bl,blpol) 
                                                                // ^ Kann sich je nach Display ändern ^
                                                                // Pins für Display A4=SDA / A5=SCL 

byte heat[8] = {  // Heizungssymbol erstellen
B01001,
B10010,
B01001,
B10010,
B00000,
B11111,
B01110,
B00000
};

byte ruehr[8] = {  // Rührwerkssymbol erstellen
B11111,
B00100,
B00100,
B00100,
B10101,
B11111,
B10101,
B00000
};

byte alarm[8] = {  // Alarmsymbol erstellen
B00000,
B00100,
B01110,
B01110,
B01110,
B11111,
B00100,
B00000
};

byte pumpe[8] = {  // Pumpensymbol erstellen
B11111,
B01110,
B10001,
B10001,
B10001,
B01110,
B11111,
B00000
};

float temperatur, temperaturalt, temperaturneu;

const boolean aus = HIGH;                          // Hier kann bei Low-Aktiven Relaiskarten einfach High und Low vertauscht werden
const boolean an = LOW;                            // Hier kann bei Low-Aktiven Relaiskarten einfach High und Low vertauscht werden

const int Heizung = 4;                             // Im folgenden sind die Pins der Sensoren und Aktoren festgelegt
const int Ruehrwerk = 5;
const int Pumpe = 6; 
const int Summer = 7; 

const int Heizschalter = 8;
const int Ruehrschalter = 9;
const int Pumpschalter = 10; 
const int Alarmschalter = 11; 
const int Autoschalter = 12; 

int sensorPin = A0;  

void setup() {
  lcd.begin(20,4);                // initialize the lcd for 20 chars 4 lines and turn on backlight
  lcd.backlight();                // backlight on  
  pinMode(Heizung, OUTPUT);       // Im folgenden werden die Pins als I/O definiert
  pinMode(Summer, OUTPUT);
  pinMode(Ruehrwerk, OUTPUT);
  pinMode(Pumpe, OUTPUT);
  pinMode(Heizschalter, INPUT);
  pinMode(Pumpschalter, INPUT);
  pinMode(Ruehrschalter, INPUT);
  pinMode(Autoschalter, INPUT);
  lcd.createChar(1, heat);         // Aktivierung der eigenen Zeichen
  lcd.createChar(2, ruehr);
  lcd.createChar(3, alarm);
  lcd.createChar(4, pumpe);
}

void loop() {
  digitalWrite(Heizung,aus);          // Alle Relais aus
  digitalWrite(Summer,aus);
  digitalWrite(Ruehrwerk,aus);
  digitalWrite(Pumpe,aus);
  lcd.setCursor(0, 1);                // Startbildschirm
  lcd.print("  Braudisplay V3.0  ");
  lcd.setCursor(0, 2); 
  lcd.print("      by emilio     ");
  delay(2000);
  temperatur = temp2();               // Erste Temperaturerfassung
  Braudisplay();                      // Hauptprogramm starten
}

void Funktion1()           // Individuelle Funktion
{

}

void Funktion2()           // Individuelle Funktion
{

}

void Funktion3()           // Individuelle Funktion
{

}

void Funktion4()           // Individuelle Funktion
{

}

void Funktion5()           // Individuelle Funktion
{

}

void Funktion6()           // Individuelle Funktion
{

}

void Funktion7()           // Individuelle Funktion
{

}

void Funktion8()           // Individuelle Funktion
{

}

void Funktion9()           // Individuelle Funktion
{

}

void Funktion10()           // Individuelle Funktion
{

}

void noFunktion()
{

}

void Braudisplay()
{
  char charVal[3];
  int temp, temp2, offlinecounter, incomingByte = 0;
  float tempsolltemp, tempisttemp = 0;
  char sensor= 'D';                  // Als Startsensor ist der DS18B20 gesetzt ( 'd'=Display, 'N'=NTC10k )
  char temprec[20] = "";
  char relais[5] = "";
  char state[3] = "";
  lcd.clear();
  BStart:   
  lcd.setCursor(0, 1);               // Basisdisplay-Beschriftung
  lcd.print("Brauerei:   "); 
  lcd.setCursor(0, 2);
  lcd.print("Ausg"); 
  lcd.write(225);  
  lcd.print("nge:    "); 
  lcd.setCursor(0, 0);
  lcd.print("Sensortyp:   "); 
  lcd.setCursor(0, 3);
  lcd.print("S:");
  lcd.setCursor(7, 3);
  lcd.write(223);
  lcd.print("C  I:"); 
  lcd.setCursor(18, 3);
  lcd.write(223);
  lcd.print("C"); 
  delay(200);
  lcd.setCursor(12, 0); 
  if (sensor == 'd') lcd.print(" Display"); else if (sensor == 'N') lcd.print("  NTC10k"); else lcd.print(" DS18B20");   // Sensortyp ausgeben 
  Serial.begin(19200);                // Serieller Port für Isttemperaturübertragung öffnen
  if (sensor=='N')                    // NTC-Messung starten und ausgeben
    {
    temperaturmessungNTC(); 
    lcd.setCursor(13, 3);
    if(temperatur>-10 & temperatur<0){lcd.print(" ");} else if(temperatur>=0 & temperatur<10){lcd.print("  ");} else if(temperatur>=10 & temperatur<100){lcd.print(" ");} 
    lcd.print(temperatur,1);
    Serial.println(temperatur,1);
    delay(1000);
    }
  if (sensor=='D')                                       // DS18B20-Messung starten und ausgeben
    {
    temperaturmessungDS18B20(); 
    lcd.setCursor(13, 3);
    if(temperatur>-10 & temperatur<0){lcd.print(" ");} 
    else if(temperatur>=0 & temperatur<10){lcd.print("  ");} 
    else if(temperatur>=10 & temperatur<100){lcd.print(" ");} 
    lcd.print(temperatur,1);
    Serial.println(temperatur,1);
    }  
  Serial.end();                                            // Serieller Port für Isttemperaturübertragung schließen
  delay(120); //200                                              
  for (int schleife2=0; schleife2 <= 9; schleife2++)       // Schleife für Serielle Kommunikation
    {                                               
    Serial.begin(19200);                                   // Serieller Port für Statusübertragung öffnen
    delay(200); //210
    lcd.setCursor(0, 1); 
    for (int schleife=0; schleife < 20; schleife++) { temprec[schleife]= ' ';}
    for (int schleife=0; schleife < Serial.available(); schleife++)
      {
      incomingByte = Serial.read(); 
      delay(8); //8 
      temprec[schleife]= incomingByte;
      }  
    Serial.end();                                            // Serieller Port für Statusübertragung schließen

    if ( offlinecounter!=10 ) {offlinecounter++;}
    
    if ((temprec[0]=='C') && (temprec[18]=='c'))             // Begin der Decodierung des seriellen Strings  
      { 
      offlinecounter=0;
      temp=(int)temprec[1];
      if ( temp < 0 ) { temp = 256 + temp; }
      if ( temp > 7) {relais[4]='A';temp=temp-8;} else {relais[4]='a';} 
      if ( temp > 3) {relais[3]='P';temp=temp-4;} else {relais[3]='p';} 
      if ( temp > 1) {relais[2]='R';temp=temp-2;} else {relais[2]='r';}
      if ( temp > 0) {relais[1]='H';temp=temp-1;} else {relais[1]='h';}   
      temp=(int)temprec[2];
      if ( temp < 0 ) { temp = 256 + temp; }
      if ( temp > 127) {sensor='N';temp=temp-128;}  
      if ( temp > 63) {sensor='D';temp=temp-64;}
      if ( temp > 31) {sensor='d';temp=temp-32;}    
      if ( temp > 15) {state[2]='t';temp=temp-16;}  
      if ( temp > 7) {state[2]='T';temp=temp-8;}  
      if ( temp > 3) {state[1]='x';temp=temp-4;} 
      else if ( temp > 1) {state[1]='z';temp=temp-2;}  
      else if ( temp > 0) {state[1]='y';temp=temp-1;}    
      temp=(int)temprec[3];
      if ( temp < 0 ) { temp = 256 + temp; }
      tempsolltemp=temp;
      temp=(int)temprec[5];
      if ( temp < 0 ) { temp = 256 + temp; }
      temp2=temp;
      temp=(int)temprec[4];
      if ( temp < 0 ) { temp = 256 + temp; }
      temp=temp*256;
      temp2=temp2+temp;
      tempisttemp=temp2;
      tempisttemp=tempisttemp/10;
      temp=(int)temprec[6];
      if ( temp < 0 ) { temp = 256 + temp; }
      temp2=(int)temprec[7];
      if ( temp2 < 0 ) { temp2 = 256 + temp2; }
      if ( (temp == 0) & (temp2 == 0) ) {noFunktion();} 
      if ( temp > 127) {Funktion1();temp=temp-128;} 
      if ( temp > 63) {Funktion2();temp=temp-64;} 
      if ( temp > 31) {Funktion3();temp=temp-32;} 
      if ( temp > 15) {Funktion4();temp=temp-16;}    
      if ( temp > 7) {Funktion5();temp=temp-8;}  
      if ( temp > 3) {Funktion6();temp=temp-4;} 
      if ( temp > 1) {Funktion7();temp=temp-2;}  
      if ( temp > 0) {Funktion8();temp=temp-1;}  
      if ( temp2 > 1) {Funktion9();temp2=temp2-2;}    
      if ( temp2 > 0) {Funktion10();temp2=temp2-1;}  
      }    
       
    if (digitalRead(Autoschalter)==LOW)                                                    // wenn Automatikschalter geschlossen dann...
      { 
      if ( offlinecounter==10 )                                                            // Wenn keinee serielle Verbindung besteht...
        {
        relais[1]='h'; relais[2]='r'; relais[3]='p'; relais[4]='a';
        lcd.setCursor(12, 1); 
        lcd.print(" offline");                        
        lcd.setCursor(2, 3);
        lcd.print(" --.-");                       
        }        
      if ((temprec[0]=='C') && (temprec[18]=='c'))                                         // Wenn serieller String vollständig...
        {
        if ( state[2] != 'T' )                                                             // Wenn Zeichen K dann 4 Zeichen ausgeben ( Solltemperatur )
          {
          lcd.setCursor(2, 3); lcd.print(" "); 
          dtostrf(tempsolltemp, 3, 1, charVal);
          lcd.print(charVal);          
          }
        if ( sensor == 'd' )                                                                // Wenn Zeichen k dann 4 Zeichen ausgeben ( Isttemperatur )  
          {
          lcd.setCursor(13, 3); lcd.print(" "); 
          dtostrf(tempisttemp, 3, 1, charVal);
          lcd.print(charVal);
          } 
        if ( state[1] == 'x' ) {lcd.setCursor(12, 1); lcd.print(" inaktiv");}                // Brauerei Status ausgeben
        else if ( state[1] == 'y' ) {lcd.setCursor(12, 1); lcd.print("   aktiv");}
        else if ( state[1] == 'z' ) {lcd.setCursor(12, 1); lcd.print("pausiert");}  
        if ( state[2] == 'T' )                                                           
          {
          relais[1]='h'; relais[2]='r'; relais[3]='p'; relais[4]='a';
          lcd.setCursor(12, 1); 
          lcd.print("     aus");  
          lcd.setCursor(2, 3);
          lcd.print(" --.-");                           
          }
        } 
      if (((temprec[0]=='C') && (temprec[18]=='c')) || ( offlinecounter==10 ))
        {      
        if (relais[1] == 'H') {lcd.setCursor(13, 2); lcd.write(1); lcd.print(" "); digitalWrite(Heizung,an);}        // Relais entsprechend der seriellen Daten schalten und auf Display ausgeben
        else {lcd.setCursor(13, 2); lcd.print("  "); digitalWrite(Heizung,aus);}
        if (relais[2] == 'R') {lcd.setCursor(15, 2); lcd.write(2); lcd.print(" "); digitalWrite(Ruehrwerk,an);}
        else {lcd.setCursor(15, 2); lcd.print("  "); digitalWrite(Ruehrwerk,aus);}
        if (relais[3] == 'P') {lcd.setCursor(17, 2); lcd.write(4); lcd.print(" "); digitalWrite(Pumpe,an);}
        else {lcd.setCursor(17, 2); lcd.print("  "); digitalWrite(Pumpe,aus);}
        if (relais[4] == 'A') {lcd.setCursor(19, 2); lcd.write(3); digitalWrite(Summer,an);}
        else {lcd.setCursor(19, 2); lcd.print(" "); digitalWrite(Summer,aus);}
        }        
      }    
    else if (digitalRead(Autoschalter)==HIGH)                                                                          // wenn Automatikschalter offen dann...
      {  
      lcd.setCursor(12, 1); 
      lcd.print(" manuell"); 
      lcd.setCursor(2, 3); 
      lcd.print(" --.-"); 
      if (digitalRead(Heizschalter)==HIGH) {lcd.setCursor(13, 2); lcd.print("  "); digitalWrite(Heizung,aus);}         // Relais entsprechend der Schalterstellungen schalten und auf Display ausgeben
      else {lcd.setCursor(13, 2); lcd.write(1); lcd.print(" "); digitalWrite(Heizung,an);}
      if (digitalRead(Ruehrschalter)==HIGH) {lcd.setCursor(15, 2); lcd.print("  "); digitalWrite(Ruehrwerk,aus);}
      else {lcd.setCursor(15, 2); lcd.write(2); lcd.print(" "); digitalWrite(Ruehrwerk,an);}
      if (digitalRead(Pumpschalter)==HIGH) {lcd.setCursor(17, 2); lcd.print("  "); digitalWrite(Pumpe,aus);}
      else {lcd.setCursor(17, 2); lcd.write(4); lcd.print(" "); digitalWrite(Pumpe,an);}
      if (digitalRead(Alarmschalter)==HIGH) {lcd.setCursor(19, 2); lcd.print(" "); digitalWrite(Summer,aus);}
      else {lcd.setCursor(19, 2); lcd.write(3); digitalWrite(Summer,an);}
      }
    }  
  goto BStart;                        // zurück zum Anfang des Hauptprogramms 
  BEnde:
  delay(1);
}

void temperaturmessungNTC()           // Glättungsroutine für NTC-Messung
{
  int c = 1;
  temperaturneu = 0;
  for (int c=1; c<=10; c++){delay(20); temperaturneu = temperaturneu + temp(analogRead(1));}
  temperaturneu= temperaturneu/10;
  if (temperaturalt-temperaturneu<2 and temperaturneu-temperaturalt<2) 
    {
    temperatur = temperaturneu*3 + temperaturalt*7;
    temperatur = temperatur / 10;
    }
  temperaturalt = temperaturneu;
}

float temp(int rawadc)
// Hilfsfunktion zur Umrechnung auf Grad Celsius
{
  int r1 = 10200; // Wert des festen Widerstandes des Spannungsteilers <- Hiermit kann der Sensor exakt abgeglichen werden
  int r2 = 10000; // Widerstand des Thermristors bei 25grad
  int b = 3990;  // Fixwert aus Datenblatt <- Hiermit kann der Sensor exakt abgeglichen werden
  float tn = 25; //Basistemperatur in Grad Celsius
  float r_akt; // Aktueller Widerstand
  float temp; //Temporäre Variable
  r_akt = rawadc;
  r_akt = 1023 / (1023-r_akt) -1;
  r_akt = r1 / r_akt;
  temp = r_akt / r2;
  temp = log(temp);
  temp /= b;
  temp += 1.0 / (tn + 273.15);
  temp = 1.0 / temp;
  temp -= 273.15;
  return temp;
}


float temperaturmessungDS18B20()            // Glättungsroutine für DS18B20-Messung
{
  temperaturneu = temp2();
  if (temperaturalt-temperaturneu<2 and temperaturneu-temperaturalt<2) 
    {
    temperatur = temperaturneu*2 + temperaturalt*8;
    temperatur = temperatur / 10;
    }
  temperaturalt = temperaturneu;
}

float temp2()
{  
  int HighByte, LowByte, TReading, SignBit, Tc_100, Whole, Fract;
  byte i;
  byte present = 0;
  byte data[12];
  byte addr[8];
  if ( !ds.search(addr))  {ds.search(addr);}  // Wenn keine weitere Adresse vorhanden, von vorne anfangen
  ds.reset();
  ds.select(addr);
  ds.write(0x44,1);         // start Konvertierung, mit power-on am Ende
  delay(750);               // 750ms sollten ausreichen
  present = ds.reset();
  ds.select(addr);    
  ds.write(0xBE);           // Wert lesen
  for ( i = 0; i < 9; i++) { data[i] = ds.read(); }
  LowByte = data[0];
  HighByte = data[1];
  TReading = (HighByte << 8) + LowByte;
  SignBit = TReading & 0x8000;  // test most sig bit
  if (SignBit)                  // negative
  {
    TReading = (TReading ^ 0xffff) + 1; // 2's comp
  }
  temperatur = TReading*0.0625;         // Für DS18S20  temperatur = TReading*0.5
  if (SignBit) // negative Werte ermitteln 
    { temperatur = temperatur * -1; }
  return temperatur;
}


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
// Beispiel: CHRpayTDK50.0k43.3c
// C=Stringstart / c=Stringende
// H=Heizung an / h=Heizung aus / R=Rührwerk an / r=Rührwer aus / P=Pumpe an / p=Pumpe aus / A=Alarm an / a=Alarm aus
// x=inaktiv / y=aktiv / z=pausiert
// T= Zu lange keine Änderung im Logfile
// D=DS18B20 / N=NTC10k / d=Display
// K50.0=Solltemperatur / k41.3=Isttemperatur

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

const boolean aus = LOW;                          // Hier kann bei Low-Aktiven Relaiskarten einfach High und Low vertauscht werden
const boolean an = HIGH;                            // Hier kann bei Low-Aktiven Relaiskarten einfach High und Low vertauscht werden

const int Heizung = 3;                             // Im folgenden sind die Pins der Sensoren und Aktoren festgelegt
const int Ruehrwerk = 15;
const int Pumpe = 16; 
const int Summer = 17; 

const int Heizschalter = 8;
const int Ruehrschalter = 9;
const int Pumpschalter = 5; 
const int Alarmschalter = 6; 
const int Autoschalter = 7; 

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
  lcd.print("  Braudisplay V2.0  ");
  lcd.setCursor(0, 2); 
  lcd.print("      by emilio     ");
  delay(2000);
  temperatur = temp2();               // Erste Temperaturerfassung
  Braudisplay();                      // Hauptprogramm starten
}

void Braudisplay()
{
  int offlinecounter= 0;
  int incomingByte = 0; 
  char sensor= 'D';                  // Als Startsensor ist der DS18B20 gesetzt ( 'd'=Display, 'N'=NTC10k )
  char received[20] = "";
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
  if (sensor=='D')                    // DS18B20-Messung starten und ausgeben
    {
    temperaturmessungDS18B20(); 
    lcd.setCursor(13, 3);
    if(temperatur>-10 & temperatur<0){lcd.print(" ");} else if(temperatur>=0 & temperatur<10){lcd.print("  ");} else if(temperatur>=10 & temperatur<100){lcd.print(" ");} 
    lcd.print(temperatur,1);
    Serial.println(temperatur,1);
    }  
  Serial.end();                        // Serieller Port für Isttemperaturübertragung schließen
  delay(200);                                              
  for (int schleife2=0; schleife2 <= 9; schleife2++)    // Schleife für Serielle Kommunikation
    {                                               
    Serial.begin(19200);                                // Serieller Port für Statusübertragung öffnen
    delay(210);
    lcd.setCursor(0, 1); 
    for (int schleife=0; schleife < 20; schleife++) { received[schleife]= ' ';}
    for (int schleife=0; schleife < Serial.available(); schleife++)
      {
      offlinecounter = 0;
      incomingByte = Serial.read(); 
      delay(10); 
      received[schleife]= incomingByte;
      }  
    Serial.end();                                       // Serieller Port für Statusübertragung schließen

    if ( offlinecounter!=10 ) {offlinecounter++;}
   
    if (digitalRead(Autoschalter)==LOW)                                                    // wenn Automatikschalter geschlossen dann...
      { 
      if ( offlinecounter==10 )                                                            // Wenn keinee serielle Verbindung besteht...
        {
        received[1]='h'; received[2]='r'; received[3]='p'; received[4]='a';
        lcd.setCursor(12, 1); 
        lcd.print(" offline");                        
        lcd.setCursor(2, 3);
        lcd.print(" --.-");                       
        }    
    
      if ((received[0]=='C') && (received[18]=='c'))                                       // Wenn serieller String vollständig...
        {
        if (( received[8] == 'K' ) && ( received[6] != 'T' ))                              // Wenn Zeichen K dann 4 Zeichen ausgeben ( Solltemperatur )
          {
          lcd.setCursor(2, 3); lcd.print(" "); 
          for (int schleife1=9; schleife1 < 13; schleife1++)
            {
            lcd.write(received[schleife1]);
            }
          }
        if ( received[13] == 'k' )                                                         // Wenn Zeichen k dann 4 Zeichen ausgeben ( Isttemperatur )  
          {
          lcd.setCursor(13, 3); lcd.print(" "); 
          for (int schleife1=14; schleife1 < 18; schleife1++)
            {
            lcd.write(received[schleife1]);
            }  
          } 

        if ( received[5] == 'x' ) {lcd.setCursor(12, 1); lcd.print(" inaktiv");}            // Brauerei Status ausgeben
        else if ( received[5] == 'y' ) {lcd.setCursor(12, 1); lcd.print("   aktiv");}
        else if ( received[5] == 'z' ) {lcd.setCursor(12, 1); lcd.print("pausiert");}  
        
        if ( received[6] == 'T' )                                                           
          {
          received[1]='h'; received[2]='r'; received[3]='p'; received[4]='a';
          lcd.setCursor(12, 1); 
          lcd.print("     aus");  
          lcd.setCursor(2, 3);
          lcd.print(" --.-");                           
          }
        }  

      if (((received[0]=='C') && (received[18]=='c')) || ( offlinecounter==10 ))
        {      
        if (received[1] == 'H') {lcd.setCursor(13, 2); lcd.write(1); lcd.print(" "); digitalWrite(Heizung,an);}        // Relais entsprechend der seriellen Daten schalten und auf Display ausgeben
        else {lcd.setCursor(13, 2); lcd.print("  "); digitalWrite(Heizung,aus);}
        if (received[2] == 'R') {lcd.setCursor(15, 2); lcd.write(2); lcd.print(" "); digitalWrite(Ruehrwerk,an);}
        else {lcd.setCursor(15, 2); lcd.print("  "); digitalWrite(Ruehrwerk,aus);}
        if (received[3] == 'P') {lcd.setCursor(17, 2); lcd.write(4); lcd.print(" "); digitalWrite(Pumpe,an);}
        else {lcd.setCursor(17, 2); lcd.print("  "); digitalWrite(Pumpe,aus);}
        if (received[4] == 'A') {lcd.setCursor(19, 2); lcd.write(3); digitalWrite(Summer,an);}
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

  if (((received[0]=='C') && (received[18]=='c')) && (received[7] == 'D' )) {sensor= 'D';}                               // Sensor Typ einstellen
  else if (((received[0]=='C') && (received[18]=='c')) && (received[7] == 'd' )) {sensor= 'd';}
  else if (((received[0]=='C') && (received[18]=='c')) && (received[7] == 'N' )) {sensor= 'N';}

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

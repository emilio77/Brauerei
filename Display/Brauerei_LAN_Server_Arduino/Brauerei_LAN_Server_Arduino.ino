// Pinbelegung:
// A0 : NTC Sernsor
// A1 : Rührwerk Relais
// A2 : Pumpe Relais
// A3 : Alarm Relais
// A4 : I²C (SDA)
// A5 : I²C (SCL)
// D0 : USB - Rx
// D1 : USB - Tx
// D2 : DS18B20 Sensor
// D3 : Heizung Relais
// D4 : Ethernet SS SD Control 
// D5 : Pumpenschalter
// D6 : Alarmschalter
// D7 : Automatikschalter
// D8 : Heizungsschalter
// D9 : Ruehrwerksschalter
// D10 : Ethernet SS Ethernet Control
// D11 : Ethernet MOSI
// D12 : Ethernet MISO
// D13 : Ethernet SCK

// Arduino lauscht auf Port 5000 nach UDP Strings
// Beschreibung des UDP Strings:
// UDP String ist immer 19stellig
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
#include <SPI.h>                // needed for Arduino versions later than 0018
#include <Ethernet.h>           // Kommt von Arduino IDE
#include <EthernetUdp.h>        // UDP library from: bjoern@cs.stanford.edu 12/30/2008

OneWire ds(2);                  // OneWireSensor an Pin 2

LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);  // LCD I2C Adresse einstellen, (addr, en,rw,rs,d4,d5,d6,d7,bl,blpol)
// ^ Kann sich je nach Display ändern ^
//   Pins für Display A4=SDA / A5=SCL

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };             // Arduino MAC Adresse
IPAddress IP(192, 168, 178, 222);                                // Arduino IP Adresse
IPAddress answerIP(192, 168, 178, 255);                          // IP Adresse an die geantwortet wird

EthernetServer server(80);                                       // Ethernet Server Port

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

int sensorPin = A0;                          // Sensor Pin für NTC10k

unsigned int localPort = 5000;               // UDP Port auf dem gelauscht wird

unsigned int answerPort = 5001;              // UDP Port für die Antwort

char packetBuffer[UDP_TX_PACKET_MAX_SIZE];   // buffer to hold incoming packet,
char  ReplyBuffer[] = "";                    // a string to send back

EthernetUDP Udp;

void setup() {
  lcd.begin(20, 4);               // initialize the lcd for 20 chars 4 lines and turn on backlight
  lcd.backlight();                // backlight on
  Ethernet.begin(mac, IP);
  Udp.begin(localPort);
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
  digitalWrite(Heizung, aus);         // Alle Relais aus
  digitalWrite(Summer, aus);
  digitalWrite(Ruehrwerk, aus);
  digitalWrite(Pumpe, aus);
  lcd.setCursor(0, 0);                // Startbildschirm
  lcd.print("      Brauerei      ");
  lcd.setCursor(0, 1);          
  lcd.print(" Arduino LAN Server ");
  lcd.setCursor(0, 2);
  lcd.print("       V01.00       ");
  lcd.setCursor(0, 3);
  lcd.print("     by emilio      ");
  delay(3000);
  temperatur = temp2();               // Erste Temperaturerfassung
  Braudisplay();                      // Hauptprogramm starten
}

void Braudisplay()
{
  int offlinecounter = 0;
  int incomingByte = 0;
  char sensor = 'D';                 // Als Startsensor ist der DS18B20 gesetzt ( 'd'=Display, 'N'=NTC10k )
  char received[24] = "";
  char tempchar[4];
  char sollchar[4] = "";
  char statechar = 'o';
  sollchar[1] = '-';
  sollchar[2] = '-';
  sollchar[3] = '.';
  sollchar[4] = '-';
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
  if (sensor == 'N')                  // NTC-Messung starten und ausgeben
  {
    temperaturmessungNTC();
    lcd.setCursor(13, 3);
    if (temperatur > -10 & temperatur < 0) {
      lcd.print(" ");
    } else if (temperatur >= 0 & temperatur < 10) {
      lcd.print("  ");
    } else if (temperatur >= 10 & temperatur < 100) {
      lcd.print(" ");
    }
    lcd.print(temperatur, 1);
    Udp.beginPacket(answerIP, answerPort);
    Udp.write('T' + temperatur + 't');
    Udp.endPacket();
    delay(1000);
  }
  if (sensor == 'D')                  // DS18B20-Messung starten und ausgeben
  {
    temperaturmessungDS18B20();
    lcd.setCursor(13, 3);
    if (temperatur > -10 & temperatur < 0) {
      lcd.print(" ");
    } else if (temperatur >= 0 & temperatur < 10) {
      lcd.print("  ");
    } else if (temperatur >= 10 & temperatur < 100) {
      lcd.print(" ");
    }
    lcd.print(temperatur, 1);
    dtostrf(temperatur, 3, 1, tempchar);
    Udp.beginPacket(answerIP, answerPort);
    Udp.write('T');
    for (int i = 0; i < sizeof(tempchar); i++) {
      Udp.write(tempchar[i]);
    }
    Udp.write('t');
    Udp.endPacket();
  }
  delay(200);

  for (int schleife2 = 0; schleife2 <= 9; schleife2++)  // Schleife für UDP Kommunikation
  {
    delay(210);
    lcd.setCursor(0, 1);

    for (int schleife = 0; schleife < 23; schleife++) {
      received[schleife] = ' ';
    }
    int packetSize = Udp.parsePacket();
    if (packetSize)
    {
      // read the packet into packetBufffer
      Udp.read(packetBuffer, UDP_TX_PACKET_MAX_SIZE);
      for (int schleife = 0; schleife < 23; schleife++) {
        received[schleife] = packetBuffer[schleife];
      }
      offlinecounter = 0;
    }

    if ( offlinecounter != 10 ) {
      offlinecounter++;
    }

    if (digitalRead(Autoschalter) == LOW)                                                  // wenn Automatikschalter geschlossen dann...
    {
      if ( offlinecounter == 10 )                                                          // Wenn keinee serielle Verbindung besteht...
      {
        received[1] = 'h'; received[2] = 'r'; received[3] = 'p'; received[4] = 'a';
        lcd.setCursor(12, 1);
        lcd.print(" offline");
        lcd.setCursor(2, 3);
        lcd.print(" --.-");
        sollchar[1] = '-';
        sollchar[2] = '-';
        sollchar[3] = '.';
        sollchar[4] = '-';
        statechar='o';
      }

      if ((received[0] == 'C') && (received[18] == 'c'))                                   // Wenn serieller String vollständig...
      {
        if (( received[8] == 'K' ) && ( received[6] != 'T' ))                              // Wenn Zeichen K dann 4 Zeichen ausgeben ( Solltemperatur )
        {
          lcd.setCursor(2, 3); lcd.print(" ");
          for (int schleife1 = 9; schleife1 < 13; schleife1++)
          {
            lcd.write(received[schleife1]);
            sollchar[schleife1 - 8] = (received[schleife1]);
          }
        }
        if ( received[13] == 'k' )                                                         // Wenn Zeichen k dann 4 Zeichen ausgeben ( Isttemperatur )
        {
          lcd.setCursor(13, 3); lcd.print(" ");
          for (int schleife1 = 14; schleife1 < 18; schleife1++)
          {
            lcd.write(received[schleife1]);
          }
        }

        if ( received[5] == 'x' ) {
          lcd.setCursor(12, 1);  // Brauerei Status ausgeben
          lcd.print(" inaktiv");
          statechar='i';
        }
        else if ( received[5] == 'y' ) {
          lcd.setCursor(12, 1);
          lcd.print("   aktiv");
          statechar='a';
        }
        else if ( received[5] == 'z' ) {
          lcd.setCursor(12, 1);
          lcd.print("pausiert");
          statechar='p';
        }

        if ( received[6] == 'T' )
        {
          received[1] = 'h'; received[2] = 'r'; received[3] = 'p'; received[4] = 'a';
          lcd.setCursor(12, 1);
          lcd.print("     aus");
          lcd.setCursor(2, 3);
          lcd.print(" --.-");
          sollchar[1] = '-';
          sollchar[2] = '-';
          sollchar[3] = '.';
          sollchar[4] = '-';
          statechar='A';
        }
      }

      if (((received[0] == 'C') && (received[18] == 'c')) || ( offlinecounter == 10 ))
      {
        if (received[1] == 'H') {
          lcd.setCursor(13, 2);  // Relais entsprechend der seriellen Daten schalten und auf Display ausgeben
          lcd.write(1);
          lcd.print(" ");
          digitalWrite(Heizung, an);
        }
        else {
          lcd.setCursor(13, 2);
          lcd.print("  ");
          digitalWrite(Heizung, aus);
        }
        if (received[2] == 'R') {
          lcd.setCursor(15, 2);
          lcd.write(2);
          lcd.print(" ");
          digitalWrite(Ruehrwerk, an);
        }
        else {
          lcd.setCursor(15, 2);
          lcd.print("  ");
          digitalWrite(Ruehrwerk, aus);
        }
        if (received[3] == 'P') {
          lcd.setCursor(17, 2);
          lcd.write(4);
          lcd.print(" ");
          digitalWrite(Pumpe, an);
        }
        else {
          lcd.setCursor(17, 2);
          lcd.print("  ");
          digitalWrite(Pumpe, aus);
        }
        if (received[4] == 'A') {
          lcd.setCursor(19, 2);
          lcd.write(3);
          digitalWrite(Summer, an);
        }
        else {
          lcd.setCursor(19, 2);
          lcd.print(" ");
          digitalWrite(Summer, aus);
        }
      }
    }

    else if (digitalRead(Autoschalter) == HIGH)                                                                        // wenn Automatikschalter offen dann...
    {
      lcd.setCursor(12, 1);
      lcd.print(" manuell");
      statechar='m';
      lcd.setCursor(2, 3);
      lcd.print(" --.-");
      if (digitalRead(Heizschalter) == HIGH) {
        lcd.setCursor(13, 2);  // Relais entsprechend der Schalterstellungen schalten und auf Display ausgeben
        lcd.print("  ");
        digitalWrite(Heizung, aus);
      }
      else {
        lcd.setCursor(13, 2);
        lcd.write(1);
        lcd.print(" ");
        digitalWrite(Heizung, an);
      }
      if (digitalRead(Ruehrschalter) == HIGH) {
        lcd.setCursor(15, 2);
        lcd.print("  ");
        digitalWrite(Ruehrwerk, aus);
      }
      else {
        lcd.setCursor(15, 2);
        lcd.write(2);
        lcd.print(" ");
        digitalWrite(Ruehrwerk, an);
      }
      if (digitalRead(Pumpschalter) == HIGH) {
        lcd.setCursor(17, 2);
        lcd.print("  ");
        digitalWrite(Pumpe, aus);
      }
      else {
        lcd.setCursor(17, 2);
        lcd.write(4);
        lcd.print(" ");
        digitalWrite(Pumpe, an);
      }
      if (digitalRead(Alarmschalter) == HIGH) {
        lcd.setCursor(19, 2);
        lcd.print(" ");
        digitalWrite(Summer, aus);
      }
      else {
        lcd.setCursor(19, 2);
        lcd.write(3);
        digitalWrite(Summer, an);
      }
    }
  
    if (((received[0] == 'C') && (received[18] == 'c')) && (received[7] == 'D' )) {
      sensor = 'D'; // Sensor Typ einstellen
    }
    else if (((received[0] == 'C') && (received[18] == 'c')) && (received[7] == 'd' )) {
      sensor = 'd';
    }
    else if (((received[0] == 'C') && (received[18] == 'c')) && (received[7] == 'N' )) {
      sensor = 'N';
    }
    
  }

  EthernetClient client = server.available();        // WEB-Server für Brauerei
  if (client) {
    boolean currentLineIsBlank = true;
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
        if (c == '\n' && currentLineIsBlank) {
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: text/html");
          client.println("Connection: close");         // the connection will be closed after completion of the response
          client.println("Refresh: 5");                // refresh the page automatically every 5 sec
          client.println();
          client.println("<!DOCTYPE HTML>");
          client.print("<html>");
          client.print("<head>");
          client.print("<title>");
          client.print("Brauerei-Arduino-LAN-Server via HTML");
          client.println("</title>");
          client.println("</head>");
          client.print("<body>");
          client.println("<u><h1>Brauerei-Arduino-LAN-Server</h1></u>");
          client.print("<table cellpadding=10 border=3 frame=void>");
          client.print("<tr>");
          client.print("<td><h2>Brauereistatus:</h2></td>");
          if (statechar=='o') {client.print("<td><h2>OFFLINE</h2></td>");}        
          if (statechar=='A') {client.print("<td><h2>AUS</h2></td>");}
          if (statechar=='i') {client.print("<td><h2>INAKTIV</h2></td>");}
          if (statechar=='a') {client.print("<td><h2>AKTIV</h2></td>");}
          if (statechar=='p') {client.print("<td><h2>PAUSIERT</h2></td>");}
          if (statechar=='m') {client.print("<td><h2>MANUELL</h2></td>");}
          client.println("</tr>");
          client.print("<tr>");
          client.print("<td><h2>Ist-Temperatur:</h2></td>");
          client.print("<td><h2>Soll-Temperatur:</h2></td>");
          client.println("</tr>");
          client.print("<tr>");
          client.print("<td>"); client.print(temperatur, 1); client.print(" "); client.print("&#186;"); client.print("C</td>");
          client.print("<td>"); client.print(sollchar[1]); client.print(sollchar[2]); client.print(sollchar[3]); client.print(sollchar[4]); client.print(" "); client.print("&#186;"); client.print("C</td>");
          client.println("</tr>");
          client.print("<tr>");
          client.print("<td>&#160;</td>");
          client.print("<td>&#160;</td>");
          client.println("</tr>");
          client.print("<tr>");
          client.print("<td><h2>Relaisstellungen:</h2></td>");
          client.print("<td>&#160;</td>");
          client.println("</tr>");
          client.print("<tr>");
          client.print("<td>Heizungsrelais</td>");
          if (digitalRead(Heizung) == an) {
            client.print("<td><b><font color=#00B200>AN</font></b></td>");
          }
          if (digitalRead(Heizung) == aus) {
            client.print("<td><b><font color=#FF0000>AUS</font></b></td>");
          }
          client.println("</tr>");
          client.print("<tr>");
          client.print("<td>R"); client.print("&#252;"); client.print("hrwerksrelais</td>");
          if (digitalRead(Ruehrwerk) == an) {
            client.print("<td><b><font color=#00B200>AN</font></b></td>");
          }
          if (digitalRead(Ruehrwerk) == aus) {
            client.print("<td><b><font color=#FF0000>AUS</font></b></td>");
          }
          client.println("</tr>");
          client.print("<tr>");
          client.print("<td>Pumpenrelais</td>");
          if (digitalRead(Pumpe) == an) {
            client.print("<td><b><font color=#00B200>AN</font></b></td>");
          }
          if (digitalRead(Pumpe) == aus) {
            client.print("<td><b><font color=#FF0000>AUS</font></b></td>");
          }
          client.println("</tr>");
          client.print("<tr>");
          client.print("<td>Alarmrelais</td>");
          if (digitalRead(Summer) == an) {
            client.print("<td><b><font color=#00B200>AN</font></b></td>");
          }
          if (digitalRead(Summer) == aus) {
            client.print("<td><b><font color=#FF0000>AUS</font></b></td>");
          }
          client.println("</tr>");
          client.print("<tr>");
          client.print("<td>&#160;</td>");
          client.print("<td>&#160;</td>");
          client.println("</tr>");
          client.print("<tr>");
          client.print("<td><h2>Sensortyp:</h2></td>");
          if (sensor == 'd') {
            client.print("<td><h2>Display</h2></td>");
          }
          if (sensor == 'D') {
            client.print("<td><h2>DS18B20</h2></td>");
          }
          if (sensor == 'N') {
            client.print("<td><h2>NTC10k</h2></td>");
          }
          client.println("</tr>");
          client.println("</table>");
          client.println("</body>");
          client.println("</html>");
          break;
        }
        if (c == '\n') {
          currentLineIsBlank = true;
        }
        else if (c != '\r') {
          currentLineIsBlank = false;
        }
      }
    }
    delay(1);
    client.stop();
  }
  goto BStart;                        // zurück zum Anfang des Hauptprogramms

BEnde:
  delay(1);
}

void temperaturmessungNTC()           // Glättungsroutine für NTC-Messung
{
  int c = 1;
  temperaturneu = 0;
  for (int c = 1; c <= 10; c++) {
    delay(20);
    temperaturneu = temperaturneu + temp(analogRead(0));
  }
  temperaturneu = temperaturneu / 10;
  if (temperaturalt - temperaturneu < 2 and temperaturneu - temperaturalt < 2)
  {
    temperatur = temperaturneu * 3 + temperaturalt * 7;
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
  r_akt = 1023 / (1023 - r_akt) - 1;
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
  if (temperaturalt - temperaturneu < 2 and temperaturneu - temperaturalt < 2)
  {
    temperatur = temperaturneu * 2 + temperaturalt * 8;
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
  if ( !ds.search(addr))  {
    ds.search(addr); // Wenn keine weitere Adresse vorhanden, von vorne anfangen
  }
  ds.reset();
  ds.select(addr);
  ds.write(0x44, 1);        // start Konvertierung, mit power-on am Ende
  delay(750);               // 750ms sollten ausreichen
  present = ds.reset();
  ds.select(addr);
  ds.write(0xBE);           // Wert lesen
  for ( i = 0; i < 9; i++) {
    data[i] = ds.read();
  }
  LowByte = data[0];
  HighByte = data[1];
  TReading = (HighByte << 8) + LowByte;
  SignBit = TReading & 0x8000;  // test most sig bit
  if (SignBit)                  // negative
  {
    TReading = (TReading ^ 0xffff) + 1; // 2's comp
  }
  temperatur = TReading * 0.0625;       // Für DS18S20  temperatur = TReading*0.5
  if (SignBit) // negative Werte ermitteln
  {
    temperatur = temperatur * -1;
  }
  return temperatur;
}

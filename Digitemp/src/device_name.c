/* -----------------------------------------------------------------------
   DigiTemp v2.4
      
   Copyright 1996-2001 by Brian C. Lane <bcl@brianlane.com>
   All Rights Reserved

   ----------------------------------------------------------------------- */


/* Return the family name passed to it */
char *device_name( unsigned int family )
{
  switch( family )
  {
    case 0x01:
      return "DS2401/DS1990A Serial Number iButton";
      
    case 0x05:
      return "DS2405 Addressable Switch";
  
    case 0x09:
      return "DS2502 1Kbit Add only memory";
  
    case 0x10:
      return "DS1820 Temperature Sensor";
    
    case 0x12:
      return "DS2406/2407 Dual Addressable Switch + 1Kbit memory";
    
    case 0x14:
      return "DS1971 256bit EEPROM iButton";
    
    case 0x18:
      return "DS1963S SHA iButton";
      
    case 0x1A:
      return "DS1963L 4kBit MONETARYiButton";
      
    case 0x1C:
      return "DS2422 1Kbit RAM + Counter";
      
    case 0x1D:
      return "DS2423 4Kbit RAM + Counter";
      
    case 0x1F:
      return "DS2409 MicroLAN Coupler";
      
    case 0x20:
      return "DS2450 Quad A/D Converter";
      
    case 0x21:
      return "DS1921 Thermochron iButton";
      
    case 0x22:
      return "DS1822 Temperature Sensor";
      
    case 0x28:
      return "DS18B20 Temperature Sensor";
      
    case 0x82:
      return "DS1425 Multi iButton";
      
    case 0x84:
      return "DS1427 TIME iButton";
      
    case 0x89:
      return "DS2502/1982 1024bit UniqueWare Add Only Memory";
    
    case 0x8B:
      return "DS2505/1985 16Kbit UniqueWare Add Only Memory";
      
    case 0x8F:
      return "DS2506/1986 64Kbit UniqueWare Add Only Memory";
  
    default:
      return "Unknown Family Code";
  }
}

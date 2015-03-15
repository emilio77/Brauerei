/* -----------------------------------------------------------------------
   Low Level Dallas Semiconductor onewire interface software
   For use with the DS9097 style adapter (4 diodes and a resistor). Not
   with the 9097-U which uses a DS2480 interface chip.
   
   Copyright (c) 1996-2002 Brian C. Lane <bcl@brianlane.com>
   All rights reserved.
   http://www.brianlane.com/digitemp.php

   =======================================================================
   03/17/2002   Trying to speed up serial operation. Instead of sending
   bcl          things 1 byte at a time, there are cases where a whole
                string of bytes could be output at once, eg. the Match
                ROM command. Doesn't work, the read scratchpad checksum
                fails. I need an O'Scope to see what is going on.

   03/12/2002   Moving other 1-wire Lan routines into this file from the
   bcl          ds1820.c file -- they aren't 1820 specific, that code is
                all in the main digitemp.c file.

   03/10/2002   Porting to Windows. 
   bcl
   
   -----------------------------------------------------------------------*/
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <windows.h>
#include "digitemp.h"
#include "comport.h"
#include "onewire.h"
#include "ownet.h"

extern int debug;                         /* Debugging level */


/* ----------------------------------------------------------------------- *
   Setup - Setup the tty for 115.2k operation

   Returns 1 if it went OK
   returns 0 if it failed
 * ----------------------------------------------------------------------- */
int Setup( HANDLE *hCom, int port )
{

  /* Open the COM port */
  if( !ComOpen( hCom, port, 115200, 8, 'N', 1, 1500, 1300 ) )
  {
    *hCom = INVALID_HANDLE_VALUE;
    return 0;
  }

  return 1;
}


/* ----------------------------------------------------------------------- *
   Reset the One Wire device and look for a presence pulse from it
   
   returns:     0 - No Presence/device detected
                1 - Presence Detected no alarm
                2 - Alarm followed by pressence
                3 - Short to Ground
                4 - Serial device error

   This expects the device to already be opened and pass the fd of it
   
 * ----------------------------------------------------------------------- */
int TouchReset( HANDLE *hCom )
{
   unsigned char byte;
   int ret, stat;

   /* Change to baudrate to 9600 generate a long enough pulse */
   if (!SetCom(hCom, 9600, 8, 'N', 1, 3000, 3000))
   {
      return -1;
   }

   /* Generate a pulse, high for 4 bits, low for 4 bits (with start/stop) */
   byte = 0xf0;
   PurgeComm( hCom, PURGE_RXCLEAR );            /* Purge the receive buffer */
   ComWriteStr(hCom, (char *)&byte, 1);

   ret = ComReadStr(hCom, (char*)&byte, 1);

   /* Check the response */
   if( byte == 0 )
   {
     stat = 3;                       /* Shorted to Ground */
   } else if( byte != 0xF0 ) {
     stat = 1;                       /* Got a response of some type  */
   } else {
     stat = 0;                       /* No device responding         */
   }

   /* Return the baudrate to 115.2kbps (500,500)*/
   if (!SetCom(hCom, 115200, 8, 'N', 1, 50, 50))
   {
      return -1;
   }
   
   return  stat;
}


/* ----------------------------------------------------------------------- *
   TouchBits - Read/Write a number of bits to the TouchMemory device

   Expects that the tty is set up for 115.2k operation
   
   returns the read byte if one received
   Returns -1 if the write failed
   Returns a -2 if the read failed
 * ----------------------------------------------------------------------- */
int TouchBits( HANDLE *hCom, int nbits, unsigned char outch  )
{
   unsigned char mask,
                 inv,
                 byte;
   int           i;

   mask = 0x01;
   inv = 0;

   PurgeComm( hCom, PURGE_RXCLEAR );            /* Purge the receive buffer */

   /* we write a *byte* so the device can see a *bit* */
   for (i = 0; i < nbits; ++i)
   {
      /* Write a 0xff for a 1 bit and 0x00 for a zero bit */
      byte = (outch & mask) ? 0xff : 0x00;
      if (ComWriteStr(hCom, (char*)&byte, 1) != 1)
      {
        return -1;
      }

      if (ComReadStr(hCom, (char*)&byte, 1) != 1)
      {
         return -2;
      }
      
      inv |= (byte & 0x01) ? mask : 0;
      mask <<= 1;
   }

   return inv;
}


/* ----------------------------------------------------------------------- *
   TouchByte - Read/Write a byte to the TouchMemory device

   Expects that the tty is set up for 115.2k operation
   
   returns the read byte if one received
 * ----------------------------------------------------------------------- */
int TouchByte( HANDLE *hCom, unsigned char outch  )
{
  return TouchBits( hCom, 8, outch );
}


/* ----------------------------------------------------------------------- *
   TouchBlock - Write/Read a block of data to the 1-wire bus

   Read data is returned in the buffer
 * ----------------------------------------------------------------------- */
int TouchBlock( HANDLE *hCom, unsigned char *buf, int len )
{
  int i;

  for( i = 0; i < len; i++, buf++ )
  {
   *buf = TouchByte( hCom, *buf );
  }

  return 1;
}


#ifdef DONT_USE
/* ----------------------------------------------------------------------- *
   DOESNT WORK RIGHT NOW
     This is an idea, but it doesn't work. I really need an O'Scope to see
     what is happening on the bus
   DOESNT WORK RIGHT NOW

   TouchFastBlock - Write a block of data to the 1-wire bus

   No reading is done. This is used for commands that don't need to read
   anything.

   We put together all the bits to be sent in one big string (8*len) and
   then send that instead of single bit read/write. This can also be used
   to send single bytes that need no response (like start temperature)
 * ----------------------------------------------------------------------- */
int TouchFastBlock( HANDLE *hCom, unsigned char *buf, int len )
{

   unsigned char mask,
                 *tBuf;
   int           i,
                 j;

  /* Creat a buffer for all the output bits */
  if( ( tBuf = malloc( len * 8 ) ) == NULL )
  {
    fprintf( stderr, "Error allocating memory for TouchFastBlock\n");
    return 0;
  }

  /* Build the string */
  for( i = 0; i < len; i++, buf++ )
  {
    mask = 0x01;

    /* we write a *byte* so the device can see a *bit* */
    for (j = 0; j < 8; j++, mask <<= 1)
    {
      /* Write a 0xff for a 1 bit and 0x00 for a zero bit */
      tBuf[(i*8)+j] = (*buf & mask) ? 0xff : 0x00;
    }
  }

  /* Send the whole thing */
  if (ComWriteStr(hCom, tBuf, len*8) != len*8)
  {
    free(tBuf);
    return 0;
  }

  /* Wait for all the characters to be transmitted */
  WaitCommEvent( hCom, EV_TXEMPTY, NULL );

  free(tBuf);
  return 1;
}
#endif /* DONT_USE */

/* ----------------------------------------------------------------------- *
   Send a Match ROM command to the indicated OneWire device
   
   Returns -1 if an error occurrs

 * ----------------------------------------------------------------------- */
int MatchROM( HANDLE *hCom, unsigned char *TempSN )
{
  int   x;
  unsigned char command[9];
    
  if( ( TouchReset( hCom ) ) < 0 )
  {
    fprintf( stderr, "Error initalizing OneWire device\n");
    return -1;
  }

#ifdef DONT_USE
/* This code is for the experimental TouchFastBlock */
  command[0] = 0x55;
  for( x=0; x <8; x++ )
  {
    command[x+1] = TempSN[x];
  }
  /* Send the command */
  return TouchFastBlock( hCom, &command, 9 );
#endif /* DONT_USE */

//#ifdef DONT_USE
  if( TouchByte( hCom, 0x55 ) < 0 )
  {
    fprintf( stderr, "Error issuing Match ROM command\n");
    return -1;
  }

  for( x = 0; x < 8; x++ )
  {
    if( TouchByte( hCom, TempSN[x] ) < 0 )
    {
      fprintf( stderr, "MatchROM error writing byte %d\n", x );
      return -1;
    }
  }
//#endif

  return 0;

}


/* ----------------------------------------------------------------------- *
   Read the Scratchpad from a selected device
   
   It assumes that the device has already been selected by using a ROM
   match or skip ROM command.

 * ----------------------------------------------------------------------- */
int ReadScratchpad( HANDLE hCom, unsigned char *scpad )
{
  int   x, byte;

  if( TouchByte( hCom, 0xBE ) < 0 )
  {
    fprintf( stderr, "Error issuing Read Scratchpad command\n");
    return -1;
  }
    
  for( x = 0; x < 9; x++ )
  {

    if( ( byte = TouchByte( hCom, 0xFF ) ) < 0 )
    {
      fprintf( stderr, "Error reading byte %d of scratchpad\n", x );
      return -1;
    }
    scpad[x] = (unsigned char) byte;
  }

  if( ( TouchReset( hCom ) ) < 0 )
  {
    fprintf( stderr, "Error initalizing OneWire device\n");
    return -1;
  }

  return 0;
}


/* ----------------------------------------------------------------------- *
   Write Temperature high and low limits
 * ----------------------------------------------------------------------- */
int WriteLimits( HANDLE hCom, int tl, int th )
{
  
  if( TouchByte( hCom, 0x4E ) < 0 )
  {
    fprintf( stderr, "Error writing to scratchpad\n");
    return -1;
  }
  
  if( TouchByte( hCom, th ) < 0 )
  {
    fprintf( stderr, "Error writing TH limit\n");
    return -1;
  }
  
  if( TouchByte( hCom, tl ) < 0 )
  {
    fprintf( stderr, "Error writing TL limit\n");
    return -1;
  }

  if( ( TouchReset( hCom ) ) < 0 )
  {
    fprintf( stderr, "Error initalizing OneWire device\n");
    return -1;
  }
  
  return 0;
}

    
/* ----------------------------------------------------------------------- *
   ReadTemperature - Do a Temperature conversion
   
   Commands DS1820 to do a temperature conversion and then sleeps for 1
   second to make sure it has completed, and then does a master reset.

   Assumes that the device has been previously selected.
 * ----------------------------------------------------------------------- */
int ReadTemperature( HANDLE hCom, int read_time )
{
  if( TouchByte( hCom, 0x44 ) < 0 )
  {
    fprintf( stderr, "Error issuing Read Temperature command\n");
    return -1;
  }

  msDelay( read_time );

//  if( ( TouchReset( hCom ) ) < 0 )
//  {
//    fprintf( stderr, "Error initalizing OneWire device\n");
//    return -1;
//  }

  return 0;
}


/* ----------------------------------------------------------------------- *
   Skip ROM command
   
   This function resets the TouchMemory device and sends a skip ROM
   command. This is only useful if there is one device connected to the
   bus.
 * ----------------------------------------------------------------------- */
int SkipROM( HANDLE *hCom )
{
  if( ( TouchReset( hCom ) ) < 0 )
  {
    fprintf( stderr, "Error initalizing OneWire device\n");
    return -1;
  }
  
  if( TouchByte( hCom, 0xCC ) < 0 )
  {
    fprintf( stderr, "Error issuing Skip ROM command\n");
    return -1;
  }
  
  return 0;
}


/* ----------------------------------------------------------------------- *
   Read the ROM number of the single connected device
 * ----------------------------------------------------------------------- */
int ReadROM( HANDLE hCom )
{
  int x;
  
  if( ( TouchReset( hCom ) ) < 0 )
  {
    fprintf( stderr, "Error initalizing OneWire device\n");
    return -1;
  }

  if( TouchByte( hCom, 0x33 ) < 0 )
  {
    fprintf( stderr, "Error issuing Read ROM command\n");
    return -1;
  }
  
  printf("ROM #");
  for( x = 0; x < 8; x++ )
  {
    printf("%02X", TouchByte( hCom, 0xFF ) );
  }
  printf("\n");  

  return 0;
}


/* ----------------------------------------------------------------------- *
   SearchROM - Find attached devices

   Find all main bus devices, doesn't go down any branches   
 * ----------------------------------------------------------------------- */
int SearchROM( HANDLE *hCom, struct _roms *rom_list )
{
   unsigned char tempSN[8];
   int x, NumDevices = 0;
   short result;

   /* Free any allocated ROM memory */
   if( rom_list->roms != NULL )
     free( rom_list->roms );
   rom_list->roms = NULL;
   rom_list->max = 0;


   printf("Searching: ");
   fflush(stdout);

   /* Find the first, resetting the bus first */
   result = owFirst(hCom, TRUE, FALSE);

   while(result)
   {
      /* Get the serial number found */
      owSerialNum(tempSN, TRUE);

      /* 08/31/98 bcl -- Check for DS1820 family 0x10 */
      if( (tempSN[0] == DS1820_FAMILY) ||
          (tempSN[0] == DS1822_FAMILY) ||
          (tempSN[0] == DS18B20_FAMILY)
        )
      {
        rom_list->max++;                        /* One more ROM         */

        if( ( rom_list->roms = realloc( rom_list->roms, rom_list->max * 8 ) ) == NULL )
        {
          fprintf( stderr, "Error allocating memory for serial #\n");
          return -1;
        } 

        /* Move the rom buffer into its final location in rom_list */
        for( x = 0; x < 8; x++ )
        {
          rom_list->roms[(NumDevices*8) + x] = tempSN[x];
        }

        NumDevices++;
        printf("%d ", NumDevices );
        fflush( stdout );
      }
      
      /* Get the next device */
      result = owNext(hCom, TRUE, FALSE);
   }
   printf("\n");
   return NumDevices;
}



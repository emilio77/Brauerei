/* -----------------------------------------------------------------------
   Low Level Dallas 1-Wire Lan interface software

   Copyright (c) 1996-2002 Brian C. Lane <bcl@brianlane.com>
   All rights reserved.
   http://www.brianlane.com/digitemp.php
   -----------------------------------------------------------------------*/
int Setup( HANDLE *, int );
int TouchReset( HANDLE * );
int TouchBits( HANDLE *, int, unsigned char );
int TouchByte( HANDLE *, unsigned char );
int TouchBlock( HANDLE *, unsigned char *, int );
int MatchROM( HANDLE *, unsigned char * );
int ReadScratchpad( HANDLE *, unsigned char * );
int ReadTemperature( HANDLE *, int );
int SkipROM( HANDLE * );
int ReadROM( HANDLE * );
int SearchROM( HANDLE *, struct _roms * );

struct _roms {
        unsigned char   *roms;                  /* Array of 8 bytes     */
        int             max;                    /* Maximum number       */
};


#define DS1820_FAMILY  0x10
#define DS1822_FAMILY  0x20
#define DS18B20_FAMILY 0x28


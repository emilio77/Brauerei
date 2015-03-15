/* -----------------------------------------------------------------------
   DigiTemp v2.5 for Windows
      
   Copyright 1996-2002 by Brian C. Lane <bcl@brianlane.com>
   All Rights Reserved
   http://www.brianlane.com/digitemp.php

     digitemp -w                        Walk the LAN & show all
     digitemp -i                        Initalize .digitemprc file
     digitemp -s/dev/ttyS0              Set serial port (required)
     digitemp -cdigitemp.conf           Configuration File
     digitemp -r1000                    Set Read timeout to 1000mS
     digitemp -l/var/log/temperature    Send output to logfile
     digitemp -v                        Verbose mode
     digitemp -t0                       Read Temperature
     digitemp -q                        Quiet, no copyright banner
     digitemp -a                        Read all Temperatures
     digitemp -d5                       Delay between samples (in sec.)
     digitemp -n50                      Number of times to repeat
     digitemp -o1                       Output format for logfile
                                        See description below
     digitemp -o"output format string"  See description below

     Logfile formats:
     1 = (default) - 1 line per sensor, time, C, F
         1 line for each sample, elapsed time, sensor #1, #2, ... tab seperated
     2 = Reading in C
     3 = Reading in F
     The format string uses strftime tokens plus 3 special
     ones for digitemp - %s for sensor #, %C for centigrage,
     %F for fahrenheight the case of the token is important!

   =======================================================================
   04/09/2002   The DS1822 family code in digitemp.h was wrong! How I
                managed to do that I dunno. It is really 0x22, not 0x20
                which is actually a quad a/d family code.

   04/05/2002   Changing version number and working on 18B20 problems.

   04/04/2002   Problems reported with it running only once, so the 1200
   bcl          baud fix doesn't work for everyone. I have generated new
                versions with 300bps, no break at all and break incl.
                again. The nobreak version doesn't work at all for me
                and the 300bps version sometimes works and other times
                doesn't work.

   04/01/2002   Thanks to Dave Smiczek at Dallas for the new BreakCom
   bcl          subroutine. It looks like break doesn't work when running
                Win98 in VMware. but slowing down to 1200bps and sending
                a 0 work to reset things.

                Remaining problems:
                1. Missing temperature sensors.
                1b. Missing iButton
                These were due to the wrong smart_main setting in the
                owBranchNext routine, it should be set to a 4 instead of
                a 1 (1 only finds the first device on main not all).
                
                2. Test everything
                3. Create Demo version and release version

                Reading an RC file doesn't handle 0 sensors on the main
                lan, tries to allocate memory for 0 sensors and dies.
                This is a bug in linux and console-v1.7 code too.
                Scratchpad offsets in read temp needed to be changed.                                               

                sensor_list isn't being cleared correctly on startup.
               
   03/28/2002   Doesn't find all the temperature sensors.
   bcl          Leaves the adapter in a state where it needs to be
                unplugged before digitemp can be run again.
                Still has these problems, even after integrating the v1.7
                search improvements that I made.
                Its not finding the sensor on the main bus, and only sees
                1 of the sensors on my 'attic' wire run.
                It sees the weather station ok.
                

   03/27/2002   Porting to windows, combining with passive adapter code.
                Calling this v3.0
                There is some small chance that I will be able to merge
                the Linux and Windows code into a single tree by v3.1
                

   01/15/2002   Cleaning up, preparing for release

   01/14/2002   Adding support for reading sensors on DS2409 couplers.

   01/13/2002   Walking the tree now works -- after changing the swt1f.c
                routine to use the Smart-On Main command while searching
                for devices (otherwise it only finds the first).
                
                Adding support for Coupler to the main program.
                Init now works, writing .digitemprc now works.
                Read .digitemprc appears to work.
                Need to add reading of specified sensors and of all
                sensors.
                

   01/12/2002   Adding a diagnostic walk of the attached network, working
                on DS2409 MicroLAN Coupler support.
                Added release1WireNet calls before all exit calls.
                Switching to the userial library v3.0.0, I seem to have
                run into a problem with the old library and I cannot read
                either of my DS9097U adapters with v2.2 digitemp code.
                

   05/26/2001   The 18B20 and 1822 patch didn't work. It was reading the
                wrong scratchpad registers. (2,1 instead of 1,0).
                Changed version to v2.2

   03/16/2001   Integrating the AIX patch from Ewan Leith
                <ejl@man.fraser-williams.com>
                It amounts to return value checking on getopt and changes
                in the wirelnk.c file.
                Adding DS1822 and DS18B20 changes from Roland Roberts
                <roland@astrofoto.org>

   03/05/2001   Adding a command line option to specify the configuration
                file to use. -c config_file will override the default of
                .digitemprc

   02/17/2001   If there is an error with strong pullup on/off it shouldn't
                abort the conversion! Just log an error to stderr.

   01/31/2001   Added a dummy temperature output when a sensor cannot be
                read. It outputs a 0 so that scripts like my grapher 
                don't get confused and log the wrong sensor in the wrong
                place.
                
                An error message is also output to stderr.

   01/29/2001   Oops. It seems that I missed the line in the DS1820 
                datasheet that says Vdd needs to be tied to GND for
                Parasite power to work correctly.
                Various curses come to mind.
                The DS1820 works better than the DS18S20 with Vdd floating
                but this probably explains the infrequent glitches I
                saw before adding the DS18S20s.

   01/15/2001   Still getting glitches.
                Adding a reset and delay before retry

   01/14/2001   Changed Version number to 2.1
   
                I now have 2 DS18S20 sensors which supposedly fix the
                Temperature accuracy problems of the DS1820 (see the
                ds1820-report.pdf from Dallas). But now I get a huge
                number of glitches in the DS18S20's readings.
                The DS18S20 has an error condition, but it is +85C and
                the glitches I am seeing are because DigiTemp doesn't
                output anything at all for the DS18S20's reading.
                
                Adding a check for the DS18S20's error condition:
                LSB = 0xAA
                MSB = 0x00
                COUNT_REMAIN = 0x0C
                COUNT_PER_C = 0x10
                
                If this error case is encountered, the reading should be
                repeated. If it comes up again, use it.
                
                There is also a glitch possible in the DS1820 that exhibits
                itself by COUNT_PER_C - COUNT_REMAIN = 1, this should be
                checked for, and the reading repeated and the next result
                used.

                The problem with no reading from the device seems to
                happen when MLanAccess is called. There is no good way to
                tell what the problem is, so I will change the code to
                try 3 times before failing. Changes are in read_temp.
                                                
   01/04/2000   Changing the default read timeout to 1000mS. I had problems
                with it set to 500mS and a 30' sensor wire (the reading
                was low by about 10 degrees).

   01/01/2000   Well, no release last year. Adding -q to make the banner
                dissapear for batchfiles that want to get the output
                directly.

   12/28/99     Changed Version number to 2.0
                Adding GNU public license
                Changing this code to use the DS9097-U adapter

   06/03/99     Finishing this thing up.

   06/02/99     Use 2 logging routines, log_time to log a single line
                per sensor with optional time data and log_str to log
                a single line for multiple sensors with elapsed time at
                the beginning of the line.

   05/29/99     Added 2 new init file tags, LOG_FORMAT and LOG_TYPE
                New formatting works, need to clean up the logic now.
                
   05/27/99     Adding user specified format string. To use it, first
                parse out the digitemp specific stuff and create a new
                string to feed into strftime, with the sensor, temperature
                already set.

   05/24/99     Adding a output specifier string, this will allow users
                to configure the output to look however they want it to.
                The format string uses strftime tokens plus 3 special
                ones for digitemp - %s for sensor #, %C for centigrage,
                %F for fahrenheight

   05/23/99     Adding Solaris support via -DSOLARIS define
                Fixing the time problems once and for all, using localtime
                in the log_line routine. The user should have TZ set
                correctly for their timezone. This has been tested
                and works correctly.

                Changed version number to v1.3

   01/14/99     A user in Sweden (and another in Finland) discovered a
                long standing bug. In do_temp I should have been using
                0x100 instead of 0xFF for the subtraction. This caused
                temperatures below 0 degrees C to jump up 1 degree as
                it decreased. This is fixed.
                
                Changed version number to v1.2

   10/20/98     Adding new features from DOS version to keep things
                consistent. Removing the debug command, not used anyway.
                Added a free() to error condition edit from read_rcfile()               
                Set some cases of freeing to = NULL, also freed the rom
                list before doing a search rom (searchROM checks too, but
                this is the right place for it).

   08/31/98     Adding a check for family 0x10 so that we can read DS1820s
                while they are on a network that includes other 1-wire
                devices.
                Fixed a problem with freeing uninitalized rom_list when
                starting a SearchROM. Not sure why this never appeared
                before.

   03/06/98     Adding a -d debug level to help figure out why this thing
                is no longer working.

   03/13/97     Error in CRC calculation. Wrong # of bytes.
                Error with 3 sensors. Sometimes doesn't store correct ROM
                data to .digitemprc -- need to malloc more memory dummy!

   03/08/97     Adding user defined timeouts for failure and for the
                read delay.

   01/24/97     Changed over to correct baud rate and 6 bits @ 115.2k
                ROM search function is now working. All low level code
                is functioning except for Alarm Search. Starting to move
                into a seperate object file with API for users to write
                their own code with.
                
   01/22/97     Working on ROM search routine, double cannot handle a full
                64 bits for some reason, converting to 64 byte array for
                each bit.

   01/19/97     Rewriting for new interface. This programs handles all the
                low level communications with the temperature sensor using
                the 115200k serial adapter.
   
   01/02/96     Rewriting this code to be more user friendly
     
   -----------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <unistd.h>
#ifndef AIX
#include <getopt.h>
#endif /* AIX */
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/timeb.h>
#include <time.h>
#include <string.h>
#include <fcntl.h>

#include "digitemp.h"
#include "ownet.h"
#include "swt1f.h"

#define strncasecmp strnicmp

/* For tracking down strange errors */
#undef BCL_DEBUG

char *device_name( unsigned int family );


extern char     *optarg;              
extern int      optind, opterr, optopt;

char    log_file[1024],                         /* Path to the log file    */
        log_format[80],                         /* Format for the logfile  */
        conf_file[1024];                        /* Configuration File      */

int     serial_port,                            /* COM port 1-*            */
        read_time,                              /* Pause during read       */
        log_type,                               /* output format type      */
        num_cs = 0;                             /* Number of sensors on cplr */

struct _coupler *coupler_top = NULL;            /* Linked list of couplers */

#ifndef DEMO
/* This could be used to generate a unique serial number for each copy */
const char bcl[] = { "bcl[89339e7c871eb1d2771339ce7681af75]" };
#endif /* DEMO */

/* ----------------------------------------------------------------------- *
   Print out the program usage
 * ----------------------------------------------------------------------- */
void usage()
{
  printf(BANNER_1);
  printf(BANNER_2);
  printf("\nUsage: digitemp [-i -a -t -w] [-s -d -l -r -v -n -c -o]\n");
  printf("                -i                            Initalize digitemp.cfg file\n");
  printf("                -w                            Walk the full device tree\n");
  printf("                -a                            Read all Sensors\n");
  printf("                -s1                           Set serial port\n");
  printf("                -r1000                        Read delay in mS\n");
  printf("                -v                            Verbose output\n");
#ifdef DEMO
  printf("\n                REGISTERED VERSION ONLY:\n");
#endif /* DEMO */
  printf("                -l/var/log/temperature        Send output to logfile\n");
  printf("                -t0                           Read Sensor #\n");
  printf("                -d5                           Delay between samples (in sec.)\n");
  printf("                -c/path/configfile            Configuration file\n");
  printf("                -q                            Quiet, no copyright banner\n");
  printf("                -n50                          Number of times to repeat\n");
  printf("                -o2                           Output format for logfile\n");
  printf("                -o\"output format string\"      See description below\n");
  printf("\nLogfile formats:  1 = One line per sensor, time, C, F (default)\n");
  printf("                  2 = One line per sample, elapsed time, temperature in C\n");
  printf("                  3 = Same as #2, except temperature is in F\n");
  printf("        #2 and #3 have the data seperated by tabs, suitable for import\n");
  printf("        into a spreadsheet or other graphing software.\n");
  printf("\n        The format string uses strftime tokens plus 3 special ones for\n");
  printf("        digitemp - %%s for sensor #, %%C for centigrage, %%F for fahrenheight.\n");
  printf("        The case of the token is important! The default format string is:\n");
  printf("        \"%%b %%d %%H:%%M:%%S Sensor %%s C: %%.2C F: %%.2F\" which gives you an\n");
  printf("        output of: May 24 21:25:43 Sensor 0 C: 23.66 F: 74.59\n");
  printf("\n\n");
  printf("        NOTE: When passing log strings from a DOS prompt you must escape\n");
  printf("              the %% sign using %%%% instead, otherwise DOS thinks you\n");
  printf("              are trying to pass a variable to the program. You can also\n");
  printf("              edit digitemp.cfg directly\n\n");
}


/* ----------------------------------------------------------------------- *
   Free up all memory used by the coupler list
 * ----------------------------------------------------------------------- */
void free_coupler()
{
  unsigned char   a[3];
  struct _coupler *c;
  
  c = coupler_top;
  while(c)
  {
     /* Turn off the Coupler */
     SetSwitch1F(0, c->SN, ALL_LINES_OFF, 0, a, TRUE);

    /* Free up the serial number lists */
    if( c->num_main > 0 )
      free( c->main );
      
    if( c->num_aux > 0 )
      free( c->aux );
      
    /* Point to the next in the list */
    coupler_top = c->next;
    
    /* Free up the current entry */
    free( c );
    
    c = coupler_top;
  } /* Coupler free loop */
}


/* -----------------------------------------------------------------------
   Convert degrees C to degrees F
   ----------------------------------------------------------------------- */
float c2f( float temp )
{
  return 32 + ((temp*9)/5);
}


/* -----------------------------------------------------------------------
   Take the log_format string and parse out the
   digitemp tags (%*s %*C and %*F) including any format
   specifiers to pass to sprintf. Build a new string
   with the strftime tokens and the temperatures mixed
   together
   ----------------------------------------------------------------------- */
int build_tf( char *time_format, char *format, int sensor, float temp_c, float temp_f )
{
  char  *tf_ptr,
        *lf_ptr,
        *lf_ptr2,
        *tk_ptr,
        token[80],
        temp[80];
        
  if( !time_format || !format )
    return 0;

  tf_ptr = time_format;
  lf_ptr = format;
  
  while( *lf_ptr )
  {
    if( *lf_ptr != '%' )
    {
      *tf_ptr++ = *lf_ptr++;
    } else {
      /* Found a token, decide if its one of ours... */
      /* save initial pointer, grab everything up to... */
      lf_ptr2 = lf_ptr;
      tk_ptr = token;
      
      /* Take numbers, astrix, period and letters */
      while( isalnum( *lf_ptr ) || (*lf_ptr == '.') ||
             (*lf_ptr == '*') || (*lf_ptr == '%') )
      {
        *tk_ptr++ = *lf_ptr++;
        *tk_ptr = 0;  
      }
      
      /* see if the format specifier is digitemp or strftime */
      switch( *(tk_ptr-1) )
      {
        case 's' :
                /* Sensor number */
                /* Change the specifier to a d */
                *(tk_ptr-1) = 'd';
                
                /* Pass it through sprintf */
                sprintf( temp, token, sensor );

                /* Insert this into the time format string */
                tk_ptr = temp;
                while( *tk_ptr )
                  *tf_ptr++ = *tk_ptr++;
                break;
                
        case 'F' :
                /* Degrees Fahrenheight */
                /* Change the specifier to a f */
                *(tk_ptr-1) = 'f';
                
                /* Pass it through sprintf */
                sprintf( temp, token, temp_f );

                /* Insert this into the time format string */
                tk_ptr = temp;
                while( *tk_ptr )
                  *tf_ptr++ = *tk_ptr++;
        
                break;
                
        case 'C' :
                /* Degrees Centigrade */
                /* Change the specifier to a f */
                *(tk_ptr-1) = 'f';
                
                /* Pass it through sprintf */
                sprintf( temp, token, temp_c );

                /* Insert this into the time format string */
                tk_ptr = temp;
                while( *tk_ptr )
                  *tf_ptr++ = *tk_ptr++;                
                break;
                
        default:
                /* Not something for us, copy it into the time format */
                tk_ptr = token;
                while( *tk_ptr )
                  *tf_ptr++ = *tk_ptr++;
                break;
      } 
    }
  
  }

  /* Terminate the string */
  *tf_ptr = 0;


  return 1;
}


/* -----------------------------------------------------------------------
   Print a string to the console or the logfile
   ----------------------------------------------------------------------- */
int log_string( char *line )
{
  int fd=0;
  

  if( log_file[0] != 0 )
  {  
    if( (fd = open( log_file, O_CREAT | O_WRONLY | O_APPEND,
                          S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH ) ) == -1 )
    {
      printf("Error opening logfile: %s\n", log_file );
      return -1;
    }
    if( write( fd, line, strlen( line ) ) == -1)
      perror("Error loging to logfile");
    close( fd );
  } else {
    printf( line );
  }
  return 0;
}  


/* -----------------------------------------------------------------------
   Log one line of text to the logfile with the current date and time
   ----------------------------------------------------------------------- */
int log_time( int sensor, float temp_c, float temp_f )
{
  unsigned char temp[1024],
                time_format[160];
  time_t        mytime;


  mytime = time(NULL);
  if( mytime )
  {
    /* Build the time format string from log_format */
    build_tf( time_format, log_format, sensor, temp_c, temp_f );

    /* Handle the time format tokens */
    strftime( temp, 1024, time_format, localtime( &mytime ) );

    strcat( temp, "\n" );
  } else {
    sprintf( temp, "Time Error\n" );
  }
  /* Log it to stdout, logfile or both */
  log_string( temp );

  return 0;
}
  

/* -----------------------------------------------------------------------
   Compare two serial numbers and return 1 of they match

   The second one has an additional byte indicating the main (0) or aux (1)
   branch.
   ----------------------------------------------------------------------- */
int cmpSN( unsigned char *sn1, unsigned char *sn2, int branch )
{
  int i;

  for(i = 0; i < 8; i++ )
  {
    if( sn1[i] != sn2[i] )
    {
      return 0;
    }
  }
  if( branch != sn2[8] )
  {
    return 0;
  }

  /* Everything Matches */
  return 1;
}  


/* -----------------------------------------------------------------------
   Show the verbose contents of the scratchpad
   ----------------------------------------------------------------------- */
void show_scratchpad( unsigned char *scratchpad, int sensor_family )
{
  unsigned char temp[80];
  int i;
  
  if( log_file[0] != 0 )
  {
    switch( sensor_family )
    {
      case DS1820_FAMILY:
        sprintf( temp, "  Temperature   : 0x%02X\n", scratchpad[1] );
        sprintf( temp, "  Sign          : 0x%02X\n", scratchpad[2] );
        sprintf( temp, "  TH            : 0x%02X\n", scratchpad[3] );
        sprintf( temp, "  TL            : 0x%02X\n", scratchpad[4] );
        sprintf( temp, "  Remain        : 0x%02X\n", scratchpad[7] );
        sprintf( temp, "  Count Per C   : 0x%02X\n", scratchpad[8] );
        sprintf( temp, "  CRC           : 0x%02X\n", scratchpad[9] );
        break;

      case DS18B20_FAMILY:
      case DS1822_FAMILY:
        sprintf( temp, "  Temp. LSB     : 0x%02X\n", scratchpad[1] );
        sprintf( temp, "  Temp. MSB     : 0x%02X\n", scratchpad[2] );
        sprintf( temp, "  TH            : 0x%02X\n", scratchpad[3] );
        sprintf( temp, "  TL            : 0x%02X\n", scratchpad[4] );
        sprintf( temp, "  Config Reg.   : 0x%02X\n", scratchpad[5] );
        sprintf( temp, "  CRC           : 0x%02X\n", scratchpad[9] );
        break;
    } /* sensor_family switch */
  } else {
    switch( sensor_family )
    {
      case DS1820_FAMILY:
        printf("  Temperature   : 0x%02X\n", scratchpad[1] );
        printf("  Sign          : 0x%02X\n", scratchpad[2] );
        printf("  TH            : 0x%02X\n", scratchpad[3] );
        printf("  TL            : 0x%02X\n", scratchpad[4] );
        printf("  Remain        : 0x%02X\n", scratchpad[7] );
        printf("  Count Per C   : 0x%02X\n", scratchpad[8] );
        printf("  CRC           : 0x%02X\n", scratchpad[9] );
        break;

      case DS18B20_FAMILY:
      case DS1822_FAMILY:
        printf( "  Temp. LSB     : 0x%02X\n", scratchpad[1] );
        printf( "  Temp. MSB     : 0x%02X\n", scratchpad[2] );
        printf( "  TH            : 0x%02X\n", scratchpad[3] );
        printf( "  TL            : 0x%02X\n", scratchpad[4] );
        printf( "  Config Reg.   : 0x%02X\n", scratchpad[5] );
        printf( "  CRC           : 0x%02X\n", scratchpad[9] );
        break;

    } /* sensor_family switch */
  } /* if log_file */

  /* Dump the complete contents of the scratchpad */
  for( i = 0; i < 10; i++ )
  {
    printf( "scratchpad[%d] = 0x%02X\n", i, scratchpad[i] );
  }
}


/* -----------------------------------------------------------------------
   Read the temperature from one sensor

   Return the high-precision temperature value

   Calculated using formula from DS1820 datasheet

   Temperature   = scratchpad[0]
   Sign          = scratchpad[1]
   TH            = scratchpad[2]
   TL            = scratchpad[3]
   Count Remain  = scratchpad[6]
   Count Per C   = scratchpad[7]
   CRC           = scratchpad[8]
   
                   count_per_C - count_remain
   (temp - 0.25) * --------------------------
                       count_per_C

   If Sign is not 0x00 then it is a negative (Centigrade) number, and
   the temperature must be subtracted from 0x100 and multiplied by -1

   ----------------------------------------------------------------------- */
int read_temp( struct _roms *sensor_list, int sensor, int opts )
{
  static unsigned char Last2409[9];     /* Last selected coupler           */
  char    temp[1024];
  unsigned char TempSN[8],
          scratchpad[30],          /* Scratchpad block from the sensor     */
          a[3],
          lastcrc8;
  int     x,
          j,
          s,
          sensor_family,
          try,                     /* Number of tries at reading device    */
          strong_err,              /* Error with strong pullup?            */
          ds1820_try,              /* Allow ds1820 glitch 1 time           */
          ds18s20_try;             /* Allow DS18S20 error 1 time           */
  float   temp_c,                  /* Calculated temperature in Centigrade */
          hi_precision;
  struct _coupler *c_ptr;          /* Coupler linked list                  */
    
  /* Tell the sensor to do a temperature conversion */

  /* Sort out how to address the sensor.
     If sensor < num_sensors then it can be directly addressed
     if sensor >= num_sensors then the coupler must first be
     addressed and the correct branch turned on.
  */

  if( sensor < sensor_list->max )
  {
    /* Address the sensor directly */
    owSerialNum( 0, &sensor_list->roms[sensor*8], FALSE );
  } else {
    /* Step through the coupler list until the right sensor is found.
       Sensors are in order.
    */
    s = sensor - sensor_list->max;
    c_ptr = coupler_top;
    while( c_ptr )
    {
      if( s < c_ptr->num_main )
      {
        /* Found the right area */
        
        /* Is this coupler & branch already on? */
        if( !cmpSN( c_ptr->SN, Last2409, 0 ) )
        {
          /* Turn on the main branch */
          if(!SetSwitch1F(0, c_ptr->SN, DIRECT_MAIN_ON, 0, a, TRUE))
          {
            printf("Setting Switch to Main ON state failed\n");
            return FALSE;
          }
          /* Remember the last selected coupler & Branch */
          memcpy( &Last2409, &c_ptr->SN, 8 );
          Last2409[8] = 0;
        }
        
        /* Select the sensor */
        owSerialNum( 0, &c_ptr->main[s*8], FALSE );
        break;
      } else {
        s -= c_ptr->num_main;
        if( s < c_ptr->num_aux )
        {
          /* Found the right area */

          /* Is this coupler & branch already on? */
          if( !cmpSN( c_ptr->SN, Last2409, 1 ) )
          {        
            /* Turn on the aux branch */
            if(!SetSwitch1F(0, c_ptr->SN, AUXILARY_ON, 2, a, TRUE))
            {
              printf("Setting Switch to Aux ON state failed\n");
              return FALSE;
            }
            /* Remember the last selected coupler & Branch */
            memcpy( &Last2409, &c_ptr->SN, 8 );
            Last2409[8] = 1;
          } /* Last2409 check */

          /* Select the sensor */
          owSerialNum( 0, &c_ptr->aux[s*8], FALSE );
          break;          
        }
      }
      s -= c_ptr->num_aux;
      c_ptr = c_ptr->next;
    }    
  }

  /* Get the Serial # selected */
  owSerialNum( 0, &TempSN[0], TRUE );
  sensor_family = TempSN[0];
  
  x = 0;  
  ds1820_try = 0;
  ds18s20_try = 0;  
  
  for( try = 0; try < MAX_READ_TRIES; try++ )
  {
    if( owAccess(0) )
    {
      /* Convert Temperature */
      owWriteBytePower( 0, 0x44 );
      
      /* Set the strong pullup */
      if( owLevel( 0, MODE_STRONG5 ) != MODE_STRONG5 )
      {
        strong_err = 1;
      }

      /* Sleep for conversion second */
      msDelay( read_time );
      
      /* Turn off the strong pullup */
      if( owLevel( 0, MODE_NORMAL ) != MODE_NORMAL )
      {
        strong_err = 2;
      }

        
      /* Now read the scratchpad from the device */
      if( owAccess(0) )
      {
/* Use Read_Scratchpad instead? */
        /* Build a block for the Scratchpad read */
        scratchpad[0] = 0xBE;
        for( j = 1; j < 10; j++ )
          scratchpad[j] = 0xFF;
          
        /* Send the block */
        if( owBlock( 0, FALSE, scratchpad, 10 ) )
        {
          /* Calculate the CRC 8 checksum on the received data */
          setcrc8(0, 0);
          for( j = 1; j < 10; j++ )
            lastcrc8 = docrc8( 0, scratchpad[j] );

          /* If the CRC8 is valid then calculate the temperature */            
          if( lastcrc8 == 0x00 )
          {
            /* DS1822 and DS18B20 use a different calculation */
            if( (sensor_family == DS18B20_FAMILY) ||
                (sensor_family == DS1822_FAMILY) )
            {
              short int temp = (scratchpad[2] << 8) | scratchpad[1];
              temp_c = temp / 16.0;
            }
            
            /* Handle the DS1820 and DS18S20 */
            if( sensor_family == DS1820_FAMILY )
            {
              /* Check for DS1820 glitch condition */
              /* COUNT_PER_C - COUNT_REMAIN == 1 */
              if( ds1820_try == 0 )
              {
                if( (scratchpad[7] - scratchpad[6]) == 1 )
                {
                  ds1820_try = 1;
                  continue;
                } /* DS1820 error */
              } /* ds1820_try */
            
              /* Check for DS18S20 Error condition */
              /*  LSB = 0xAA
                  MSB = 0x00
                  COUNT_REMAIN = 0x0C
                  COUNT_PER_C = 0x10
              */
              if( ds18s20_try == 0 )
              {
                if( (scratchpad[4]==0xAA) &&
                    (scratchpad[3]==0x00) &&
                    (scratchpad[7]==0x0C) &&
                    (scratchpad[8]==0x10)
                  )
                {
                  ds18s20_try = 1;
                  continue;
                } /* DS18S20 error condition */
              } /* ds18s20_try */
          
              /* Convert data to temperature */
              if( scratchpad[2] == 0 )
              {
                temp_c = (int) scratchpad[1] >> 1;
              } else {
                temp_c = -1 * (int) (0x100-scratchpad[1]) >> 1;
              } /* Negative temp calculation */
              temp_c -= 0.25;
              hi_precision = (int) scratchpad[8] - (int) scratchpad[7];
              hi_precision = hi_precision / (int) scratchpad[8];
              temp_c = temp_c + hi_precision;
            } /* DS1820_FAMILY */
            
            /* Log the temperature */
            switch( log_type )
            {
              /* Multiple Centigrade temps per line */
              case 2:     sprintf( temp, "\t%3.2f", temp_c );
                          log_string( temp );
                          break;

              /* Multiple Fahrenheight temps per line */
              case 3:     sprintf( temp, "\t%3.2f", c2f(temp_c) );
                          log_string( temp );
                          break;

              default:    log_time( sensor, temp_c, c2f(temp_c) );
                          break;
            } /* switch( log_type ) */

            /* Show the scratchpad if verbose is seelcted */
            if( opts & OPT_VERBOSE )
            {
              show_scratchpad( scratchpad, sensor_family );              
            } /* if OPT_VERBOSE */

            /* Good conversion finished */
            return TRUE;
          } else {
            fprintf( stderr, "CRC Failed. CRC is %02X instead of 0x00\n", lastcrc8 );

            if( opts & OPT_VERBOSE )
            {
              show_scratchpad( scratchpad, sensor_family );              
            } /* if OPT_VERBOSE */
          } /* CRC 8 is OK */
        } /* Scratchpad Read */
      } /* owAccess failed */
    } /* owAccess failed */
    
    /* Failed to read, rest the network, delay and try again */
    owTouchReset(0);
    msDelay( read_time );
  } /* for try < 3 */
  
  /* Failed, no good reads after MAX_READ_TRIES */
  return FALSE;
}



/* -----------------------------------------------------------------------
   Read the temperaturess for all the connected sensors

   Step through all the sensors in the list of serial numbers
   ----------------------------------------------------------------------- */
int read_all( struct _roms *sensor_list, int opts )
{
  int x;
  
  for( x = 0; x <  (num_cs+sensor_list->max); x++ )
  {
    read_temp( sensor_list, x, opts );  
  }
  
  return 0;
}


/* -----------------------------------------------------------------------
   Read a digitemp.cfg file from the current directory

   The rc file contains:
   
   TTY <serial>
   LOG <logfilepath>
   FAIL_TIME <time in seconds>
   READ_TIME <time in mS>
   LOG_TYPE <from -o>
   LOG_FORMAT <format string for logging and printing>
   SENSORS <number of ROM lines>
   Multiple ROM x <serial number in bytes> lines
   
   v 2.3 additions:
   Multiple COUPLER x <serial number in decimal> lines
   CROM x <COUPLER #> <M or A> <Serial number in decimal>
   ----------------------------------------------------------------------- */
int read_rcfile( char *fname, struct _roms *sensor_list )
{
  FILE  *fp;
  char  temp[80];
  char  *ptr;
  int   sensors, x;
  struct _coupler *c_ptr, *coupler_end;
  
  sensors = 0;
  num_cs = 0;
  c_ptr = coupler_top;
  coupler_end = coupler_top;
  
  if( ( fp = fopen( fname, "r" ) ) == NULL )
  {
    /* No rcfile to read */
    return 1;
  }
  
  while( fgets( temp, 80, fp ) != 0 )
  {
    if( (temp[0] == '\n') || (temp[0] == '#') )
      continue;
      
    ptr = strtok( temp, " \t\n" );
    
    if( strncasecmp( "TTY", ptr, 3 ) == 0 )
    {
      ptr = strtok( NULL, " \t\n" );
      serial_port = atoi( ptr );
    } else if( strncasecmp( "LOG_TYPE", ptr, 8 ) == 0 ) {
      ptr = strtok( NULL, " \t\n");
      log_type = atoi( ptr );
    } else if( strncasecmp( "LOG_FORMAT", ptr, 10 ) == 0 ) {
      ptr = strtok( NULL, "\"\n");
      strcpy( log_format, ptr );
    } else if( strncasecmp( "LOG", ptr, 3 ) == 0 ) {
      ptr = strtok( NULL, " \t\n" );
      strcpy( log_file, ptr );
    } else if( strncasecmp( "FAIL_TIME", ptr, 9 ) == 0 ) {
//      ptr = strtok( NULL, " \t\n");
//      fail_time = atoi( ptr );
    } else if( strncasecmp( "READ_TIME", ptr, 9 ) == 0 ) {
      ptr = strtok( NULL, " \t\n");
      read_time = atoi( ptr );
    } else if( strncasecmp( "SENSORS", ptr, 7 ) == 0 ) {
      ptr = strtok( NULL, " \t\n" );
      sensors = atoi( ptr );
      
      /* Reserve some memory for the list */
      if( sensors > 0 )
      {
        if( ( sensor_list->roms = malloc( sensors * 8 ) ) == NULL )
        {
          fprintf( stderr, "Error reserving memory for %d sensors\n", sensors );
          return -1;
        }
        sensor_list->max = sensors; 
      }
    } else if( strncasecmp( "ROM", ptr, 3 ) == 0 ) {
      ptr = strtok( NULL, " \t\n" );
      sensors = atoi( ptr );

      /* Read the 8 byte ROM address */
      for( x = 0; x < 8; x++ )
      {
        ptr = strtok( NULL, " \t\n" );
        sensor_list->roms[(sensors * 8) + x] = atoi( ptr );
      }      
    } else if( strncasecmp( "COUPLER", ptr, 7 ) == 0 ) {
      /* DS2409 Coupler list, they are ALWAYS in order, so ignore the
         coupler # and create the list in the order found
       */
      
      /* Allocate space for this coupler */
      /* Create a new entry in the coupler linked list */
      if( (c_ptr = malloc( sizeof( struct _coupler ) ) ) == NULL )
      {
        fprintf( stderr, "Failed to allocate %d bytes for coupler linked list\n", sizeof( struct _coupler ) );
        free_coupler();
        if( sensor_list != NULL )
          free(sensor_list->roms);
        return -1;
      }

      c_ptr->next = NULL;
      c_ptr->num_main = 0;
      c_ptr->num_aux = 0;
      c_ptr->main = NULL;
      c_ptr->aux = NULL;

      if( coupler_top == NULL )
      {
        /* First coupler, add it to the top of the list */
        coupler_top = c_ptr;
        coupler_end = c_ptr;
      } else {
        /* Add the new coupler to the list, point to new end */
        coupler_end->next = c_ptr;
        coupler_end = c_ptr;
      }

      /* Ignore the coupler # */
      ptr = strtok( NULL, " \t\n" );
      
      /* Read the 8 byte ROM address */
      for( x = 0; x < 8; x++ )
      {
        ptr = strtok( NULL, " \t\n" );
        c_ptr->SN[x] = atoi( ptr );
      }
    } else if( strncasecmp( "CROM", ptr, 4 ) == 0 ) {
      /* Count the number of coupler connected sensors */
      num_cs++;

      /* DS2409 Coupler sensors */    
      /* Ignore sensor #, they are all created in order */
      ptr = strtok( NULL, " \t\n" );

      /* Get the coupler number, and set the pointer to the right
         coupler
       */
      ptr = strtok( NULL, " \t\n" );
      x = atoi(ptr);
      c_ptr = coupler_top;
      while( c_ptr && (x > 0) )
      {
        c_ptr = c_ptr->next;
        x--;
      }
        
      /* Make sure we are pointing to something */
      if( c_ptr )
      {
        /* Main/Aux branch */
        ptr = strtok( NULL, " \t\n" );
        
        if( *ptr == 'M' )
        {
          /* Add to the main list */
          c_ptr->num_main++;
          
          /* Allocate enough space for the new serial number */
          if( (c_ptr->main = realloc( c_ptr->main, c_ptr->num_main * 8 ) ) == NULL )
          {
            fprintf( stderr, "Failed to allocate %d bytes for main branch\n", c_ptr->num_main * 8 );
            free_coupler();
            if( sensor_list != NULL )
              free( sensor_list->roms );
            return -1;
          }
          
          /* Add the serial number to the list */
          for( x = 0; x < 8; x++ )
          {
            ptr = strtok( NULL, " \t\n" );
            c_ptr->main[((c_ptr->num_main-1)*8)+x] = atoi( ptr );
          }       
        } else {
          /* Add to the aux list */
          c_ptr->num_aux++;
          
          /* Allocate enough space for the new serial number */
          if( (c_ptr->aux = realloc( c_ptr->aux, c_ptr->num_aux * 8 ) ) == NULL )
          {
            fprintf( stderr, "Failed to allocate %d bytes for aux branch\n", c_ptr->num_aux * 8 );
            free_coupler();
            if( sensor_list != NULL )
              free( sensor_list->roms );
            return -1;
          } /* Allocate more aux space */
          
          /* Add the serial number to the list */
          for( x = 0; x < 8; x++ )
          {
            ptr = strtok( NULL, " \t\n" );
            c_ptr->aux[((c_ptr->num_aux-1)*8)+x] = atoi( ptr );
          } /* aux serial number loop */
        } /* Main/Aux branch check */
      } /* c_ptr Pointing somewhere check */
    } else {
      fprintf( stderr, "Error reading %s file\n", fname );
      free( sensor_list->roms );
      fclose( fp );
      return -1;
    }
  }
  
  fclose( fp ); 

  return 0;
}


/* -----------------------------------------------------------------------
   Write a digitemp.cfg file, it contains:
   
   TTY <serial>
   LOG <logfilepath>
   FAIL_TIME <time in seconds>
   READ_TIME <time in mS>
   LOG_TYPE <from -o>
   LOG_FORMAT <format string for logging and printing>
   SENSORS <number of ROM lines>
   Multiple ROM x <serial number in bytes> lines

   v 2.3 additions:
   Multiple COUPLER x <serial number in decimal> lines
   CROM x <COUPLER #> <M or A> <Serial number in decimal>
   ----------------------------------------------------------------------- */
int write_rcfile( char *fname, struct _roms *sensor_list )
{
  FILE  *fp;
  int   x, y, i;
  struct _coupler *c_ptr;

  if( ( fp = fopen( fname, "wb" ) ) == NULL )
  {
    return -1;
  }
  
  fprintf( fp, "TTY %d\n", serial_port );
  if( log_file[0] != 0 )
    fprintf( fp, "LOG %s\n", log_file );

//  fprintf( fp, "FAIL_TIME %d\n", fail_time );           /* Seconds      */
  fprintf( fp, "READ_TIME %d\n", read_time );           /* mSeconds     */

  fprintf( fp, "LOG_TYPE %d\n", log_type );
  fprintf( fp, "LOG_FORMAT \"%s\"\n", log_format );
  
  fprintf( fp, "SENSORS %d\n", sensor_list->max );

  for( x = 0; x < sensor_list->max; x++ )
  {
    fprintf( fp, "ROM %d ", x );
    
    for( y = 0; y < 8; y++ )
    {
      fprintf( fp, "%d ", sensor_list->roms[(x * 8) + y] );
    }
    fprintf( fp, "\n" );
  }

  /* If any DS2409 Couplers were found, write out their information too */
  /* Write out the couplers first */
  c_ptr = coupler_top;
  x =  0;
  while( c_ptr )
  {
    fprintf( fp, "COUPLER %d ", x );
    for( y = 0; y < 8; y++ )
    {
      fprintf( fp, "%d ", c_ptr->SN[y] );
    }
    fprintf( fp, "\n" );
    x++;
    c_ptr = c_ptr->next;
  } /* Coupler list */

  /* Sendor # ID for coupler starts at num_sensors */
  num_cs = 0;  

  /* Start at the top of the coupler list */  
  c_ptr = coupler_top;
  x =  0;
  while( c_ptr )
  {
    /* Print the devices on this coupler's main branch */
    if( c_ptr->num_main > 0 )
    {
      for( i = 0; i < c_ptr->num_main; i++ )
      {
        fprintf( fp, "CROM %d %d M ", sensor_list->max+num_cs++, x );

        for( y = 0; y < 8; y++ )
        {
          fprintf( fp, "%d ", c_ptr->main[(i * 8) + y] );
        }
        fprintf( fp, "\n" );
      }
    }
    
    /* Print the devices on this coupler's aux branch */
    if( c_ptr->num_aux > 0 )
    {
      for( i = 0; i < c_ptr->num_aux; i++ )
      {
        fprintf( fp, "CROM %d %d A ", sensor_list->max+num_cs++, x );

        for( y = 0; y < 8; y++ )
        {
          fprintf( fp, "%d ", c_ptr->aux[(i * 8) + y] );
        }
        fprintf( fp, "\n" );
      }
    }

    x++;
    c_ptr = c_ptr->next;
  } /* Coupler list */

  fclose( fp );
  
  return 0;
}



/* -----------------------------------------------------------------------
   Print out a serial number
   ----------------------------------------------------------------------- */      
void printSN( unsigned char *TempSN, int crlf )
{
  int y;

  /* Print the serial number */    
  for( y = 0; y < 8; y++ )
  {
    printf("%02X", TempSN[y] );
  }
  if( crlf )
    printf("\n");
}


/* -----------------------------------------------------------------------
   Walk the entire connected 1-wire LAN and display the serial number
   and type of device.
   ----------------------------------------------------------------------- */      
int Walk1Wire()
{
  unsigned char TempSN[8],
                InfoByte[3];
  short result;
  struct _roms  coupler_list;           /* Attached Roms                */
  int   x;

  bzero( &coupler_list, sizeof( struct _roms ) );
    
  /* Find any DS2409 Couplers and turn them all off.
     This WILL NOT WORK if there is a coupler attached to the
     bus of another coupler. DigiTemp on;y supports couplers
     on the main 1-Wire LAN.

     We also don't record any couplers in this loop because if
     one was one and we detected a branch that is closed off
     after it is turned off we will end up with multiple copies
     of the same couplers.
  */
  printf("Turning off all DS2409 Couplers\n");
  result = owFirst( 0, TRUE, FALSE );
  while(result)
  {
    owSerialNum( 0, TempSN, TRUE );
    printf(".");
    fflush(stdout);
    if( TempSN[0] == SWITCH_FAMILY )
    {
      /* Turn off the Coupler */
      if(!SetSwitch1F(0, TempSN, ALL_LINES_OFF, 0, InfoByte, TRUE))
      {
        printf("Setting Coupler to OFF state failed\n");

        if( coupler_list.roms != NULL )
          free( coupler_list.roms );

        return -1;
      }
    }
    result = owNext( 0, TRUE, FALSE );
  } /* HUB search */
  printf("\n");
  
  /* Now we know all the couplers on the main LAN are off, we
     can now start mapping the 1-Wire LAN
   */
  printf("Devices on the Main LAN\n");
  result = owFirst( 0, TRUE, FALSE );
  while(result)
  {
    owSerialNum( 0, TempSN, TRUE );
    /* Print the serial number */    
    printSN( TempSN, 0 );
    printf(" : %s\n", device_name( TempSN[0]) );

    if( TempSN[0] == SWITCH_FAMILY )
    {
      /* Save the Coupler's serial number so we can explore it later */
      /* Count the sensors detected */
      coupler_list.max++;

      /* Allocate enough space for the new serial number */
      if( (coupler_list.roms = realloc( coupler_list.roms, coupler_list.max * 8 ) ) == NULL )
      {
        printf( "Failed to allocate %d bytes for coupler_list\n", coupler_list.max * 8 );

        if( coupler_list.roms != NULL )
          free( coupler_list.roms );

        return -1;
      }
      owSerialNum( 0, &coupler_list.roms[(coupler_list.max-1)*8], TRUE );
        
      /* Turn off the Coupler */
      if(!SetSwitch1F(0, TempSN, ALL_LINES_OFF, 0, InfoByte, TRUE))
      {
        printf("Setting Switch to OFF state failed\n");

        if( coupler_list.roms != NULL )
          free( coupler_list.roms );

        return -1;
      }
    }
    result = owNext( 0, TRUE, FALSE );
  } /* HUB search */
  printf("\n");

  /* If there were any 2409 Couplers present walk their trees too */
  if( coupler_list.max > 0 )
  {
    for(x = 0; x < coupler_list.max; x++ )
    {
      printf("\nDevices on Main Branch of Coupler : ");
      printSN( &coupler_list.roms[x*8], 1 );

      result = owBranchFirst( 0, &coupler_list.roms[x * 8], FALSE, TRUE );
      while(result)
      {
        owSerialNum( 0, TempSN, TRUE );

        /* Print the serial number */    
        printSN( TempSN, 0 );
        printf(" : %s\n", device_name( TempSN[0]) );

        result = owBranchNext(0, &coupler_list.roms[x * 8], FALSE, TRUE );
      } /* Main branch loop */
      printf("\n");

      printf("Devices on Aux Branch of Coupler : ");
      printSN( &coupler_list.roms[x*8], 1 );

      result = owBranchFirst( 0, &coupler_list.roms[x * 8], FALSE, FALSE );
      while(result)
      {
        owSerialNum( 0, TempSN, TRUE );

        /* Print the serial number */    
        printSN( TempSN, 0 );
        printf(" : %s\n", device_name( TempSN[0]) );

        result = owBranchNext(0, &coupler_list.roms[x * 8], FALSE, FALSE );
      } /* Aux Branch loop */
    }  /* Coupler loop */
  } /* num_couplers check */
    
  if( coupler_list.roms != NULL )
    free( coupler_list.roms );

  return 0;
}



/* -----------------------------------------------------------------------
   Find all the supported temperature sensors on the bus, searching down
   DS2409 hubs on the main bus (but not on other hubs).
   ----------------------------------------------------------------------- */
int Init1WireLan( struct _roms *sensor_list )
{
  unsigned char TempSN[8],
                InfoByte[3];
  int result,
      x;
  unsigned int found_sensors = 0;
  struct _coupler       *c_ptr,         /* Coupler pointer              */
                        *coupler_end;   /* end of the list              */

  /* Free up any thing that was read from .digitemprc */
  if( sensor_list->roms != NULL )
  {
    free( sensor_list->roms );
    sensor_list->roms = NULL;
  }
  sensor_list->max = 0;
  num_cs = 0;

  /* Free up the coupler list */
  free_coupler();

  /* Initalize the coupler pointer */
  coupler_end = coupler_top;

  printf("Turning off all DS2409 Couplers\n");
  result = owFirst( 0, TRUE, FALSE );
  while(result)
  {
    owSerialNum( 0, TempSN, TRUE );
    printf(".");
    fflush(stdout);
    if( TempSN[0] == SWITCH_FAMILY )
    {
      /* Turn off the Coupler */
      if(!SetSwitch1F(0, TempSN, ALL_LINES_OFF, 0, InfoByte, TRUE))
      {
        printf("Setting Coupler to OFF state failed\n");
        free_coupler();
        return -1;
      }
    }
    result = owNext( 0, TRUE, FALSE );
  } /* HUB OFF search */ 
  printf("\n");
  
  printf("Searching the 1-Wire LAN\n");
  /* Find any DS2409 Couplers and turn them all off */
  result = owFirst( 0, TRUE, FALSE );
  while(result)
  {
    owSerialNum( 0, TempSN, TRUE );

    if( TempSN[0] == SWITCH_FAMILY )
    {
      /* Print the serial number */
      printSN( TempSN, 0 );
      printf(" : %s\n", device_name( TempSN[0]) );

      /* Save the Coupler's serial number */
      /* Create a new entry in the coupler linked list */
      if( (c_ptr = malloc( sizeof( struct _coupler ) ) ) == NULL )
      {
        printf( "Failed to allocate %d bytes for coupler linked list\n", sizeof( struct _coupler ) );
        free_coupler();
        return -1;
      }

      c_ptr->next = NULL;
      c_ptr->num_main = 0;
      c_ptr->num_aux = 0;
      c_ptr->main = NULL;
      c_ptr->aux = NULL;
        
      if( coupler_top == NULL )
      {
        /* First coupler, add it to the top of the list */
        coupler_top = c_ptr;
        coupler_end = c_ptr;
      } else {
        /* Add the new coupler to the list, point to new end */
        coupler_end->next = c_ptr;
        coupler_end = c_ptr;
      }
        
      /* Write the serial number to the new list entry */
      owSerialNum( 0, &coupler_end->SN, TRUE );
    } else if( (TempSN[0] == DS1820_FAMILY) ||
               (TempSN[0] == DS1822_FAMILY) ||
               (TempSN[0] == DS18B20_FAMILY) )
    {
      /* Print the serial number */
      printSN( TempSN, 0 );
      printf(" : %s\n", device_name( TempSN[0]) );

      found_sensors = 1;
      /* Count the sensors detected */
      sensor_list->max++;

      /* Allocate enough space for the new serial number */
      if( (sensor_list->roms = realloc( sensor_list->roms, sensor_list->max * 8 ) ) == NULL )
      {
        printf( "Failed to allocate %d bytes for sensor_list\n", sensor_list->max * 8 );
        if( sensor_list->roms )
        {
          if( sensor_list->roms )
          {
            free( sensor_list->roms );
            sensor_list->roms = NULL;
          }
        }
        return -1;
      }
      owSerialNum( 0, &sensor_list->roms[(sensor_list->max-1)*8], TRUE );
    }
    result = owNext( 0, TRUE, FALSE );
  }    

  /* Now go through each coupler branch and search there */
  c_ptr = coupler_top;
  while( c_ptr )
  {
    /* Search the Main branch */
    result = owBranchFirst( 0, &c_ptr->SN, FALSE, TRUE );
    while(result)
    {
      owSerialNum( 0, TempSN, TRUE );

      /* Check to see if it is a temperature sensor */
      if( (TempSN[0] == DS1820_FAMILY) ||
          (TempSN[0] == DS1822_FAMILY) ||
          (TempSN[0] == DS18B20_FAMILY) )
      {
        /* Print the serial number */
        printSN( TempSN, 0 );
        printf(" : %s\n", device_name( TempSN[0]) );

        found_sensors = 1;
        /* Count the number of sensors on the main branch */
        c_ptr->num_main++;
                
        /* Allocate enough space for the new serial number */
        if( (c_ptr->main = realloc( c_ptr->main, c_ptr->num_main * 8 ) ) == NULL )
        {
          printf( "Failed to allocate %d bytes for main branch\n", c_ptr->num_main * 8 );
          free_coupler();
          if( sensor_list->roms )
          {
            free( sensor_list->roms );
            sensor_list->roms = NULL;
          }
          return -1;
        }
        owSerialNum( 0, &c_ptr->main[(c_ptr->num_main-1)*8], TRUE );
      } /* Add serial number to list */
        
      /* Find the next device on this branch */
      result = owBranchNext(0, &c_ptr->SN, FALSE, TRUE );
    } /* Main branch loop */
      
    /* Search the Aux branch */
    result = owBranchFirst( 0, &c_ptr->SN, FALSE, FALSE );
    while(result)
    {
      owSerialNum( 0, TempSN, TRUE );

      if( (TempSN[0] == DS1820_FAMILY) ||
          (TempSN[0] == DS1822_FAMILY) ||
          (TempSN[0] == DS18B20_FAMILY) )
      {
        /* Print the serial number */
        printSN( TempSN, 0 );
        printf(" : %s\n", device_name( TempSN[0]) );

        found_sensors = 1;
        /* Count the number of sensors on the aux branch */
        c_ptr->num_aux++;
        
        /* Allocate enough space for the new serial number */
        if( (c_ptr->aux = realloc( c_ptr->aux, c_ptr->num_aux * 8 ) ) == NULL )
        {
          printf( "Failed to allocate %d bytes for aux branch\n", c_ptr->num_main * 8 );
          free_coupler();
          if( sensor_list->roms )
          {
            free( sensor_list->roms );
            sensor_list->roms = NULL;
          }
          return -1;
        }
        owSerialNum( 0, &c_ptr->aux[(c_ptr->num_aux-1)*8], TRUE );
      } /* Add serial number to list */
        
      /* Find the next device on this branch */
      result = owBranchNext(0, &c_ptr->SN, FALSE, FALSE );
    } /* Aux branch loop */
      
    c_ptr = c_ptr->next;
  }  /* Coupler loop */


  /*
     Did the search find any sensors? Even if there was an error it may
     have found some valid sensors
  */ 
  if( found_sensors )
  {
    /* Was anything found on the main branch? */
    if( sensor_list->max > 0 )
    {
      for( x = 0; x < sensor_list->max; x++ )
      {
        printf("ROM #%d : ", x );
        printSN( &sensor_list->roms[x*8], 1 );
      }
    } /* num_sensors check */
      
    /* Was anything found on any DS2409 couplers? */
    c_ptr = coupler_top;
    while( c_ptr )      
    {
      /* Check the main branch */
      if( c_ptr->num_main > 0 )
      {
        for( x = 0; x < c_ptr->num_main; x++ )
        {    
          printf("ROM #%d : ", sensor_list->max+num_cs++ );
          printSN( &c_ptr->main[x*8], 1 );
        }
      }
      
      /* Check the aux branch */
      if( c_ptr->num_aux > 0 )
      {
        for( x = 0; x < c_ptr->num_aux; x++ )
        {    
          printf("ROM #%d : ", sensor_list->max+num_cs++ );
          printSN( &c_ptr->aux[x*8], 1 );
        }
      }
        
      /* Next Coupler */
      c_ptr = c_ptr->next;
    } /* Coupler list loop */

    /* Write the new list of sensors to the current directory */
    write_rcfile( conf_file, sensor_list );
  }
  return 0;
}



/* ----------------------------------------------------------------------- *
   DigiTemp main routine
   
   Parse command line options, run functions
 * ----------------------------------------------------------------------- */
int main( int argc, char *argv[] )
{
  int           sensor;                 /* Single sensor index to read  */
  char          temp[80];               /* Temporary strings            */
  int           opts,                   /* Bitmask of flags             */
                c;
  int           sample_delay = 0;       /* Delay between samples (SEC)  */
  unsigned int  x,
                num_samples = 1;        /* Number of samples            */
  time_t        last_time,              /* Last time we started samples */
                start_time;             /* Starting time                */
  long int      elapsed_time;           /* Elapsed from start           */
  struct _roms  sensor_list;            /* Attached Roms                */
  

  /* Make sure the structure is erased */
  bzero( &sensor_list, sizeof( struct _roms ) );

  if( argc == 1 )
  {
    usage();
    return -1;
  }

  serial_port = 0;                      /* No default port              */
  log_file[0] = 0;                      /* No default log file          */
  read_time = 1000;                     /* 1000mS read delay            */
  sensor = 0;                           /* First sensor in list         */
  log_type = 1;                         /* Normal DigiTemp logfile      */
  sample_delay = 0;                     /* No delay                     */
  num_samples = 1;                      /* Only do it once by default   */

  /* Default log format string:                 */
  /* May 24 21:25:43 Sensor 0 C: 23.66 F: 74.59 */
  strcpy( log_format, "%b %d %H:%M:%S Sensor %s C: %.2C F: %.2F" );
  strcpy( conf_file, "digitemp.cfg" );
  
  optind = 1;
  opterr = 1;
  c = 0;
  
  // The Linux getopt returns -1 when complete, but AIX returns 255
#ifndef AIX
  while( c != -1 )
#else /* AIX */ 
  while( c != 255 )
#endif /* AIX */ 
  {
#ifndef DEMO
    c = getopt(argc, argv, "?hqwiavr:s:l:t:d:n:o:c:");
#else
    c = getopt(argc, argv, "?hwiavr:s:");
#endif /* DEMO */ 

    /* No more options, exit the loop */
#ifndef AIX
    if( c == -1 )
#else
    if( c == 255 )
#endif /* AIX */
      break;

    /* Process the command line arguments */
    switch( c )
    {
      case 'c': if(optarg)                      /* Configuration Filename */
                {
                  strncpy( conf_file, optarg, 1023 );
                }
                break;
    }
  }
  
  
  /*
     The configuration file should be overridden by command line
     arguments, but I need to process the command line arguments
     before I know where to read the configuration file from.
     
     Can I process the CL args for just the 'c' option first, then
     reset it for the second pass after processing the config file?
  
     Read the .digitemprc file first, then let the command line
     arguments override them. If no .digitemprc is found, set up for
     1 sensors (Increased by the SearchROM routine).

     Returns with global variables set and sensors in sensor_list
  */
  if( read_rcfile( conf_file, &sensor_list ) < 0 )
  {
    /* Fatal error reading .digitemprc, exit with an error code */
    exit(2);
  }

  /* Command line options override any .digitemprc options temporarily  */
  /* Unless the -i parameter is specified, then changes are saved to    */
  /* .digitemprc file                                                   */
  optind = 1;
  opterr = 1;
  opts = 0;
  c = 0;
#ifndef AIX
  while( c != -1 )
#else /* AIX */ 
  while( c != 255 )
#endif /* AIX */ 
  {
#ifndef DEMO
    c = getopt(argc, argv, "?hqwiavr:s:l:t:d:n:o:c:");
#else
    c = getopt(argc, argv, "?hwiavr:s:");
#endif /* DEMO */ 

    /* No more options, exit the loop and execute the functions */
#ifndef AIX
    if( c == -1 )
#else
    if( c == 255 )
#endif /* AIX */
      break;

    /* Process the command line arguments */
    switch( c )
    {
      case 'w': opts |= OPT_WALK;               /* Walk the LAN         */
                break;
    
      case 'i': opts |= OPT_INIT;               /* Initalize the s#'s   */
                break;
                
      case 'r': read_time = atoi(optarg);       /* Read delay in mS     */
                break;
                
      case 'v': opts |= OPT_VERBOSE;            /* Verbose              */
                break;

      case 's': if(optarg)                      /* Serial port          */
                {
                  serial_port = atoi(optarg);
                }
                break;
                
      case 'a': opts |= OPT_ALL;                /* Read All sensors     */
                break;

#ifndef DEMO
      case 'l': if(optarg)                      /* Log Filename         */
                {
                  strncpy( log_file, optarg, 1023 );
                }
                break;
                
      case 't': if(optarg)                      /* Single Sensor #      */
                {
                  sensor = atoi(optarg);
                  opts |= OPT_SINGLE;
                }
                break;

      case 'd': if(optarg)                      /* Sample Delay         */
                {
                  sample_delay = atoi(optarg);
                }
                break;

      case 'n': if(optarg)                      /* Number of samples    */
                {
                  num_samples = atoi(optarg);
                }
                break;

      case 'o': if(optarg)                      /* Logfile format       */
                {
                  if( isdigit( optarg[0] ) )
                  {
                    /* Its a number, get it */
                    log_type = atoi(optarg);
                  } else {
                    /* Not a nuber, get the string */
                    if( strlen( optarg ) > 79 )
                      printf("Output specifier too long!\n");
                    else
                      strncpy( log_format, optarg, 79 );
                    log_type=0;
                  }
                }
                break;
                
      case 'q': opts |= OPT_QUIET;
                break;
#endif /* DEMO */

      case ':':
      case 'h':
      case '?': usage();
                exit(3);
                break;
    
      default:  break;
    }
  }


  /* Need at least 1 action command */
  if( (opts & (OPT_WALK|OPT_INIT|OPT_SINGLE|OPT_ALL)) == 0 )
  {
    fprintf( stderr, "Need at least 1 action command, -w -a -i -t\n");

    if( sensor_list.roms != NULL )
      free( sensor_list.roms );

    free_coupler();
    return -1;
  }

  /* Show the copyright banner? */
  if( !(opts & OPT_QUIET) )
  {
    printf(BANNER_1);
    printf(BANNER_2);
  }

  /* Connect to the MLan network */
  sprintf( temp, "COM%d", serial_port );
  if( !owAcquire( 0, temp) )
  {
    /* Error connecting, print the error and exit */
    OWERROR_DUMP(stdout);
    exit(1);
  }


  /* Should we walk the whole LAN and display all devices? */
  if( opts & OPT_WALK )
  {
    Walk1Wire();

    if( sensor_list.roms != NULL )
      free( sensor_list.roms );

    if( coupler_top != NULL )
      free_coupler();

    owRelease(0);
    
    exit(0);
  }


  /* ------------------------------------------------------------------*/
  /* Should we initalize the sensors?                                  */
  /* This should store the serial numbers to the .digitemprc file      */
  if( opts & OPT_INIT )
  {
    if( Init1WireLan( &sensor_list ) != 0 )
    {
      if( sensor_list.roms != NULL )
        free( sensor_list.roms );

      if( coupler_top != NULL )
        free_coupler();

      /* Close the serial port */
      owRelease( 0 );

      exit(-1);
    }
  }


  
  /* Record the starting time */
  start_time = time(NULL);

  /* Sample the prescribed number of times */
  for( x = 0; x < num_samples; x++ )
  {
    last_time = time(NULL);
    elapsed_time = last_time - start_time;

    switch( log_type )
    {
      /* For this type of logging we print out the elapsed time at the
         start of the line
       */
      case 3:
      case 2:   sprintf(temp, "%ld", elapsed_time );
                log_string( temp );
                break;
      default:
                break;
    }

#ifndef DEMO
    /* Should we read just one sensor? */
    if( opts & OPT_SINGLE )
    {
      read_temp( &sensor_list, sensor, opts );
    }
#endif /* DEMO */
  
    /* Should we read all connected sensors? */
    if( opts & OPT_ALL )
    {
      read_all( &sensor_list, opts );
    }

    switch( log_type )
    {
      /* For this type of logging we print out the elapsed time at the
         start of the line
       */
      case 3:
      case 2:   log_string( "\n" );
                break;
      default:
                break;
    }
  
    /* Wait until we have passed last_time + sample_delay. We do it
       this way because reading the sensors takes a certain amount
       of time, and sample_delay may be less then the time needed
       to read all the sensors. We should complain about this.
    */
    if( (time(NULL) > (last_time + sample_delay)) && (sample_delay > 0) )
    {
      fprintf(stderr, "Warning: delay (-d) is less than the time needed to ");
      fprintf(stderr, "read all of the attached sensors. It took %ld seconds", (long int) time(NULL) - last_time );
      fprintf(stderr, " to read the sensors\n" );
    }

    /* Should we delay before the next sample? */
    if( sample_delay > 0 )
    {
      while( time(NULL) < (last_time + sample_delay) );
    }
  }

  if( sensor_list.roms != NULL )
    free( sensor_list.roms );

  free_coupler();

  /* Close the serial port */
  owRelease( 0 );
  
  exit(0);
}

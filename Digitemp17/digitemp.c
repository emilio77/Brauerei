/* -----------------------------------------------------------------------
   DigiTemp v1.7 for Windows
      
   Copyright 1996-2002 by Brian C. Lane <bcl@brianlane.com>
   All rights reserved.
   http://www.brianlane.com/digitemp.php

     digitemp -w                        Walk the LAN & show all
     digitemp -i                        Initalize digitemp.cfg file
     digitemp -s1                       Set serial port (required)
     digitemp -cdigitemp.conf           Configuration File
     digitemp -f5                       Set Fail timeout to 5 seconds
     digitemp -r500                     Set Read timeout to 500mS
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

     When passing log options from a DOS prompt the % needs to be a %% or else
     DOS will think it is passing a variable.

   =======================================================================
   03/18/2002   Cleaning up last bugs for release.
   bcl          x 1. Serial device example is from unix
                x 2. Is -f used? Is it useful in this version?
                x 3. Running without -i and without a cfg file it only
                     exits, it doesn't complain.

                Added some sanity checks and more verbose error info for
                startups without arguments.
                Removed -f, not used.

                Adding compile time DEMO selection. I will release a
                downloadable demo that has most of the options disabled.
                Full version, with source, will be emailed to paying
                customers.

   03/17/2002   Testing and cleanup. Adding some speedups, keep track of
   bcl          the last active coupler so we don't need to activate it
                for other sensors on the same branch. Works, but didn't
                speed things up as much as I had hoped.
                Tried creating a new routine called TouchFastBlock that
                writes out the whole string without reading response,
                but it doesn't work. I really need a scope to tell what
                is going on.
                

   03/16/2002   The problem was that when first exploring the 1-Wire net
   bcl          the couplers are in an unknown state. We must first go
                through and turn them all off.
                NOTE: DigiTemp will only work with DS2409 couplers on the
                main 1-wire lan, it will not work with couplers connected
                as children of couplers.

                Found a number of bugs in the read_temp routine. It appears
                that the DS2480 routines are offset by 1, but I never
                adjusted the verbose output, '20 and '22 calculations.
                Need to fix linux code.
                Need some '20 and '22 parts to test.

   03/14/2002   Converted the DS2480 search rom code over to passive 
   bcl          adapter to make porting digitemp 2.3 code over easier.
                Ended up implemeting my search function, just broken into
                pieces so it could be used with the hub. DS2480 code uses
                special search rom acceleration code, so it couldn't be
                used.

                Walking the network is working. That was harder than it
                ought to have been.
                Now to make the rest of it work.

            !!! There is a bug in the walk code that makes it show the
                couplers twice. Need to find this.
                At the end of the walk it accesses memory it shouldn't.

   03/13/2002   Adding Hub support code...
   bcl          

   03/12/2002   Connected the hub to this machine. 1 sensor and hub on
   bcl          the adapter, sensors on A main, weather on A aux and
                iButtons on B main.

                It only detects the 1 temperature sensor on the adapter.
                Now I need to add the hub support code and tree walking
                from the 2.3 Linux code.

                This version also needs to be changed.

                It looks like I changed to using a rom_list struct in the
                v1.6 code but didn't do this in the 2.3 code. I'll change
                the 2.3 code to use the new struct.

                It looks like it might be easier to just port the unix
                1-wire library to the passive adapter. There are a bunch
                of subroutines that the hub code depends on. I should be
                able to replace the lowest level code with my Touch*
                routines.
   
   03/11/2002   Something seems to be wrong with the logging options, it
   bcl          isn't producing the correct output when I try to use a
                custom log string.
                DOS interprets % as a variable being passed, the command
                line needs to use %% or edit digitemp.cfg directly.

   03/10/2002   Porting Linux v1.6 code over to Windows console mode.
   bcl          1. Need low level serial code.
                2. Need getopt replacement - I have a PD AT&T getopt.
                The SearchROM bits were backwards.
                It is now working, still needs more testing.

                Q. Is there a good reason for this thing to be so slow?
                A. Partly due to 1byte=1bit and delays in the serial read
                   write routines. I reduced them to 500mS which works for
                   me. Need to see if it works for others.

                Timing and counting is working.
                Log string parsing is not working correctly.
                Logging to a file is not working correctly when the log
                output is something other than the default.
                

   05/26/2001   Checking the DS18B20 support code. It looks like it is
                reading the wrong scratchpad values. They should be 0,1
                instead of 1,2. Multiple people have reported that this
                fixes problems they were having with the 18B20 parts.
                Time for a new release, but I should look at other one-
                wire temperature sensors and see what needs to be done
                to add support for them too. 

   05/07/2001   The bus reset on failure was at the bottom of the loop,
                so it wouldn't get called if the DS18S20 had a 85C error.
                I moved it to the top, this should fix any DS18S20
                problems.

   04/28/2001   Updating to include features and bugfixes added to v2.1
                codeset. Adding rrdb perl scripts to the rrdb directory.
                Integrating the AIX patch from Ewan Leith
                <ejl@man.fraser-williams.com>
                It amounts to return value checking on getopt and changes
                to the msDelay() routine.
                Adding DS1822 and DS18B20 changes from Roland Roberts
                <roland@astrofoto.org>
                Adding a command line option to specify the configuration
                file to use. -c config_file will override the default of
                .digitemprc

                Oops. It seems that I missed the line in the DS1820 
                datasheet that says Vdd needs to be tied to GND for
                Parasite power to work correctly.
                Various curses come to mind.
                The DS1820 works better than the DS18S20 with Vdd floating
                but this probably explains the infrequent glitches I
                saw before adding the DS18S20s.

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

                Changed the default read delay to 1 second so that people
                using the DS18S20 don't have read problems (hopefully)

                Adding -q to make the banner
                dissapear for batchfiles that want to get the output
                directly.

                The log string needed to be 0 terminated after parsing the
                tokens.

                Errors are now output to stderr so they can be filtered off
                if needed.

   12/29/99     Changing license to GNU Public License version 2
                Leaving the version number the same, no code changes.

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

                Changed version nuber to v1.3

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
#include <time.h>
#include <sys/timeb.h>
#include <string.h>
#include <windows.h>
#include "comport.h"
#include "digitemp.h"
#include "onewire.h"
#include "getopt.h"
#include "ownet.h"
#include "swt1f.h"
#include "device_name.h"

#define strncasecmp strnicmp

/* Show the arguments passed to main */
#undef DEBUG_ARGV

extern char     *optarg;              
extern int      optind, opterr, optopt;

char    log_file[1024],                         /* Path to logfile      */
        log_format[80],                         /* Format of logfile    */
        conf_file[1024];                        /* Configuration File   */

int     read_time,                              /* Pause during read    */
        log_type,                               /* output format type   */
        serial_port,                            /* Serial Port to use   */
        num_cs = 0;                             /* Number of sensors on cplr */

struct _coupler *coupler_top = NULL;            /* List of couplers     */

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
  printf("                -r500                         Read delay in mS\n");
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


/* --------------------------------------------------------------------------
   Description:
   Delay for at least 'len' ms
   -------------------------------------------------------------------------- */ 
void msDelay(int len)
{
  struct timeb now, later;
  
  /* Get the current time */
  ftime( &later );

  /* Add the time to wait */
  later.time += (len / 1000);
  later.millitm += (len % 1000);

  while( 1 )
  {
    ftime( &now );

    /* Is it finished yet? */
    if(    (now.time > later.time)
        || ((now.time == later.time) && (now.millitm > later.millitm)) )
    {
      return;
    }
  }
}

/* ----------------------------------------------------------------------- *
   Free up all memory used by the coupler list
 * ----------------------------------------------------------------------- */
void free_coupler()
{
//  unsigned char   a[3];
  struct _coupler *c;
  
  c = coupler_top;
  while(c)
  {
     /* Turn off the Coupler */
//     SetSwitch1F(hCom, c->SN, ALL_LINES_OFF, 0, a, TRUE);

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
    } /* if token (%) */
    /* Terminate the new string! */
    *tf_ptr = 0;
  } /* while lf_ptr */

  return 1;
}


/* -----------------------------------------------------------------------
   Print a string to the console or the logfile
   ----------------------------------------------------------------------- */
int log_string( char *line )
{
  FILE *fp;

  if( log_file[0] != 0 )
  {  
    if( (fp = fopen( log_file, "a" ) ) == NULL )
    {
      fprintf( stderr, "Error opening logfile: %s\n", log_file );
      return -1;
    }
    if( fwrite( line, strlen( line ), 1, fp ) == NULL)
      perror("Error loging to logfile");
    fclose( fp );
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
int read_temp( HANDLE *hCom, struct _roms *sensor_list, int sensor, int opts )
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
    owSerialNum( &sensor_list->roms[sensor*8], FALSE );
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
          if(!SetSwitch1F(hCom, c_ptr->SN, DIRECT_MAIN_ON, 0, a, TRUE))
          {
            printf("Setting Switch to Main ON state failed\n");
            return FALSE;
          }
          /* Remember the last selected coupler & Branch */
          memcpy( &Last2409, &c_ptr->SN, 8 );
          Last2409[8] = 0;
        }
        
        /* Select the sensor */
        owSerialNum( &c_ptr->main[s*8], FALSE );
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
            if(!SetSwitch1F(hCom, c_ptr->SN, AUXILARY_ON, 2, a, TRUE))
            {
              printf("Setting Switch to Aux ON state failed\n");
              return FALSE;
            }
            /* Remember the last selected coupler & Branch */
            memcpy( &Last2409, &c_ptr->SN, 8 );
            Last2409[8] = 1;
          } /* Last2409 check */

          /* Select the sensor */
          owSerialNum( &c_ptr->aux[s*8], FALSE );
          break;          
        }
      }
      s -= c_ptr->num_aux;
      c_ptr = c_ptr->next;
    }    
  }

  /* Get the Serial # selected */
  owSerialNum( &TempSN[0], TRUE );
  sensor_family = TempSN[0];
  
  x = 0;  
  ds1820_try = 0;
  ds18s20_try = 0;  
  
  for( try = 0; try < MAX_READ_TRIES; try++ )
  {
    MatchROM( hCom, &TempSN[0] );
    ReadTemperature( hCom, read_time );

    MatchROM( hCom, &TempSN[0] );
    if( ReadScratchpad( hCom, scratchpad ) == 0 )
    {
      /* Calculate the CRC 8 checksum on the received data */
      setcrc8(0);
      for( j = 0; j < 9; j++ )
        lastcrc8 = docrc8( scratchpad[j] );

      /* If the CRC8 is valid then calculate the temperature */            
      if( lastcrc8 == 0x00 )
      {
        /* DS1822 and DS18B20 use a different calculation */
        if( (sensor_family == DS18B20_FAMILY) ||
            (sensor_family == DS1822_FAMILY) )
        {
          short int temp = (scratchpad[1] << 8) | scratchpad[0];
          temp_c = temp / 16.0;
        }
            
        /* Handle the DS1820 and DS18S20 */
        if( sensor_family == DS1820_FAMILY )
        {
          /* Check for DS1820 glitch condition */
          /* COUNT_PER_C - COUNT_REMAIN == 1 */
          if( ds1820_try == 0 )
          {
            if( (scratchpad[6] - scratchpad[5]) == 1 )
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
            if( (scratchpad[3]==0xAA) &&
                (scratchpad[2]==0x00) &&
                (scratchpad[6]==0x0C) &&
                (scratchpad[7]==0x10)
              )
            {
              ds18s20_try = 1;
              continue;
            } /* DS18S20 error condition */
          } /* ds18s20_try */
          
          /* Convert data to temperature */
          if( scratchpad[1] == 0 )
          {
            temp_c = (int) scratchpad[0] >> 1;
          } else {
            temp_c = -1 * (int) (0x100-scratchpad[0]) >> 1;
          } /* Negative temp calculation */
          temp_c -= 0.25;
          hi_precision = (int) scratchpad[7] - (int) scratchpad[6];
          hi_precision = hi_precision / (int) scratchpad[7];
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
          if( log_file[0] != 0 )
          {
            switch( sensor_family )
            {
              case DS1820_FAMILY:
                sprintf( temp, "  Temperature   : 0x%02X\n", scratchpad[0] );
                sprintf( temp, "  Sign          : 0x%02X\n", scratchpad[1] );
                sprintf( temp, "  TH            : 0x%02X\n", scratchpad[2] );
                sprintf( temp, "  TL            : 0x%02X\n", scratchpad[3] );
                sprintf( temp, "  Remain        : 0x%02X\n", scratchpad[6] );
                sprintf( temp, "  Count Per C   : 0x%02X\n", scratchpad[7] );
                sprintf( temp, "  CRC           : 0x%02X\n", scratchpad[8] );
                break;

              case DS18B20_FAMILY:
              case DS1822_FAMILY:
                sprintf( temp, "  Temp. LSB     : 0x%02X\n", scratchpad[0] );
                sprintf( temp, "  Temp. MSB     : 0x%02X\n", scratchpad[1] );
                sprintf( temp, "  TH            : 0x%02X\n", scratchpad[2] );
                sprintf( temp, "  TL            : 0x%02X\n", scratchpad[3] );
                sprintf( temp, "  Config Reg.   : 0x%02X\n", scratchpad[4] );
                sprintf( temp, "  CRC           : 0x%02X\n", scratchpad[8] );
                break;
            } /* sensor_family switch */
          } else {
            switch( sensor_family )
            {
              case DS1820_FAMILY:
                printf("  Temperature   : 0x%02X\n", scratchpad[0] );
                printf("  Sign          : 0x%02X\n", scratchpad[1] );
                printf("  TH            : 0x%02X\n", scratchpad[2] );
                printf("  TL            : 0x%02X\n", scratchpad[3] );
                printf("  Remain        : 0x%02X\n", scratchpad[6] );
                printf("  Count Per C   : 0x%02X\n", scratchpad[7] );
                printf("  CRC           : 0x%02X\n", scratchpad[8] );
                break;

              case DS18B20_FAMILY:
              case DS1822_FAMILY:
                printf( "  Temp. LSB     : 0x%02X\n", scratchpad[0] );
                printf( "  Temp. MSB     : 0x%02X\n", scratchpad[1] );
                printf( "  TH            : 0x%02X\n", scratchpad[2] );
                printf( "  TL            : 0x%02X\n", scratchpad[3] );
                printf( "  Config Reg.   : 0x%02X\n", scratchpad[4] );
                printf( "  CRC           : 0x%02X\n", scratchpad[8] );
                break;

            } /* sensor_family switch */
          } /* if log_file */
        } /* if OPT_VERBOSE */

        /* Good conversion finished */
        return TRUE;
      } else {
        fprintf( stderr, "CRC Failed. CRC is %02X instead of 0x00\n", lastcrc8 );
      } /* CRC 8 is OK */
    } /* Scratchpad Read */
    
    /* Failed to read, rest the network, delay and try again */
    TouchReset( hCom );
    msDelay( read_time );
  } /* for try < 3 */
  
  /* Failed, no good reads after MAX_READ_TRIES */
  return FALSE;
}



/* -----------------------------------------------------------------------
   Read the temperaturess for all the connected sensors

   Step through all the sensors in the list of serial numbers
   ----------------------------------------------------------------------- */
int read_all( HANDLE *hCom, struct _roms *sensor_list, int opts )
{
  int x;
  
  for( x = 0; x <  (num_cs+sensor_list->max); x++ )
  {
    read_temp( hCom, sensor_list, x, opts );  
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
      if( ( sensor_list->roms = malloc( sensors * 8 ) ) == NULL )
      {
        fprintf( stderr, "Error reserving memory for %d sensors\n", sensors );
        return -1;
      }
      sensor_list->max = sensors;

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
int Walk1Wire( HANDLE *hCom )
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
  result = owFirst( hCom, TRUE, FALSE );
  while(result)
  {
    owSerialNum( TempSN, TRUE );
    printf(".");
    fflush(stdout);
    if( TempSN[0] == SWITCH_FAMILY )
    {
      /* Turn off the Coupler */
      if(!SetSwitch1F(hCom, TempSN, ALL_LINES_OFF, 0, InfoByte, TRUE))
      {
        printf("Setting Coupler to OFF state failed\n");

        if( coupler_list.roms != NULL )
          free( coupler_list.roms );

        return -1;
      }
    }
    result = owNext( hCom, TRUE, FALSE );
  } /* HUB search */
  printf("\n");
  
  /* Now we know all the couplers on the main LAN are off, we
     can now start mapping the 1-Wire LAN
   */
  printf("Devices on the Main LAN\n");
  result = owFirst( hCom, TRUE, FALSE );
  while(result)
  {
    owSerialNum( TempSN, TRUE );
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
      owSerialNum( &coupler_list.roms[(coupler_list.max-1)*8], TRUE );
        
      /* Turn off the Coupler */
      if(!SetSwitch1F(hCom, TempSN, ALL_LINES_OFF, 0, InfoByte, TRUE))
      {
        printf("Setting Switch to OFF state failed\n");

        if( coupler_list.roms != NULL )
          free( coupler_list.roms );

        return -1;
      }
    }
    result = owNext( hCom, TRUE, FALSE );
  } /* HUB search */
  printf("\n");

  /* If there were any 2409 Couplers present walk their trees too */
  if( coupler_list.max > 0 )
  {
    for(x = 0; x < coupler_list.max; x++ )
    {
      printf("\nDevices on Main Branch of Coupler : ");
      printSN( &coupler_list.roms[x*8], 1 );

      result = owBranchFirst( hCom, &coupler_list.roms[x * 8], FALSE, TRUE );
      while(result)
      {
        owSerialNum( TempSN, TRUE );

        /* Print the serial number */    
        printSN( TempSN, 0 );
        printf(" : %s\n", device_name( TempSN[0]) );

        result = owBranchNext(hCom, &coupler_list.roms[x * 8], FALSE, TRUE );
      } /* Main branch loop */
      printf("\n");

      printf("Devices on Aux Branch of Coupler : ");
      printSN( &coupler_list.roms[x*8], 1 );

      result = owBranchFirst( hCom, &coupler_list.roms[x * 8], FALSE, FALSE );
      while(result)
      {
        owSerialNum( TempSN, TRUE );

        /* Print the serial number */    
        printSN( TempSN, 0 );
        printf(" : %s\n", device_name( TempSN[0]) );

        result = owBranchNext(hCom, &coupler_list.roms[x * 8], FALSE, FALSE );
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
int Init1WireLan( HANDLE *hCom, struct _roms *sensor_list )
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
  result = owFirst( hCom, TRUE, FALSE );
  while(result)
  {
    owSerialNum( TempSN, TRUE );
    printf(".");
    fflush(stdout);
    if( TempSN[0] == SWITCH_FAMILY )
    {
      /* Turn off the Coupler */
      if(!SetSwitch1F(hCom, TempSN, ALL_LINES_OFF, 0, InfoByte, TRUE))
      {
        printf("Setting Coupler to OFF state failed\n");
        free_coupler();
        return -1;
      }
    }
    result = owNext( hCom, TRUE, FALSE );
  } /* HUB OFF search */ 
  printf("\n");
  
  printf("Searching the 1-Wire LAN\n");
  /* Find any DS2409 Couplers and turn them all off */
  result = owFirst( hCom, TRUE, FALSE );
  while(result)
  {
    owSerialNum( TempSN, TRUE );

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
      owSerialNum( &coupler_end->SN, TRUE );
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
      owSerialNum( &sensor_list->roms[(sensor_list->max-1)*8], TRUE );
    }
    result = owNext( hCom, TRUE, FALSE );
  }    

  /* Now go through each coupler branch and search there */
  c_ptr = coupler_top;
  while( c_ptr )
  {
    /* Search the Main branch */
    result = owBranchFirst( hCom, &c_ptr->SN, FALSE, TRUE );
    while(result)
    {
      owSerialNum( TempSN, TRUE );

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
        owSerialNum( &c_ptr->main[(c_ptr->num_main-1)*8], TRUE );
      } /* Add serial number to list */
        
      /* Find the next device on this branch */
      result = owBranchNext(hCom, &c_ptr->SN, FALSE, TRUE );
    } /* Main branch loop */
      
    /* Search the Aux branch */
    result = owBranchFirst( hCom, &c_ptr->SN, FALSE, FALSE );
    while(result)
    {
      owSerialNum( TempSN, TRUE );

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
        owSerialNum( &c_ptr->aux[(c_ptr->num_aux-1)*8], TRUE );
      } /* Add serial number to list */
        
      /* Find the next device on this branch */
      result = owBranchNext(hCom, &c_ptr->SN, FALSE, FALSE );
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
  int           sensor;                 /* Single sensor to read*/
  char          temp[80];               /* Temporary strings */
  int           opts;                   /* Bitmask of flags     */
  HANDLE        hCom;                   /* COM port handle */
  int           c;
  int           sample_delay = 0;       /* Delay between samples        */
  unsigned int  x,
                num_samples = 1;        /* Number of samples            */
  time_t        last_time,              /* Last time we started samples */
                start_time;             /* Starting time                */
  long int      elapsed_time;           /* Elapsed from start           */
  struct _roms  sensor_list;            /* Attached Roms                */

#ifdef DEBUG_ARGV
  for( x = 0; x < argc; x++ )
  {
    printf("argv[%d] = %s\n", x, argv[x] );
  }
#endif /* argv */

  /* Make sure the structure is erased */
  bzero( &sensor_list, sizeof( struct _roms ) );

  /* No arguments passed, tell the user how to use DigiTemp */
  if( argc == 1 )
  {
    usage();
    return -1;
  }

  /* Setup defaults */
  serial_port = 0;                      /* No default port              */
  log_file[0] = 0;                      /* No default log file          */
  read_time = 1000;                     /* 1S read delay                */
  sensor = 0;                           /* First sensor                 */
  log_type = 1;                         /* Normal DigiTemp logfile      */
  sample_delay = 0;                     /* No delay                     */
  num_samples = 1;                      /* Only do it once by default   */

  /* May 24 21:25:43 Sensor 0 C: 23.66 F: 74.59 */
  strcpy( log_format, "%b %d %H:%M:%S Sensor %s C: %.2C F: %.2F" );
  strcpy( conf_file, "digitemp.cfg" );

  optind = 1;
  opterr = 1;
  c = 0;   
  while( c != -1 )
  {
#ifndef DEMO
    c = getopt(argc, argv, "?hqwiavr:s:l:t:d:n:o:c:");
#else
    c = getopt(argc, argv, "?hwiavr:s:");
#endif /* DEMO */ 

    /* No more options, exit the loop */
    if( c == -1 )
      break;
 
    /* Process the command line arguments */
    switch( c )
    {
      case 'c': if(optarg)                    /* Configuration Filename */
                {
                  strncpy( conf_file, optarg, 1023 );
                }
                break;
    }
  } /* while c loop */
   

  /* Read the configuration file first, then let the command line
     arguments override them. If no digitemp.cfg is found, set up for
     1 sensors (Increased by the SearchROM routine).
  */
  if( read_rcfile( conf_file, &sensor_list ) < 0 )
  {
    /* Fatal error reading digitemp.cfg, exit with an error code */
    exit(2);
  }

  /* Command line options override any digitemp.cfg options temporarily  */
  optind = 1;
  opterr = 1;
  opts = 0;
  c = 0;
  while( c != -1 )
  {
#ifndef DEMO
    c = getopt(argc, argv, "?hqwiavr:s:l:t:d:n:o:c:");
#else
    c = getopt(argc, argv, "?hwiavr:s:");
#endif /* DEMO */ 

    /* No more options, bail out */
    if( c == -1 )
      break;

    /* Process the command line arguments */
    switch( c )
    {
      case 'w': opts |= OPT_WALK;                       /* Walk the LAN         */
                break;
                        
      case 'i': opts |= OPT_INIT;                       /* Initalize the s#'s   */
                break;
                
      case 'r': read_time = atoi(optarg);       /* Read delay in mS     */
                break;
                
//      case 'f': fail_time = atoi(optarg);       /* Fail delay in S      */
//                break;
                
      case 'v': opts |= OPT_VERBOSE;                    /* Verbose              */
                break;
                
      case 's': if(optarg)                      /* Serial port          */
                {
                  serial_port = atoi( optarg );
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
                
      case 't': if(optarg)                      /* Sensor #             */
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
                    if( log_type > 3 )
                    {
                      fprintf( stderr, "Unrecognized log level %d, defaulting to 1\n", log_type );
                    }
                  } else {
                    /* Not a nuber, get the string */
                    if( strlen( optarg ) > 79 )
                      fprintf( stderr, "Output specifier too long!\n");
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

  if( serial_port == 0 )
  {
    fprintf( stderr, "Error, no configuration file found, or no serial port specified\n");

    if( sensor_list.roms != NULL )
      free( sensor_list.roms );

    free_coupler();
    return -1;
  }

  /* Initalize the serial interface to the DS1820 */
  if( !Setup( &hCom, serial_port ) )
  {
    fprintf( stderr, "Error initalizing COM%d\n", serial_port );
    exit(4);
  }


  /* Should we walk the whole LAN and display all devices? */
  if( opts & OPT_WALK )
  {
    Walk1Wire( &hCom );

    if( sensor_list.roms != NULL )
      free( sensor_list.roms );

    if( coupler_top != NULL )
      free_coupler();

    /* Close the serial port */
    ComClose( &hCom );

    exit(0);
  }


  /* First, should we initalize the sensors? */
  /* This should store the serial numbers to the digitemp.cfg file */
  if( opts & OPT_INIT )
  {
    if( Init1WireLan( &hCom, &sensor_list ) != 0 )
    {
      if( sensor_list.roms != NULL )
        free( sensor_list.roms );

      if( coupler_top != NULL )
        free_coupler();

      /* Close the serial port */
      ComClose( &hCom );

      exit(-1);
    }
  }

  /* Make sure we have some sensors to read */
  if( (sensor_list.roms == NULL) && (coupler_top == NULL) )
  {
    fprintf(stderr, "No sensors found! Try running with -i or -w\n");

    if( sensor_list.roms != NULL )
      free( sensor_list.roms );

    if( coupler_top != NULL )
      free_coupler();

    /* Close the serial port */
    ComClose( &hCom );

    exit(-1);
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
      read_temp( &hCom, &sensor_list, sensor, opts );
    }
#endif /* DEMO */
  
    /* Should we read all connected sensors? */
    if( opts & OPT_ALL )
    {
      read_all( &hCom, &sensor_list, opts );
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
  ComClose( &hCom );
  
  exit(0);
}


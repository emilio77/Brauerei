----------------------------------------------------------------------------
  DigiTemp v2.5 for Windows                  (c)1996-2002 by Brian C. Lane
============================================================================

  Thank you for using DigiTemp for Windows. If you have any problems or
suggestions please feel free to contact me at bcl@brianlane.com You
can get the latest information by pointing your web browser at
http://www.brianlane.com/ or by logging into the help forum section of my
website.


  04/10/2002 v2.5 bugfixes
  ------------------------
  This version returns to using BREAK to reset the DS9097U, and it fixes an
error with the wrong family code for the DS1822 sensors. 


  04/01/2002 v2.4 with DS2409 hub support added
  ---------------------------------------------
  This is the first release of DigiTemp for Windows that supports the 
DS9097U-009 adapters. It includes HUB support, and comes in a DEMO version
with limited capabilited and a REGISTERED version for $10.

NOTE:

  Because of the way the passive adapter works it will not be able to read
temperatures above about +70C, even though the DS1820 is designed to work up
to +125C. This is because of the power requirements for reading higher
temperatures and the voltage drop across the resistor in the simple circuit
that the passive adapter uses. This may vary from serial port to serial port.
If you need higher temperature readins you should be using the DS9097-U
adapter.


  Quick Setup
  -----------

  If you are like me you want to just plug it in and run it, right? Ok,
follow these steps to start reading temperatures:

  1. Find a free serial port on your system (I'll use COM1 in these
     examples).

  2. Plug your passive adapter into the connector if you haven't already.

  3. Initialize the digitemp.cfg file with the following command:

    digitemp -s1 -i

    You should see a response like this:
    
    DigiTemp v2.4 [DEMO] Copyright 1996-2002 by Brian C. Lane
    All Rights Reserved - http://www.brianlane.com
    
    Turning off all DS2409 Couplers
    ....
    Searching the 1-Wire LAN
    1F881D01000000ED : DS2409 MicroLAN Coupler
    1FB03001000000B5 : DS2409 MicroLAN Coupler
    1F404301000000E4 : DS2409 MicroLAN Coupler
    10F2A215000000EE : DS1820 Temperature Sensor
    10575A050008008F : DS1820 Temperature Sensor
    10B95E05000800AA : DS1820 Temperature Sensor
    10E8A00E00000055 : DS1820 Temperature Sensor
    10A8574000000022 : DS1820 Temperature Sensor
    ROM #0 : 10F2A215000000EE
    ROM #1 : 10575A050008008F
    ROM #2 : 10B95E05000800AA
    ROM #3 : 10E8A00E00000055
    ROM #4 : 10A8574000000022
    
    The ROM numbers for your sensors will be different of course, and if you
    don't have any couplers you won't see them either.

    The digitemp.cfg file is saved in the current directory so that you can
    have multiple configurations. You can select the configuration file using
    the -c command in the registered version of DigiTemp for Windows.

 4. Read temperatures with this command:

    digitemp -a

    You should see something like this:
    
    DigiTemp v2.4 [REGISTERED] Copyright 1996-2002 by Brian C. Lane
    All Rights Reserved - http://www.brianlane.com
    
    Mar 20 07:50:31 Sensor 0 C: 23.76 F: 74.77
    Mar 20 07:50:37 Sensor 1 C: 26.44 F: 79.59
    Mar 20 07:50:41 Sensor 2 C: 3.25 F: 37.85
    Mar 20 07:50:46 Sensor 3 C: 24.11 F: 75.40
    Mar 20 07:50:52 Sensor 4 C: -3.92 F: 24.95
    
 5. If it doesn't work, try running the initialization again.
    Make sure you have the right serial port and that it works, try
    plugging a known working modem into the port. If all else fails,
    email me! 

    Also make sure the user running digitemp has permission to access the
    serial port you are using.
    
    You can also use the -w command to walk the whole 1-wire lan and 
    identify all the attached devices. If walking the tree doesn't work
    then there may be something wrong with your adapter (especially if
    you built it yourself -- double check the diode directions).

 6. Read the rest of this document to learn how to log data to a file and
    use the extra options like custom log format.


  Overview
  --------

  When DigiTemp initializes it stores the serial port and serial numbers
into a file called digitemp.cfg in the current directory. It reads this file
to set the default options when run. The command line arguments can be used
to override the settings in digitemp.cfg temporarily. You can select a
different configuration file using the -c command (only available in the
registered version).


  DEMO Version
  ------------
  
  This version (v2.4) is my first release of a publicly available limited
demonstration program instead of the full program. The DEMO only allows 
you to walk the 1-wire LAN, initalize the digitemp.cfg file (100% 
compatible with the registered version), and read all temperature sensors.
The advanced commands, like reading multiple times, logging to a file, etc.
are only available in the registered version.

  The full registered version, including source, is available from my
website at http://www.brianlane.com/digitemp.php for $10.00 or you can
mail me a check, money order, cash at:

    Nexus Computing
    4208 Kellum Ranch Rd. NW
    Bremerton, Wa 98312
    Please make checks payable to Nexus Computing

  Please include your email address so that I can contact you with download
instructions for the registered version.

  This manual covers the full version of DigiTemp. If you find an option
that doesn't work in the demo you can be sure that it will be available in
the registered version.


  Command Summary
  ---------------
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
     2 = Reading in C - 1 line for each sample time, all sensors, tabbed
     3 = Reading in F - 1 line for each sample time, all sensors, tabbed

     The format string uses strftime tokens plus 3 special
     ones for digitemp - %s for sensor #, %C for centigrage,
     %F for fahrenheight.

     When passing log options from a DOS prompt the % needs to be a %% or
     else DOS will think it is passing a variable.


  Temperature Reading
  -------------------
  
  There are two commands for reading temperatures. The -a command reads all
of the attached sensors. The -t command reads the temperature from a single
attached sensor. Pass the index of the sensor to read (0 to #of sensors) to
read that 1 sensor:

  digitemp -t2

  DigiTemp v2.4 [REGISTERED] Copyright 1996-2002 by Brian C. Lane
  All Rights Reserved - http://www.brianlane.com

  Mar 20 08:32:06 Sensor 2 C: 3.69 F: 38.64


  Temperature Logging
  -------------------

  To log temperatures to a logfile instead of to the console you use the
-l command line option. 

  digitemp -a -ltemp.log
  The format of the data to be written to the logfile can be controlled in
several ways. The default is to use a format specifier string that outputs
a line of data like: Dec 29 20:52:29 Sensor 1 C: 1.70 F: 35.06

  The -o argument is used to change this. Using -o1 or -o2 will output all
the sensor readings on a single line like this:

0       23.22   1.33    12.69

  The first number is the elapsed time (see timing, below) and the rest are
the sensor readings, for all of the sensors on your lan, separated by tabs.
This makes it easy to import the data into a spreadsheet program. The data
is output in Centigrade when -o2 is used and Fahrenheit when -o3 is used.

  The other option is to use a format specifier string. To do this you pass
the string as the argument to -o, like this:

  -o"%%b %%d %%H:%%M:%%S Sensor %%s C: %%.2C F: %%.2F"

  The specifiers are the same as those used for the strftime function, with
the addition of three special ones. %%s for the sensor number, %%C for the
temperature in Centigrade and %%F for the temperature in Fahrenheit. 

  Thereason that these have %% is that DOS will attempt to interpret the
variable if only %F is passed. %% inserts a literal % into the string
being passed to digitemp.

  strftime specifiers used by log format string:
  
  %%a   Abbreviated weeekday name
  %%A   Full weekday name
  %%b   Abbreviated month name
  %%B   Full month name
  %%c   Standard date and time string
  %%d   Day of month as decimal (1-31)
  %%H   Hour in 24 hour format (0-23)
  %%I   Hour in 12 hour format (1-12)
  %%j   Day of year as decimal (1-366)
  %%m   Month as decimal (1-12)
  %%M   Minute as decimal (0-59)
  %%p   Locale's equivalent of AM or PM
  %%S   Second as decimal (0-59)
  %%U   Week of year, with Sunday as first day (0-52)
  %%w   Weekday as decimal (0-6 with Sunday as 0)
  %%W   Week of year, with Monday as first day (0-52)
  %%x   Standard Date string
  %%X   Standard Time string
  %%y   Year in decimal without century (00-99)
  %%Y   Year including century as decimal
  %%Z   Timezone name
  

  Timing
  ------

    The Read timeout is the amount of time for DigiTemp to pause after
issuing a temperature conversion command before it reads the temperature
(it takes the DS1820 as much as 750mS to do the conversion and make the
temperature available to DigiTemp). The default value for this is 1000mS.
The Read timeout can be set by issuing the following command:

    digitemp -r1500      Set Read timeout to 500mS
    digitemp -i -r1500   Set Read timeout to 500mS and save to digitemp.cfg

    If you don't specify either of these parameters then they are set to the
defaults. If Read timeout is set too short the temperature will not be read
correctly. The shortest I can set it with my sensors is 300mS before they 
fail.

  The DS18S20 has a longer conversion time than the old DS1820, but it has
a more stable temperature reading. All new DS1820 sensors sold by 
Dallas/Maxim are DS18S20, even though they are labeled as DS1820. The old 
ones look like a tall TO-92 transistor, the DS18S20 looks like a regular 
sized TO-92 transistor.


Repeated Temperature Sampling
-----------------------------

  You can setup a script to repeatedly call DigiTemp and process its output,
or you can setup DigiTemp to repeatedly sample the sensors and output the
data in one of the logfile formats specified in the 'Temperature Logging'
section of this document.

  -dx   This sets the sample interval. x is a number in seconds.
        -d5 will sample at 5 second intervals. The number of sensors
        that you have attached will determine the minimum interval that
        you can use. It can take as long as 5 seconds to sample each
        sensor attached, so if you have 6 sensors you will probably have
        a minimum sample interval of 30 seconds. The program will tell you
        when the sampling process has taken longer than the interval you
        have specified so that you can adjust it accordingly. The time to
        read a sensor depends where it is on the LAN, sensors on a HUB
        will take longer to read because the correct HUB branch needs to
        be selected first.

  -nx   This sets the number of times to sample all the specified sensors.
        -n10 will sample 10 times.

  The output can be sent to a file by using the -lfilename.txt options. So
to log data every 10 seconds for 30 minutes you would run DigiTemp to sample
every 10 seconds for a count of 180 (10 x 180 = 1800 seconds = 3 minutes) 
like this:

    digitemp -a -d10 -n180 -o2 -ldata1.txt

  This outputs the data as tab separated Centigrade readings to a file named
data1.txt in the current directory.


  Configuration File Selection
  ----------------------------
  
  By default DigiTemp will use the digitemp.cfg file in the current 
directory, but a different file can be specified using the -c argument
passed to DigiTemp when you run it:

  digitemp -i -s1 -cotherdt.cfg

  This will initalize the network and write the configuration to the
otherdt.cfg file in the current directory.


  Walking the 1-Wire LAN
  ----------------------
  
  This version features a new option, walking the lan. Run digitemp with the
-w argument and digitemp will display the serial number of all the connected
devices and a short description of the type of device that it is.


  Quiet output
  ------------
  
  When running digitemp from scripts it is useful to silence the copyright
banner. this can be done by passing the -q command.


  Contact
  -------

  Thank you for using Digitemp,

  If you have any comments, questions, or scripts that you would like to
donate, drop me an email, and I'll set up a ftp directory for user
contributions. You can communicate with other DigiTemp users on the support
forum section of my webpage at http://www.brianlane.com/forums

    Brian Lane
    bcl@brianlane.com
    http://www.brianlane.com


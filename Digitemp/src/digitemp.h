/* -----------------------------------------------------------------------
   DigiTemp v2.5

   Copyright 1996-2002 by Brian C. Lane <bcl@brianlane.com>
   All Rights Reserved

   ----------------------------------------------------------------------- */
/* Define this to generate a demo allowing only iwasrv commands */
#undef DEMO

#ifndef DEMO
#define BANNER_1     "DigiTemp v2.5 [REGISTERED] Copyright 1996-2002 by Brian C. Lane\n"
#define BANNER_2     "All Rights Reserved - http://www.brianlane.com\n\n"
#else
#define BANNER_1     "DigiTemp v2.5 [DEMO] Copyright 1996-2002 by Brian C. Lane\n"
#define BANNER_2     "All Rights Reserved - http://www.brianlane.com\n\n"
#endif

#define OPT_INIT     0x0001
#define OPT_VERBOSE  0x0002
#define OPT_SINGLE   0x0004
#define OPT_ALL      0x0008
#define OPT_QUIET    0x0010
#define OPT_WALK     0x0020


/* Dallas iButton family for the DS1820 */
#define DS1820_FAMILY   0x10
#define DS1822_FAMILY   0x22
#define DS18B20_FAMILY  0x28

/* Coupler related definitions */
#define SWITCH_FAMILY      0x1F
#define MAXDEVICES         15
#define ALL_LINES_OFF      0
#define DIRECT_MAIN_ON     1
#define AUXILARY_ON        2
#define STATUS_RW          3



/* Number of tries to read a sensor before giving up */
#define MAX_READ_TRIES  3

struct _roms {
        unsigned char   *roms;                  /* Array of 8 bytes     */
        int             max;                    /* Maximum number       */
};

struct _coupler {
  unsigned char SN[8];                  /* Serial # of this Coupler */
  unsigned int num_main;                /* # of devices on main */
  unsigned int num_aux;                 /* # of devices on aux */
  
  unsigned char *main;                  /* Array of 8 byte serial nums */
  unsigned char *aux;                   /* Array of 8 byte serial nums */
  
  struct _coupler *next;
};


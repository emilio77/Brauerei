/* -----------------------------------------------------------------------
   COM port routines for Windows
   Copyright 1997-2002 by Brian C. Lane <bcl@brianlane.com>
   All Rights Reserved
   http://www.brianlane.com/digitemp.php   

   =======================================================================
   03/10/2002  Cleaning up this code. Building a new Windows DigiTemp 
   bcl         release.
   ----------------------------------------------------------------------- */
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <windows.h>
#include "comport.h"
    

/* =======================================================================
   Open the com port

   Returns 1 if it was opened OK and hCom has the HANDLE to the port
   Returns -1 if there was an error
   ======================================================================= */
int ComOpen(HANDLE *hCom, int port, unsigned long baud, int bits, char parity,
                     int stop, long rtout, long wtout)
{
   char fname[32];

   /* Create the filename to open */
   sprintf(fname, "COM%d", port);

   /* Create the file */
   *hCom = CreateFile(
        fname,                      /* File ro device to open */
        GENERIC_READ|GENERIC_WRITE, /* Open it in R/W mode */
        0,                          /* Don't share the file */
        NULL,                       
        OPEN_EXISTING,              /* Must already exist, its a device */
        FILE_ATTRIBUTE_NORMAL,      /* Normal attributes */
        NULL);                      

   /* check to make sure it was created OK */
   if (*hCom == INVALID_HANDLE_VALUE)
   {
      return -1;
   }

   /* Set the com port's parameters */
   if (!SetCom(hCom, baud, bits, parity, stop, rtout, wtout))
   {
      ComClose(hCom);
      return -1;
   }

   /* Everythign went ok */
   return 1;
}


/* =======================================================================
   If the COM port is open, then close it and set handle to invalid
   ======================================================================= */
void ComClose( HANDLE *hCom )
{
  if (*hCom == INVALID_HANDLE_VALUE)
    return;
  CloseHandle(*hCom);
  *hCom = INVALID_HANDLE_VALUE;
}


/* =======================================================================
   Initalize the COM port usage, take the parameters and set them using
   the

   Returns 1 if everything was setup OK
   Returns -1 if there was a problem
   ======================================================================= */
int SetCom(HANDLE *hCom, unsigned long baud, int bits, char parity, int stop,
                                long rtout, long wtout)
{
  char         tBuf[256];      /* Buffer for settings string */
  DCB          dcb;             /* Device-control Block */
  COMMTIMEOUTS ct;              /* R/W timeout settings */

  /* Create a string with the desired settings */
  sprintf( tBuf, "baud=%lu data=%d parity=%c stop=%d",baud,bits,parity,stop);

  /* Get the current state of the serial port, return an error on failure */
  if (!GetCommState(*hCom, &dcb))
  {
     return -1;
  }

  /* Load the DSB with the parameters from the string we created */
  if( !BuildCommDCB(tBuf, &dcb) )
  {
     return -1;
  }

  /* Setup for no buffering, binary mode with DCD on */
  dcb.fOutX = dcb.fInX = 0;
  dcb.fNull = 0;
  dcb.fBinary = 1;
  dcb.fDtrControl = DTR_CONTROL_ENABLE;         /* Power the 1-Ware LAN */

  /* Set the parameters */
  if (!SetCommState(*hCom, &dcb))
  {
    return -1;
  }

  /* Setup the timing */
  ct.ReadIntervalTimeout = MAXDWORD;
  ct.ReadTotalTimeoutMultiplier = MAXDWORD;
  ct.ReadTotalTimeoutConstant = rtout;
  ct.WriteTotalTimeoutMultiplier = 0;
  ct.WriteTotalTimeoutConstant = wtout;

  /* Set the timing */
  if (!SetCommTimeouts(*hCom, &ct))
  {
    return -1;
  }

  return 1;
}


/* =======================================================================
   Write a buffer to the COM port 
   ======================================================================= */
long ComWriteStr(HANDLE *hCom, char *buf, int len)
{
  DWORD  bytes;
   
  if( WriteFile(*hCom, buf, (DWORD)len, &bytes, NULL) )
  {
    return bytes;
  }
  return -1L;
}

    
/* =======================================================================
   Read 'len' data from the COM port
   Returns the data in buf
   Returns the number of bytes read or -1 if there was an error.
   ======================================================================= */
long ComReadStr(HANDLE *hCom, char *buf, int len)
{
  DWORD        bytes;

  /* Read len bytes from the serial port */
  if( ReadFile(*hCom, buf, (DWORD)len, &bytes, NULL) )
  {
    return bytes;
  }
  return -1L;
}



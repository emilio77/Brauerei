//---------------------------------------------------------------------------
// Copyright (C) 2000 Dallas Semiconductor Corporation, All Rights Reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY,  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL DALLAS SEMICONDUCTOR BE LIABLE FOR ANY CLAIM, DAMAGES
// OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//
// Except as contained in this notice, the name of Dallas Semiconductor
// shall not be used except as stated in the Dallas Semiconductor
// Branding Policy.
//---------------------------------------------------------------------------
//
//  owNetU.C - Network functions for 1-Wire Net devices
//             using the DS2480/DS2480B (U) serial interface chip.
//
//  Version: 2.01
//
//           1.02 -> 1.03  Removed caps in #includes for Linux capatibility
//           1.03 -> 2.00  Changed 'MLan' to 'ow'. Added support for
//                         multiple ports.
//          2.00 -> 2.01 Added error handling. Added circular-include check.
//          2.01 -> 2.10 Added raw memory error handling and SMALLINT
//          2.10 -> 3.00 Added memory bank functionality
//                       Added file I/O operations
/* --------------------------------------------------------------------------
   03/16/2002   Tracking down double detection bug.
   bcl

   03/14/2002   Trying to get this wrapped up today.
   bcl          Mostly working. Has a bug where it will sometimes detect
                The couplers a second time.

   03/13/2002   Removing the DS2480 specific commands from the search rom
   bcl          functions so that they will work with the passive adapter.
                Removing multiple port handling capability. Single COM port
                only.

 * -------------------------------------------------------------------------- */

#include <windows.h>
#include "ownet.h"
#include "onewire.h"

// external functions defined in owllu.c
//extern SMALLINT owTouchReset(int);
//extern SMALLINT owTouchBit(int,SMALLINT);
//extern SMALLINT owWriteByte(int,SMALLINT);
//extern SMALLINT owReadByte(int);
//extern SMALLINT owSpeed(int,SMALLINT);
//extern SMALLINT owLevel(int,SMALLINT);

// external functions defined in owltrnu.c
//extern SMALLINT owBlock(int,SMALLINT,uchar *,SMALLINT);

// external COM functions defined in system specific link file
//extern SMALLINT WriteCOM(int,int,uchar *);
//extern int      ReadCOM(int,int,uchar *);
//extern void     FlushCOM(int);

// external functions defined in ds2480ut.c
//extern SMALLINT DS2480Detect(int);

// external functions defined in crcutil.c
//extern void setcrc8(int,uchar);
//extern uchar docrc8(int,uchar);


// global variables for this module to hold search state information
static uchar LastDevice;
uchar SerialNum[8];
uchar Unknown[8];               /* Keep track of branches in ROM Search */

// external globals
//extern int UMode[MAX_PORTNUM];
//extern uchar USpeed[MAX_PORTNUM];

//--------------------------------------------------------------------------
// The 'owFirst' finds the first device on the 1-Wire Net  This function
// contains one parameter 'alarm_only'.  When
// 'alarm_only' is TRUE (1) the find alarm command 0xEC is
// sent instead of the normal search command 0xF0.
// Using the find alarm command 0xEC will limit the search to only
// 1-Wire devices that are in an 'alarm' state.
//
// 'portnum'    - number 0 to MAX_PORTNUM-1.  This number is provided to
//                indicate the symbolic port number.
// 'do_reset'   - TRUE (1) perform reset before search, FALSE (0) do not
//                perform reset before search.
// 'alarm_only' - TRUE (1) the find alarm command 0xEC is
//                sent instead of the normal search command 0xF0
//
// Returns:   TRUE (1) : when a 1-Wire device was found and it's
//                       Serial Number placed in the global SerialNum
//            FALSE (0): There are no devices on the 1-Wire Net.
//
SMALLINT owFirst(HANDLE *hCom, SMALLINT do_reset, SMALLINT alarm_only)
{
  int x;
  
  // reset the search state
  LastDevice = FALSE;

  /* Initalize the unknown bits array */
  for( x = 0; x < 8; x++ )
    Unknown[x] = 0xFF;

  return owNext(hCom, do_reset, alarm_only);
}

//--------------------------------------------------------------------------
// The 'owNext' function does a general search.  This function
// continues from the previos search state. The search state
// can be reset by using the 'owFirst' function.
// This function contains one parameter 'alarm_only'.
// When 'alarm_only' is TRUE (1) the find alarm command
// 0xEC is sent instead of the normal search command 0xF0.
// Using the find alarm command 0xEC will limit the search to only
// 1-Wire devices that are in an 'alarm' state.
//
// 'portnum'    - number 0 to MAX_PORTNUM-1.  This number was provided to
//                OpenCOM to indicate the port number.
// 'do_reset'   - TRUE (1) perform reset before search, FALSE (0) do not
//                perform reset before search.
// 'alarm_only' - TRUE (1) the find alarm command 0xEC is
//                sent instead of the normal search command 0xF0
//
// Returns:   TRUE (1) : when a 1-Wire device was found and it's
//                       Serial Number placed in the global SerialNum
//            FALSE (0): when no new device was found.  Either the
//                       last search was the last device or there
//                       are no devices on the 1-Wire Net.
//
SMALLINT owNext(HANDLE *hCom, SMALLINT do_reset, SMALLINT alarm_only)
{
   int done=-1;
   uchar tmp_serial_num[8];
   uchar i, j;
   uchar lastcrc8;
   uchar bits;

   // if the last call was the last one
   if (LastDevice)
   {
      // reset the search
      LastDevice = FALSE;
      return FALSE;
   }

   // check if reset first is requested
   if (do_reset)
   {
      // reset the 1-wire
      // if there are no parts on 1-wire, return FALSE
      switch (TouchReset(hCom))
      {
        case 0:
        case 3:
        case 4:
         // reset the search
         OWERROR(OWERROR_NO_DEVICES_ON_NET);
         return FALSE;
      }
   }

   // search command
   if( alarm_only )
   {
     TouchByte( hCom, 0xEC );
   } else {
     TouchByte( hCom, 0xF0 );     /* ROM Search Command           */
   }

#ifdef DEBUG_UNKNOWN
   /* Diagnostic -- output Unknown before and after */
   printf("1:");
   for(i = 0; i < 64; i++ )
   {
     printf("%d", bitacc( READ_FUNCTION,0,i,&Unknown[0] ) );
   }
   printf("\n");
#endif /* DEBUG_UNKNOWN */

   /* Find the serial number for one ROM */
   for( i = 0; i < 64; i++ )
   {
     /* Read 2 bits from the devices */
     bits = TouchBits( hCom, 2, 0xFF );

     switch( bits & 0x03 )
     {
       case 0x00 :  /* Unknown bit at this point. If Unknown reg.   */
                    /* has a 1 then write a 1 to the DS and 1 to SN */
                    /* If Unknown has a zero then write 0 to SN     */

                    if( bitacc(READ_FUNCTION,0,i,&Unknown[0]) )
                    {
                      TouchBits( hCom, 1, 0xFF );
                      bitacc(WRITE_FUNCTION,1,i,&tmp_serial_num[0]);
                    } else {
                      TouchBits( hCom, 1, 0x00 );
                      bitacc(WRITE_FUNCTION,0,i,&tmp_serial_num[0]);
                    }
                    break;

       case 0x01 :  /* All have a 1 bit in this position */
                    TouchBits( hCom, 1, 0xFF );
                    bitacc(WRITE_FUNCTION,1,i,&tmp_serial_num[0]);

                    /* Flag that we know the state of this bit */
                    bitacc(WRITE_FUNCTION,0,i,&Unknown[0]);
                    break;
                    
       case 0x02 :  /* All have a 0 bit in this position */
                    TouchBits( hCom, 1, 0x00 );
                    bitacc(WRITE_FUNCTION,0,i,&tmp_serial_num[0]);

                    /* Flag that we know the state of this bit */
                    bitacc(WRITE_FUNCTION,0,i,&Unknown[0]);
                    break;
                    
       case 0x03 :  /* Error, nothing is connected! */
                    return -1;
                    break;
                             
       default   :  /* Major malfunction! */
                    break;
     } /* switch */
   } /* for i */

   /* At this point the Unknown array has 1's at the points where there
      are branches in ROM tree.
      
      Adjust the unknown array, clear the rightmost 1 and fill the
      remainder with 1's (to the right of the 1 bit)
    */

#ifdef DEBUG_UNKNOWN
   /* Diagnostic -- output Unknown before and after */
   printf("1:");
   for(i = 0; i < 64; i++ )
   {
     printf("%d", bitacc( READ_FUNCTION,0,i,&Unknown[0] ) );
   }
   printf("\n");
#endif /* DEBUG_UNKNOWN */
   
   /* Fill with 1's up to right most 1 and clear it */
   for( i = 0; i < 64; i++ )
   {
     if( bitacc( READ_FUNCTION,0,63-i,&Unknown[0]) == 0 )
     {
       /* Fill with 1's  */
       bitacc( WRITE_FUNCTION,1,63-i,&Unknown[0]);
     } else {
       /* Clear rightmost 1 */
       bitacc( WRITE_FUNCTION,0,63-i,&Unknown[0]);
       done = 0;                        /* Not done yet */
       break;                           /* Quit the loop */
     }
   }

#ifdef DEBUG_UNKNOWN
   /* Diagnostic -- output Unknown before and after */
   printf("1:");
   for(i = 0; i < 64; i++ )
   {
     printf("%d", bitacc( READ_FUNCTION,0,i,&Unknown[0] ) );
   }
   printf("\n");
#endif /* DEBUG_UNKNOWN */   

   /* Check to see if the serial number is valid */
   setcrc8(0);
   for (i = 0; i < 8; i++)
     lastcrc8 = docrc8(tmp_serial_num[i]);

   // check results
   if ((lastcrc8 != 0) || (tmp_serial_num[0] == 0))
   {
     // error during search
     // reset the search
     LastDevice = FALSE;
     OWERROR(OWERROR_SEARCH_ERROR);

// Diagnostic
printf("Error, bad CRC\n");
     return FALSE;
   } else {
     // successful search
     // check for lastone
     if (done == -1)
       LastDevice = TRUE;

     // copy the SerialNum to the buffer
     for (i = 0; i < 8; i++)
       SerialNum[i] = tmp_serial_num[i];

     return TRUE;
   }
}

//--------------------------------------------------------------------------
// The 'owSerialNum' function either reads or sets the SerialNum buffer
// that is used in the search functions 'owFirst' and 'owNext'.
// This function contains two parameters, 'serialnum_buf' is a pointer
// to a buffer provided by the caller.  'serialnum_buf' should point to
// an array of 8 unsigned chars.  The second parameter is a flag called
// 'do_read' that is TRUE (1) if the operation is to read and FALSE
// (0) if the operation is to set the internal SerialNum buffer from
// the data in the provided buffer.
//
// 'portnum'       - number 0 to MAX_PORTNUM-1.  This number was provided to
//                   OpenCOM to indicate the port number.
// 'serialnum_buf' - buffer to that contains the serial number to set
//                   when do_read = FALSE (0) and buffer to get the serial
//                   number when do_read = TRUE (1).
// 'do_read'       - flag to indicate reading (1) or setting (0) the current
//                   serial number.
//
void owSerialNum(uchar *serialnum_buf, SMALLINT do_read)
{
   uchar i;

   // read the internal buffer and place in 'serialnum_buf'
   if (do_read)
   {
      for (i = 0; i < 8; i++)
         serialnum_buf[i] = SerialNum[i];
   }
   // set the internal buffer from the data in 'serialnum_buf'
   else
   {
      for (i = 0; i < 8; i++)
         SerialNum[i] = serialnum_buf[i];
   }
}


#ifdef NOT_USED
//--------------------------------------------------------------------------
// Setup the search algorithm to find a certain family of devices
// the next time a search function is called 'owNext'.
//
// 'portnum'       - number 0 to MAX_PORTNUM-1.  This number was provided to
//                   OpenCOM to indicate the port number.
// 'search_family' - family code type to set the search algorithm to find
//                   next.
//
void owFamilySearchSetup(HANDLE hCom, SMALLINT search_family)
{
   uchar i;

   // set the search state to find search_family type devices
   SerialNum[portnum][0] = search_family;
   for (i = 1; i < 8; i++)
      SerialNum[portnum][i] = 0;
   LastDiscrepancy[portnum] = 64;
   LastDevice[portnum] = FALSE;
}

//--------------------------------------------------------------------------
// Set the current search state to skip the current family code.
//
// 'portnum'  - number 0 to MAX_PORTNUM-1.  This number was provided to
//               OpenCOM to indicate the port number.
//
void owSkipFamily(int portnum)
{
   // set the Last discrepancy to last family discrepancy
   LastDiscrepancy[portnum] = LastFamilyDiscrepancy[portnum];

   // check for end of list
   if (LastDiscrepancy[portnum] == 0)
      LastDevice[portnum] = TRUE;
}

//--------------------------------------------------------------------------
// The 'owAccess' function resets the 1-Wire and sends a MATCH Serial
// Number command followed by the current SerialNum code. After this
// function is complete the 1-Wire device is ready to accept device-specific
// commands.
//
// 'portnum'  - number 0 to MAX_PORTNUM-1.  This number was provided to
//              OpenCOM to indicate the port number.
//
// Returns:   TRUE (1) : reset indicates present and device is ready
//                       for commands.
//            FALSE (0): reset does not indicate presence or echos 'writes'
//                       are not correct.
//
SMALLINT owAccess(int portnum)
{
   uchar sendpacket[9];
   uchar i;

   // reset the 1-wire
   if (owTouchReset(portnum))
   {
      // create a buffer to use with block function
      // match Serial Number command 0x55
      sendpacket[0] = 0x55;
      // Serial Number
      for (i = 1; i < 9; i++)
         sendpacket[i] = SerialNum[portnum][i-1];

      // send/recieve the transfer buffer
      if (owBlock(portnum,FALSE,sendpacket,9))
      {
         // verify that the echo of the writes was correct
         for (i = 1; i < 9; i++)
            if (sendpacket[i] != SerialNum[portnum][i-1])
               return FALSE;
         if (sendpacket[0] != 0x55)
         {
            OWERROR(OWERROR_WRITE_VERIFY_FAILED);
            return FALSE;
         }
         else
            return TRUE;
      }
      else
         OWERROR(OWERROR_BLOCK_FAILED);
   }
   else
      OWERROR(OWERROR_NO_DEVICES_ON_NET);

   // reset or match echo failed
   return FALSE;
}

//----------------------------------------------------------------------
// The function 'owVerify' verifies that the current device
// is in contact with the 1-Wire Net.
// Using the find alarm command 0xEC will verify that the device
// is in contact with the 1-Wire Net and is in an 'alarm' state.
//
// 'portnum'    - number 0 to MAX_PORTNUM-1.  This number was provided to
//                OpenCOM to indicate the port number.
// 'alarm_only' - TRUE (1) the find alarm command 0xEC
//                         is sent instead of the normal search
//                         command 0xF0.
//
// Returns:   TRUE (1) : when the 1-Wire device was verified
//                       to be on the 1-Wire Net
//                       with alarm_only == FALSE
//                       or verified to be on the 1-Wire Net
//                       AND in an alarm state when
//                       alarm_only == TRUE.
//            FALSE (0): the 1-Wire device was not on the
//                       1-Wire Net or if alarm_only
//                       == TRUE, the device may be on the
//                       1-Wire Net but in a non-alarm state.
//
SMALLINT owVerify(int portnum, SMALLINT alarm_only)
{
   uchar i,sendlen=0,goodbits=0,cnt=0,s,tst;
   uchar sendpacket[50];

   // construct the search rom
   if (alarm_only)
      sendpacket[sendlen++] = 0xEC; // issue the alarming search command
   else
      sendpacket[sendlen++] = 0xF0; // issue the search command
   // set all bits at first
   for (i = 1; i <= 24; i++)
      sendpacket[sendlen++] = 0xFF;
   // now set or clear apropriate bits for search
   for (i = 0; i < 64; i++)
      bitacc(WRITE_FUNCTION,bitacc(READ_FUNCTION,0,i,&SerialNum[portnum][0]),(int)((i+1)*3-1),&sendpacket[1]);

   // send/recieve the transfer buffer
   if (owBlock(portnum,TRUE,sendpacket,sendlen))
   {
      // check results to see if it was a success
      for (i = 0; i < 192; i += 3)
      {
         tst = (bitacc(READ_FUNCTION,0,i,&sendpacket[1]) << 1) |
                bitacc(READ_FUNCTION,0,(int)(i+1),&sendpacket[1]);

         s = bitacc(READ_FUNCTION,0,cnt++,&SerialNum[portnum][0]);

         if (tst == 0x03)  // no device on line
         {
              goodbits = 0;    // number of good bits set to zero
              break;     // quit
         }

         if (((s == 0x01) && (tst == 0x02)) ||
             ((s == 0x00) && (tst == 0x01))    )  // correct bit
            goodbits++;  // count as a good bit
      }

      // check too see if there were enough good bits to be successful
      if (goodbits >= 8)
         return TRUE;
   }
   else
      OWERROR(OWERROR_BLOCK_FAILED);

   // block fail or device not present
   return FALSE;
}

//----------------------------------------------------------------------
// Perform a overdrive MATCH command to select the 1-Wire device with
// the address in the ID data register.
//
// 'portnum'  - number 0 to MAX_PORTNUM-1.  This number was provided to
//               OpenCOM to indicate the port number.
//
// Returns:  TRUE: If the device is present on the 1-Wire Net and
//                 can do overdrive then the device is selected.
//           FALSE: Device is not present or not capable of overdrive.
//
//  *Note: This function could be converted to send DS2480
//         commands in one packet.
//
SMALLINT owOverdriveAccess(int portnum)
{
   uchar sendpacket[8];
   uchar i, bad_echo = FALSE;

   // make sure normal level
   owLevel(portnum,MODE_NORMAL);

   // force to normal communication speed
   owSpeed(portnum,MODE_NORMAL);

   // call the 1-Wire Net reset function
   if (owTouchReset(portnum))
   {
      // send the match command 0x69
      if (owWriteByte(portnum,0x69))
      {
         // switch to overdrive communication speed
         owSpeed(portnum,MODE_OVERDRIVE);

         // create a buffer to use with block function
         // Serial Number
         for (i = 0; i < 8; i++)
            sendpacket[i] = SerialNum[portnum][i];

         // send/recieve the transfer buffer
         if (owBlock(portnum,FALSE,sendpacket,8))
         {
            // verify that the echo of the writes was correct
            for (i = 0; i < 8; i++)
               if (sendpacket[i] != SerialNum[portnum][i])
                  bad_echo = TRUE;
            // if echo ok then success
            if (!bad_echo)
               return TRUE;
            else
               OWERROR(OWERROR_WRITE_VERIFY_FAILED);
         }
         else
            OWERROR(OWERROR_BLOCK_FAILED);
      }
      else
         OWERROR(OWERROR_WRITE_BYTE_FAILED);
   }
   else
      OWERROR(OWERROR_NO_DEVICES_ON_NET);

   // failure, force back to normal communication speed
   owSpeed(portnum,MODE_NORMAL);

   return FALSE;
}

#endif /* Not Used */

//--------------------------------------------------------------------------
// Bit utility to read and write a bit in the buffer 'buf'.
//
// 'op'    - operation (1) to set and (0) to read
// 'state' - set (1) or clear (0) if operation is write (1)
// 'loc'   - bit number location to read or write
// 'buf'   - pointer to array of bytes that contains the bit
//           to read or write
//
// Returns: 1   if operation is set (1)
//          0/1 state of bit number 'loc' if operation is reading
//
SMALLINT bitacc(SMALLINT op, SMALLINT state, SMALLINT loc, uchar *buf)
{
   SMALLINT nbyt,nbit;

   nbyt = (loc / 8);
   nbit = loc - (nbyt * 8);

   if (op == WRITE_FUNCTION)
   {
      if (state)
         buf[nbyt] |= (0x01 << nbit);
      else
         buf[nbyt] &= ~(0x01 << nbit);

      return 1;
   }
   else
      return ((buf[nbyt] >> nbit) & 0x01);
}

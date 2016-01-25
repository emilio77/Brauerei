/* -----------------------------------------------------------------------
   COM port routines for Windows
   Copyright 1997-2002 by Brian C. Lane <bcl@brianlane.com>
   All Rights Reserved
   http://www.brianlane.com/digitemp.php   
   ----------------------------------------------------------------------- */

void ComClose( HANDLE * );
int SetCom(HANDLE *, unsigned long, int, char, int, long, long );
int ComOpen(HANDLE *, int, unsigned long, int, char, int, long, long );
long ComWriteStr(HANDLE *, char *, int );
long ComReadStr(HANDLE *, char *, int );


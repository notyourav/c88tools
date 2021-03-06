/*
 *	@(#)rewind.c	1.2
 */

/**************************************************************************
**                                                                        *
**  FILE        :  rewind.c                                               *
**                                                                        *
**  DESCRIPTION :  Source file for rewind() routine                       *
**                 Sets the file position indicator for the stream        *
**                 pointed by 'file' according to the beginning of the    *
**                 file.                                                  *
**                                                                        *
**  COPYRIGHT   :  1996 Tasking Software B.V.                             *
**                                                                        *
**************************************************************************/

#include <stdio.h>
#include <errno.h>

extern int _ungetc[];	/* defined in _iob.c */

void
rewind( FILE * file )
{
	file;
}

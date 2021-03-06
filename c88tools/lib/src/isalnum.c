/*
 *	Version : @(#)isalnum.c	1.2	
 */

/**************************************************************************
**                                                                        *
**  FILE        :  isalnum.c                                              *
**                                                                        *
**  DESCRIPTION :  Source file for isalnum() routine                      *
**                 Returns non zero if given character is an alphanumeric *
**                 character.                                             *
**                                                                        *
**  COPYRIGHT   :  1996 Tasking Software B.V.                             *
**                                                                        *
**************************************************************************/
#include <ctype.h>

#undef	isalnum

int
isalnum( int c )
{
	return( (_ctype_+1)[c] & (__U|__L|__N) );
}

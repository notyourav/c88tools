/*
 *	@(#)signal.h	1.1
 */

/**************************************************************************
**                                                                        *
**  FILE        :  signal.h                                               *
**                                                                        *
**  DESCRIPTION :  Include file with prototypes and macros for handling	  *
**		   various signals.					  *
**                                                                        *
**  COPYRIGHT   :  1996 Tasking Software B.V., Amersfoort                 *
**                                                                        *
**************************************************************************/

#ifndef	_SIGNAL_H
#define _SIGNAL_H

typedef int sig_atomic_t;
typedef void signalfunction( int );

#define _NSIG		7 /* one more then last code */

#define SIGINT		1
#define SIGILL		2
#define SIGFPE		3
#define SIGSEGV		4
#define SIGTERM		5
#define SIGABRT		6
#define SIG_DFL (void (*)())0
#define SIG_IGN (void (*)())1
#define SIG_ERR (void (*)())-1

signalfunction *	signal	( int, signalfunction * );
int			raise	( int );

#endif	/* _SIGNAL_H */

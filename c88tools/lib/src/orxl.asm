;;;****************************************************************************
;;;
;;; VERSION CONTROL:	@(#)orxl.asm	1.6	99/01/08
;;;
;;; AUTHOR:		Gerard Boersema		(gebo)
;;;
;;; COPYRIGHT:		Copyright (c) 1996 Tasking Software B.V.
;;;
;;;****************************************************************************

$CASE ON

                NAME    "_ORXL"

                DEFSECT ".rtcode", CODE, SHORT, FIT 8000H
                SECT    ".rtcode"


                GLOBAL	__ORXL	
;;;****************************************************************************
;;; 
;;; ROUTINE:            __ORXL
;;; 
;;; AT ENTRY:           HLBA    long operand a
;;;                     IYIX    long operand b
;;; 
;;; AT EXIT:            HLBA    a OR b
;;;                     
;;; DESTROYS:           -
;;; 
;;; PRESERVES:          IYIX
;;;
;;; STACK USAGE:        8 (in maximum mode 9)
;;; 
;;; DESCRIPTION:        This routine provides a 32 bit bitwise OR operation
;;; 
	
	EXTERN (DATA) __lc_es

__ORXL:		PUSH	EP
		PUSH    HL              ; Move operand a to stack
                PUSH    BA
		LD	EP,#@DPAG(__lc_es-1)	; Set page register
                LD      HL, SP          ; Set SP-->lowest byte
                
                LD      BA, IX
                OR      A, [HL]         ; IX.low_byte
                INC     HL
                EX      A, B    
                OR      A, [HL]         ; IX.high_byte
                INC     HL
                EX      A, B
                PUSH    BA              ; Save result
                
                LD      BA, IY
                OR      A, [HL]         ; IY.low_byte
                INC     HL
                EX      A, B    
                OR      A, [HL]         ; IY.high_byte
                EX      A, B
                LD      HL, BA

                POP     BA              ; Get result low part
                ADD     SP, #4          ; Free stack space
		POP	EP
                
EXIT:           RET
                END

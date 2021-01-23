/**************************************************************************
**
**	FILE        :  @(#)s1c8f626.dsc	1.0
**
**	VERSION     :  06/5/12
**
**	DESCRIPTION :  software description for S1C8f626
**
**	COPYRIGHT   :  2006 SEIKO EPSON CORPORATION
**
**************************************************************************/

software {
	// define program start label
	// program start label is the start of the code
	// reset vector should point to this label 
	load_mod start=__START;

	// define software layout
	layout {
		// define the preferred locating order of sections
		// in the memory space 
		// (the range is defined in the s1c8f626.cpu file)
		space SMC88_space {
			// define for each sub-area in the space 
			// the locating order of sections
			block total_range {
				// define a cluster for read-only sections
				// containing:
				//  - program code
				//  - romdata sections
				//       * vectors
				//       * strings
				//       * constant data
				//  - copy table (used by startup code)
				//  - initialization data 
				//    (copied to ram by startup code)
				cluster rom {
					attribute r; 
					amode code_short {
						// system reserved 
						// (exception vector)
						reserved length=0x2 addr=0x52;
						reserved length=0x100 addr=0x00;
					}
					amode code_short {
						// allocate short program code 
						// before short romdata
						section selection=x;
						section selection=r;
					}
					amode code {
						// allocate program code, 
						// then allocate romdata,
						// initialization data,  
						section selection=x;
						section selection=r;
						copy;
						table;
					}
					amode data_short {
						// allocate short romdata
						section selection=r; 
					}
					amode data {
						// allocate far romdata
						// copy table
						section selection=r;
					}
				}
				// define a cluster for ram sections
				// containing:
				//  - uninitialized data
				//  - initialized data
				//      * zeroed by startup code 
				//        (clean attribute)
				//      * copied from initialization data 
				//        by startup code (init attribute)
				//  - heap (only when used)
				//  - stack
				//  - buffer needed by debugger
				cluster ram {
					attribute w;
					amode data_tiny {
						// allocate tiny memory code
						// before short romdata
						section selection=w;
					}
					amode data_short {
						// allocate short data
						section selection=w;
						heap;
					}
					amode data {
						// allocate far data,
						// heap (growing upwards)
						// stack (growing downwards)
						// reservation for CrossView debugger
						// (only when using '-g')
						section selection=w;
						reserved label=xvwbuffer length=0x10;
						stack;
					}
				}
			}
		}
	}
}

cpu s1c8f626.cpu
memory s1c8f626.mem


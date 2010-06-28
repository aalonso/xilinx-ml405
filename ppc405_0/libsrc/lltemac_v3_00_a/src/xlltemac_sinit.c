/**************************************************************
 * (c) Copyright 2005 - 2009 Xilinx, Inc. All rights reserved.
 *
 * This file contains confidential and proprietary information
 * of Xilinx, Inc. and is protected under U.S. and
 * international copyright and other intellectual property
 * laws.
 *
 * DISCLAIMER
 * This disclaimer is not a license and does not grant any
 * rights to the materials distributed herewith. Except as
 * otherwise provided in a valid license issued to you by
 * Xilinx, and to the maximum extent permitted by applicable
 * law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
 * WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
 * AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
 * BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
 * INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
 * (2) Xilinx shall not be liable (whether in contract or tort,
 * including negligence, or under any other theory of
 * liability) for any loss or damage of any kind or nature
 * related to, arising under or in connection with these
 * materials, including for any direct, or any indirect,
 * special, incidental, or consequential loss or damage
 * (including loss of data, profits, goodwill, or any type of
 * loss or damage suffered as a result of any action brought
 * by a third party) even if such damage or loss was
 * reasonably foreseeable or Xilinx had been advised of the
 * possibility of the same.
 *
 * CRITICAL APPLICATIONS
 * Xilinx products are not designed or intended to be fail-
 * safe, or for use in any application requiring fail-safe
 * performance, such as life-support or safety devices or
 * systems, Class III medical devices, nuclear facilities,
 * applications related to the deployment of airbags, or any
 * other applications that could lead to death, personal
 * injury, or severe property or environmental damage
 * (individually and collectively, "Critical
 * Applications"). Customer assumes the sole risk and
 * liability of any use of Xilinx products in Critical
 * Applications, subject only to applicable laws and
 * regulations governing limitations on product liability.
 *
 * THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
 * PART OF THIS FILE AT ALL TIMES. 
 *************************************************************/
/**
 *
 * @file xlltemac_sinit.c
 *
 * This file contains legacy initialization methods .
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who  Date     Changes
 * ----- ---- -------- -------------------------------------------------------
 * 1.00a jvb  11/10/06 First release
 * </pre>
 *
 ******************************************************************************/

/***************************** Include Files *********************************/

#include "xlltemac.h"

/************************** Constant Definitions *****************************/


/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/

/*****************************************************************************/
/**
 * XLlTemac_LookupConfig returns a reference to an XLlTemac_Config structure 
 * based on an unique device id, <i>DeviceId</i>. The return value will refer to
 * an entry in the device configuration table defined in the xlltemac_g.c file.
 *
 * @param DeviceId is the unique device ID of the device for the lookup
 *        operation.
 *
 * @return XLlTemac_LookupConfig returns a reference to a config record in the
 * configuration table (in xlltemac_g.c) corresponding to <i>DeviceId</i>, or NULL
 * if no match is found.
 *
 ******************************************************************************/
XLlTemac_Config *XLlTemac_LookupConfig(u16 DeviceId)
{
	extern XLlTemac_Config XLlTemac_ConfigTable[];
	XLlTemac_Config *CfgPtr = NULL;
	int i;

	for (i = 0; i < XPAR_XLLTEMAC_NUM_INSTANCES; i++) {
		if (XLlTemac_ConfigTable[i].DeviceId == DeviceId) {
			CfgPtr = &XLlTemac_ConfigTable[i];
			break;
		}
	}

	return (CfgPtr);
}

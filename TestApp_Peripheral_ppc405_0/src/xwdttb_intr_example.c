#define TESTAPP_GEN

/*$Id: xwdttb_intr_example.c,v 1.1.2.1 2009/12/04 05:52:36 svemula Exp $*/
/******************************************************************************
*
* (c) Copyright 2006-2009 Xilinx, Inc. All rights reserved.
*
* This file contains confidential and proprietary information of Xilinx, Inc.
* and is protected under U.S. and international copyright and other
* intellectual property laws.
*
* DISCLAIMER
* This disclaimer is not a license and does not grant any rights to the
* materials distributed herewith. Except as otherwise provided in a valid
* license issued to you by Xilinx, and to the maximum extent permitted by
* applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
* FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
* IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
* and (2) Xilinx shall not be liable (whether in contract or tort, including
* negligence, or under any other theory of liability) for any loss or damage
* of any kind or nature related to, arising under or in connection with these
* materials, including for any direct, or any indirect, special, incidental,
* or consequential loss or damage (including loss of data, profits, goodwill,
* or any type of loss or damage suffered as a result of any action brought by
* a third party) even if such damage or loss was reasonably foreseeable or
* Xilinx had been advised of the possibility of the same.
*
* CRITICAL APPLICATIONS
* Xilinx products are not designed or intended to be fail-safe, or for use in
* any application requiring fail-safe performance, such as life-support or
* safety devices or systems, Class III medical devices, nuclear facilities,
* applications related to the deployment of airbags, or any other applications
* that could lead to death, personal injury, or severe property or
* environmental damage (individually and collectively, "Critical
* Applications"). Customer assumes the sole risk and liability of any use of
* Xilinx products in Critical Applications, subject only to applicable laws
* and regulations governing limitations on product liability.
*
* THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
* AT ALL TIMES.
*
******************************************************************************/
/*****************************************************************************/
/**
*
* @file xwdttb_intr_example.c
*
* This file contains a design example using the TimeBase Watchdog Timer Device
* (WdtTb) driver and hardware device using interrupt mode (for the WDT
* interrupt).
*
* @note
*
* This example assumes that the reset output of the WdtTb device is not
* connected to the reset of the processor. This example will not return
* if the interrupts are not working.
*
* <pre>
*
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- ---------------------------------------------------------
* 1.00b hvm  05/10/06 First release
* 1.00b sv   05/30/06 Updated to support interrupt examples in Test App
* 1.11a hvm  03/30/09 Modified the example to avoid a race condition
* 2.00a ktn  10/22/09 Updated the example to use the HAL APIs/macros.
*		      Updated the example with support for MicroBlaze.
* </pre>
*
******************************************************************************/

/***************************** Include Files *********************************/

#include "xparameters.h"
#include "xwdttb.h"
#include "xintc.h"
#include "xil_exception.h"

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are only defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#ifndef TESTAPP_GEN
#define WDTTB_DEVICE_ID		XPAR_WDTTB_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_INTC_0_DEVICE_ID
#define WDTTB_IRPT_INTR		XPAR_INTC_0_WDTTB_0_WDT_INTERRUPT_VEC_ID
#endif


/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/

int WdtTbIntrExample(XIntc *IntcInstancePtr,
			XWdtTb *WdtTbInstancePtr,
			u16 WdtTbDeviceId,
			u16 WdtTbIntrId);

static void WdtTbIntrHandler(void *CallBackRef);

static int WdtTbSetupIntrSystem(XIntc *IntcInstancePtr,
				XWdtTb *WdtTbInstancePtr,
				u16 WdtTbIntrId);

static void WdtTbDisableIntrSystem(XIntc *IntcInstancePtr,
				u16 WdtTbIntrId);



/************************** Variable Definitions *****************************/

#ifndef TESTAPP_GEN
XWdtTb WdtTbInstance;            /* Instance of Time Base WatchDog Timer */
XIntc IntcInstance;              /* Instance of the Interrupt Controller */
#endif

static volatile int WdtExpired;

/*****************************************************************************/
/**
* Main function to call the WdtTb interrupt example.
*
* @param	None.
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		None.
*
******************************************************************************/
#ifndef TESTAPP_GEN
int main(void)
{
	int Status;

	/*
	 * Call the WdtTb interrupt example, specify the parameters generated in
	 * xparameters.h
	 */
	Status = WdtTbIntrExample(&IntcInstance,
				&WdtTbInstance,
				WDTTB_DEVICE_ID,
				WDTTB_IRPT_INTR);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
#endif


/*****************************************************************************/
/**
*
* This function tests the functioning of the TimeBase WatchDog Timer module
* in the Interrupt mode (for the WDT interrupt).
*
* After one expiration of the WDT timeout interval, an interrupt is generated
* and the WDT state bit is set to one in the status register. If the state bit
* is not cleared (by writing a 1 to the state bit) before the next expiration of
* the timeout interval, a WDT reset is generated.
* A WDT reset sets the WDT reset status bit in the status register so that
* the application code can determine if the last system reset was a WDT reset.
*
* This function assumes that the reset output of the WdtTb device is not
* connected to the reset of the processor. The function allows the watchdog
* timer to timeout such that a reset will occur if it is connected.
*
* @param	IntcInstancePtr is a pointer to the instance of the INTC driver.
* @param	WdtTbInstancePtr is a pointer to the instance of WdtTb driver.
* @param	WdtTbDeviceId is the Device ID of the WdtTb Device and is
*		typically XPAR_<WDTTB_instance>_DEVICE_ID value from
*		xparameters.h.
* @param	WdtTbIntrId is the Interrupt Id of the WatchDog and is typically
*		XPAR_<INTC_instance>_<WDTTB_instance>_WDT_INTERRUPT_VEC_ID
*		value from xparameters.h.
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		This example will not return if the interrupts are not working.
*
******************************************************************************/
int WdtTbIntrExample(XIntc *IntcInstancePtr,
			XWdtTb *WdtTbInstancePtr,
			u16 WdtTbDeviceId,
			u16 WdtTbIntrId)
{
	int Status;

	/*
	 * Initialize the WdtTb driver
	 */
	Status = XWdtTb_Initialize(WdtTbInstancePtr, WdtTbDeviceId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	/*
	 * Perform a self-test to ensure that the hardware was built correctly
	 */
	Status = XWdtTb_SelfTest(WdtTbInstancePtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Stop the timer to start the test for interrupt mode
	 */
	XWdtTb_Stop(WdtTbInstancePtr);

	/*
	 * Connect the WdtTb to the interrupt subsystem so that interrupts
	 * can occur
	 */
	Status = WdtTbSetupIntrSystem(IntcInstancePtr,
					WdtTbInstancePtr,
					WdtTbIntrId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Start the WdtTb device
	 */
	WdtExpired = FALSE;
	XWdtTb_Start(WdtTbInstancePtr);

	/*
	 * Wait for the firt expiration of the WDT
	 */
	while (WdtExpired != TRUE);
	WdtExpired = FALSE;

	/*
	 * Wait for the second expiration of the WDT
	 */
	while (WdtExpired != TRUE);
	WdtExpired = FALSE;

	/*
	 * Check whether the WatchDog Reset Status has been set.
	 * If this is set means then the test has failed
	 */
	if (XWdtTb_ReadReg(WdtTbInstancePtr->RegBaseAddress,
			XWT_TWCSR0_OFFSET) & XWT_CSR0_WRS_MASK) {
		/*
		 * Disable and disconnect the interrupt system
		 */
		WdtTbDisableIntrSystem(IntcInstancePtr, WdtTbIntrId);

		/*
		 * Stop the timer
		 */
		XWdtTb_Stop(WdtTbInstancePtr);

		return XST_FAILURE;
	}

	/*
	 * Disable and disconnect the interrupt system
	 */
	WdtTbDisableIntrSystem(IntcInstancePtr, WdtTbIntrId);

	/*
	 * Stop the timer
	 */
	XWdtTb_Stop(WdtTbInstancePtr);

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function setups the interrupt system such that WDT interrupt can occur
* for the WdtTb. This function is application specific since the actual
* system may or may not have an interrupt controller. The WdtTb device could be
* directly connected to a processor without an interrupt controller. The
* user should modify this function to fit the application.
*
* @param	IntcInstancePtr is a pointer to the instance of the Intc driver.
* @param	WdtTbInstancePtr is a pointer to the instance of WdtTb driver.
* @param	WdtTbIntrId is the Interrupt Id of the WDT interrupt and is
*		typically
*		XPAR_<INTC_instance>_<WDTTB_instance>_WDT_INTERRUPT_VEC_ID
*		value from xparameters.h.
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		None.
*
******************************************************************************/
static int WdtTbSetupIntrSystem(XIntc *IntcInstancePtr,
				XWdtTb *WdtTbInstancePtr,
				u16 WdtTbIntrId)
{
	int Status;

#ifndef TESTAPP_GEN
	/*
	 * Initialize the interrupt controller driver so that
	 * it's ready to use. Specify the device ID that is generated in
	 * xparameters.h
	 */
	Status = XIntc_Initialize(IntcInstancePtr, INTC_DEVICE_ID);
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
#endif

	/*
	 * Connect a device driver handler that will be called when the WDT
	 * interrupt for the device occurs, the device driver handler performs
	 * the specific interrupt processing for the device
	 */
	Status = XIntc_Connect(IntcInstancePtr, WdtTbIntrId,
			   (XInterruptHandler)WdtTbIntrHandler,
			   (void *)WdtTbInstancePtr);
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

#ifndef TESTAPP_GEN
	/*
	 * Start the interrupt controller such that interrupts are enabled for
	 * all devices that cause interrupts
	 */
	Status = XIntc_Start(IntcInstancePtr, XIN_REAL_MODE);
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
#endif

	/*
	 * Enable the WDT interrupt of the WdtTb Device
	 */
	XIntc_Enable(IntcInstancePtr, WdtTbIntrId);

#ifndef TESTAPP_GEN


	/*
	 * Initialize the  exception table
	 */
	Xil_ExceptionInit();

	/*
	 * Register the interrupt controller handler with the exception table
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			 (Xil_ExceptionHandler)XIntc_InterruptHandler,
			 IntcInstancePtr);


	/*
	 * Enable non-critical exceptions
	 */
	Xil_ExceptionEnable();


#endif /* TESTAPP_GEN */

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function is the Interrupt handler for the WDT Interrupt of the
* WdtTb device. It is called on the expiration of the WDT period and is called
* from an interrupt context.
*
* This function provides an example of how to handle WDT interrupt of the
* WdtTb device.
*
* @param	CallBackRef is a pointer to the callback function.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void WdtTbIntrHandler(void *CallBackRef)
{
	XWdtTb *WdtTbInstancePtr = (XWdtTb *)CallBackRef;

	/*
	 * Set the flag indicating that the WDT has expired
	 */
	WdtExpired = TRUE;

	/*
	 * Restart the watchdog timer as a normal application would
	 */
	XWdtTb_RestartWdt(WdtTbInstancePtr);
}


/*****************************************************************************/
/**
*
* This function disables the interrupts that occur for the WdtTb.
*
* @param	IntcInstancePtr is the pointer to the instance of INTC driver.
* @param	WdtTbIntrId is the WDT Interrupt Id and is typically
*		XPAR_<INTC_instance>_<WDTTB_instance>_WDT_INTERRUPT_VEC_ID
*		value from xparameters.h.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void WdtTbDisableIntrSystem(XIntc *IntcInstancePtr, u16 WdtTbIntrId)
{

	/*
	 * Disconnect and disable the interrupt for the WdtTb
	 */
	XIntc_Disconnect(IntcInstancePtr, WdtTbIntrId);

}



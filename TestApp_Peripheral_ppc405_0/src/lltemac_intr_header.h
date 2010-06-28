#define TESTAPP_GEN

/* $Id: lltemac_intr_header.h,v 1.1.2.1 2010/01/20 23:00:23 haibing Exp $ */


#include "xstatus.h"
#include "xil_types.h"

int TemacFifoIntrExample(XIntc * IntcInstancePtr,
                         XLlTemac * TemacInstancePtr,
                         XLlFifo * FifoInstancePtr,
                         u16 TemacDeviceId,
                         u16 FifoDeviceId, u16 TemacIntrId, u16 FifoIntrId);


int TemacSgDmaIntrExample(XIntc * IntcInstancePtr,
                          XLlTemac * TemacInstancePtr,
                          XLlDma * DmaInstancePtr,
                          u16 TemacDeviceId,
                          u16 TemacIntrId, u16 DmaRxIntrId, u16 DmaTxIntrId);




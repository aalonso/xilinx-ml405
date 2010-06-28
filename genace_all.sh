#!/bin/sh
# Generate ace files
# Adrian Alonso <aalonso00@gmail.com>

# -start_address 0x02022a00

# Set Xilinx edk tools
if [ -z ${XILINX_EDK} ]; then
    source xlnx-setup-env
fi

# Remove existing ace files
if [ -f ml405_bsp_u-boot.ace ]; then
	rm ml405_bsp_* 
fi

#xmd -tcl genace.tcl -jprog -hw implementation/download.bit -elf u-boot \
# -target ppc_hw -board ml405 -ace ml405_bsp_u-boot.ace
# -start_address 0x04000000
if [ -f u-boot ]; then
	xmd -tcl genace.tcl -jprog -board ml405 -hw implementation/download.bit \
	-elf u-boot -ace u-boot_ml405.ace -target ppc_hw 
fi

echo "Done"

-------------------------------------------------------------------------------
-- system.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system is
  port (
    fpga_0_LEDs_4Bit_GPIO_IO_pin : inout std_logic_vector(0 to 3);
    fpga_0_LEDs_Positions_GPIO_IO_pin : inout std_logic_vector(0 to 4);
    fpga_0_Push_Buttons_Position_GPIO_IO_pin : inout std_logic_vector(0 to 4);
    fpga_0_IIC_EEPROM_Sda_pin : inout std_logic;
    fpga_0_IIC_EEPROM_Scl_pin : inout std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_MPA_pin : out std_logic_vector(6 downto 1);
    fpga_0_SysACE_CompactFlash_SysACE_CLK_pin : in std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin : in std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_CEN_pin : out std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_OEN_pin : out std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_WEN_pin : out std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_MPD_pin : inout std_logic_vector(15 downto 0);
    fpga_0_DDR_SDRAM_DDR_Clk_pin : out std_logic;
    fpga_0_DDR_SDRAM_DDR_Clk_n_pin : out std_logic;
    fpga_0_DDR_SDRAM_DDR_CE_pin : out std_logic;
    fpga_0_DDR_SDRAM_DDR_CS_n_pin : out std_logic;
    fpga_0_DDR_SDRAM_DDR_RAS_n_pin : out std_logic;
    fpga_0_DDR_SDRAM_DDR_CAS_n_pin : out std_logic;
    fpga_0_DDR_SDRAM_DDR_WE_n_pin : out std_logic;
    fpga_0_DDR_SDRAM_DDR_BankAddr_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR_SDRAM_DDR_Addr_pin : out std_logic_vector(12 downto 0);
    fpga_0_DDR_SDRAM_DDR_DQ_pin : inout std_logic_vector(31 downto 0);
    fpga_0_DDR_SDRAM_DDR_DM_pin : out std_logic_vector(3 downto 0);
    fpga_0_DDR_SDRAM_DDR_DQS_pin : inout std_logic_vector(3 downto 0);
    fpga_0_TriMode_MAC_GMII_TemacPhy_RST_n_pin : out std_logic;
    fpga_0_TriMode_MAC_GMII_MII_TX_CLK_0_pin : in std_logic;
    fpga_0_TriMode_MAC_GMII_GMII_TXD_0_pin : out std_logic_vector(7 downto 0);
    fpga_0_TriMode_MAC_GMII_GMII_TX_EN_0_pin : out std_logic;
    fpga_0_TriMode_MAC_GMII_GMII_TX_ER_0_pin : out std_logic;
    fpga_0_TriMode_MAC_GMII_GMII_TX_CLK_0_pin : out std_logic;
    fpga_0_TriMode_MAC_GMII_GMII_RXD_0_pin : in std_logic_vector(7 downto 0);
    fpga_0_TriMode_MAC_GMII_GMII_RX_DV_0_pin : in std_logic;
    fpga_0_TriMode_MAC_GMII_GMII_RX_ER_0_pin : in std_logic;
    fpga_0_TriMode_MAC_GMII_GMII_RX_CLK_0_pin : in std_logic;
    fpga_0_TriMode_MAC_GMII_MDC_0_pin : out std_logic;
    fpga_0_TriMode_MAC_GMII_MDIO_0_pin : inout std_logic;
    fpga_0_FLASH_Mem_A_pin : out std_logic_vector(9 to 29);
    fpga_0_FLASH_Mem_OEN_pin : out std_logic;
    fpga_0_FLASH_Mem_WEN_pin : out std_logic;
    fpga_0_FLASH_Mem_CE_pin : out std_logic;
    fpga_0_FLASH_Mem_DQ_pin : inout std_logic_vector(0 to 31);
    fpga_0_RS232_Uart_sin_pin : in std_logic;
    fpga_0_RS232_Uart_sout_pin : out std_logic;
    fpga_0_clk_1_sys_clk_pin : in std_logic;
    fpga_0_rst_1_sys_rst_pin : in std_logic
  );
end system;

architecture STRUCTURE of system is

  component ppc405_0_wrapper is
    port (
      C405CPMCORESLEEPREQ : out std_logic;
      C405CPMMSRCE : out std_logic;
      C405CPMMSREE : out std_logic;
      C405CPMTIMERIRQ : out std_logic;
      C405CPMTIMERRESETREQ : out std_logic;
      C405XXXMACHINECHECK : out std_logic;
      CPMC405CLOCK : in std_logic;
      CPMC405CORECLKINACTIVE : in std_logic;
      CPMC405CPUCLKEN : in std_logic;
      CPMC405JTAGCLKEN : in std_logic;
      CPMC405TIMERCLKEN : in std_logic;
      CPMC405TIMERTICK : in std_logic;
      MCBCPUCLKEN : in std_logic;
      MCBTIMEREN : in std_logic;
      MCPPCRST : in std_logic;
      CPMDCRCLK : in std_logic;
      CPMFCMCLK : in std_logic;
      C405RSTCHIPRESETREQ : out std_logic;
      C405RSTCORERESETREQ : out std_logic;
      C405RSTSYSRESETREQ : out std_logic;
      RSTC405RESETCHIP : in std_logic;
      RSTC405RESETCORE : in std_logic;
      RSTC405RESETSYS : in std_logic;
      APUFCMDECODED : out std_logic;
      APUFCMDECUDI : out std_logic_vector(0 to 2);
      APUFCMDECUDIVALID : out std_logic;
      APUFCMENDIAN : out std_logic;
      APUFCMFLUSH : out std_logic;
      APUFCMINSTRUCTION : out std_logic_vector(0 to 31);
      APUFCMINSTRVALID : out std_logic;
      APUFCMLOADBYTEEN : out std_logic_vector(0 to 3);
      APUFCMLOADDATA : out std_logic_vector(0 to 31);
      APUFCMLOADDVALID : out std_logic;
      APUFCMOPERANDVALID : out std_logic;
      APUFCMRADATA : out std_logic_vector(0 to 31);
      APUFCMRBDATA : out std_logic_vector(0 to 31);
      APUFCMWRITEBACKOK : out std_logic;
      APUFCMXERCA : out std_logic;
      FCMAPUCR : in std_logic_vector(0 to 3);
      FCMAPUDCDCREN : in std_logic;
      FCMAPUDCDFORCEALIGN : in std_logic;
      FCMAPUDCDFORCEBESTEERING : in std_logic;
      FCMAPUDCDFPUOP : in std_logic;
      FCMAPUDCDGPRWRITE : in std_logic;
      FCMAPUDCDLDSTBYTE : in std_logic;
      FCMAPUDCDLDSTDW : in std_logic;
      FCMAPUDCDLDSTHW : in std_logic;
      FCMAPUDCDLDSTQW : in std_logic;
      FCMAPUDCDLDSTWD : in std_logic;
      FCMAPUDCDLOAD : in std_logic;
      FCMAPUDCDPRIVOP : in std_logic;
      FCMAPUDCDRAEN : in std_logic;
      FCMAPUDCDRBEN : in std_logic;
      FCMAPUDCDSTORE : in std_logic;
      FCMAPUDCDTRAPBE : in std_logic;
      FCMAPUDCDTRAPLE : in std_logic;
      FCMAPUDCDUPDATE : in std_logic;
      FCMAPUDCDXERCAEN : in std_logic;
      FCMAPUDCDXEROVEN : in std_logic;
      FCMAPUDECODEBUSY : in std_logic;
      FCMAPUDONE : in std_logic;
      FCMAPUEXCEPTION : in std_logic;
      FCMAPUEXEBLOCKINGMCO : in std_logic;
      FCMAPUEXECRFIELD : in std_logic_vector(0 to 2);
      FCMAPUEXENONBLOCKINGMCO : in std_logic;
      FCMAPUINSTRACK : in std_logic;
      FCMAPULOADWAIT : in std_logic;
      FCMAPURESULT : in std_logic_vector(0 to 31);
      FCMAPURESULTVALID : in std_logic;
      FCMAPUSLEEPNOTREADY : in std_logic;
      FCMAPUXERCA : in std_logic;
      FCMAPUXEROV : in std_logic;
      IPLB0_PLB_Clk : in std_logic;
      IPLB0_PLB_Rst : in std_logic;
      IPLB0_PLB_MBusy : in std_logic;
      IPLB0_PLB_MRdErr : in std_logic;
      IPLB0_PLB_MWrErr : in std_logic;
      IPLB0_PLB_MWrBTerm : in std_logic;
      IPLB0_PLB_MWrDAck : in std_logic;
      IPLB0_PLB_MAddrAck : in std_logic;
      IPLB0_PLB_MRdBTerm : in std_logic;
      IPLB0_PLB_MRdDAck : in std_logic;
      IPLB0_PLB_MRdDBus : in std_logic_vector(0 to 63);
      IPLB0_PLB_MRearbitrate : in std_logic;
      IPLB0_PLB_MSSize : in std_logic_vector(0 to 1);
      IPLB0_PLB_MTimeout : in std_logic;
      IPLB0_PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      IPLB0_M_ABus : out std_logic_vector(0 to 31);
      IPLB0_M_BE : out std_logic_vector(0 to 7);
      IPLB0_M_MSize : out std_logic_vector(0 to 1);
      IPLB0_M_rdBurst : out std_logic;
      IPLB0_M_request : out std_logic;
      IPLB0_M_RNW : out std_logic;
      IPLB0_M_size : out std_logic_vector(0 to 3);
      IPLB0_M_wrBurst : out std_logic;
      IPLB0_M_wrDBus : out std_logic_vector(0 to 63);
      IPLB0_M_abort : out std_logic;
      IPLB0_M_UABus : out std_logic_vector(0 to 31);
      IPLB0_M_busLock : out std_logic;
      IPLB0_M_lockErr : out std_logic;
      IPLB0_M_priority : out std_logic_vector(0 to 1);
      IPLB0_M_type : out std_logic_vector(0 to 2);
      IPLB0_M_TAttribute : out std_logic_vector(0 to 15);
      DPLB0_PLB_Clk : in std_logic;
      DPLB0_PLB_Rst : in std_logic;
      DPLB0_PLB_MBusy : in std_logic;
      DPLB0_PLB_MRdErr : in std_logic;
      DPLB0_PLB_MWrErr : in std_logic;
      DPLB0_PLB_MWrBTerm : in std_logic;
      DPLB0_PLB_MWrDAck : in std_logic;
      DPLB0_PLB_MAddrAck : in std_logic;
      DPLB0_PLB_MRdBTerm : in std_logic;
      DPLB0_PLB_MRdDAck : in std_logic;
      DPLB0_PLB_MRdDBus : in std_logic_vector(0 to 63);
      DPLB0_PLB_MRearbitrate : in std_logic;
      DPLB0_PLB_MSSize : in std_logic_vector(0 to 1);
      DPLB0_PLB_MTimeout : in std_logic;
      DPLB0_PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      DPLB0_M_ABus : out std_logic_vector(0 to 31);
      DPLB0_M_BE : out std_logic_vector(0 to 7);
      DPLB0_M_MSize : out std_logic_vector(0 to 1);
      DPLB0_M_rdBurst : out std_logic;
      DPLB0_M_request : out std_logic;
      DPLB0_M_RNW : out std_logic;
      DPLB0_M_size : out std_logic_vector(0 to 3);
      DPLB0_M_wrBurst : out std_logic;
      DPLB0_M_wrDBus : out std_logic_vector(0 to 63);
      DPLB0_M_abort : out std_logic;
      DPLB0_M_UABus : out std_logic_vector(0 to 31);
      DPLB0_M_busLock : out std_logic;
      DPLB0_M_lockErr : out std_logic;
      DPLB0_M_priority : out std_logic_vector(0 to 1);
      DPLB0_M_type : out std_logic_vector(0 to 2);
      DPLB0_M_TAttribute : out std_logic_vector(0 to 15);
      IPLB1_PLB_Clk : in std_logic;
      IPLB1_PLB_Rst : in std_logic;
      IPLB1_PLB_MBusy : in std_logic;
      IPLB1_PLB_MRdErr : in std_logic;
      IPLB1_PLB_MWrErr : in std_logic;
      IPLB1_PLB_MWrBTerm : in std_logic;
      IPLB1_PLB_MWrDAck : in std_logic;
      IPLB1_PLB_MAddrAck : in std_logic;
      IPLB1_PLB_MRdBTerm : in std_logic;
      IPLB1_PLB_MRdDAck : in std_logic;
      IPLB1_PLB_MRdDBus : in std_logic_vector(0 to 63);
      IPLB1_PLB_MRearbitrate : in std_logic;
      IPLB1_PLB_MSSize : in std_logic_vector(0 to 1);
      IPLB1_PLB_MTimeout : in std_logic;
      IPLB1_PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      IPLB1_M_ABus : out std_logic_vector(0 to 31);
      IPLB1_M_BE : out std_logic_vector(0 to 7);
      IPLB1_M_MSize : out std_logic_vector(0 to 1);
      IPLB1_M_rdBurst : out std_logic;
      IPLB1_M_request : out std_logic;
      IPLB1_M_RNW : out std_logic;
      IPLB1_M_size : out std_logic_vector(0 to 3);
      IPLB1_M_wrBurst : out std_logic;
      IPLB1_M_wrDBus : out std_logic_vector(0 to 63);
      IPLB1_M_abort : out std_logic;
      IPLB1_M_UABus : out std_logic_vector(0 to 31);
      IPLB1_M_busLock : out std_logic;
      IPLB1_M_lockErr : out std_logic;
      IPLB1_M_priority : out std_logic_vector(0 to 1);
      IPLB1_M_type : out std_logic_vector(0 to 2);
      IPLB1_M_TAttribute : out std_logic_vector(0 to 15);
      DPLB1_PLB_Clk : in std_logic;
      DPLB1_PLB_Rst : in std_logic;
      DPLB1_PLB_MBusy : in std_logic;
      DPLB1_PLB_MRdErr : in std_logic;
      DPLB1_PLB_MWrErr : in std_logic;
      DPLB1_PLB_MWrBTerm : in std_logic;
      DPLB1_PLB_MWrDAck : in std_logic;
      DPLB1_PLB_MAddrAck : in std_logic;
      DPLB1_PLB_MRdBTerm : in std_logic;
      DPLB1_PLB_MRdDAck : in std_logic;
      DPLB1_PLB_MRdDBus : in std_logic_vector(0 to 63);
      DPLB1_PLB_MRearbitrate : in std_logic;
      DPLB1_PLB_MSSize : in std_logic_vector(0 to 1);
      DPLB1_PLB_MTimeout : in std_logic;
      DPLB1_PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      DPLB1_M_ABus : out std_logic_vector(0 to 31);
      DPLB1_M_BE : out std_logic_vector(0 to 7);
      DPLB1_M_MSize : out std_logic_vector(0 to 1);
      DPLB1_M_rdBurst : out std_logic;
      DPLB1_M_request : out std_logic;
      DPLB1_M_RNW : out std_logic;
      DPLB1_M_size : out std_logic_vector(0 to 3);
      DPLB1_M_wrBurst : out std_logic;
      DPLB1_M_wrDBus : out std_logic_vector(0 to 63);
      DPLB1_M_abort : out std_logic;
      DPLB1_M_UABus : out std_logic_vector(0 to 31);
      DPLB1_M_busLock : out std_logic;
      DPLB1_M_lockErr : out std_logic;
      DPLB1_M_priority : out std_logic_vector(0 to 1);
      DPLB1_M_type : out std_logic_vector(0 to 2);
      DPLB1_M_TAttribute : out std_logic_vector(0 to 15);
      BRAMDSOCMCLK : in std_logic;
      BRAMDSOCMRDDBUS : in std_logic_vector(0 to 31);
      DSARCVALUE : in std_logic_vector(0 to 7);
      DSCNTLVALUE : in std_logic_vector(0 to 7);
      DSOCMBRAMABUS : out std_logic_vector(8 to 29);
      DSOCMBRAMBYTEWRITE : out std_logic_vector(0 to 3);
      DSOCMBRAMEN : out std_logic;
      DSOCMBRAMWRDBUS : out std_logic_vector(0 to 31);
      DSOCMBUSY : out std_logic;
      DSOCMRDADDRVALID : out std_logic;
      DSOCMWRADDRVALID : out std_logic;
      DSOCMRWCOMPLETE : in std_logic;
      BRAMISOCMCLK : in std_logic;
      BRAMISOCMRDDBUS : in std_logic_vector(0 to 63);
      BRAMISOCMDCRRDDBUS : in std_logic_vector(0 to 31);
      ISARCVALUE : in std_logic_vector(0 to 7);
      ISCNTLVALUE : in std_logic_vector(0 to 7);
      ISOCMBRAMEN : out std_logic;
      ISOCMBRAMEVENWRITEEN : out std_logic;
      ISOCMBRAMODDWRITEEN : out std_logic;
      ISOCMBRAMRDABUS : out std_logic_vector(8 to 28);
      ISOCMBRAMWRABUS : out std_logic_vector(8 to 28);
      ISOCMBRAMWRDBUS : out std_logic_vector(0 to 31);
      ISOCMDCRBRAMEVENEN : out std_logic;
      ISOCMDCRBRAMODDEN : out std_logic;
      ISOCMDCRBRAMRDSELECT : out std_logic;
      DCREMACABUS : out std_logic_vector(8 to 9);
      DCREMACCLK : out std_logic;
      DCREMACDBUS : out std_logic_vector(0 to 31);
      DCREMACENABLER : out std_logic;
      DCREMACREAD : out std_logic;
      DCREMACWRITE : out std_logic;
      EMACDCRACK : in std_logic;
      EMACDCRDBUS : in std_logic_vector(0 to 31);
      EXTDCRABUS : out std_logic_vector(0 to 9);
      EXTDCRDBUSOUT : out std_logic_vector(0 to 31);
      EXTDCRREAD : out std_logic;
      EXTDCRWRITE : out std_logic;
      EXTDCRACK : in std_logic;
      EXTDCRDBUSIN : in std_logic_vector(0 to 31);
      EICC405CRITINPUTIRQ : in std_logic;
      EICC405EXTINPUTIRQ : in std_logic;
      C405JTGCAPTUREDR : out std_logic;
      C405JTGEXTEST : out std_logic;
      C405JTGPGMOUT : out std_logic;
      C405JTGSHIFTDR : out std_logic;
      C405JTGTDO : out std_logic;
      C405JTGTDOEN : out std_logic;
      C405JTGUPDATEDR : out std_logic;
      MCBJTAGEN : in std_logic;
      JTGC405BNDSCANTDO : in std_logic;
      JTGC405TCK : in std_logic;
      JTGC405TDI : in std_logic;
      JTGC405TMS : in std_logic;
      JTGC405TRSTNEG : in std_logic;
      C405DBGMSRWE : out std_logic;
      C405DBGSTOPACK : out std_logic;
      C405DBGWBCOMPLETE : out std_logic;
      C405DBGWBFULL : out std_logic;
      C405DBGWBIAR : out std_logic_vector(0 to 29);
      DBGC405DEBUGHALT : in std_logic;
      DBGC405DEBUGHALTNEG : in std_logic;
      DBGC405EXTBUSHOLDACK : in std_logic;
      DBGC405UNCONDDEBUGEVENT : in std_logic;
      C405DBGLOADDATAONAPUDBUS : out std_logic;
      C405TRCCYCLE : out std_logic;
      C405TRCEVENEXECUTIONSTATUS : out std_logic_vector(0 to 1);
      C405TRCODDEXECUTIONSTATUS : out std_logic_vector(0 to 1);
      C405TRCTRACESTATUS : out std_logic_vector(0 to 3);
      C405TRCTRIGGEREVENTOUT : out std_logic;
      C405TRCTRIGGEREVENTTYPE : out std_logic_vector(0 to 10);
      TRCC405TRACEDISABLE : in std_logic;
      TRCC405TRIGGEREVENTIN : in std_logic
    );
  end component;

  component plb_wrapper is
    port (
      PLB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      PLB_Rst : out std_logic;
      SPLB_Rst : out std_logic_vector(0 to 12);
      MPLB_Rst : out std_logic_vector(0 to 1);
      PLB_dcrAck : out std_logic;
      PLB_dcrDBus : out std_logic_vector(0 to 31);
      DCR_ABus : in std_logic_vector(0 to 9);
      DCR_DBus : in std_logic_vector(0 to 31);
      DCR_Read : in std_logic;
      DCR_Write : in std_logic;
      M_ABus : in std_logic_vector(0 to 63);
      M_UABus : in std_logic_vector(0 to 63);
      M_BE : in std_logic_vector(0 to 15);
      M_RNW : in std_logic_vector(0 to 1);
      M_abort : in std_logic_vector(0 to 1);
      M_busLock : in std_logic_vector(0 to 1);
      M_TAttribute : in std_logic_vector(0 to 31);
      M_lockErr : in std_logic_vector(0 to 1);
      M_MSize : in std_logic_vector(0 to 3);
      M_priority : in std_logic_vector(0 to 3);
      M_rdBurst : in std_logic_vector(0 to 1);
      M_request : in std_logic_vector(0 to 1);
      M_size : in std_logic_vector(0 to 7);
      M_type : in std_logic_vector(0 to 5);
      M_wrBurst : in std_logic_vector(0 to 1);
      M_wrDBus : in std_logic_vector(0 to 127);
      Sl_addrAck : in std_logic_vector(0 to 12);
      Sl_MRdErr : in std_logic_vector(0 to 25);
      Sl_MWrErr : in std_logic_vector(0 to 25);
      Sl_MBusy : in std_logic_vector(0 to 25);
      Sl_rdBTerm : in std_logic_vector(0 to 12);
      Sl_rdComp : in std_logic_vector(0 to 12);
      Sl_rdDAck : in std_logic_vector(0 to 12);
      Sl_rdDBus : in std_logic_vector(0 to 831);
      Sl_rdWdAddr : in std_logic_vector(0 to 51);
      Sl_rearbitrate : in std_logic_vector(0 to 12);
      Sl_SSize : in std_logic_vector(0 to 25);
      Sl_wait : in std_logic_vector(0 to 12);
      Sl_wrBTerm : in std_logic_vector(0 to 12);
      Sl_wrComp : in std_logic_vector(0 to 12);
      Sl_wrDAck : in std_logic_vector(0 to 12);
      Sl_MIRQ : in std_logic_vector(0 to 25);
      PLB_MIRQ : out std_logic_vector(0 to 1);
      PLB_ABus : out std_logic_vector(0 to 31);
      PLB_UABus : out std_logic_vector(0 to 31);
      PLB_BE : out std_logic_vector(0 to 7);
      PLB_MAddrAck : out std_logic_vector(0 to 1);
      PLB_MTimeout : out std_logic_vector(0 to 1);
      PLB_MBusy : out std_logic_vector(0 to 1);
      PLB_MRdErr : out std_logic_vector(0 to 1);
      PLB_MWrErr : out std_logic_vector(0 to 1);
      PLB_MRdBTerm : out std_logic_vector(0 to 1);
      PLB_MRdDAck : out std_logic_vector(0 to 1);
      PLB_MRdDBus : out std_logic_vector(0 to 127);
      PLB_MRdWdAddr : out std_logic_vector(0 to 7);
      PLB_MRearbitrate : out std_logic_vector(0 to 1);
      PLB_MWrBTerm : out std_logic_vector(0 to 1);
      PLB_MWrDAck : out std_logic_vector(0 to 1);
      PLB_MSSize : out std_logic_vector(0 to 3);
      PLB_PAValid : out std_logic;
      PLB_RNW : out std_logic;
      PLB_SAValid : out std_logic;
      PLB_abort : out std_logic;
      PLB_busLock : out std_logic;
      PLB_TAttribute : out std_logic_vector(0 to 15);
      PLB_lockErr : out std_logic;
      PLB_masterID : out std_logic_vector(0 to 0);
      PLB_MSize : out std_logic_vector(0 to 1);
      PLB_rdPendPri : out std_logic_vector(0 to 1);
      PLB_wrPendPri : out std_logic_vector(0 to 1);
      PLB_rdPendReq : out std_logic;
      PLB_wrPendReq : out std_logic;
      PLB_rdBurst : out std_logic;
      PLB_rdPrim : out std_logic_vector(0 to 12);
      PLB_reqPri : out std_logic_vector(0 to 1);
      PLB_size : out std_logic_vector(0 to 3);
      PLB_type : out std_logic_vector(0 to 2);
      PLB_wrBurst : out std_logic;
      PLB_wrDBus : out std_logic_vector(0 to 63);
      PLB_wrPrim : out std_logic_vector(0 to 12);
      PLB_SaddrAck : out std_logic;
      PLB_SMRdErr : out std_logic_vector(0 to 1);
      PLB_SMWrErr : out std_logic_vector(0 to 1);
      PLB_SMBusy : out std_logic_vector(0 to 1);
      PLB_SrdBTerm : out std_logic;
      PLB_SrdComp : out std_logic;
      PLB_SrdDAck : out std_logic;
      PLB_SrdDBus : out std_logic_vector(0 to 63);
      PLB_SrdWdAddr : out std_logic_vector(0 to 3);
      PLB_Srearbitrate : out std_logic;
      PLB_Sssize : out std_logic_vector(0 to 1);
      PLB_Swait : out std_logic;
      PLB_SwrBTerm : out std_logic;
      PLB_SwrComp : out std_logic;
      PLB_SwrDAck : out std_logic;
      Bus_Error_Det : out std_logic
    );
  end component;

  component xps_bram_if_cntlr_1_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      BRAM_Rst : out std_logic;
      BRAM_Clk : out std_logic;
      BRAM_EN : out std_logic;
      BRAM_WEN : out std_logic_vector(0 to 7);
      BRAM_Addr : out std_logic_vector(0 to 31);
      BRAM_Din : in std_logic_vector(0 to 63);
      BRAM_Dout : out std_logic_vector(0 to 63)
    );
  end component;

  component plb_bram_if_cntlr_1_bram_wrapper is
    port (
      BRAM_Rst_A : in std_logic;
      BRAM_Clk_A : in std_logic;
      BRAM_EN_A : in std_logic;
      BRAM_WEN_A : in std_logic_vector(0 to 7);
      BRAM_Addr_A : in std_logic_vector(0 to 31);
      BRAM_Din_A : out std_logic_vector(0 to 63);
      BRAM_Dout_A : in std_logic_vector(0 to 63);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 7);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 63);
      BRAM_Dout_B : in std_logic_vector(0 to 63)
    );
  end component;

  component leds_4bit_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      IP2INTC_Irpt : out std_logic;
      GPIO_IO_I : in std_logic_vector(0 to 3);
      GPIO_IO_O : out std_logic_vector(0 to 3);
      GPIO_IO_T : out std_logic_vector(0 to 3);
      GPIO2_IO_I : in std_logic_vector(0 to 31);
      GPIO2_IO_O : out std_logic_vector(0 to 31);
      GPIO2_IO_T : out std_logic_vector(0 to 31)
    );
  end component;

  component leds_positions_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      IP2INTC_Irpt : out std_logic;
      GPIO_IO_I : in std_logic_vector(0 to 4);
      GPIO_IO_O : out std_logic_vector(0 to 4);
      GPIO_IO_T : out std_logic_vector(0 to 4);
      GPIO2_IO_I : in std_logic_vector(0 to 31);
      GPIO2_IO_O : out std_logic_vector(0 to 31);
      GPIO2_IO_T : out std_logic_vector(0 to 31)
    );
  end component;

  component push_buttons_position_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      IP2INTC_Irpt : out std_logic;
      GPIO_IO_I : in std_logic_vector(0 to 4);
      GPIO_IO_O : out std_logic_vector(0 to 4);
      GPIO_IO_T : out std_logic_vector(0 to 4);
      GPIO2_IO_I : in std_logic_vector(0 to 31);
      GPIO2_IO_O : out std_logic_vector(0 to 31);
      GPIO2_IO_T : out std_logic_vector(0 to 31)
    );
  end component;

  component iic_eeprom_wrapper is
    port (
      Sda_I : in std_logic;
      Sda_O : out std_logic;
      Sda_T : out std_logic;
      Scl_I : in std_logic;
      Scl_O : out std_logic;
      Scl_T : out std_logic;
      Gpo : out std_logic_vector(31 to 31);
      IIC2INTC_Irpt : out std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1)
    );
  end component;

  component sysace_compactflash_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      SysACE_MPA : out std_logic_vector(6 downto 0);
      SysACE_CLK : in std_logic;
      SysACE_MPIRQ : in std_logic;
      SysACE_MPD_I : in std_logic_vector(15 downto 0);
      SysACE_MPD_O : out std_logic_vector(15 downto 0);
      SysACE_MPD_T : out std_logic_vector(15 downto 0);
      SysACE_CEN : out std_logic;
      SysACE_OEN : out std_logic;
      SysACE_WEN : out std_logic;
      SysACE_IRQ : out std_logic
    );
  end component;

  component ddr_sdram_wrapper is
    port (
      FSL0_M_Clk : in std_logic;
      FSL0_M_Write : in std_logic;
      FSL0_M_Data : in std_logic_vector(0 to 31);
      FSL0_M_Control : in std_logic;
      FSL0_M_Full : out std_logic;
      FSL0_S_Clk : in std_logic;
      FSL0_S_Read : in std_logic;
      FSL0_S_Data : out std_logic_vector(0 to 31);
      FSL0_S_Control : out std_logic;
      FSL0_S_Exists : out std_logic;
      FSL0_B_M_Clk : in std_logic;
      FSL0_B_M_Write : in std_logic;
      FSL0_B_M_Data : in std_logic_vector(0 to 31);
      FSL0_B_M_Control : in std_logic;
      FSL0_B_M_Full : out std_logic;
      FSL0_B_S_Clk : in std_logic;
      FSL0_B_S_Read : in std_logic;
      FSL0_B_S_Data : out std_logic_vector(0 to 31);
      FSL0_B_S_Control : out std_logic;
      FSL0_B_S_Exists : out std_logic;
      SPLB0_Clk : in std_logic;
      SPLB0_Rst : in std_logic;
      SPLB0_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB0_PLB_PAValid : in std_logic;
      SPLB0_PLB_SAValid : in std_logic;
      SPLB0_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB0_PLB_RNW : in std_logic;
      SPLB0_PLB_BE : in std_logic_vector(0 to 7);
      SPLB0_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB0_PLB_rdPrim : in std_logic;
      SPLB0_PLB_wrPrim : in std_logic;
      SPLB0_PLB_abort : in std_logic;
      SPLB0_PLB_busLock : in std_logic;
      SPLB0_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB0_PLB_size : in std_logic_vector(0 to 3);
      SPLB0_PLB_type : in std_logic_vector(0 to 2);
      SPLB0_PLB_lockErr : in std_logic;
      SPLB0_PLB_wrPendReq : in std_logic;
      SPLB0_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB0_PLB_rdPendReq : in std_logic;
      SPLB0_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB0_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB0_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB0_PLB_rdBurst : in std_logic;
      SPLB0_PLB_wrBurst : in std_logic;
      SPLB0_PLB_wrDBus : in std_logic_vector(0 to 63);
      SPLB0_Sl_addrAck : out std_logic;
      SPLB0_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB0_Sl_wait : out std_logic;
      SPLB0_Sl_rearbitrate : out std_logic;
      SPLB0_Sl_wrDAck : out std_logic;
      SPLB0_Sl_wrComp : out std_logic;
      SPLB0_Sl_wrBTerm : out std_logic;
      SPLB0_Sl_rdDBus : out std_logic_vector(0 to 63);
      SPLB0_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB0_Sl_rdDAck : out std_logic;
      SPLB0_Sl_rdComp : out std_logic;
      SPLB0_Sl_rdBTerm : out std_logic;
      SPLB0_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB0_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB0_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB0_Sl_MIRQ : out std_logic_vector(0 to 0);
      SDMA0_Clk : in std_logic;
      SDMA0_Rx_IntOut : out std_logic;
      SDMA0_Tx_IntOut : out std_logic;
      SDMA0_RstOut : out std_logic;
      SDMA0_TX_D : out std_logic_vector(0 to 31);
      SDMA0_TX_Rem : out std_logic_vector(0 to 3);
      SDMA0_TX_SOF : out std_logic;
      SDMA0_TX_EOF : out std_logic;
      SDMA0_TX_SOP : out std_logic;
      SDMA0_TX_EOP : out std_logic;
      SDMA0_TX_Src_Rdy : out std_logic;
      SDMA0_TX_Dst_Rdy : in std_logic;
      SDMA0_RX_D : in std_logic_vector(0 to 31);
      SDMA0_RX_Rem : in std_logic_vector(0 to 3);
      SDMA0_RX_SOF : in std_logic;
      SDMA0_RX_EOF : in std_logic;
      SDMA0_RX_SOP : in std_logic;
      SDMA0_RX_EOP : in std_logic;
      SDMA0_RX_Src_Rdy : in std_logic;
      SDMA0_RX_Dst_Rdy : out std_logic;
      SDMA_CTRL0_Clk : in std_logic;
      SDMA_CTRL0_Rst : in std_logic;
      SDMA_CTRL0_PLB_ABus : in std_logic_vector(0 to 31);
      SDMA_CTRL0_PLB_PAValid : in std_logic;
      SDMA_CTRL0_PLB_SAValid : in std_logic;
      SDMA_CTRL0_PLB_masterID : in std_logic_vector(0 to 0);
      SDMA_CTRL0_PLB_RNW : in std_logic;
      SDMA_CTRL0_PLB_BE : in std_logic_vector(0 to 7);
      SDMA_CTRL0_PLB_UABus : in std_logic_vector(0 to 31);
      SDMA_CTRL0_PLB_rdPrim : in std_logic;
      SDMA_CTRL0_PLB_wrPrim : in std_logic;
      SDMA_CTRL0_PLB_abort : in std_logic;
      SDMA_CTRL0_PLB_busLock : in std_logic;
      SDMA_CTRL0_PLB_MSize : in std_logic_vector(0 to 1);
      SDMA_CTRL0_PLB_size : in std_logic_vector(0 to 3);
      SDMA_CTRL0_PLB_type : in std_logic_vector(0 to 2);
      SDMA_CTRL0_PLB_lockErr : in std_logic;
      SDMA_CTRL0_PLB_wrPendReq : in std_logic;
      SDMA_CTRL0_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL0_PLB_rdPendReq : in std_logic;
      SDMA_CTRL0_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL0_PLB_reqPri : in std_logic_vector(0 to 1);
      SDMA_CTRL0_PLB_TAttribute : in std_logic_vector(0 to 15);
      SDMA_CTRL0_PLB_rdBurst : in std_logic;
      SDMA_CTRL0_PLB_wrBurst : in std_logic;
      SDMA_CTRL0_PLB_wrDBus : in std_logic_vector(0 to 63);
      SDMA_CTRL0_Sl_addrAck : out std_logic;
      SDMA_CTRL0_Sl_SSize : out std_logic_vector(0 to 1);
      SDMA_CTRL0_Sl_wait : out std_logic;
      SDMA_CTRL0_Sl_rearbitrate : out std_logic;
      SDMA_CTRL0_Sl_wrDAck : out std_logic;
      SDMA_CTRL0_Sl_wrComp : out std_logic;
      SDMA_CTRL0_Sl_wrBTerm : out std_logic;
      SDMA_CTRL0_Sl_rdDBus : out std_logic_vector(0 to 63);
      SDMA_CTRL0_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SDMA_CTRL0_Sl_rdDAck : out std_logic;
      SDMA_CTRL0_Sl_rdComp : out std_logic;
      SDMA_CTRL0_Sl_rdBTerm : out std_logic;
      SDMA_CTRL0_Sl_MBusy : out std_logic_vector(0 to 0);
      SDMA_CTRL0_Sl_MRdErr : out std_logic_vector(0 to 0);
      SDMA_CTRL0_Sl_MWrErr : out std_logic_vector(0 to 0);
      SDMA_CTRL0_Sl_MIRQ : out std_logic_vector(0 to 0);
      PIM0_Addr : in std_logic_vector(31 downto 0);
      PIM0_AddrReq : in std_logic;
      PIM0_AddrAck : out std_logic;
      PIM0_RNW : in std_logic;
      PIM0_Size : in std_logic_vector(3 downto 0);
      PIM0_RdModWr : in std_logic;
      PIM0_WrFIFO_Data : in std_logic_vector(63 downto 0);
      PIM0_WrFIFO_BE : in std_logic_vector(7 downto 0);
      PIM0_WrFIFO_Push : in std_logic;
      PIM0_RdFIFO_Data : out std_logic_vector(63 downto 0);
      PIM0_RdFIFO_Pop : in std_logic;
      PIM0_RdFIFO_RdWdAddr : out std_logic_vector(3 downto 0);
      PIM0_WrFIFO_Empty : out std_logic;
      PIM0_WrFIFO_AlmostFull : out std_logic;
      PIM0_WrFIFO_Flush : in std_logic;
      PIM0_RdFIFO_Empty : out std_logic;
      PIM0_RdFIFO_Flush : in std_logic;
      PIM0_RdFIFO_Latency : out std_logic_vector(1 downto 0);
      PIM0_InitDone : out std_logic;
      PPC440MC0_MIMCReadNotWrite : in std_logic;
      PPC440MC0_MIMCAddress : in std_logic_vector(0 to 35);
      PPC440MC0_MIMCAddressValid : in std_logic;
      PPC440MC0_MIMCWriteData : in std_logic_vector(0 to 127);
      PPC440MC0_MIMCWriteDataValid : in std_logic;
      PPC440MC0_MIMCByteEnable : in std_logic_vector(0 to 15);
      PPC440MC0_MIMCBankConflict : in std_logic;
      PPC440MC0_MIMCRowConflict : in std_logic;
      PPC440MC0_MCMIReadData : out std_logic_vector(0 to 127);
      PPC440MC0_MCMIReadDataValid : out std_logic;
      PPC440MC0_MCMIReadDataErr : out std_logic;
      PPC440MC0_MCMIAddrReadyToAccept : out std_logic;
      VFBC0_Cmd_Clk : in std_logic;
      VFBC0_Cmd_Reset : in std_logic;
      VFBC0_Cmd_Data : in std_logic_vector(31 downto 0);
      VFBC0_Cmd_Write : in std_logic;
      VFBC0_Cmd_End : in std_logic;
      VFBC0_Cmd_Full : out std_logic;
      VFBC0_Cmd_Almost_Full : out std_logic;
      VFBC0_Cmd_Idle : out std_logic;
      VFBC0_Wd_Clk : in std_logic;
      VFBC0_Wd_Reset : in std_logic;
      VFBC0_Wd_Write : in std_logic;
      VFBC0_Wd_End_Burst : in std_logic;
      VFBC0_Wd_Flush : in std_logic;
      VFBC0_Wd_Data : in std_logic_vector(31 downto 0);
      VFBC0_Wd_Data_BE : in std_logic_vector(3 downto 0);
      VFBC0_Wd_Full : out std_logic;
      VFBC0_Wd_Almost_Full : out std_logic;
      VFBC0_Rd_Clk : in std_logic;
      VFBC0_Rd_Reset : in std_logic;
      VFBC0_Rd_Read : in std_logic;
      VFBC0_Rd_End_Burst : in std_logic;
      VFBC0_Rd_Flush : in std_logic;
      VFBC0_Rd_Data : out std_logic_vector(31 downto 0);
      VFBC0_Rd_Empty : out std_logic;
      VFBC0_Rd_Almost_Empty : out std_logic;
      MCB0_cmd_clk : in std_logic;
      MCB0_cmd_en : in std_logic;
      MCB0_cmd_instr : in std_logic_vector(2 downto 0);
      MCB0_cmd_bl : in std_logic_vector(5 downto 0);
      MCB0_cmd_byte_addr : in std_logic_vector(29 downto 0);
      MCB0_cmd_empty : out std_logic;
      MCB0_cmd_full : out std_logic;
      MCB0_wr_clk : in std_logic;
      MCB0_wr_en : in std_logic;
      MCB0_wr_mask : in std_logic_vector(7 downto 0);
      MCB0_wr_data : in std_logic_vector(63 downto 0);
      MCB0_wr_full : out std_logic;
      MCB0_wr_empty : out std_logic;
      MCB0_wr_count : out std_logic_vector(6 downto 0);
      MCB0_wr_underrun : out std_logic;
      MCB0_wr_error : out std_logic;
      MCB0_rd_clk : in std_logic;
      MCB0_rd_en : in std_logic;
      MCB0_rd_data : out std_logic_vector(63 downto 0);
      MCB0_rd_full : out std_logic;
      MCB0_rd_empty : out std_logic;
      MCB0_rd_count : out std_logic_vector(6 downto 0);
      MCB0_rd_overflow : out std_logic;
      MCB0_rd_error : out std_logic;
      FSL1_M_Clk : in std_logic;
      FSL1_M_Write : in std_logic;
      FSL1_M_Data : in std_logic_vector(0 to 31);
      FSL1_M_Control : in std_logic;
      FSL1_M_Full : out std_logic;
      FSL1_S_Clk : in std_logic;
      FSL1_S_Read : in std_logic;
      FSL1_S_Data : out std_logic_vector(0 to 31);
      FSL1_S_Control : out std_logic;
      FSL1_S_Exists : out std_logic;
      FSL1_B_M_Clk : in std_logic;
      FSL1_B_M_Write : in std_logic;
      FSL1_B_M_Data : in std_logic_vector(0 to 31);
      FSL1_B_M_Control : in std_logic;
      FSL1_B_M_Full : out std_logic;
      FSL1_B_S_Clk : in std_logic;
      FSL1_B_S_Read : in std_logic;
      FSL1_B_S_Data : out std_logic_vector(0 to 31);
      FSL1_B_S_Control : out std_logic;
      FSL1_B_S_Exists : out std_logic;
      SPLB1_Clk : in std_logic;
      SPLB1_Rst : in std_logic;
      SPLB1_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB1_PLB_PAValid : in std_logic;
      SPLB1_PLB_SAValid : in std_logic;
      SPLB1_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB1_PLB_RNW : in std_logic;
      SPLB1_PLB_BE : in std_logic_vector(0 to 7);
      SPLB1_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB1_PLB_rdPrim : in std_logic;
      SPLB1_PLB_wrPrim : in std_logic;
      SPLB1_PLB_abort : in std_logic;
      SPLB1_PLB_busLock : in std_logic;
      SPLB1_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB1_PLB_size : in std_logic_vector(0 to 3);
      SPLB1_PLB_type : in std_logic_vector(0 to 2);
      SPLB1_PLB_lockErr : in std_logic;
      SPLB1_PLB_wrPendReq : in std_logic;
      SPLB1_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB1_PLB_rdPendReq : in std_logic;
      SPLB1_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB1_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB1_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB1_PLB_rdBurst : in std_logic;
      SPLB1_PLB_wrBurst : in std_logic;
      SPLB1_PLB_wrDBus : in std_logic_vector(0 to 63);
      SPLB1_Sl_addrAck : out std_logic;
      SPLB1_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB1_Sl_wait : out std_logic;
      SPLB1_Sl_rearbitrate : out std_logic;
      SPLB1_Sl_wrDAck : out std_logic;
      SPLB1_Sl_wrComp : out std_logic;
      SPLB1_Sl_wrBTerm : out std_logic;
      SPLB1_Sl_rdDBus : out std_logic_vector(0 to 63);
      SPLB1_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB1_Sl_rdDAck : out std_logic;
      SPLB1_Sl_rdComp : out std_logic;
      SPLB1_Sl_rdBTerm : out std_logic;
      SPLB1_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB1_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB1_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB1_Sl_MIRQ : out std_logic_vector(0 to 0);
      SDMA1_Clk : in std_logic;
      SDMA1_Rx_IntOut : out std_logic;
      SDMA1_Tx_IntOut : out std_logic;
      SDMA1_RstOut : out std_logic;
      SDMA1_TX_D : out std_logic_vector(0 to 31);
      SDMA1_TX_Rem : out std_logic_vector(0 to 3);
      SDMA1_TX_SOF : out std_logic;
      SDMA1_TX_EOF : out std_logic;
      SDMA1_TX_SOP : out std_logic;
      SDMA1_TX_EOP : out std_logic;
      SDMA1_TX_Src_Rdy : out std_logic;
      SDMA1_TX_Dst_Rdy : in std_logic;
      SDMA1_RX_D : in std_logic_vector(0 to 31);
      SDMA1_RX_Rem : in std_logic_vector(0 to 3);
      SDMA1_RX_SOF : in std_logic;
      SDMA1_RX_EOF : in std_logic;
      SDMA1_RX_SOP : in std_logic;
      SDMA1_RX_EOP : in std_logic;
      SDMA1_RX_Src_Rdy : in std_logic;
      SDMA1_RX_Dst_Rdy : out std_logic;
      SDMA_CTRL1_Clk : in std_logic;
      SDMA_CTRL1_Rst : in std_logic;
      SDMA_CTRL1_PLB_ABus : in std_logic_vector(0 to 31);
      SDMA_CTRL1_PLB_PAValid : in std_logic;
      SDMA_CTRL1_PLB_SAValid : in std_logic;
      SDMA_CTRL1_PLB_masterID : in std_logic_vector(0 to 0);
      SDMA_CTRL1_PLB_RNW : in std_logic;
      SDMA_CTRL1_PLB_BE : in std_logic_vector(0 to 7);
      SDMA_CTRL1_PLB_UABus : in std_logic_vector(0 to 31);
      SDMA_CTRL1_PLB_rdPrim : in std_logic;
      SDMA_CTRL1_PLB_wrPrim : in std_logic;
      SDMA_CTRL1_PLB_abort : in std_logic;
      SDMA_CTRL1_PLB_busLock : in std_logic;
      SDMA_CTRL1_PLB_MSize : in std_logic_vector(0 to 1);
      SDMA_CTRL1_PLB_size : in std_logic_vector(0 to 3);
      SDMA_CTRL1_PLB_type : in std_logic_vector(0 to 2);
      SDMA_CTRL1_PLB_lockErr : in std_logic;
      SDMA_CTRL1_PLB_wrPendReq : in std_logic;
      SDMA_CTRL1_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL1_PLB_rdPendReq : in std_logic;
      SDMA_CTRL1_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL1_PLB_reqPri : in std_logic_vector(0 to 1);
      SDMA_CTRL1_PLB_TAttribute : in std_logic_vector(0 to 15);
      SDMA_CTRL1_PLB_rdBurst : in std_logic;
      SDMA_CTRL1_PLB_wrBurst : in std_logic;
      SDMA_CTRL1_PLB_wrDBus : in std_logic_vector(0 to 63);
      SDMA_CTRL1_Sl_addrAck : out std_logic;
      SDMA_CTRL1_Sl_SSize : out std_logic_vector(0 to 1);
      SDMA_CTRL1_Sl_wait : out std_logic;
      SDMA_CTRL1_Sl_rearbitrate : out std_logic;
      SDMA_CTRL1_Sl_wrDAck : out std_logic;
      SDMA_CTRL1_Sl_wrComp : out std_logic;
      SDMA_CTRL1_Sl_wrBTerm : out std_logic;
      SDMA_CTRL1_Sl_rdDBus : out std_logic_vector(0 to 63);
      SDMA_CTRL1_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SDMA_CTRL1_Sl_rdDAck : out std_logic;
      SDMA_CTRL1_Sl_rdComp : out std_logic;
      SDMA_CTRL1_Sl_rdBTerm : out std_logic;
      SDMA_CTRL1_Sl_MBusy : out std_logic_vector(0 to 0);
      SDMA_CTRL1_Sl_MRdErr : out std_logic_vector(0 to 0);
      SDMA_CTRL1_Sl_MWrErr : out std_logic_vector(0 to 0);
      SDMA_CTRL1_Sl_MIRQ : out std_logic_vector(0 to 0);
      PIM1_Addr : in std_logic_vector(31 downto 0);
      PIM1_AddrReq : in std_logic;
      PIM1_AddrAck : out std_logic;
      PIM1_RNW : in std_logic;
      PIM1_Size : in std_logic_vector(3 downto 0);
      PIM1_RdModWr : in std_logic;
      PIM1_WrFIFO_Data : in std_logic_vector(63 downto 0);
      PIM1_WrFIFO_BE : in std_logic_vector(7 downto 0);
      PIM1_WrFIFO_Push : in std_logic;
      PIM1_RdFIFO_Data : out std_logic_vector(63 downto 0);
      PIM1_RdFIFO_Pop : in std_logic;
      PIM1_RdFIFO_RdWdAddr : out std_logic_vector(3 downto 0);
      PIM1_WrFIFO_Empty : out std_logic;
      PIM1_WrFIFO_AlmostFull : out std_logic;
      PIM1_WrFIFO_Flush : in std_logic;
      PIM1_RdFIFO_Empty : out std_logic;
      PIM1_RdFIFO_Flush : in std_logic;
      PIM1_RdFIFO_Latency : out std_logic_vector(1 downto 0);
      PIM1_InitDone : out std_logic;
      PPC440MC1_MIMCReadNotWrite : in std_logic;
      PPC440MC1_MIMCAddress : in std_logic_vector(0 to 35);
      PPC440MC1_MIMCAddressValid : in std_logic;
      PPC440MC1_MIMCWriteData : in std_logic_vector(0 to 127);
      PPC440MC1_MIMCWriteDataValid : in std_logic;
      PPC440MC1_MIMCByteEnable : in std_logic_vector(0 to 15);
      PPC440MC1_MIMCBankConflict : in std_logic;
      PPC440MC1_MIMCRowConflict : in std_logic;
      PPC440MC1_MCMIReadData : out std_logic_vector(0 to 127);
      PPC440MC1_MCMIReadDataValid : out std_logic;
      PPC440MC1_MCMIReadDataErr : out std_logic;
      PPC440MC1_MCMIAddrReadyToAccept : out std_logic;
      VFBC1_Cmd_Clk : in std_logic;
      VFBC1_Cmd_Reset : in std_logic;
      VFBC1_Cmd_Data : in std_logic_vector(31 downto 0);
      VFBC1_Cmd_Write : in std_logic;
      VFBC1_Cmd_End : in std_logic;
      VFBC1_Cmd_Full : out std_logic;
      VFBC1_Cmd_Almost_Full : out std_logic;
      VFBC1_Cmd_Idle : out std_logic;
      VFBC1_Wd_Clk : in std_logic;
      VFBC1_Wd_Reset : in std_logic;
      VFBC1_Wd_Write : in std_logic;
      VFBC1_Wd_End_Burst : in std_logic;
      VFBC1_Wd_Flush : in std_logic;
      VFBC1_Wd_Data : in std_logic_vector(31 downto 0);
      VFBC1_Wd_Data_BE : in std_logic_vector(3 downto 0);
      VFBC1_Wd_Full : out std_logic;
      VFBC1_Wd_Almost_Full : out std_logic;
      VFBC1_Rd_Clk : in std_logic;
      VFBC1_Rd_Reset : in std_logic;
      VFBC1_Rd_Read : in std_logic;
      VFBC1_Rd_End_Burst : in std_logic;
      VFBC1_Rd_Flush : in std_logic;
      VFBC1_Rd_Data : out std_logic_vector(31 downto 0);
      VFBC1_Rd_Empty : out std_logic;
      VFBC1_Rd_Almost_Empty : out std_logic;
      MCB1_cmd_clk : in std_logic;
      MCB1_cmd_en : in std_logic;
      MCB1_cmd_instr : in std_logic_vector(2 downto 0);
      MCB1_cmd_bl : in std_logic_vector(5 downto 0);
      MCB1_cmd_byte_addr : in std_logic_vector(29 downto 0);
      MCB1_cmd_empty : out std_logic;
      MCB1_cmd_full : out std_logic;
      MCB1_wr_clk : in std_logic;
      MCB1_wr_en : in std_logic;
      MCB1_wr_mask : in std_logic_vector(7 downto 0);
      MCB1_wr_data : in std_logic_vector(63 downto 0);
      MCB1_wr_full : out std_logic;
      MCB1_wr_empty : out std_logic;
      MCB1_wr_count : out std_logic_vector(6 downto 0);
      MCB1_wr_underrun : out std_logic;
      MCB1_wr_error : out std_logic;
      MCB1_rd_clk : in std_logic;
      MCB1_rd_en : in std_logic;
      MCB1_rd_data : out std_logic_vector(63 downto 0);
      MCB1_rd_full : out std_logic;
      MCB1_rd_empty : out std_logic;
      MCB1_rd_count : out std_logic_vector(6 downto 0);
      MCB1_rd_overflow : out std_logic;
      MCB1_rd_error : out std_logic;
      FSL2_M_Clk : in std_logic;
      FSL2_M_Write : in std_logic;
      FSL2_M_Data : in std_logic_vector(0 to 31);
      FSL2_M_Control : in std_logic;
      FSL2_M_Full : out std_logic;
      FSL2_S_Clk : in std_logic;
      FSL2_S_Read : in std_logic;
      FSL2_S_Data : out std_logic_vector(0 to 31);
      FSL2_S_Control : out std_logic;
      FSL2_S_Exists : out std_logic;
      FSL2_B_M_Clk : in std_logic;
      FSL2_B_M_Write : in std_logic;
      FSL2_B_M_Data : in std_logic_vector(0 to 31);
      FSL2_B_M_Control : in std_logic;
      FSL2_B_M_Full : out std_logic;
      FSL2_B_S_Clk : in std_logic;
      FSL2_B_S_Read : in std_logic;
      FSL2_B_S_Data : out std_logic_vector(0 to 31);
      FSL2_B_S_Control : out std_logic;
      FSL2_B_S_Exists : out std_logic;
      SPLB2_Clk : in std_logic;
      SPLB2_Rst : in std_logic;
      SPLB2_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB2_PLB_PAValid : in std_logic;
      SPLB2_PLB_SAValid : in std_logic;
      SPLB2_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB2_PLB_RNW : in std_logic;
      SPLB2_PLB_BE : in std_logic_vector(0 to 7);
      SPLB2_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB2_PLB_rdPrim : in std_logic;
      SPLB2_PLB_wrPrim : in std_logic;
      SPLB2_PLB_abort : in std_logic;
      SPLB2_PLB_busLock : in std_logic;
      SPLB2_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB2_PLB_size : in std_logic_vector(0 to 3);
      SPLB2_PLB_type : in std_logic_vector(0 to 2);
      SPLB2_PLB_lockErr : in std_logic;
      SPLB2_PLB_wrPendReq : in std_logic;
      SPLB2_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB2_PLB_rdPendReq : in std_logic;
      SPLB2_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB2_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB2_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB2_PLB_rdBurst : in std_logic;
      SPLB2_PLB_wrBurst : in std_logic;
      SPLB2_PLB_wrDBus : in std_logic_vector(0 to 63);
      SPLB2_Sl_addrAck : out std_logic;
      SPLB2_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB2_Sl_wait : out std_logic;
      SPLB2_Sl_rearbitrate : out std_logic;
      SPLB2_Sl_wrDAck : out std_logic;
      SPLB2_Sl_wrComp : out std_logic;
      SPLB2_Sl_wrBTerm : out std_logic;
      SPLB2_Sl_rdDBus : out std_logic_vector(0 to 63);
      SPLB2_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB2_Sl_rdDAck : out std_logic;
      SPLB2_Sl_rdComp : out std_logic;
      SPLB2_Sl_rdBTerm : out std_logic;
      SPLB2_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB2_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB2_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB2_Sl_MIRQ : out std_logic_vector(0 to 0);
      SDMA2_Clk : in std_logic;
      SDMA2_Rx_IntOut : out std_logic;
      SDMA2_Tx_IntOut : out std_logic;
      SDMA2_RstOut : out std_logic;
      SDMA2_TX_D : out std_logic_vector(0 to 31);
      SDMA2_TX_Rem : out std_logic_vector(0 to 3);
      SDMA2_TX_SOF : out std_logic;
      SDMA2_TX_EOF : out std_logic;
      SDMA2_TX_SOP : out std_logic;
      SDMA2_TX_EOP : out std_logic;
      SDMA2_TX_Src_Rdy : out std_logic;
      SDMA2_TX_Dst_Rdy : in std_logic;
      SDMA2_RX_D : in std_logic_vector(0 to 31);
      SDMA2_RX_Rem : in std_logic_vector(0 to 3);
      SDMA2_RX_SOF : in std_logic;
      SDMA2_RX_EOF : in std_logic;
      SDMA2_RX_SOP : in std_logic;
      SDMA2_RX_EOP : in std_logic;
      SDMA2_RX_Src_Rdy : in std_logic;
      SDMA2_RX_Dst_Rdy : out std_logic;
      SDMA_CTRL2_Clk : in std_logic;
      SDMA_CTRL2_Rst : in std_logic;
      SDMA_CTRL2_PLB_ABus : in std_logic_vector(0 to 31);
      SDMA_CTRL2_PLB_PAValid : in std_logic;
      SDMA_CTRL2_PLB_SAValid : in std_logic;
      SDMA_CTRL2_PLB_masterID : in std_logic_vector(0 to 0);
      SDMA_CTRL2_PLB_RNW : in std_logic;
      SDMA_CTRL2_PLB_BE : in std_logic_vector(0 to 7);
      SDMA_CTRL2_PLB_UABus : in std_logic_vector(0 to 31);
      SDMA_CTRL2_PLB_rdPrim : in std_logic;
      SDMA_CTRL2_PLB_wrPrim : in std_logic;
      SDMA_CTRL2_PLB_abort : in std_logic;
      SDMA_CTRL2_PLB_busLock : in std_logic;
      SDMA_CTRL2_PLB_MSize : in std_logic_vector(0 to 1);
      SDMA_CTRL2_PLB_size : in std_logic_vector(0 to 3);
      SDMA_CTRL2_PLB_type : in std_logic_vector(0 to 2);
      SDMA_CTRL2_PLB_lockErr : in std_logic;
      SDMA_CTRL2_PLB_wrPendReq : in std_logic;
      SDMA_CTRL2_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL2_PLB_rdPendReq : in std_logic;
      SDMA_CTRL2_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL2_PLB_reqPri : in std_logic_vector(0 to 1);
      SDMA_CTRL2_PLB_TAttribute : in std_logic_vector(0 to 15);
      SDMA_CTRL2_PLB_rdBurst : in std_logic;
      SDMA_CTRL2_PLB_wrBurst : in std_logic;
      SDMA_CTRL2_PLB_wrDBus : in std_logic_vector(0 to 63);
      SDMA_CTRL2_Sl_addrAck : out std_logic;
      SDMA_CTRL2_Sl_SSize : out std_logic_vector(0 to 1);
      SDMA_CTRL2_Sl_wait : out std_logic;
      SDMA_CTRL2_Sl_rearbitrate : out std_logic;
      SDMA_CTRL2_Sl_wrDAck : out std_logic;
      SDMA_CTRL2_Sl_wrComp : out std_logic;
      SDMA_CTRL2_Sl_wrBTerm : out std_logic;
      SDMA_CTRL2_Sl_rdDBus : out std_logic_vector(0 to 63);
      SDMA_CTRL2_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SDMA_CTRL2_Sl_rdDAck : out std_logic;
      SDMA_CTRL2_Sl_rdComp : out std_logic;
      SDMA_CTRL2_Sl_rdBTerm : out std_logic;
      SDMA_CTRL2_Sl_MBusy : out std_logic_vector(0 to 1);
      SDMA_CTRL2_Sl_MRdErr : out std_logic_vector(0 to 1);
      SDMA_CTRL2_Sl_MWrErr : out std_logic_vector(0 to 1);
      SDMA_CTRL2_Sl_MIRQ : out std_logic_vector(0 to 1);
      PIM2_Addr : in std_logic_vector(31 downto 0);
      PIM2_AddrReq : in std_logic;
      PIM2_AddrAck : out std_logic;
      PIM2_RNW : in std_logic;
      PIM2_Size : in std_logic_vector(3 downto 0);
      PIM2_RdModWr : in std_logic;
      PIM2_WrFIFO_Data : in std_logic_vector(63 downto 0);
      PIM2_WrFIFO_BE : in std_logic_vector(7 downto 0);
      PIM2_WrFIFO_Push : in std_logic;
      PIM2_RdFIFO_Data : out std_logic_vector(63 downto 0);
      PIM2_RdFIFO_Pop : in std_logic;
      PIM2_RdFIFO_RdWdAddr : out std_logic_vector(3 downto 0);
      PIM2_WrFIFO_Empty : out std_logic;
      PIM2_WrFIFO_AlmostFull : out std_logic;
      PIM2_WrFIFO_Flush : in std_logic;
      PIM2_RdFIFO_Empty : out std_logic;
      PIM2_RdFIFO_Flush : in std_logic;
      PIM2_RdFIFO_Latency : out std_logic_vector(1 downto 0);
      PIM2_InitDone : out std_logic;
      PPC440MC2_MIMCReadNotWrite : in std_logic;
      PPC440MC2_MIMCAddress : in std_logic_vector(0 to 35);
      PPC440MC2_MIMCAddressValid : in std_logic;
      PPC440MC2_MIMCWriteData : in std_logic_vector(0 to 127);
      PPC440MC2_MIMCWriteDataValid : in std_logic;
      PPC440MC2_MIMCByteEnable : in std_logic_vector(0 to 15);
      PPC440MC2_MIMCBankConflict : in std_logic;
      PPC440MC2_MIMCRowConflict : in std_logic;
      PPC440MC2_MCMIReadData : out std_logic_vector(0 to 127);
      PPC440MC2_MCMIReadDataValid : out std_logic;
      PPC440MC2_MCMIReadDataErr : out std_logic;
      PPC440MC2_MCMIAddrReadyToAccept : out std_logic;
      VFBC2_Cmd_Clk : in std_logic;
      VFBC2_Cmd_Reset : in std_logic;
      VFBC2_Cmd_Data : in std_logic_vector(31 downto 0);
      VFBC2_Cmd_Write : in std_logic;
      VFBC2_Cmd_End : in std_logic;
      VFBC2_Cmd_Full : out std_logic;
      VFBC2_Cmd_Almost_Full : out std_logic;
      VFBC2_Cmd_Idle : out std_logic;
      VFBC2_Wd_Clk : in std_logic;
      VFBC2_Wd_Reset : in std_logic;
      VFBC2_Wd_Write : in std_logic;
      VFBC2_Wd_End_Burst : in std_logic;
      VFBC2_Wd_Flush : in std_logic;
      VFBC2_Wd_Data : in std_logic_vector(31 downto 0);
      VFBC2_Wd_Data_BE : in std_logic_vector(3 downto 0);
      VFBC2_Wd_Full : out std_logic;
      VFBC2_Wd_Almost_Full : out std_logic;
      VFBC2_Rd_Clk : in std_logic;
      VFBC2_Rd_Reset : in std_logic;
      VFBC2_Rd_Read : in std_logic;
      VFBC2_Rd_End_Burst : in std_logic;
      VFBC2_Rd_Flush : in std_logic;
      VFBC2_Rd_Data : out std_logic_vector(31 downto 0);
      VFBC2_Rd_Empty : out std_logic;
      VFBC2_Rd_Almost_Empty : out std_logic;
      MCB2_cmd_clk : in std_logic;
      MCB2_cmd_en : in std_logic;
      MCB2_cmd_instr : in std_logic_vector(2 downto 0);
      MCB2_cmd_bl : in std_logic_vector(5 downto 0);
      MCB2_cmd_byte_addr : in std_logic_vector(29 downto 0);
      MCB2_cmd_empty : out std_logic;
      MCB2_cmd_full : out std_logic;
      MCB2_wr_clk : in std_logic;
      MCB2_wr_en : in std_logic;
      MCB2_wr_mask : in std_logic_vector(7 downto 0);
      MCB2_wr_data : in std_logic_vector(63 downto 0);
      MCB2_wr_full : out std_logic;
      MCB2_wr_empty : out std_logic;
      MCB2_wr_count : out std_logic_vector(6 downto 0);
      MCB2_wr_underrun : out std_logic;
      MCB2_wr_error : out std_logic;
      MCB2_rd_clk : in std_logic;
      MCB2_rd_en : in std_logic;
      MCB2_rd_data : out std_logic_vector(63 downto 0);
      MCB2_rd_full : out std_logic;
      MCB2_rd_empty : out std_logic;
      MCB2_rd_count : out std_logic_vector(6 downto 0);
      MCB2_rd_overflow : out std_logic;
      MCB2_rd_error : out std_logic;
      FSL3_M_Clk : in std_logic;
      FSL3_M_Write : in std_logic;
      FSL3_M_Data : in std_logic_vector(0 to 31);
      FSL3_M_Control : in std_logic;
      FSL3_M_Full : out std_logic;
      FSL3_S_Clk : in std_logic;
      FSL3_S_Read : in std_logic;
      FSL3_S_Data : out std_logic_vector(0 to 31);
      FSL3_S_Control : out std_logic;
      FSL3_S_Exists : out std_logic;
      FSL3_B_M_Clk : in std_logic;
      FSL3_B_M_Write : in std_logic;
      FSL3_B_M_Data : in std_logic_vector(0 to 31);
      FSL3_B_M_Control : in std_logic;
      FSL3_B_M_Full : out std_logic;
      FSL3_B_S_Clk : in std_logic;
      FSL3_B_S_Read : in std_logic;
      FSL3_B_S_Data : out std_logic_vector(0 to 31);
      FSL3_B_S_Control : out std_logic;
      FSL3_B_S_Exists : out std_logic;
      SPLB3_Clk : in std_logic;
      SPLB3_Rst : in std_logic;
      SPLB3_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB3_PLB_PAValid : in std_logic;
      SPLB3_PLB_SAValid : in std_logic;
      SPLB3_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB3_PLB_RNW : in std_logic;
      SPLB3_PLB_BE : in std_logic_vector(0 to 7);
      SPLB3_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB3_PLB_rdPrim : in std_logic;
      SPLB3_PLB_wrPrim : in std_logic;
      SPLB3_PLB_abort : in std_logic;
      SPLB3_PLB_busLock : in std_logic;
      SPLB3_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB3_PLB_size : in std_logic_vector(0 to 3);
      SPLB3_PLB_type : in std_logic_vector(0 to 2);
      SPLB3_PLB_lockErr : in std_logic;
      SPLB3_PLB_wrPendReq : in std_logic;
      SPLB3_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB3_PLB_rdPendReq : in std_logic;
      SPLB3_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB3_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB3_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB3_PLB_rdBurst : in std_logic;
      SPLB3_PLB_wrBurst : in std_logic;
      SPLB3_PLB_wrDBus : in std_logic_vector(0 to 63);
      SPLB3_Sl_addrAck : out std_logic;
      SPLB3_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB3_Sl_wait : out std_logic;
      SPLB3_Sl_rearbitrate : out std_logic;
      SPLB3_Sl_wrDAck : out std_logic;
      SPLB3_Sl_wrComp : out std_logic;
      SPLB3_Sl_wrBTerm : out std_logic;
      SPLB3_Sl_rdDBus : out std_logic_vector(0 to 63);
      SPLB3_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB3_Sl_rdDAck : out std_logic;
      SPLB3_Sl_rdComp : out std_logic;
      SPLB3_Sl_rdBTerm : out std_logic;
      SPLB3_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB3_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB3_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB3_Sl_MIRQ : out std_logic_vector(0 to 0);
      SDMA3_Clk : in std_logic;
      SDMA3_Rx_IntOut : out std_logic;
      SDMA3_Tx_IntOut : out std_logic;
      SDMA3_RstOut : out std_logic;
      SDMA3_TX_D : out std_logic_vector(0 to 31);
      SDMA3_TX_Rem : out std_logic_vector(0 to 3);
      SDMA3_TX_SOF : out std_logic;
      SDMA3_TX_EOF : out std_logic;
      SDMA3_TX_SOP : out std_logic;
      SDMA3_TX_EOP : out std_logic;
      SDMA3_TX_Src_Rdy : out std_logic;
      SDMA3_TX_Dst_Rdy : in std_logic;
      SDMA3_RX_D : in std_logic_vector(0 to 31);
      SDMA3_RX_Rem : in std_logic_vector(0 to 3);
      SDMA3_RX_SOF : in std_logic;
      SDMA3_RX_EOF : in std_logic;
      SDMA3_RX_SOP : in std_logic;
      SDMA3_RX_EOP : in std_logic;
      SDMA3_RX_Src_Rdy : in std_logic;
      SDMA3_RX_Dst_Rdy : out std_logic;
      SDMA_CTRL3_Clk : in std_logic;
      SDMA_CTRL3_Rst : in std_logic;
      SDMA_CTRL3_PLB_ABus : in std_logic_vector(0 to 31);
      SDMA_CTRL3_PLB_PAValid : in std_logic;
      SDMA_CTRL3_PLB_SAValid : in std_logic;
      SDMA_CTRL3_PLB_masterID : in std_logic_vector(0 to 0);
      SDMA_CTRL3_PLB_RNW : in std_logic;
      SDMA_CTRL3_PLB_BE : in std_logic_vector(0 to 7);
      SDMA_CTRL3_PLB_UABus : in std_logic_vector(0 to 31);
      SDMA_CTRL3_PLB_rdPrim : in std_logic;
      SDMA_CTRL3_PLB_wrPrim : in std_logic;
      SDMA_CTRL3_PLB_abort : in std_logic;
      SDMA_CTRL3_PLB_busLock : in std_logic;
      SDMA_CTRL3_PLB_MSize : in std_logic_vector(0 to 1);
      SDMA_CTRL3_PLB_size : in std_logic_vector(0 to 3);
      SDMA_CTRL3_PLB_type : in std_logic_vector(0 to 2);
      SDMA_CTRL3_PLB_lockErr : in std_logic;
      SDMA_CTRL3_PLB_wrPendReq : in std_logic;
      SDMA_CTRL3_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL3_PLB_rdPendReq : in std_logic;
      SDMA_CTRL3_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL3_PLB_reqPri : in std_logic_vector(0 to 1);
      SDMA_CTRL3_PLB_TAttribute : in std_logic_vector(0 to 15);
      SDMA_CTRL3_PLB_rdBurst : in std_logic;
      SDMA_CTRL3_PLB_wrBurst : in std_logic;
      SDMA_CTRL3_PLB_wrDBus : in std_logic_vector(0 to 63);
      SDMA_CTRL3_Sl_addrAck : out std_logic;
      SDMA_CTRL3_Sl_SSize : out std_logic_vector(0 to 1);
      SDMA_CTRL3_Sl_wait : out std_logic;
      SDMA_CTRL3_Sl_rearbitrate : out std_logic;
      SDMA_CTRL3_Sl_wrDAck : out std_logic;
      SDMA_CTRL3_Sl_wrComp : out std_logic;
      SDMA_CTRL3_Sl_wrBTerm : out std_logic;
      SDMA_CTRL3_Sl_rdDBus : out std_logic_vector(0 to 63);
      SDMA_CTRL3_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SDMA_CTRL3_Sl_rdDAck : out std_logic;
      SDMA_CTRL3_Sl_rdComp : out std_logic;
      SDMA_CTRL3_Sl_rdBTerm : out std_logic;
      SDMA_CTRL3_Sl_MBusy : out std_logic_vector(0 to 0);
      SDMA_CTRL3_Sl_MRdErr : out std_logic_vector(0 to 0);
      SDMA_CTRL3_Sl_MWrErr : out std_logic_vector(0 to 0);
      SDMA_CTRL3_Sl_MIRQ : out std_logic_vector(0 to 0);
      PIM3_Addr : in std_logic_vector(31 downto 0);
      PIM3_AddrReq : in std_logic;
      PIM3_AddrAck : out std_logic;
      PIM3_RNW : in std_logic;
      PIM3_Size : in std_logic_vector(3 downto 0);
      PIM3_RdModWr : in std_logic;
      PIM3_WrFIFO_Data : in std_logic_vector(63 downto 0);
      PIM3_WrFIFO_BE : in std_logic_vector(7 downto 0);
      PIM3_WrFIFO_Push : in std_logic;
      PIM3_RdFIFO_Data : out std_logic_vector(63 downto 0);
      PIM3_RdFIFO_Pop : in std_logic;
      PIM3_RdFIFO_RdWdAddr : out std_logic_vector(3 downto 0);
      PIM3_WrFIFO_Empty : out std_logic;
      PIM3_WrFIFO_AlmostFull : out std_logic;
      PIM3_WrFIFO_Flush : in std_logic;
      PIM3_RdFIFO_Empty : out std_logic;
      PIM3_RdFIFO_Flush : in std_logic;
      PIM3_RdFIFO_Latency : out std_logic_vector(1 downto 0);
      PIM3_InitDone : out std_logic;
      PPC440MC3_MIMCReadNotWrite : in std_logic;
      PPC440MC3_MIMCAddress : in std_logic_vector(0 to 35);
      PPC440MC3_MIMCAddressValid : in std_logic;
      PPC440MC3_MIMCWriteData : in std_logic_vector(0 to 127);
      PPC440MC3_MIMCWriteDataValid : in std_logic;
      PPC440MC3_MIMCByteEnable : in std_logic_vector(0 to 15);
      PPC440MC3_MIMCBankConflict : in std_logic;
      PPC440MC3_MIMCRowConflict : in std_logic;
      PPC440MC3_MCMIReadData : out std_logic_vector(0 to 127);
      PPC440MC3_MCMIReadDataValid : out std_logic;
      PPC440MC3_MCMIReadDataErr : out std_logic;
      PPC440MC3_MCMIAddrReadyToAccept : out std_logic;
      VFBC3_Cmd_Clk : in std_logic;
      VFBC3_Cmd_Reset : in std_logic;
      VFBC3_Cmd_Data : in std_logic_vector(31 downto 0);
      VFBC3_Cmd_Write : in std_logic;
      VFBC3_Cmd_End : in std_logic;
      VFBC3_Cmd_Full : out std_logic;
      VFBC3_Cmd_Almost_Full : out std_logic;
      VFBC3_Cmd_Idle : out std_logic;
      VFBC3_Wd_Clk : in std_logic;
      VFBC3_Wd_Reset : in std_logic;
      VFBC3_Wd_Write : in std_logic;
      VFBC3_Wd_End_Burst : in std_logic;
      VFBC3_Wd_Flush : in std_logic;
      VFBC3_Wd_Data : in std_logic_vector(31 downto 0);
      VFBC3_Wd_Data_BE : in std_logic_vector(3 downto 0);
      VFBC3_Wd_Full : out std_logic;
      VFBC3_Wd_Almost_Full : out std_logic;
      VFBC3_Rd_Clk : in std_logic;
      VFBC3_Rd_Reset : in std_logic;
      VFBC3_Rd_Read : in std_logic;
      VFBC3_Rd_End_Burst : in std_logic;
      VFBC3_Rd_Flush : in std_logic;
      VFBC3_Rd_Data : out std_logic_vector(31 downto 0);
      VFBC3_Rd_Empty : out std_logic;
      VFBC3_Rd_Almost_Empty : out std_logic;
      MCB3_cmd_clk : in std_logic;
      MCB3_cmd_en : in std_logic;
      MCB3_cmd_instr : in std_logic_vector(2 downto 0);
      MCB3_cmd_bl : in std_logic_vector(5 downto 0);
      MCB3_cmd_byte_addr : in std_logic_vector(29 downto 0);
      MCB3_cmd_empty : out std_logic;
      MCB3_cmd_full : out std_logic;
      MCB3_wr_clk : in std_logic;
      MCB3_wr_en : in std_logic;
      MCB3_wr_mask : in std_logic_vector(7 downto 0);
      MCB3_wr_data : in std_logic_vector(63 downto 0);
      MCB3_wr_full : out std_logic;
      MCB3_wr_empty : out std_logic;
      MCB3_wr_count : out std_logic_vector(6 downto 0);
      MCB3_wr_underrun : out std_logic;
      MCB3_wr_error : out std_logic;
      MCB3_rd_clk : in std_logic;
      MCB3_rd_en : in std_logic;
      MCB3_rd_data : out std_logic_vector(63 downto 0);
      MCB3_rd_full : out std_logic;
      MCB3_rd_empty : out std_logic;
      MCB3_rd_count : out std_logic_vector(6 downto 0);
      MCB3_rd_overflow : out std_logic;
      MCB3_rd_error : out std_logic;
      FSL4_M_Clk : in std_logic;
      FSL4_M_Write : in std_logic;
      FSL4_M_Data : in std_logic_vector(0 to 31);
      FSL4_M_Control : in std_logic;
      FSL4_M_Full : out std_logic;
      FSL4_S_Clk : in std_logic;
      FSL4_S_Read : in std_logic;
      FSL4_S_Data : out std_logic_vector(0 to 31);
      FSL4_S_Control : out std_logic;
      FSL4_S_Exists : out std_logic;
      FSL4_B_M_Clk : in std_logic;
      FSL4_B_M_Write : in std_logic;
      FSL4_B_M_Data : in std_logic_vector(0 to 31);
      FSL4_B_M_Control : in std_logic;
      FSL4_B_M_Full : out std_logic;
      FSL4_B_S_Clk : in std_logic;
      FSL4_B_S_Read : in std_logic;
      FSL4_B_S_Data : out std_logic_vector(0 to 31);
      FSL4_B_S_Control : out std_logic;
      FSL4_B_S_Exists : out std_logic;
      SPLB4_Clk : in std_logic;
      SPLB4_Rst : in std_logic;
      SPLB4_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB4_PLB_PAValid : in std_logic;
      SPLB4_PLB_SAValid : in std_logic;
      SPLB4_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB4_PLB_RNW : in std_logic;
      SPLB4_PLB_BE : in std_logic_vector(0 to 7);
      SPLB4_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB4_PLB_rdPrim : in std_logic;
      SPLB4_PLB_wrPrim : in std_logic;
      SPLB4_PLB_abort : in std_logic;
      SPLB4_PLB_busLock : in std_logic;
      SPLB4_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB4_PLB_size : in std_logic_vector(0 to 3);
      SPLB4_PLB_type : in std_logic_vector(0 to 2);
      SPLB4_PLB_lockErr : in std_logic;
      SPLB4_PLB_wrPendReq : in std_logic;
      SPLB4_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB4_PLB_rdPendReq : in std_logic;
      SPLB4_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB4_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB4_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB4_PLB_rdBurst : in std_logic;
      SPLB4_PLB_wrBurst : in std_logic;
      SPLB4_PLB_wrDBus : in std_logic_vector(0 to 63);
      SPLB4_Sl_addrAck : out std_logic;
      SPLB4_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB4_Sl_wait : out std_logic;
      SPLB4_Sl_rearbitrate : out std_logic;
      SPLB4_Sl_wrDAck : out std_logic;
      SPLB4_Sl_wrComp : out std_logic;
      SPLB4_Sl_wrBTerm : out std_logic;
      SPLB4_Sl_rdDBus : out std_logic_vector(0 to 63);
      SPLB4_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB4_Sl_rdDAck : out std_logic;
      SPLB4_Sl_rdComp : out std_logic;
      SPLB4_Sl_rdBTerm : out std_logic;
      SPLB4_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB4_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB4_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB4_Sl_MIRQ : out std_logic_vector(0 to 0);
      SDMA4_Clk : in std_logic;
      SDMA4_Rx_IntOut : out std_logic;
      SDMA4_Tx_IntOut : out std_logic;
      SDMA4_RstOut : out std_logic;
      SDMA4_TX_D : out std_logic_vector(0 to 31);
      SDMA4_TX_Rem : out std_logic_vector(0 to 3);
      SDMA4_TX_SOF : out std_logic;
      SDMA4_TX_EOF : out std_logic;
      SDMA4_TX_SOP : out std_logic;
      SDMA4_TX_EOP : out std_logic;
      SDMA4_TX_Src_Rdy : out std_logic;
      SDMA4_TX_Dst_Rdy : in std_logic;
      SDMA4_RX_D : in std_logic_vector(0 to 31);
      SDMA4_RX_Rem : in std_logic_vector(0 to 3);
      SDMA4_RX_SOF : in std_logic;
      SDMA4_RX_EOF : in std_logic;
      SDMA4_RX_SOP : in std_logic;
      SDMA4_RX_EOP : in std_logic;
      SDMA4_RX_Src_Rdy : in std_logic;
      SDMA4_RX_Dst_Rdy : out std_logic;
      SDMA_CTRL4_Clk : in std_logic;
      SDMA_CTRL4_Rst : in std_logic;
      SDMA_CTRL4_PLB_ABus : in std_logic_vector(0 to 31);
      SDMA_CTRL4_PLB_PAValid : in std_logic;
      SDMA_CTRL4_PLB_SAValid : in std_logic;
      SDMA_CTRL4_PLB_masterID : in std_logic_vector(0 to 0);
      SDMA_CTRL4_PLB_RNW : in std_logic;
      SDMA_CTRL4_PLB_BE : in std_logic_vector(0 to 7);
      SDMA_CTRL4_PLB_UABus : in std_logic_vector(0 to 31);
      SDMA_CTRL4_PLB_rdPrim : in std_logic;
      SDMA_CTRL4_PLB_wrPrim : in std_logic;
      SDMA_CTRL4_PLB_abort : in std_logic;
      SDMA_CTRL4_PLB_busLock : in std_logic;
      SDMA_CTRL4_PLB_MSize : in std_logic_vector(0 to 1);
      SDMA_CTRL4_PLB_size : in std_logic_vector(0 to 3);
      SDMA_CTRL4_PLB_type : in std_logic_vector(0 to 2);
      SDMA_CTRL4_PLB_lockErr : in std_logic;
      SDMA_CTRL4_PLB_wrPendReq : in std_logic;
      SDMA_CTRL4_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL4_PLB_rdPendReq : in std_logic;
      SDMA_CTRL4_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL4_PLB_reqPri : in std_logic_vector(0 to 1);
      SDMA_CTRL4_PLB_TAttribute : in std_logic_vector(0 to 15);
      SDMA_CTRL4_PLB_rdBurst : in std_logic;
      SDMA_CTRL4_PLB_wrBurst : in std_logic;
      SDMA_CTRL4_PLB_wrDBus : in std_logic_vector(0 to 63);
      SDMA_CTRL4_Sl_addrAck : out std_logic;
      SDMA_CTRL4_Sl_SSize : out std_logic_vector(0 to 1);
      SDMA_CTRL4_Sl_wait : out std_logic;
      SDMA_CTRL4_Sl_rearbitrate : out std_logic;
      SDMA_CTRL4_Sl_wrDAck : out std_logic;
      SDMA_CTRL4_Sl_wrComp : out std_logic;
      SDMA_CTRL4_Sl_wrBTerm : out std_logic;
      SDMA_CTRL4_Sl_rdDBus : out std_logic_vector(0 to 63);
      SDMA_CTRL4_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SDMA_CTRL4_Sl_rdDAck : out std_logic;
      SDMA_CTRL4_Sl_rdComp : out std_logic;
      SDMA_CTRL4_Sl_rdBTerm : out std_logic;
      SDMA_CTRL4_Sl_MBusy : out std_logic_vector(0 to 0);
      SDMA_CTRL4_Sl_MRdErr : out std_logic_vector(0 to 0);
      SDMA_CTRL4_Sl_MWrErr : out std_logic_vector(0 to 0);
      SDMA_CTRL4_Sl_MIRQ : out std_logic_vector(0 to 0);
      PIM4_Addr : in std_logic_vector(31 downto 0);
      PIM4_AddrReq : in std_logic;
      PIM4_AddrAck : out std_logic;
      PIM4_RNW : in std_logic;
      PIM4_Size : in std_logic_vector(3 downto 0);
      PIM4_RdModWr : in std_logic;
      PIM4_WrFIFO_Data : in std_logic_vector(63 downto 0);
      PIM4_WrFIFO_BE : in std_logic_vector(7 downto 0);
      PIM4_WrFIFO_Push : in std_logic;
      PIM4_RdFIFO_Data : out std_logic_vector(63 downto 0);
      PIM4_RdFIFO_Pop : in std_logic;
      PIM4_RdFIFO_RdWdAddr : out std_logic_vector(3 downto 0);
      PIM4_WrFIFO_Empty : out std_logic;
      PIM4_WrFIFO_AlmostFull : out std_logic;
      PIM4_WrFIFO_Flush : in std_logic;
      PIM4_RdFIFO_Empty : out std_logic;
      PIM4_RdFIFO_Flush : in std_logic;
      PIM4_RdFIFO_Latency : out std_logic_vector(1 downto 0);
      PIM4_InitDone : out std_logic;
      PPC440MC4_MIMCReadNotWrite : in std_logic;
      PPC440MC4_MIMCAddress : in std_logic_vector(0 to 35);
      PPC440MC4_MIMCAddressValid : in std_logic;
      PPC440MC4_MIMCWriteData : in std_logic_vector(0 to 127);
      PPC440MC4_MIMCWriteDataValid : in std_logic;
      PPC440MC4_MIMCByteEnable : in std_logic_vector(0 to 15);
      PPC440MC4_MIMCBankConflict : in std_logic;
      PPC440MC4_MIMCRowConflict : in std_logic;
      PPC440MC4_MCMIReadData : out std_logic_vector(0 to 127);
      PPC440MC4_MCMIReadDataValid : out std_logic;
      PPC440MC4_MCMIReadDataErr : out std_logic;
      PPC440MC4_MCMIAddrReadyToAccept : out std_logic;
      VFBC4_Cmd_Clk : in std_logic;
      VFBC4_Cmd_Reset : in std_logic;
      VFBC4_Cmd_Data : in std_logic_vector(31 downto 0);
      VFBC4_Cmd_Write : in std_logic;
      VFBC4_Cmd_End : in std_logic;
      VFBC4_Cmd_Full : out std_logic;
      VFBC4_Cmd_Almost_Full : out std_logic;
      VFBC4_Cmd_Idle : out std_logic;
      VFBC4_Wd_Clk : in std_logic;
      VFBC4_Wd_Reset : in std_logic;
      VFBC4_Wd_Write : in std_logic;
      VFBC4_Wd_End_Burst : in std_logic;
      VFBC4_Wd_Flush : in std_logic;
      VFBC4_Wd_Data : in std_logic_vector(31 downto 0);
      VFBC4_Wd_Data_BE : in std_logic_vector(3 downto 0);
      VFBC4_Wd_Full : out std_logic;
      VFBC4_Wd_Almost_Full : out std_logic;
      VFBC4_Rd_Clk : in std_logic;
      VFBC4_Rd_Reset : in std_logic;
      VFBC4_Rd_Read : in std_logic;
      VFBC4_Rd_End_Burst : in std_logic;
      VFBC4_Rd_Flush : in std_logic;
      VFBC4_Rd_Data : out std_logic_vector(31 downto 0);
      VFBC4_Rd_Empty : out std_logic;
      VFBC4_Rd_Almost_Empty : out std_logic;
      MCB4_cmd_clk : in std_logic;
      MCB4_cmd_en : in std_logic;
      MCB4_cmd_instr : in std_logic_vector(2 downto 0);
      MCB4_cmd_bl : in std_logic_vector(5 downto 0);
      MCB4_cmd_byte_addr : in std_logic_vector(29 downto 0);
      MCB4_cmd_empty : out std_logic;
      MCB4_cmd_full : out std_logic;
      MCB4_wr_clk : in std_logic;
      MCB4_wr_en : in std_logic;
      MCB4_wr_mask : in std_logic_vector(7 downto 0);
      MCB4_wr_data : in std_logic_vector(63 downto 0);
      MCB4_wr_full : out std_logic;
      MCB4_wr_empty : out std_logic;
      MCB4_wr_count : out std_logic_vector(6 downto 0);
      MCB4_wr_underrun : out std_logic;
      MCB4_wr_error : out std_logic;
      MCB4_rd_clk : in std_logic;
      MCB4_rd_en : in std_logic;
      MCB4_rd_data : out std_logic_vector(63 downto 0);
      MCB4_rd_full : out std_logic;
      MCB4_rd_empty : out std_logic;
      MCB4_rd_count : out std_logic_vector(6 downto 0);
      MCB4_rd_overflow : out std_logic;
      MCB4_rd_error : out std_logic;
      FSL5_M_Clk : in std_logic;
      FSL5_M_Write : in std_logic;
      FSL5_M_Data : in std_logic_vector(0 to 31);
      FSL5_M_Control : in std_logic;
      FSL5_M_Full : out std_logic;
      FSL5_S_Clk : in std_logic;
      FSL5_S_Read : in std_logic;
      FSL5_S_Data : out std_logic_vector(0 to 31);
      FSL5_S_Control : out std_logic;
      FSL5_S_Exists : out std_logic;
      FSL5_B_M_Clk : in std_logic;
      FSL5_B_M_Write : in std_logic;
      FSL5_B_M_Data : in std_logic_vector(0 to 31);
      FSL5_B_M_Control : in std_logic;
      FSL5_B_M_Full : out std_logic;
      FSL5_B_S_Clk : in std_logic;
      FSL5_B_S_Read : in std_logic;
      FSL5_B_S_Data : out std_logic_vector(0 to 31);
      FSL5_B_S_Control : out std_logic;
      FSL5_B_S_Exists : out std_logic;
      SPLB5_Clk : in std_logic;
      SPLB5_Rst : in std_logic;
      SPLB5_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB5_PLB_PAValid : in std_logic;
      SPLB5_PLB_SAValid : in std_logic;
      SPLB5_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB5_PLB_RNW : in std_logic;
      SPLB5_PLB_BE : in std_logic_vector(0 to 7);
      SPLB5_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB5_PLB_rdPrim : in std_logic;
      SPLB5_PLB_wrPrim : in std_logic;
      SPLB5_PLB_abort : in std_logic;
      SPLB5_PLB_busLock : in std_logic;
      SPLB5_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB5_PLB_size : in std_logic_vector(0 to 3);
      SPLB5_PLB_type : in std_logic_vector(0 to 2);
      SPLB5_PLB_lockErr : in std_logic;
      SPLB5_PLB_wrPendReq : in std_logic;
      SPLB5_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB5_PLB_rdPendReq : in std_logic;
      SPLB5_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB5_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB5_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB5_PLB_rdBurst : in std_logic;
      SPLB5_PLB_wrBurst : in std_logic;
      SPLB5_PLB_wrDBus : in std_logic_vector(0 to 63);
      SPLB5_Sl_addrAck : out std_logic;
      SPLB5_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB5_Sl_wait : out std_logic;
      SPLB5_Sl_rearbitrate : out std_logic;
      SPLB5_Sl_wrDAck : out std_logic;
      SPLB5_Sl_wrComp : out std_logic;
      SPLB5_Sl_wrBTerm : out std_logic;
      SPLB5_Sl_rdDBus : out std_logic_vector(0 to 63);
      SPLB5_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB5_Sl_rdDAck : out std_logic;
      SPLB5_Sl_rdComp : out std_logic;
      SPLB5_Sl_rdBTerm : out std_logic;
      SPLB5_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB5_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB5_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB5_Sl_MIRQ : out std_logic_vector(0 to 0);
      SDMA5_Clk : in std_logic;
      SDMA5_Rx_IntOut : out std_logic;
      SDMA5_Tx_IntOut : out std_logic;
      SDMA5_RstOut : out std_logic;
      SDMA5_TX_D : out std_logic_vector(0 to 31);
      SDMA5_TX_Rem : out std_logic_vector(0 to 3);
      SDMA5_TX_SOF : out std_logic;
      SDMA5_TX_EOF : out std_logic;
      SDMA5_TX_SOP : out std_logic;
      SDMA5_TX_EOP : out std_logic;
      SDMA5_TX_Src_Rdy : out std_logic;
      SDMA5_TX_Dst_Rdy : in std_logic;
      SDMA5_RX_D : in std_logic_vector(0 to 31);
      SDMA5_RX_Rem : in std_logic_vector(0 to 3);
      SDMA5_RX_SOF : in std_logic;
      SDMA5_RX_EOF : in std_logic;
      SDMA5_RX_SOP : in std_logic;
      SDMA5_RX_EOP : in std_logic;
      SDMA5_RX_Src_Rdy : in std_logic;
      SDMA5_RX_Dst_Rdy : out std_logic;
      SDMA_CTRL5_Clk : in std_logic;
      SDMA_CTRL5_Rst : in std_logic;
      SDMA_CTRL5_PLB_ABus : in std_logic_vector(0 to 31);
      SDMA_CTRL5_PLB_PAValid : in std_logic;
      SDMA_CTRL5_PLB_SAValid : in std_logic;
      SDMA_CTRL5_PLB_masterID : in std_logic_vector(0 to 0);
      SDMA_CTRL5_PLB_RNW : in std_logic;
      SDMA_CTRL5_PLB_BE : in std_logic_vector(0 to 7);
      SDMA_CTRL5_PLB_UABus : in std_logic_vector(0 to 31);
      SDMA_CTRL5_PLB_rdPrim : in std_logic;
      SDMA_CTRL5_PLB_wrPrim : in std_logic;
      SDMA_CTRL5_PLB_abort : in std_logic;
      SDMA_CTRL5_PLB_busLock : in std_logic;
      SDMA_CTRL5_PLB_MSize : in std_logic_vector(0 to 1);
      SDMA_CTRL5_PLB_size : in std_logic_vector(0 to 3);
      SDMA_CTRL5_PLB_type : in std_logic_vector(0 to 2);
      SDMA_CTRL5_PLB_lockErr : in std_logic;
      SDMA_CTRL5_PLB_wrPendReq : in std_logic;
      SDMA_CTRL5_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL5_PLB_rdPendReq : in std_logic;
      SDMA_CTRL5_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL5_PLB_reqPri : in std_logic_vector(0 to 1);
      SDMA_CTRL5_PLB_TAttribute : in std_logic_vector(0 to 15);
      SDMA_CTRL5_PLB_rdBurst : in std_logic;
      SDMA_CTRL5_PLB_wrBurst : in std_logic;
      SDMA_CTRL5_PLB_wrDBus : in std_logic_vector(0 to 63);
      SDMA_CTRL5_Sl_addrAck : out std_logic;
      SDMA_CTRL5_Sl_SSize : out std_logic_vector(0 to 1);
      SDMA_CTRL5_Sl_wait : out std_logic;
      SDMA_CTRL5_Sl_rearbitrate : out std_logic;
      SDMA_CTRL5_Sl_wrDAck : out std_logic;
      SDMA_CTRL5_Sl_wrComp : out std_logic;
      SDMA_CTRL5_Sl_wrBTerm : out std_logic;
      SDMA_CTRL5_Sl_rdDBus : out std_logic_vector(0 to 63);
      SDMA_CTRL5_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SDMA_CTRL5_Sl_rdDAck : out std_logic;
      SDMA_CTRL5_Sl_rdComp : out std_logic;
      SDMA_CTRL5_Sl_rdBTerm : out std_logic;
      SDMA_CTRL5_Sl_MBusy : out std_logic_vector(0 to 0);
      SDMA_CTRL5_Sl_MRdErr : out std_logic_vector(0 to 0);
      SDMA_CTRL5_Sl_MWrErr : out std_logic_vector(0 to 0);
      SDMA_CTRL5_Sl_MIRQ : out std_logic_vector(0 to 0);
      PIM5_Addr : in std_logic_vector(31 downto 0);
      PIM5_AddrReq : in std_logic;
      PIM5_AddrAck : out std_logic;
      PIM5_RNW : in std_logic;
      PIM5_Size : in std_logic_vector(3 downto 0);
      PIM5_RdModWr : in std_logic;
      PIM5_WrFIFO_Data : in std_logic_vector(63 downto 0);
      PIM5_WrFIFO_BE : in std_logic_vector(7 downto 0);
      PIM5_WrFIFO_Push : in std_logic;
      PIM5_RdFIFO_Data : out std_logic_vector(63 downto 0);
      PIM5_RdFIFO_Pop : in std_logic;
      PIM5_RdFIFO_RdWdAddr : out std_logic_vector(3 downto 0);
      PIM5_WrFIFO_Empty : out std_logic;
      PIM5_WrFIFO_AlmostFull : out std_logic;
      PIM5_WrFIFO_Flush : in std_logic;
      PIM5_RdFIFO_Empty : out std_logic;
      PIM5_RdFIFO_Flush : in std_logic;
      PIM5_RdFIFO_Latency : out std_logic_vector(1 downto 0);
      PIM5_InitDone : out std_logic;
      PPC440MC5_MIMCReadNotWrite : in std_logic;
      PPC440MC5_MIMCAddress : in std_logic_vector(0 to 35);
      PPC440MC5_MIMCAddressValid : in std_logic;
      PPC440MC5_MIMCWriteData : in std_logic_vector(0 to 127);
      PPC440MC5_MIMCWriteDataValid : in std_logic;
      PPC440MC5_MIMCByteEnable : in std_logic_vector(0 to 15);
      PPC440MC5_MIMCBankConflict : in std_logic;
      PPC440MC5_MIMCRowConflict : in std_logic;
      PPC440MC5_MCMIReadData : out std_logic_vector(0 to 127);
      PPC440MC5_MCMIReadDataValid : out std_logic;
      PPC440MC5_MCMIReadDataErr : out std_logic;
      PPC440MC5_MCMIAddrReadyToAccept : out std_logic;
      VFBC5_Cmd_Clk : in std_logic;
      VFBC5_Cmd_Reset : in std_logic;
      VFBC5_Cmd_Data : in std_logic_vector(31 downto 0);
      VFBC5_Cmd_Write : in std_logic;
      VFBC5_Cmd_End : in std_logic;
      VFBC5_Cmd_Full : out std_logic;
      VFBC5_Cmd_Almost_Full : out std_logic;
      VFBC5_Cmd_Idle : out std_logic;
      VFBC5_Wd_Clk : in std_logic;
      VFBC5_Wd_Reset : in std_logic;
      VFBC5_Wd_Write : in std_logic;
      VFBC5_Wd_End_Burst : in std_logic;
      VFBC5_Wd_Flush : in std_logic;
      VFBC5_Wd_Data : in std_logic_vector(31 downto 0);
      VFBC5_Wd_Data_BE : in std_logic_vector(3 downto 0);
      VFBC5_Wd_Full : out std_logic;
      VFBC5_Wd_Almost_Full : out std_logic;
      VFBC5_Rd_Clk : in std_logic;
      VFBC5_Rd_Reset : in std_logic;
      VFBC5_Rd_Read : in std_logic;
      VFBC5_Rd_End_Burst : in std_logic;
      VFBC5_Rd_Flush : in std_logic;
      VFBC5_Rd_Data : out std_logic_vector(31 downto 0);
      VFBC5_Rd_Empty : out std_logic;
      VFBC5_Rd_Almost_Empty : out std_logic;
      MCB5_cmd_clk : in std_logic;
      MCB5_cmd_en : in std_logic;
      MCB5_cmd_instr : in std_logic_vector(2 downto 0);
      MCB5_cmd_bl : in std_logic_vector(5 downto 0);
      MCB5_cmd_byte_addr : in std_logic_vector(29 downto 0);
      MCB5_cmd_empty : out std_logic;
      MCB5_cmd_full : out std_logic;
      MCB5_wr_clk : in std_logic;
      MCB5_wr_en : in std_logic;
      MCB5_wr_mask : in std_logic_vector(7 downto 0);
      MCB5_wr_data : in std_logic_vector(63 downto 0);
      MCB5_wr_full : out std_logic;
      MCB5_wr_empty : out std_logic;
      MCB5_wr_count : out std_logic_vector(6 downto 0);
      MCB5_wr_underrun : out std_logic;
      MCB5_wr_error : out std_logic;
      MCB5_rd_clk : in std_logic;
      MCB5_rd_en : in std_logic;
      MCB5_rd_data : out std_logic_vector(63 downto 0);
      MCB5_rd_full : out std_logic;
      MCB5_rd_empty : out std_logic;
      MCB5_rd_count : out std_logic_vector(6 downto 0);
      MCB5_rd_overflow : out std_logic;
      MCB5_rd_error : out std_logic;
      FSL6_M_Clk : in std_logic;
      FSL6_M_Write : in std_logic;
      FSL6_M_Data : in std_logic_vector(0 to 31);
      FSL6_M_Control : in std_logic;
      FSL6_M_Full : out std_logic;
      FSL6_S_Clk : in std_logic;
      FSL6_S_Read : in std_logic;
      FSL6_S_Data : out std_logic_vector(0 to 31);
      FSL6_S_Control : out std_logic;
      FSL6_S_Exists : out std_logic;
      FSL6_B_M_Clk : in std_logic;
      FSL6_B_M_Write : in std_logic;
      FSL6_B_M_Data : in std_logic_vector(0 to 31);
      FSL6_B_M_Control : in std_logic;
      FSL6_B_M_Full : out std_logic;
      FSL6_B_S_Clk : in std_logic;
      FSL6_B_S_Read : in std_logic;
      FSL6_B_S_Data : out std_logic_vector(0 to 31);
      FSL6_B_S_Control : out std_logic;
      FSL6_B_S_Exists : out std_logic;
      SPLB6_Clk : in std_logic;
      SPLB6_Rst : in std_logic;
      SPLB6_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB6_PLB_PAValid : in std_logic;
      SPLB6_PLB_SAValid : in std_logic;
      SPLB6_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB6_PLB_RNW : in std_logic;
      SPLB6_PLB_BE : in std_logic_vector(0 to 7);
      SPLB6_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB6_PLB_rdPrim : in std_logic;
      SPLB6_PLB_wrPrim : in std_logic;
      SPLB6_PLB_abort : in std_logic;
      SPLB6_PLB_busLock : in std_logic;
      SPLB6_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB6_PLB_size : in std_logic_vector(0 to 3);
      SPLB6_PLB_type : in std_logic_vector(0 to 2);
      SPLB6_PLB_lockErr : in std_logic;
      SPLB6_PLB_wrPendReq : in std_logic;
      SPLB6_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB6_PLB_rdPendReq : in std_logic;
      SPLB6_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB6_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB6_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB6_PLB_rdBurst : in std_logic;
      SPLB6_PLB_wrBurst : in std_logic;
      SPLB6_PLB_wrDBus : in std_logic_vector(0 to 63);
      SPLB6_Sl_addrAck : out std_logic;
      SPLB6_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB6_Sl_wait : out std_logic;
      SPLB6_Sl_rearbitrate : out std_logic;
      SPLB6_Sl_wrDAck : out std_logic;
      SPLB6_Sl_wrComp : out std_logic;
      SPLB6_Sl_wrBTerm : out std_logic;
      SPLB6_Sl_rdDBus : out std_logic_vector(0 to 63);
      SPLB6_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB6_Sl_rdDAck : out std_logic;
      SPLB6_Sl_rdComp : out std_logic;
      SPLB6_Sl_rdBTerm : out std_logic;
      SPLB6_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB6_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB6_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB6_Sl_MIRQ : out std_logic_vector(0 to 0);
      SDMA6_Clk : in std_logic;
      SDMA6_Rx_IntOut : out std_logic;
      SDMA6_Tx_IntOut : out std_logic;
      SDMA6_RstOut : out std_logic;
      SDMA6_TX_D : out std_logic_vector(0 to 31);
      SDMA6_TX_Rem : out std_logic_vector(0 to 3);
      SDMA6_TX_SOF : out std_logic;
      SDMA6_TX_EOF : out std_logic;
      SDMA6_TX_SOP : out std_logic;
      SDMA6_TX_EOP : out std_logic;
      SDMA6_TX_Src_Rdy : out std_logic;
      SDMA6_TX_Dst_Rdy : in std_logic;
      SDMA6_RX_D : in std_logic_vector(0 to 31);
      SDMA6_RX_Rem : in std_logic_vector(0 to 3);
      SDMA6_RX_SOF : in std_logic;
      SDMA6_RX_EOF : in std_logic;
      SDMA6_RX_SOP : in std_logic;
      SDMA6_RX_EOP : in std_logic;
      SDMA6_RX_Src_Rdy : in std_logic;
      SDMA6_RX_Dst_Rdy : out std_logic;
      SDMA_CTRL6_Clk : in std_logic;
      SDMA_CTRL6_Rst : in std_logic;
      SDMA_CTRL6_PLB_ABus : in std_logic_vector(0 to 31);
      SDMA_CTRL6_PLB_PAValid : in std_logic;
      SDMA_CTRL6_PLB_SAValid : in std_logic;
      SDMA_CTRL6_PLB_masterID : in std_logic_vector(0 to 0);
      SDMA_CTRL6_PLB_RNW : in std_logic;
      SDMA_CTRL6_PLB_BE : in std_logic_vector(0 to 7);
      SDMA_CTRL6_PLB_UABus : in std_logic_vector(0 to 31);
      SDMA_CTRL6_PLB_rdPrim : in std_logic;
      SDMA_CTRL6_PLB_wrPrim : in std_logic;
      SDMA_CTRL6_PLB_abort : in std_logic;
      SDMA_CTRL6_PLB_busLock : in std_logic;
      SDMA_CTRL6_PLB_MSize : in std_logic_vector(0 to 1);
      SDMA_CTRL6_PLB_size : in std_logic_vector(0 to 3);
      SDMA_CTRL6_PLB_type : in std_logic_vector(0 to 2);
      SDMA_CTRL6_PLB_lockErr : in std_logic;
      SDMA_CTRL6_PLB_wrPendReq : in std_logic;
      SDMA_CTRL6_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL6_PLB_rdPendReq : in std_logic;
      SDMA_CTRL6_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL6_PLB_reqPri : in std_logic_vector(0 to 1);
      SDMA_CTRL6_PLB_TAttribute : in std_logic_vector(0 to 15);
      SDMA_CTRL6_PLB_rdBurst : in std_logic;
      SDMA_CTRL6_PLB_wrBurst : in std_logic;
      SDMA_CTRL6_PLB_wrDBus : in std_logic_vector(0 to 63);
      SDMA_CTRL6_Sl_addrAck : out std_logic;
      SDMA_CTRL6_Sl_SSize : out std_logic_vector(0 to 1);
      SDMA_CTRL6_Sl_wait : out std_logic;
      SDMA_CTRL6_Sl_rearbitrate : out std_logic;
      SDMA_CTRL6_Sl_wrDAck : out std_logic;
      SDMA_CTRL6_Sl_wrComp : out std_logic;
      SDMA_CTRL6_Sl_wrBTerm : out std_logic;
      SDMA_CTRL6_Sl_rdDBus : out std_logic_vector(0 to 63);
      SDMA_CTRL6_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SDMA_CTRL6_Sl_rdDAck : out std_logic;
      SDMA_CTRL6_Sl_rdComp : out std_logic;
      SDMA_CTRL6_Sl_rdBTerm : out std_logic;
      SDMA_CTRL6_Sl_MBusy : out std_logic_vector(0 to 0);
      SDMA_CTRL6_Sl_MRdErr : out std_logic_vector(0 to 0);
      SDMA_CTRL6_Sl_MWrErr : out std_logic_vector(0 to 0);
      SDMA_CTRL6_Sl_MIRQ : out std_logic_vector(0 to 0);
      PIM6_Addr : in std_logic_vector(31 downto 0);
      PIM6_AddrReq : in std_logic;
      PIM6_AddrAck : out std_logic;
      PIM6_RNW : in std_logic;
      PIM6_Size : in std_logic_vector(3 downto 0);
      PIM6_RdModWr : in std_logic;
      PIM6_WrFIFO_Data : in std_logic_vector(63 downto 0);
      PIM6_WrFIFO_BE : in std_logic_vector(7 downto 0);
      PIM6_WrFIFO_Push : in std_logic;
      PIM6_RdFIFO_Data : out std_logic_vector(63 downto 0);
      PIM6_RdFIFO_Pop : in std_logic;
      PIM6_RdFIFO_RdWdAddr : out std_logic_vector(3 downto 0);
      PIM6_WrFIFO_Empty : out std_logic;
      PIM6_WrFIFO_AlmostFull : out std_logic;
      PIM6_WrFIFO_Flush : in std_logic;
      PIM6_RdFIFO_Empty : out std_logic;
      PIM6_RdFIFO_Flush : in std_logic;
      PIM6_RdFIFO_Latency : out std_logic_vector(1 downto 0);
      PIM6_InitDone : out std_logic;
      PPC440MC6_MIMCReadNotWrite : in std_logic;
      PPC440MC6_MIMCAddress : in std_logic_vector(0 to 35);
      PPC440MC6_MIMCAddressValid : in std_logic;
      PPC440MC6_MIMCWriteData : in std_logic_vector(0 to 127);
      PPC440MC6_MIMCWriteDataValid : in std_logic;
      PPC440MC6_MIMCByteEnable : in std_logic_vector(0 to 15);
      PPC440MC6_MIMCBankConflict : in std_logic;
      PPC440MC6_MIMCRowConflict : in std_logic;
      PPC440MC6_MCMIReadData : out std_logic_vector(0 to 127);
      PPC440MC6_MCMIReadDataValid : out std_logic;
      PPC440MC6_MCMIReadDataErr : out std_logic;
      PPC440MC6_MCMIAddrReadyToAccept : out std_logic;
      VFBC6_Cmd_Clk : in std_logic;
      VFBC6_Cmd_Reset : in std_logic;
      VFBC6_Cmd_Data : in std_logic_vector(31 downto 0);
      VFBC6_Cmd_Write : in std_logic;
      VFBC6_Cmd_End : in std_logic;
      VFBC6_Cmd_Full : out std_logic;
      VFBC6_Cmd_Almost_Full : out std_logic;
      VFBC6_Cmd_Idle : out std_logic;
      VFBC6_Wd_Clk : in std_logic;
      VFBC6_Wd_Reset : in std_logic;
      VFBC6_Wd_Write : in std_logic;
      VFBC6_Wd_End_Burst : in std_logic;
      VFBC6_Wd_Flush : in std_logic;
      VFBC6_Wd_Data : in std_logic_vector(31 downto 0);
      VFBC6_Wd_Data_BE : in std_logic_vector(3 downto 0);
      VFBC6_Wd_Full : out std_logic;
      VFBC6_Wd_Almost_Full : out std_logic;
      VFBC6_Rd_Clk : in std_logic;
      VFBC6_Rd_Reset : in std_logic;
      VFBC6_Rd_Read : in std_logic;
      VFBC6_Rd_End_Burst : in std_logic;
      VFBC6_Rd_Flush : in std_logic;
      VFBC6_Rd_Data : out std_logic_vector(31 downto 0);
      VFBC6_Rd_Empty : out std_logic;
      VFBC6_Rd_Almost_Empty : out std_logic;
      MCB6_cmd_clk : in std_logic;
      MCB6_cmd_en : in std_logic;
      MCB6_cmd_instr : in std_logic_vector(2 downto 0);
      MCB6_cmd_bl : in std_logic_vector(5 downto 0);
      MCB6_cmd_byte_addr : in std_logic_vector(29 downto 0);
      MCB6_cmd_empty : out std_logic;
      MCB6_cmd_full : out std_logic;
      MCB6_wr_clk : in std_logic;
      MCB6_wr_en : in std_logic;
      MCB6_wr_mask : in std_logic_vector(7 downto 0);
      MCB6_wr_data : in std_logic_vector(63 downto 0);
      MCB6_wr_full : out std_logic;
      MCB6_wr_empty : out std_logic;
      MCB6_wr_count : out std_logic_vector(6 downto 0);
      MCB6_wr_underrun : out std_logic;
      MCB6_wr_error : out std_logic;
      MCB6_rd_clk : in std_logic;
      MCB6_rd_en : in std_logic;
      MCB6_rd_data : out std_logic_vector(63 downto 0);
      MCB6_rd_full : out std_logic;
      MCB6_rd_empty : out std_logic;
      MCB6_rd_count : out std_logic_vector(6 downto 0);
      MCB6_rd_overflow : out std_logic;
      MCB6_rd_error : out std_logic;
      FSL7_M_Clk : in std_logic;
      FSL7_M_Write : in std_logic;
      FSL7_M_Data : in std_logic_vector(0 to 31);
      FSL7_M_Control : in std_logic;
      FSL7_M_Full : out std_logic;
      FSL7_S_Clk : in std_logic;
      FSL7_S_Read : in std_logic;
      FSL7_S_Data : out std_logic_vector(0 to 31);
      FSL7_S_Control : out std_logic;
      FSL7_S_Exists : out std_logic;
      FSL7_B_M_Clk : in std_logic;
      FSL7_B_M_Write : in std_logic;
      FSL7_B_M_Data : in std_logic_vector(0 to 31);
      FSL7_B_M_Control : in std_logic;
      FSL7_B_M_Full : out std_logic;
      FSL7_B_S_Clk : in std_logic;
      FSL7_B_S_Read : in std_logic;
      FSL7_B_S_Data : out std_logic_vector(0 to 31);
      FSL7_B_S_Control : out std_logic;
      FSL7_B_S_Exists : out std_logic;
      SPLB7_Clk : in std_logic;
      SPLB7_Rst : in std_logic;
      SPLB7_PLB_ABus : in std_logic_vector(0 to 31);
      SPLB7_PLB_PAValid : in std_logic;
      SPLB7_PLB_SAValid : in std_logic;
      SPLB7_PLB_masterID : in std_logic_vector(0 to 0);
      SPLB7_PLB_RNW : in std_logic;
      SPLB7_PLB_BE : in std_logic_vector(0 to 7);
      SPLB7_PLB_UABus : in std_logic_vector(0 to 31);
      SPLB7_PLB_rdPrim : in std_logic;
      SPLB7_PLB_wrPrim : in std_logic;
      SPLB7_PLB_abort : in std_logic;
      SPLB7_PLB_busLock : in std_logic;
      SPLB7_PLB_MSize : in std_logic_vector(0 to 1);
      SPLB7_PLB_size : in std_logic_vector(0 to 3);
      SPLB7_PLB_type : in std_logic_vector(0 to 2);
      SPLB7_PLB_lockErr : in std_logic;
      SPLB7_PLB_wrPendReq : in std_logic;
      SPLB7_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SPLB7_PLB_rdPendReq : in std_logic;
      SPLB7_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SPLB7_PLB_reqPri : in std_logic_vector(0 to 1);
      SPLB7_PLB_TAttribute : in std_logic_vector(0 to 15);
      SPLB7_PLB_rdBurst : in std_logic;
      SPLB7_PLB_wrBurst : in std_logic;
      SPLB7_PLB_wrDBus : in std_logic_vector(0 to 63);
      SPLB7_Sl_addrAck : out std_logic;
      SPLB7_Sl_SSize : out std_logic_vector(0 to 1);
      SPLB7_Sl_wait : out std_logic;
      SPLB7_Sl_rearbitrate : out std_logic;
      SPLB7_Sl_wrDAck : out std_logic;
      SPLB7_Sl_wrComp : out std_logic;
      SPLB7_Sl_wrBTerm : out std_logic;
      SPLB7_Sl_rdDBus : out std_logic_vector(0 to 63);
      SPLB7_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SPLB7_Sl_rdDAck : out std_logic;
      SPLB7_Sl_rdComp : out std_logic;
      SPLB7_Sl_rdBTerm : out std_logic;
      SPLB7_Sl_MBusy : out std_logic_vector(0 to 0);
      SPLB7_Sl_MRdErr : out std_logic_vector(0 to 0);
      SPLB7_Sl_MWrErr : out std_logic_vector(0 to 0);
      SPLB7_Sl_MIRQ : out std_logic_vector(0 to 0);
      SDMA7_Clk : in std_logic;
      SDMA7_Rx_IntOut : out std_logic;
      SDMA7_Tx_IntOut : out std_logic;
      SDMA7_RstOut : out std_logic;
      SDMA7_TX_D : out std_logic_vector(0 to 31);
      SDMA7_TX_Rem : out std_logic_vector(0 to 3);
      SDMA7_TX_SOF : out std_logic;
      SDMA7_TX_EOF : out std_logic;
      SDMA7_TX_SOP : out std_logic;
      SDMA7_TX_EOP : out std_logic;
      SDMA7_TX_Src_Rdy : out std_logic;
      SDMA7_TX_Dst_Rdy : in std_logic;
      SDMA7_RX_D : in std_logic_vector(0 to 31);
      SDMA7_RX_Rem : in std_logic_vector(0 to 3);
      SDMA7_RX_SOF : in std_logic;
      SDMA7_RX_EOF : in std_logic;
      SDMA7_RX_SOP : in std_logic;
      SDMA7_RX_EOP : in std_logic;
      SDMA7_RX_Src_Rdy : in std_logic;
      SDMA7_RX_Dst_Rdy : out std_logic;
      SDMA_CTRL7_Clk : in std_logic;
      SDMA_CTRL7_Rst : in std_logic;
      SDMA_CTRL7_PLB_ABus : in std_logic_vector(0 to 31);
      SDMA_CTRL7_PLB_PAValid : in std_logic;
      SDMA_CTRL7_PLB_SAValid : in std_logic;
      SDMA_CTRL7_PLB_masterID : in std_logic_vector(0 to 0);
      SDMA_CTRL7_PLB_RNW : in std_logic;
      SDMA_CTRL7_PLB_BE : in std_logic_vector(0 to 7);
      SDMA_CTRL7_PLB_UABus : in std_logic_vector(0 to 31);
      SDMA_CTRL7_PLB_rdPrim : in std_logic;
      SDMA_CTRL7_PLB_wrPrim : in std_logic;
      SDMA_CTRL7_PLB_abort : in std_logic;
      SDMA_CTRL7_PLB_busLock : in std_logic;
      SDMA_CTRL7_PLB_MSize : in std_logic_vector(0 to 1);
      SDMA_CTRL7_PLB_size : in std_logic_vector(0 to 3);
      SDMA_CTRL7_PLB_type : in std_logic_vector(0 to 2);
      SDMA_CTRL7_PLB_lockErr : in std_logic;
      SDMA_CTRL7_PLB_wrPendReq : in std_logic;
      SDMA_CTRL7_PLB_wrPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL7_PLB_rdPendReq : in std_logic;
      SDMA_CTRL7_PLB_rdPendPri : in std_logic_vector(0 to 1);
      SDMA_CTRL7_PLB_reqPri : in std_logic_vector(0 to 1);
      SDMA_CTRL7_PLB_TAttribute : in std_logic_vector(0 to 15);
      SDMA_CTRL7_PLB_rdBurst : in std_logic;
      SDMA_CTRL7_PLB_wrBurst : in std_logic;
      SDMA_CTRL7_PLB_wrDBus : in std_logic_vector(0 to 63);
      SDMA_CTRL7_Sl_addrAck : out std_logic;
      SDMA_CTRL7_Sl_SSize : out std_logic_vector(0 to 1);
      SDMA_CTRL7_Sl_wait : out std_logic;
      SDMA_CTRL7_Sl_rearbitrate : out std_logic;
      SDMA_CTRL7_Sl_wrDAck : out std_logic;
      SDMA_CTRL7_Sl_wrComp : out std_logic;
      SDMA_CTRL7_Sl_wrBTerm : out std_logic;
      SDMA_CTRL7_Sl_rdDBus : out std_logic_vector(0 to 63);
      SDMA_CTRL7_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      SDMA_CTRL7_Sl_rdDAck : out std_logic;
      SDMA_CTRL7_Sl_rdComp : out std_logic;
      SDMA_CTRL7_Sl_rdBTerm : out std_logic;
      SDMA_CTRL7_Sl_MBusy : out std_logic_vector(0 to 0);
      SDMA_CTRL7_Sl_MRdErr : out std_logic_vector(0 to 0);
      SDMA_CTRL7_Sl_MWrErr : out std_logic_vector(0 to 0);
      SDMA_CTRL7_Sl_MIRQ : out std_logic_vector(0 to 0);
      PIM7_Addr : in std_logic_vector(31 downto 0);
      PIM7_AddrReq : in std_logic;
      PIM7_AddrAck : out std_logic;
      PIM7_RNW : in std_logic;
      PIM7_Size : in std_logic_vector(3 downto 0);
      PIM7_RdModWr : in std_logic;
      PIM7_WrFIFO_Data : in std_logic_vector(63 downto 0);
      PIM7_WrFIFO_BE : in std_logic_vector(7 downto 0);
      PIM7_WrFIFO_Push : in std_logic;
      PIM7_RdFIFO_Data : out std_logic_vector(63 downto 0);
      PIM7_RdFIFO_Pop : in std_logic;
      PIM7_RdFIFO_RdWdAddr : out std_logic_vector(3 downto 0);
      PIM7_WrFIFO_Empty : out std_logic;
      PIM7_WrFIFO_AlmostFull : out std_logic;
      PIM7_WrFIFO_Flush : in std_logic;
      PIM7_RdFIFO_Empty : out std_logic;
      PIM7_RdFIFO_Flush : in std_logic;
      PIM7_RdFIFO_Latency : out std_logic_vector(1 downto 0);
      PIM7_InitDone : out std_logic;
      PPC440MC7_MIMCReadNotWrite : in std_logic;
      PPC440MC7_MIMCAddress : in std_logic_vector(0 to 35);
      PPC440MC7_MIMCAddressValid : in std_logic;
      PPC440MC7_MIMCWriteData : in std_logic_vector(0 to 127);
      PPC440MC7_MIMCWriteDataValid : in std_logic;
      PPC440MC7_MIMCByteEnable : in std_logic_vector(0 to 15);
      PPC440MC7_MIMCBankConflict : in std_logic;
      PPC440MC7_MIMCRowConflict : in std_logic;
      PPC440MC7_MCMIReadData : out std_logic_vector(0 to 127);
      PPC440MC7_MCMIReadDataValid : out std_logic;
      PPC440MC7_MCMIReadDataErr : out std_logic;
      PPC440MC7_MCMIAddrReadyToAccept : out std_logic;
      VFBC7_Cmd_Clk : in std_logic;
      VFBC7_Cmd_Reset : in std_logic;
      VFBC7_Cmd_Data : in std_logic_vector(31 downto 0);
      VFBC7_Cmd_Write : in std_logic;
      VFBC7_Cmd_End : in std_logic;
      VFBC7_Cmd_Full : out std_logic;
      VFBC7_Cmd_Almost_Full : out std_logic;
      VFBC7_Cmd_Idle : out std_logic;
      VFBC7_Wd_Clk : in std_logic;
      VFBC7_Wd_Reset : in std_logic;
      VFBC7_Wd_Write : in std_logic;
      VFBC7_Wd_End_Burst : in std_logic;
      VFBC7_Wd_Flush : in std_logic;
      VFBC7_Wd_Data : in std_logic_vector(31 downto 0);
      VFBC7_Wd_Data_BE : in std_logic_vector(3 downto 0);
      VFBC7_Wd_Full : out std_logic;
      VFBC7_Wd_Almost_Full : out std_logic;
      VFBC7_Rd_Clk : in std_logic;
      VFBC7_Rd_Reset : in std_logic;
      VFBC7_Rd_Read : in std_logic;
      VFBC7_Rd_End_Burst : in std_logic;
      VFBC7_Rd_Flush : in std_logic;
      VFBC7_Rd_Data : out std_logic_vector(31 downto 0);
      VFBC7_Rd_Empty : out std_logic;
      VFBC7_Rd_Almost_Empty : out std_logic;
      MCB7_cmd_clk : in std_logic;
      MCB7_cmd_en : in std_logic;
      MCB7_cmd_instr : in std_logic_vector(2 downto 0);
      MCB7_cmd_bl : in std_logic_vector(5 downto 0);
      MCB7_cmd_byte_addr : in std_logic_vector(29 downto 0);
      MCB7_cmd_empty : out std_logic;
      MCB7_cmd_full : out std_logic;
      MCB7_wr_clk : in std_logic;
      MCB7_wr_en : in std_logic;
      MCB7_wr_mask : in std_logic_vector(7 downto 0);
      MCB7_wr_data : in std_logic_vector(63 downto 0);
      MCB7_wr_full : out std_logic;
      MCB7_wr_empty : out std_logic;
      MCB7_wr_count : out std_logic_vector(6 downto 0);
      MCB7_wr_underrun : out std_logic;
      MCB7_wr_error : out std_logic;
      MCB7_rd_clk : in std_logic;
      MCB7_rd_en : in std_logic;
      MCB7_rd_data : out std_logic_vector(63 downto 0);
      MCB7_rd_full : out std_logic;
      MCB7_rd_empty : out std_logic;
      MCB7_rd_count : out std_logic_vector(6 downto 0);
      MCB7_rd_overflow : out std_logic;
      MCB7_rd_error : out std_logic;
      MPMC_CTRL_Clk : in std_logic;
      MPMC_CTRL_Rst : in std_logic;
      MPMC_CTRL_PLB_ABus : in std_logic_vector(0 to 31);
      MPMC_CTRL_PLB_PAValid : in std_logic;
      MPMC_CTRL_PLB_SAValid : in std_logic;
      MPMC_CTRL_PLB_masterID : in std_logic_vector(0 to 0);
      MPMC_CTRL_PLB_RNW : in std_logic;
      MPMC_CTRL_PLB_BE : in std_logic_vector(0 to 7);
      MPMC_CTRL_PLB_UABus : in std_logic_vector(0 to 31);
      MPMC_CTRL_PLB_rdPrim : in std_logic;
      MPMC_CTRL_PLB_wrPrim : in std_logic;
      MPMC_CTRL_PLB_abort : in std_logic;
      MPMC_CTRL_PLB_busLock : in std_logic;
      MPMC_CTRL_PLB_MSize : in std_logic_vector(0 to 1);
      MPMC_CTRL_PLB_size : in std_logic_vector(0 to 3);
      MPMC_CTRL_PLB_type : in std_logic_vector(0 to 2);
      MPMC_CTRL_PLB_lockErr : in std_logic;
      MPMC_CTRL_PLB_wrPendReq : in std_logic;
      MPMC_CTRL_PLB_wrPendPri : in std_logic_vector(0 to 1);
      MPMC_CTRL_PLB_rdPendReq : in std_logic;
      MPMC_CTRL_PLB_rdPendPri : in std_logic_vector(0 to 1);
      MPMC_CTRL_PLB_reqPri : in std_logic_vector(0 to 1);
      MPMC_CTRL_PLB_TAttribute : in std_logic_vector(0 to 15);
      MPMC_CTRL_PLB_rdBurst : in std_logic;
      MPMC_CTRL_PLB_wrBurst : in std_logic;
      MPMC_CTRL_PLB_wrDBus : in std_logic_vector(0 to 63);
      MPMC_CTRL_Sl_addrAck : out std_logic;
      MPMC_CTRL_Sl_SSize : out std_logic_vector(0 to 1);
      MPMC_CTRL_Sl_wait : out std_logic;
      MPMC_CTRL_Sl_rearbitrate : out std_logic;
      MPMC_CTRL_Sl_wrDAck : out std_logic;
      MPMC_CTRL_Sl_wrComp : out std_logic;
      MPMC_CTRL_Sl_wrBTerm : out std_logic;
      MPMC_CTRL_Sl_rdDBus : out std_logic_vector(0 to 63);
      MPMC_CTRL_Sl_rdWdAddr : out std_logic_vector(0 to 3);
      MPMC_CTRL_Sl_rdDAck : out std_logic;
      MPMC_CTRL_Sl_rdComp : out std_logic;
      MPMC_CTRL_Sl_rdBTerm : out std_logic;
      MPMC_CTRL_Sl_MBusy : out std_logic_vector(0 to 0);
      MPMC_CTRL_Sl_MRdErr : out std_logic_vector(0 to 0);
      MPMC_CTRL_Sl_MWrErr : out std_logic_vector(0 to 0);
      MPMC_CTRL_Sl_MIRQ : out std_logic_vector(0 to 0);
      MPMC_Clk0 : in std_logic;
      MPMC_Clk0_DIV2 : in std_logic;
      MPMC_Clk90 : in std_logic;
      MPMC_Clk_200MHz : in std_logic;
      MPMC_Rst : in std_logic;
      MPMC_Clk_Mem : in std_logic;
      MPMC_Clk_Mem_2x : in std_logic;
      MPMC_Clk_Mem_2x_180 : in std_logic;
      MPMC_Clk_Mem_2x_CE0 : in std_logic;
      MPMC_Clk_Mem_2x_CE90 : in std_logic;
      MPMC_Clk_Rd_Base : in std_logic;
      MPMC_PLL_Lock : in std_logic;
      MPMC_Idelayctrl_Rdy_I : in std_logic;
      MPMC_Idelayctrl_Rdy_O : out std_logic;
      MPMC_InitDone : out std_logic;
      MPMC_ECC_Intr : out std_logic;
      MPMC_DCM_PSEN : out std_logic;
      MPMC_DCM_PSINCDEC : out std_logic;
      MPMC_DCM_PSDONE : in std_logic;
      MPMC_MCB_DRP_Clk : in std_logic;
      SDRAM_Clk : out std_logic_vector(0 to 0);
      SDRAM_CE : out std_logic_vector(0 to 0);
      SDRAM_CS_n : out std_logic_vector(0 to 0);
      SDRAM_RAS_n : out std_logic;
      SDRAM_CAS_n : out std_logic;
      SDRAM_WE_n : out std_logic;
      SDRAM_BankAddr : out std_logic_vector(1 downto 0);
      SDRAM_Addr : out std_logic_vector(12 downto 0);
      SDRAM_DQ : inout std_logic_vector(31 downto 0);
      SDRAM_DM : out std_logic_vector(3 downto 0);
      DDR_Clk : out std_logic_vector(0 to 0);
      DDR_Clk_n : out std_logic_vector(0 to 0);
      DDR_CE : out std_logic_vector(0 to 0);
      DDR_CS_n : out std_logic_vector(0 to 0);
      DDR_RAS_n : out std_logic;
      DDR_CAS_n : out std_logic;
      DDR_WE_n : out std_logic;
      DDR_BankAddr : out std_logic_vector(1 downto 0);
      DDR_Addr : out std_logic_vector(12 downto 0);
      DDR_DQ : inout std_logic_vector(31 downto 0);
      DDR_DM : out std_logic_vector(3 downto 0);
      DDR_DQS : inout std_logic_vector(3 downto 0);
      DDR_DQS_Div_O : out std_logic;
      DDR_DQS_Div_I : in std_logic;
      DDR2_Clk : out std_logic_vector(0 to 0);
      DDR2_Clk_n : out std_logic_vector(0 to 0);
      DDR2_CE : out std_logic_vector(0 to 0);
      DDR2_CS_n : out std_logic_vector(0 to 0);
      DDR2_ODT : out std_logic_vector(0 to 0);
      DDR2_RAS_n : out std_logic;
      DDR2_CAS_n : out std_logic;
      DDR2_WE_n : out std_logic;
      DDR2_BankAddr : out std_logic_vector(1 downto 0);
      DDR2_Addr : out std_logic_vector(12 downto 0);
      DDR2_DQ : inout std_logic_vector(31 downto 0);
      DDR2_DM : out std_logic_vector(3 downto 0);
      DDR2_DQS : inout std_logic_vector(3 downto 0);
      DDR2_DQS_n : inout std_logic_vector(3 downto 0);
      DDR2_DQS_Div_O : out std_logic;
      DDR2_DQS_Div_I : in std_logic;
      DDR3_Clk : out std_logic_vector(0 to 0);
      DDR3_Clk_n : out std_logic_vector(0 to 0);
      DDR3_CE : out std_logic_vector(0 to 0);
      DDR3_CS_n : out std_logic_vector(0 to 0);
      DDR3_ODT : out std_logic_vector(0 to 0);
      DDR3_RAS_n : out std_logic;
      DDR3_CAS_n : out std_logic;
      DDR3_WE_n : out std_logic;
      DDR3_BankAddr : out std_logic_vector(1 downto 0);
      DDR3_Addr : out std_logic_vector(12 downto 0);
      DDR3_DQ : inout std_logic_vector(31 downto 0);
      DDR3_DM : out std_logic_vector(3 downto 0);
      DDR3_Reset_n : out std_logic;
      DDR3_DQS : inout std_logic_vector(3 downto 0);
      DDR3_DQS_n : inout std_logic_vector(3 downto 0);
      mcbx_dram_addr : out std_logic_vector(12 downto 0);
      mcbx_dram_ba : out std_logic_vector(1 downto 0);
      mcbx_dram_ras_n : out std_logic;
      mcbx_dram_cas_n : out std_logic;
      mcbx_dram_we_n : out std_logic;
      mcbx_dram_cke : out std_logic;
      mcbx_dram_clk : out std_logic;
      mcbx_dram_clk_n : out std_logic;
      mcbx_dram_dq : inout std_logic_vector(31 downto 0);
      mcbx_dram_dqs : inout std_logic;
      mcbx_dram_dqs_n : inout std_logic;
      mcbx_dram_udqs : inout std_logic;
      mcbx_dram_udqs_n : inout std_logic;
      mcbx_dram_udm : out std_logic;
      mcbx_dram_ldm : out std_logic;
      mcbx_dram_odt : out std_logic;
      mcbx_dram_ddr3_rst : out std_logic;
      selfrefresh_enter : in std_logic;
      selfrefresh_mode : out std_logic;
      calib_recal : in std_logic;
      rzq : inout std_logic;
      zio : inout std_logic
    );
  end component;

  component ppc405_0_iplb1_wrapper is
    port (
      PLB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      PLB_Rst : out std_logic;
      SPLB_Rst : out std_logic_vector(0 to 0);
      MPLB_Rst : out std_logic_vector(0 to 0);
      PLB_dcrAck : out std_logic;
      PLB_dcrDBus : out std_logic_vector(0 to 31);
      DCR_ABus : in std_logic_vector(0 to 9);
      DCR_DBus : in std_logic_vector(0 to 31);
      DCR_Read : in std_logic;
      DCR_Write : in std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_UABus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 7);
      M_RNW : in std_logic_vector(0 to 0);
      M_abort : in std_logic_vector(0 to 0);
      M_busLock : in std_logic_vector(0 to 0);
      M_TAttribute : in std_logic_vector(0 to 15);
      M_lockErr : in std_logic_vector(0 to 0);
      M_MSize : in std_logic_vector(0 to 1);
      M_priority : in std_logic_vector(0 to 1);
      M_rdBurst : in std_logic_vector(0 to 0);
      M_request : in std_logic_vector(0 to 0);
      M_size : in std_logic_vector(0 to 3);
      M_type : in std_logic_vector(0 to 2);
      M_wrBurst : in std_logic_vector(0 to 0);
      M_wrDBus : in std_logic_vector(0 to 63);
      Sl_addrAck : in std_logic_vector(0 to 0);
      Sl_MRdErr : in std_logic_vector(0 to 0);
      Sl_MWrErr : in std_logic_vector(0 to 0);
      Sl_MBusy : in std_logic_vector(0 to 0);
      Sl_rdBTerm : in std_logic_vector(0 to 0);
      Sl_rdComp : in std_logic_vector(0 to 0);
      Sl_rdDAck : in std_logic_vector(0 to 0);
      Sl_rdDBus : in std_logic_vector(0 to 63);
      Sl_rdWdAddr : in std_logic_vector(0 to 3);
      Sl_rearbitrate : in std_logic_vector(0 to 0);
      Sl_SSize : in std_logic_vector(0 to 1);
      Sl_wait : in std_logic_vector(0 to 0);
      Sl_wrBTerm : in std_logic_vector(0 to 0);
      Sl_wrComp : in std_logic_vector(0 to 0);
      Sl_wrDAck : in std_logic_vector(0 to 0);
      Sl_MIRQ : in std_logic_vector(0 to 0);
      PLB_MIRQ : out std_logic_vector(0 to 0);
      PLB_ABus : out std_logic_vector(0 to 31);
      PLB_UABus : out std_logic_vector(0 to 31);
      PLB_BE : out std_logic_vector(0 to 7);
      PLB_MAddrAck : out std_logic_vector(0 to 0);
      PLB_MTimeout : out std_logic_vector(0 to 0);
      PLB_MBusy : out std_logic_vector(0 to 0);
      PLB_MRdErr : out std_logic_vector(0 to 0);
      PLB_MWrErr : out std_logic_vector(0 to 0);
      PLB_MRdBTerm : out std_logic_vector(0 to 0);
      PLB_MRdDAck : out std_logic_vector(0 to 0);
      PLB_MRdDBus : out std_logic_vector(0 to 63);
      PLB_MRdWdAddr : out std_logic_vector(0 to 3);
      PLB_MRearbitrate : out std_logic_vector(0 to 0);
      PLB_MWrBTerm : out std_logic_vector(0 to 0);
      PLB_MWrDAck : out std_logic_vector(0 to 0);
      PLB_MSSize : out std_logic_vector(0 to 1);
      PLB_PAValid : out std_logic;
      PLB_RNW : out std_logic;
      PLB_SAValid : out std_logic;
      PLB_abort : out std_logic;
      PLB_busLock : out std_logic;
      PLB_TAttribute : out std_logic_vector(0 to 15);
      PLB_lockErr : out std_logic;
      PLB_masterID : out std_logic_vector(0 to 0);
      PLB_MSize : out std_logic_vector(0 to 1);
      PLB_rdPendPri : out std_logic_vector(0 to 1);
      PLB_wrPendPri : out std_logic_vector(0 to 1);
      PLB_rdPendReq : out std_logic;
      PLB_wrPendReq : out std_logic;
      PLB_rdBurst : out std_logic;
      PLB_rdPrim : out std_logic_vector(0 to 0);
      PLB_reqPri : out std_logic_vector(0 to 1);
      PLB_size : out std_logic_vector(0 to 3);
      PLB_type : out std_logic_vector(0 to 2);
      PLB_wrBurst : out std_logic;
      PLB_wrDBus : out std_logic_vector(0 to 63);
      PLB_wrPrim : out std_logic_vector(0 to 0);
      PLB_SaddrAck : out std_logic;
      PLB_SMRdErr : out std_logic_vector(0 to 0);
      PLB_SMWrErr : out std_logic_vector(0 to 0);
      PLB_SMBusy : out std_logic_vector(0 to 0);
      PLB_SrdBTerm : out std_logic;
      PLB_SrdComp : out std_logic;
      PLB_SrdDAck : out std_logic;
      PLB_SrdDBus : out std_logic_vector(0 to 63);
      PLB_SrdWdAddr : out std_logic_vector(0 to 3);
      PLB_Srearbitrate : out std_logic;
      PLB_Sssize : out std_logic_vector(0 to 1);
      PLB_Swait : out std_logic;
      PLB_SwrBTerm : out std_logic;
      PLB_SwrComp : out std_logic;
      PLB_SwrDAck : out std_logic;
      Bus_Error_Det : out std_logic
    );
  end component;

  component ppc405_0_dplb1_wrapper is
    port (
      PLB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      PLB_Rst : out std_logic;
      SPLB_Rst : out std_logic_vector(0 to 0);
      MPLB_Rst : out std_logic_vector(0 to 0);
      PLB_dcrAck : out std_logic;
      PLB_dcrDBus : out std_logic_vector(0 to 31);
      DCR_ABus : in std_logic_vector(0 to 9);
      DCR_DBus : in std_logic_vector(0 to 31);
      DCR_Read : in std_logic;
      DCR_Write : in std_logic;
      M_ABus : in std_logic_vector(0 to 31);
      M_UABus : in std_logic_vector(0 to 31);
      M_BE : in std_logic_vector(0 to 7);
      M_RNW : in std_logic_vector(0 to 0);
      M_abort : in std_logic_vector(0 to 0);
      M_busLock : in std_logic_vector(0 to 0);
      M_TAttribute : in std_logic_vector(0 to 15);
      M_lockErr : in std_logic_vector(0 to 0);
      M_MSize : in std_logic_vector(0 to 1);
      M_priority : in std_logic_vector(0 to 1);
      M_rdBurst : in std_logic_vector(0 to 0);
      M_request : in std_logic_vector(0 to 0);
      M_size : in std_logic_vector(0 to 3);
      M_type : in std_logic_vector(0 to 2);
      M_wrBurst : in std_logic_vector(0 to 0);
      M_wrDBus : in std_logic_vector(0 to 63);
      Sl_addrAck : in std_logic_vector(0 to 0);
      Sl_MRdErr : in std_logic_vector(0 to 0);
      Sl_MWrErr : in std_logic_vector(0 to 0);
      Sl_MBusy : in std_logic_vector(0 to 0);
      Sl_rdBTerm : in std_logic_vector(0 to 0);
      Sl_rdComp : in std_logic_vector(0 to 0);
      Sl_rdDAck : in std_logic_vector(0 to 0);
      Sl_rdDBus : in std_logic_vector(0 to 63);
      Sl_rdWdAddr : in std_logic_vector(0 to 3);
      Sl_rearbitrate : in std_logic_vector(0 to 0);
      Sl_SSize : in std_logic_vector(0 to 1);
      Sl_wait : in std_logic_vector(0 to 0);
      Sl_wrBTerm : in std_logic_vector(0 to 0);
      Sl_wrComp : in std_logic_vector(0 to 0);
      Sl_wrDAck : in std_logic_vector(0 to 0);
      Sl_MIRQ : in std_logic_vector(0 to 0);
      PLB_MIRQ : out std_logic_vector(0 to 0);
      PLB_ABus : out std_logic_vector(0 to 31);
      PLB_UABus : out std_logic_vector(0 to 31);
      PLB_BE : out std_logic_vector(0 to 7);
      PLB_MAddrAck : out std_logic_vector(0 to 0);
      PLB_MTimeout : out std_logic_vector(0 to 0);
      PLB_MBusy : out std_logic_vector(0 to 0);
      PLB_MRdErr : out std_logic_vector(0 to 0);
      PLB_MWrErr : out std_logic_vector(0 to 0);
      PLB_MRdBTerm : out std_logic_vector(0 to 0);
      PLB_MRdDAck : out std_logic_vector(0 to 0);
      PLB_MRdDBus : out std_logic_vector(0 to 63);
      PLB_MRdWdAddr : out std_logic_vector(0 to 3);
      PLB_MRearbitrate : out std_logic_vector(0 to 0);
      PLB_MWrBTerm : out std_logic_vector(0 to 0);
      PLB_MWrDAck : out std_logic_vector(0 to 0);
      PLB_MSSize : out std_logic_vector(0 to 1);
      PLB_PAValid : out std_logic;
      PLB_RNW : out std_logic;
      PLB_SAValid : out std_logic;
      PLB_abort : out std_logic;
      PLB_busLock : out std_logic;
      PLB_TAttribute : out std_logic_vector(0 to 15);
      PLB_lockErr : out std_logic;
      PLB_masterID : out std_logic_vector(0 to 0);
      PLB_MSize : out std_logic_vector(0 to 1);
      PLB_rdPendPri : out std_logic_vector(0 to 1);
      PLB_wrPendPri : out std_logic_vector(0 to 1);
      PLB_rdPendReq : out std_logic;
      PLB_wrPendReq : out std_logic;
      PLB_rdBurst : out std_logic;
      PLB_rdPrim : out std_logic_vector(0 to 0);
      PLB_reqPri : out std_logic_vector(0 to 1);
      PLB_size : out std_logic_vector(0 to 3);
      PLB_type : out std_logic_vector(0 to 2);
      PLB_wrBurst : out std_logic;
      PLB_wrDBus : out std_logic_vector(0 to 63);
      PLB_wrPrim : out std_logic_vector(0 to 0);
      PLB_SaddrAck : out std_logic;
      PLB_SMRdErr : out std_logic_vector(0 to 0);
      PLB_SMWrErr : out std_logic_vector(0 to 0);
      PLB_SMBusy : out std_logic_vector(0 to 0);
      PLB_SrdBTerm : out std_logic;
      PLB_SrdComp : out std_logic;
      PLB_SrdDAck : out std_logic;
      PLB_SrdDBus : out std_logic_vector(0 to 63);
      PLB_SrdWdAddr : out std_logic_vector(0 to 3);
      PLB_Srearbitrate : out std_logic;
      PLB_Sssize : out std_logic_vector(0 to 1);
      PLB_Swait : out std_logic;
      PLB_SwrBTerm : out std_logic;
      PLB_SwrComp : out std_logic;
      PLB_SwrDAck : out std_logic;
      Bus_Error_Det : out std_logic
    );
  end component;

  component mgt_wrapper_wrapper is
    port (
      CLK : in std_logic
    );
  end component;

  component trimode_mac_gmii_wrapper is
    port (
      TemacIntc0_Irpt : out std_logic;
      TemacIntc1_Irpt : out std_logic;
      TemacPhy_RST_n : out std_logic;
      GTX_CLK_0 : in std_logic;
      MGTCLK_P : in std_logic;
      MGTCLK_N : in std_logic;
      REFCLK : in std_logic;
      DCLK : in std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      Core_Clk : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      LlinkTemac0_CLK : in std_logic;
      LlinkTemac0_RST : in std_logic;
      LlinkTemac0_SOP_n : in std_logic;
      LlinkTemac0_EOP_n : in std_logic;
      LlinkTemac0_SOF_n : in std_logic;
      LlinkTemac0_EOF_n : in std_logic;
      LlinkTemac0_REM : in std_logic_vector(0 to 3);
      LlinkTemac0_Data : in std_logic_vector(0 to 31);
      LlinkTemac0_SRC_RDY_n : in std_logic;
      Temac0Llink_DST_RDY_n : out std_logic;
      Temac0Llink_SOP_n : out std_logic;
      Temac0Llink_EOP_n : out std_logic;
      Temac0Llink_SOF_n : out std_logic;
      Temac0Llink_EOF_n : out std_logic;
      Temac0Llink_REM : out std_logic_vector(0 to 3);
      Temac0Llink_Data : out std_logic_vector(0 to 31);
      Temac0Llink_SRC_RDY_n : out std_logic;
      LlinkTemac0_DST_RDY_n : in std_logic;
      LlinkTemac1_CLK : in std_logic;
      LlinkTemac1_RST : in std_logic;
      LlinkTemac1_SOP_n : in std_logic;
      LlinkTemac1_EOP_n : in std_logic;
      LlinkTemac1_SOF_n : in std_logic;
      LlinkTemac1_EOF_n : in std_logic;
      LlinkTemac1_REM : in std_logic_vector(0 to 3);
      LlinkTemac1_Data : in std_logic_vector(0 to 31);
      LlinkTemac1_SRC_RDY_n : in std_logic;
      Temac1Llink_DST_RDY_n : out std_logic;
      Temac1Llink_SOP_n : out std_logic;
      Temac1Llink_EOP_n : out std_logic;
      Temac1Llink_SOF_n : out std_logic;
      Temac1Llink_EOF_n : out std_logic;
      Temac1Llink_REM : out std_logic_vector(0 to 3);
      Temac1Llink_Data : out std_logic_vector(0 to 31);
      Temac1Llink_SRC_RDY_n : out std_logic;
      LlinkTemac1_DST_RDY_n : in std_logic;
      MII_TXD_0 : out std_logic_vector(3 downto 0);
      MII_TX_EN_0 : out std_logic;
      MII_TX_ER_0 : out std_logic;
      MII_RXD_0 : in std_logic_vector(3 downto 0);
      MII_RX_DV_0 : in std_logic;
      MII_RX_ER_0 : in std_logic;
      MII_RX_CLK_0 : in std_logic;
      MII_TX_CLK_0 : in std_logic;
      MII_TXD_1 : out std_logic_vector(3 downto 0);
      MII_TX_EN_1 : out std_logic;
      MII_TX_ER_1 : out std_logic;
      MII_RXD_1 : in std_logic_vector(3 downto 0);
      MII_RX_DV_1 : in std_logic;
      MII_RX_ER_1 : in std_logic;
      MII_RX_CLK_1 : in std_logic;
      MII_TX_CLK_1 : in std_logic;
      GMII_TXD_0 : out std_logic_vector(7 downto 0);
      GMII_TX_EN_0 : out std_logic;
      GMII_TX_ER_0 : out std_logic;
      GMII_TX_CLK_0 : out std_logic;
      GMII_RXD_0 : in std_logic_vector(7 downto 0);
      GMII_RX_DV_0 : in std_logic;
      GMII_RX_ER_0 : in std_logic;
      GMII_RX_CLK_0 : in std_logic;
      GMII_TXD_1 : out std_logic_vector(7 downto 0);
      GMII_TX_EN_1 : out std_logic;
      GMII_TX_ER_1 : out std_logic;
      GMII_TX_CLK_1 : out std_logic;
      GMII_RXD_1 : in std_logic_vector(7 downto 0);
      GMII_RX_DV_1 : in std_logic;
      GMII_RX_ER_1 : in std_logic;
      GMII_RX_CLK_1 : in std_logic;
      TXP_0 : out std_logic;
      TXN_0 : out std_logic;
      RXP_0 : in std_logic;
      RXN_0 : in std_logic;
      TXP_1 : out std_logic;
      TXN_1 : out std_logic;
      RXP_1 : in std_logic;
      RXN_1 : in std_logic;
      RGMII_TXD_0 : out std_logic_vector(3 downto 0);
      RGMII_TX_CTL_0 : out std_logic;
      RGMII_TXC_0 : out std_logic;
      RGMII_RXD_0 : in std_logic_vector(3 downto 0);
      RGMII_RX_CTL_0 : in std_logic;
      RGMII_RXC_0 : in std_logic;
      RGMII_TXD_1 : out std_logic_vector(3 downto 0);
      RGMII_TX_CTL_1 : out std_logic;
      RGMII_TXC_1 : out std_logic;
      RGMII_RXD_1 : in std_logic_vector(3 downto 0);
      RGMII_RX_CTL_1 : in std_logic;
      RGMII_RXC_1 : in std_logic;
      MDC_0 : out std_logic;
      MDC_1 : out std_logic;
      HostMiimRdy : in std_logic;
      HostRdData : in std_logic_vector(31 downto 0);
      HostMiimSel : out std_logic;
      HostReq : out std_logic;
      HostAddr : out std_logic_vector(9 downto 0);
      HostEmac1Sel : out std_logic;
      Temac0AvbTxClk : out std_logic;
      Temac0AvbTxClkEn : out std_logic;
      Temac0AvbRxClk : out std_logic;
      Temac0AvbRxClkEn : out std_logic;
      Avb2Mac0TxData : in std_logic_vector(7 downto 0);
      Avb2Mac0TxDataValid : in std_logic;
      Avb2Mac0TxUnderrun : in std_logic;
      Mac02AvbTxAck : out std_logic;
      Mac02AvbRxData : out std_logic_vector(7 downto 0);
      Mac02AvbRxDataValid : out std_logic;
      Mac02AvbRxFrameGood : out std_logic;
      Mac02AvbRxFrameBad : out std_logic;
      Temac02AvbTxData : out std_logic_vector(7 downto 0);
      Temac02AvbTxDataValid : out std_logic;
      Temac02AvbTxUnderrun : out std_logic;
      Avb2Temac0TxAck : in std_logic;
      Avb2Temac0RxData : in std_logic_vector(7 downto 0);
      Avb2Temac0RxDataValid : in std_logic;
      Avb2Temac0RxFrameGood : in std_logic;
      Avb2Temac0RxFrameBad : in std_logic;
      Temac1AvbTxClk : out std_logic;
      Temac1AvbTxClkEn : out std_logic;
      Temac1AvbRxClk : out std_logic;
      Temac1AvbRxClkEn : out std_logic;
      Avb2Mac1TxData : in std_logic_vector(7 downto 0);
      Avb2Mac1TxDataValid : in std_logic;
      Avb2Mac1TxUnderrun : in std_logic;
      Mac12AvbTxAck : out std_logic;
      Mac12AvbRxData : out std_logic_vector(7 downto 0);
      Mac12AvbRxDataValid : out std_logic;
      Mac12AvbRxFrameGood : out std_logic;
      Mac12AvbRxFrameBad : out std_logic;
      Temac12AvbTxData : out std_logic_vector(7 downto 0);
      Temac12AvbTxDataValid : out std_logic;
      Temac12AvbTxUnderrun : out std_logic;
      Avb2Temac1TxAck : in std_logic;
      Avb2Temac1RxData : in std_logic_vector(7 downto 0);
      Avb2Temac1RxDataValid : in std_logic;
      Avb2Temac1RxFrameGood : in std_logic;
      Avb2Temac1RxFrameBad : in std_logic;
      TxClientClk_0 : out std_logic;
      ClientTxStat_0 : out std_logic;
      ClientTxStatsVld_0 : out std_logic;
      ClientTxStatsByteVld_0 : out std_logic;
      RxClientClk_0 : out std_logic;
      ClientRxStats_0 : out std_logic_vector(6 downto 0);
      ClientRxStatsVld_0 : out std_logic;
      ClientRxStatsByteVld_0 : out std_logic;
      TxClientClk_1 : out std_logic;
      ClientTxStat_1 : out std_logic;
      ClientTxStatsVld_1 : out std_logic;
      ClientTxStatsByteVld_1 : out std_logic;
      RxClientClk_1 : out std_logic;
      ClientRxStats_1 : out std_logic_vector(6 downto 0);
      ClientRxStatsVld_1 : out std_logic;
      ClientRxStatsByteVld_1 : out std_logic;
      MDIO_0_I : in std_logic;
      MDIO_0_O : out std_logic;
      MDIO_0_T : out std_logic;
      MDIO_1_I : in std_logic;
      MDIO_1_O : out std_logic;
      MDIO_1_T : out std_logic
    );
  end component;

  component flash_wrapper is
    port (
      MCH_SPLB_Clk : in std_logic;
      RdClk : in std_logic;
      MCH_SPLB_Rst : in std_logic;
      MCH0_Access_Control : in std_logic;
      MCH0_Access_Data : in std_logic_vector(0 to 31);
      MCH0_Access_Write : in std_logic;
      MCH0_Access_Full : out std_logic;
      MCH0_ReadData_Control : out std_logic;
      MCH0_ReadData_Data : out std_logic_vector(0 to 31);
      MCH0_ReadData_Read : in std_logic;
      MCH0_ReadData_Exists : out std_logic;
      MCH1_Access_Control : in std_logic;
      MCH1_Access_Data : in std_logic_vector(0 to 31);
      MCH1_Access_Write : in std_logic;
      MCH1_Access_Full : out std_logic;
      MCH1_ReadData_Control : out std_logic;
      MCH1_ReadData_Data : out std_logic_vector(0 to 31);
      MCH1_ReadData_Read : in std_logic;
      MCH1_ReadData_Exists : out std_logic;
      MCH2_Access_Control : in std_logic;
      MCH2_Access_Data : in std_logic_vector(0 to 31);
      MCH2_Access_Write : in std_logic;
      MCH2_Access_Full : out std_logic;
      MCH2_ReadData_Control : out std_logic;
      MCH2_ReadData_Data : out std_logic_vector(0 to 31);
      MCH2_ReadData_Read : in std_logic;
      MCH2_ReadData_Exists : out std_logic;
      MCH3_Access_Control : in std_logic;
      MCH3_Access_Data : in std_logic_vector(0 to 31);
      MCH3_Access_Write : in std_logic;
      MCH3_Access_Full : out std_logic;
      MCH3_ReadData_Control : out std_logic;
      MCH3_ReadData_Data : out std_logic_vector(0 to 31);
      MCH3_ReadData_Read : in std_logic;
      MCH3_ReadData_Exists : out std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      Mem_DQ_I : in std_logic_vector(0 to 31);
      Mem_DQ_O : out std_logic_vector(0 to 31);
      Mem_DQ_T : out std_logic_vector(0 to 31);
      Mem_A : out std_logic_vector(0 to 31);
      Mem_RPN : out std_logic;
      Mem_CEN : out std_logic_vector(0 to 0);
      Mem_OEN : out std_logic_vector(0 to 0);
      Mem_WEN : out std_logic;
      Mem_QWEN : out std_logic_vector(0 to 3);
      Mem_BEN : out std_logic_vector(0 to 3);
      Mem_CE : out std_logic_vector(0 to 0);
      Mem_ADV_LDN : out std_logic;
      Mem_LBON : out std_logic;
      Mem_CKEN : out std_logic;
      Mem_RNW : out std_logic
    );
  end component;

  component xps_timebase_wdt_0_wrapper is
    port (
      WDT_Reset : out std_logic;
      Timebase_Interrupt : out std_logic;
      WDT_Interrupt : out std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 63);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 1)
    );
  end component;

  component xps_timer_0_wrapper is
    port (
      CaptureTrig0 : in std_logic;
      CaptureTrig1 : in std_logic;
      GenerateOut0 : out std_logic;
      GenerateOut1 : out std_logic;
      PWM0 : out std_logic;
      Interrupt : out std_logic;
      Freeze : in std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 63);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 1)
    );
  end component;

  component rs232_uart_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      baudoutN : out std_logic;
      ctsN : in std_logic;
      dcdN : in std_logic;
      ddis : out std_logic;
      dsrN : in std_logic;
      dtrN : out std_logic;
      out1N : out std_logic;
      out2N : out std_logic;
      rclk : in std_logic;
      riN : in std_logic;
      rtsN : out std_logic;
      rxrdyN : out std_logic;
      sin : in std_logic;
      sout : out std_logic;
      IP2INTC_Irpt : out std_logic;
      txrdyN : out std_logic;
      xin : in std_logic;
      xout : out std_logic;
      Freeze : in std_logic
    );
  end component;

  component clock_generator_0_wrapper is
    port (
      CLKIN : in std_logic;
      CLKOUT0 : out std_logic;
      CLKOUT1 : out std_logic;
      CLKOUT2 : out std_logic;
      CLKOUT3 : out std_logic;
      CLKOUT4 : out std_logic;
      CLKOUT5 : out std_logic;
      CLKOUT6 : out std_logic;
      CLKOUT7 : out std_logic;
      CLKOUT8 : out std_logic;
      CLKOUT9 : out std_logic;
      CLKOUT10 : out std_logic;
      CLKOUT11 : out std_logic;
      CLKOUT12 : out std_logic;
      CLKOUT13 : out std_logic;
      CLKOUT14 : out std_logic;
      CLKOUT15 : out std_logic;
      CLKFBIN : in std_logic;
      CLKFBOUT : out std_logic;
      PSCLK : in std_logic;
      PSEN : in std_logic;
      PSINCDEC : in std_logic;
      PSDONE : out std_logic;
      RST : in std_logic;
      LOCKED : out std_logic
    );
  end component;

  component jtagppc_cntlr_inst_wrapper is
    port (
      TRSTNEG : in std_logic;
      HALTNEG0 : in std_logic;
      DBGC405DEBUGHALT0 : out std_logic;
      HALTNEG1 : in std_logic;
      DBGC405DEBUGHALT1 : out std_logic;
      C405JTGTDO0 : in std_logic;
      C405JTGTDOEN0 : in std_logic;
      JTGC405TCK0 : out std_logic;
      JTGC405TDI0 : out std_logic;
      JTGC405TMS0 : out std_logic;
      JTGC405TRSTNEG0 : out std_logic;
      C405JTGTDO1 : in std_logic;
      C405JTGTDOEN1 : in std_logic;
      JTGC405TCK1 : out std_logic;
      JTGC405TDI1 : out std_logic;
      JTGC405TMS1 : out std_logic;
      JTGC405TRSTNEG1 : out std_logic
    );
  end component;

  component proc_sys_reset_0_wrapper is
    port (
      Slowest_sync_clk : in std_logic;
      Ext_Reset_In : in std_logic;
      Aux_Reset_In : in std_logic;
      MB_Debug_Sys_Rst : in std_logic;
      Core_Reset_Req_0 : in std_logic;
      Chip_Reset_Req_0 : in std_logic;
      System_Reset_Req_0 : in std_logic;
      Core_Reset_Req_1 : in std_logic;
      Chip_Reset_Req_1 : in std_logic;
      System_Reset_Req_1 : in std_logic;
      Dcm_locked : in std_logic;
      RstcPPCresetcore_0 : out std_logic;
      RstcPPCresetchip_0 : out std_logic;
      RstcPPCresetsys_0 : out std_logic;
      RstcPPCresetcore_1 : out std_logic;
      RstcPPCresetchip_1 : out std_logic;
      RstcPPCresetsys_1 : out std_logic;
      MB_Reset : out std_logic;
      Bus_Struct_Reset : out std_logic_vector(0 to 0);
      Peripheral_Reset : out std_logic_vector(0 to 0)
    );
  end component;

  component xps_intc_0_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 7);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 63);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 63);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 1);
      Intr : in std_logic_vector(9 downto 0);
      Irq : out std_logic
    );
  end component;

  component IOBUF is
    port (
      I : in std_logic;
      IO : inout std_logic;
      O : out std_logic;
      T : in std_logic
    );
  end component;

  -- Internal signals

  signal DDR_SDRAM_SDMA2_Rx_IntOut : std_logic;
  signal DDR_SDRAM_SDMA2_Tx_IntOut : std_logic;
  signal Dcm_all_locked : std_logic;
  signal IIC_EEPROM_IIC2INTC_Irpt : std_logic;
  signal Push_Buttons_Position_IP2INTC_Irpt : std_logic;
  signal RS232_Uart_IP2INTC_Irpt : std_logic;
  signal SysACE_CompactFlash_SysACE_IRQ : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_RST_ACK : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Rx_Data : std_logic_vector(0 to 31);
  signal TriMode_MAC_GMII_LLINK0_LL_Rx_DstRdy_n : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Rx_EOF_n : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Rx_EOP_n : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Rx_Rem : std_logic_vector(0 to 3);
  signal TriMode_MAC_GMII_LLINK0_LL_Rx_SOF_n : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Rx_SOP_n : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Rx_SrcRdy_n : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Tx_Data : std_logic_vector(0 to 31);
  signal TriMode_MAC_GMII_LLINK0_LL_Tx_DstRdy_n : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Tx_EOF_n : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Tx_EOP_n : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Tx_Rem : std_logic_vector(0 to 3);
  signal TriMode_MAC_GMII_LLINK0_LL_Tx_SOF_n : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Tx_SOP_n : std_logic;
  signal TriMode_MAC_GMII_LLINK0_LL_Tx_SrcRdy_n : std_logic;
  signal TriMode_MAC_GMII_TemacIntc0_Irpt : std_logic;
  signal clk_100_0000MHz90DCM0 : std_logic;
  signal clk_100_0000MHzDCM0 : std_logic;
  signal clk_125_0000MHz : std_logic;
  signal clk_200_0000MHz : std_logic;
  signal clk_300_0000MHzDCM0 : std_logic;
  signal dcm_clk_s : std_logic;
  signal fpga_0_FLASH_Mem_A_pin_vslice_9_29_concat : std_logic_vector(9 to 29);
  signal fpga_0_FLASH_Mem_DQ_pin_I : std_logic_vector(0 to 31);
  signal fpga_0_FLASH_Mem_DQ_pin_O : std_logic_vector(0 to 31);
  signal fpga_0_FLASH_Mem_DQ_pin_T : std_logic_vector(0 to 31);
  signal fpga_0_IIC_EEPROM_Scl_pin_I : std_logic;
  signal fpga_0_IIC_EEPROM_Scl_pin_O : std_logic;
  signal fpga_0_IIC_EEPROM_Scl_pin_T : std_logic;
  signal fpga_0_IIC_EEPROM_Sda_pin_I : std_logic;
  signal fpga_0_IIC_EEPROM_Sda_pin_O : std_logic;
  signal fpga_0_IIC_EEPROM_Sda_pin_T : std_logic;
  signal fpga_0_LEDs_4Bit_GPIO_IO_pin_I : std_logic_vector(0 to 3);
  signal fpga_0_LEDs_4Bit_GPIO_IO_pin_O : std_logic_vector(0 to 3);
  signal fpga_0_LEDs_4Bit_GPIO_IO_pin_T : std_logic_vector(0 to 3);
  signal fpga_0_LEDs_Positions_GPIO_IO_pin_I : std_logic_vector(0 to 4);
  signal fpga_0_LEDs_Positions_GPIO_IO_pin_O : std_logic_vector(0 to 4);
  signal fpga_0_LEDs_Positions_GPIO_IO_pin_T : std_logic_vector(0 to 4);
  signal fpga_0_Push_Buttons_Position_GPIO_IO_pin_I : std_logic_vector(0 to 4);
  signal fpga_0_Push_Buttons_Position_GPIO_IO_pin_O : std_logic_vector(0 to 4);
  signal fpga_0_Push_Buttons_Position_GPIO_IO_pin_T : std_logic_vector(0 to 4);
  signal fpga_0_SysACE_CompactFlash_SysACE_MPA_pin_vslice_6_1_concat : std_logic_vector(6 downto 1);
  signal fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I : std_logic_vector(15 downto 0);
  signal fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O : std_logic_vector(15 downto 0);
  signal fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T : std_logic_vector(15 downto 0);
  signal fpga_0_TriMode_MAC_GMII_MDIO_0_pin_I : std_logic;
  signal fpga_0_TriMode_MAC_GMII_MDIO_0_pin_O : std_logic;
  signal fpga_0_TriMode_MAC_GMII_MDIO_0_pin_T : std_logic;
  signal net_gnd0 : std_logic;
  signal net_gnd1 : std_logic_vector(0 to 0);
  signal net_gnd2 : std_logic_vector(0 to 1);
  signal net_gnd3 : std_logic_vector(0 to 2);
  signal net_gnd4 : std_logic_vector(0 to 3);
  signal net_gnd6 : std_logic_vector(5 downto 0);
  signal net_gnd8 : std_logic_vector(0 to 7);
  signal net_gnd10 : std_logic_vector(0 to 9);
  signal net_gnd16 : std_logic_vector(0 to 15);
  signal net_gnd30 : std_logic_vector(29 downto 0);
  signal net_gnd32 : std_logic_vector(31 downto 0);
  signal net_gnd36 : std_logic_vector(0 to 35);
  signal net_gnd64 : std_logic_vector(0 to 63);
  signal net_gnd128 : std_logic_vector(0 to 127);
  signal net_vcc0 : std_logic;
  signal net_vcc4 : std_logic_vector(0 to 3);
  signal pgassign1 : std_logic_vector(0 to 0);
  signal pgassign2 : std_logic_vector(0 to 0);
  signal pgassign3 : std_logic_vector(0 to 0);
  signal pgassign4 : std_logic_vector(0 to 0);
  signal pgassign5 : std_logic_vector(0 to 0);
  signal pgassign6 : std_logic_vector(0 to 0);
  signal pgassign7 : std_logic_vector(0 to 0);
  signal pgassign8 : std_logic_vector(0 to 8);
  signal pgassign9 : std_logic_vector(0 to 1);
  signal pgassign10 : std_logic_vector(6 downto 0);
  signal pgassign11 : std_logic_vector(0 to 31);
  signal pgassign12 : std_logic_vector(9 downto 0);
  signal plb_MPLB_Rst : std_logic_vector(0 to 1);
  signal plb_M_ABus : std_logic_vector(0 to 63);
  signal plb_M_BE : std_logic_vector(0 to 15);
  signal plb_M_MSize : std_logic_vector(0 to 3);
  signal plb_M_RNW : std_logic_vector(0 to 1);
  signal plb_M_TAttribute : std_logic_vector(0 to 31);
  signal plb_M_UABus : std_logic_vector(0 to 63);
  signal plb_M_abort : std_logic_vector(0 to 1);
  signal plb_M_busLock : std_logic_vector(0 to 1);
  signal plb_M_lockErr : std_logic_vector(0 to 1);
  signal plb_M_priority : std_logic_vector(0 to 3);
  signal plb_M_rdBurst : std_logic_vector(0 to 1);
  signal plb_M_request : std_logic_vector(0 to 1);
  signal plb_M_size : std_logic_vector(0 to 7);
  signal plb_M_type : std_logic_vector(0 to 5);
  signal plb_M_wrBurst : std_logic_vector(0 to 1);
  signal plb_M_wrDBus : std_logic_vector(0 to 127);
  signal plb_PLB_ABus : std_logic_vector(0 to 31);
  signal plb_PLB_BE : std_logic_vector(0 to 7);
  signal plb_PLB_MAddrAck : std_logic_vector(0 to 1);
  signal plb_PLB_MBusy : std_logic_vector(0 to 1);
  signal plb_PLB_MRdBTerm : std_logic_vector(0 to 1);
  signal plb_PLB_MRdDAck : std_logic_vector(0 to 1);
  signal plb_PLB_MRdDBus : std_logic_vector(0 to 127);
  signal plb_PLB_MRdErr : std_logic_vector(0 to 1);
  signal plb_PLB_MRdWdAddr : std_logic_vector(0 to 7);
  signal plb_PLB_MRearbitrate : std_logic_vector(0 to 1);
  signal plb_PLB_MSSize : std_logic_vector(0 to 3);
  signal plb_PLB_MSize : std_logic_vector(0 to 1);
  signal plb_PLB_MTimeout : std_logic_vector(0 to 1);
  signal plb_PLB_MWrBTerm : std_logic_vector(0 to 1);
  signal plb_PLB_MWrDAck : std_logic_vector(0 to 1);
  signal plb_PLB_MWrErr : std_logic_vector(0 to 1);
  signal plb_PLB_PAValid : std_logic;
  signal plb_PLB_RNW : std_logic;
  signal plb_PLB_SAValid : std_logic;
  signal plb_PLB_TAttribute : std_logic_vector(0 to 15);
  signal plb_PLB_UABus : std_logic_vector(0 to 31);
  signal plb_PLB_abort : std_logic;
  signal plb_PLB_busLock : std_logic;
  signal plb_PLB_lockErr : std_logic;
  signal plb_PLB_masterID : std_logic_vector(0 to 0);
  signal plb_PLB_rdBurst : std_logic;
  signal plb_PLB_rdPendPri : std_logic_vector(0 to 1);
  signal plb_PLB_rdPendReq : std_logic;
  signal plb_PLB_rdPrim : std_logic_vector(0 to 12);
  signal plb_PLB_reqPri : std_logic_vector(0 to 1);
  signal plb_PLB_size : std_logic_vector(0 to 3);
  signal plb_PLB_type : std_logic_vector(0 to 2);
  signal plb_PLB_wrBurst : std_logic;
  signal plb_PLB_wrDBus : std_logic_vector(0 to 63);
  signal plb_PLB_wrPendPri : std_logic_vector(0 to 1);
  signal plb_PLB_wrPendReq : std_logic;
  signal plb_PLB_wrPrim : std_logic_vector(0 to 12);
  signal plb_SPLB_Rst : std_logic_vector(0 to 12);
  signal plb_Sl_MBusy : std_logic_vector(0 to 25);
  signal plb_Sl_MIRQ : std_logic_vector(0 to 25);
  signal plb_Sl_MRdErr : std_logic_vector(0 to 25);
  signal plb_Sl_MWrErr : std_logic_vector(0 to 25);
  signal plb_Sl_SSize : std_logic_vector(0 to 25);
  signal plb_Sl_addrAck : std_logic_vector(0 to 12);
  signal plb_Sl_rdBTerm : std_logic_vector(0 to 12);
  signal plb_Sl_rdComp : std_logic_vector(0 to 12);
  signal plb_Sl_rdDAck : std_logic_vector(0 to 12);
  signal plb_Sl_rdDBus : std_logic_vector(0 to 831);
  signal plb_Sl_rdWdAddr : std_logic_vector(0 to 51);
  signal plb_Sl_rearbitrate : std_logic_vector(0 to 12);
  signal plb_Sl_wait : std_logic_vector(0 to 12);
  signal plb_Sl_wrBTerm : std_logic_vector(0 to 12);
  signal plb_Sl_wrComp : std_logic_vector(0 to 12);
  signal plb_Sl_wrDAck : std_logic_vector(0 to 12);
  signal ppc405_0_EICC405EXTINPUTIRQ : std_logic;
  signal ppc405_0_dplb1_MPLB_Rst : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_M_ABus : std_logic_vector(0 to 31);
  signal ppc405_0_dplb1_M_BE : std_logic_vector(0 to 7);
  signal ppc405_0_dplb1_M_MSize : std_logic_vector(0 to 1);
  signal ppc405_0_dplb1_M_RNW : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_M_TAttribute : std_logic_vector(0 to 15);
  signal ppc405_0_dplb1_M_UABus : std_logic_vector(0 to 31);
  signal ppc405_0_dplb1_M_abort : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_M_busLock : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_M_lockErr : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_M_priority : std_logic_vector(0 to 1);
  signal ppc405_0_dplb1_M_rdBurst : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_M_request : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_M_size : std_logic_vector(0 to 3);
  signal ppc405_0_dplb1_M_type : std_logic_vector(0 to 2);
  signal ppc405_0_dplb1_M_wrBurst : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_M_wrDBus : std_logic_vector(0 to 63);
  signal ppc405_0_dplb1_PLB_ABus : std_logic_vector(0 to 31);
  signal ppc405_0_dplb1_PLB_BE : std_logic_vector(0 to 7);
  signal ppc405_0_dplb1_PLB_MAddrAck : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_MBusy : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_MRdBTerm : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_MRdDAck : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_MRdDBus : std_logic_vector(0 to 63);
  signal ppc405_0_dplb1_PLB_MRdErr : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_MRdWdAddr : std_logic_vector(0 to 3);
  signal ppc405_0_dplb1_PLB_MRearbitrate : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_MSSize : std_logic_vector(0 to 1);
  signal ppc405_0_dplb1_PLB_MSize : std_logic_vector(0 to 1);
  signal ppc405_0_dplb1_PLB_MTimeout : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_MWrBTerm : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_MWrDAck : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_MWrErr : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_PAValid : std_logic;
  signal ppc405_0_dplb1_PLB_RNW : std_logic;
  signal ppc405_0_dplb1_PLB_SAValid : std_logic;
  signal ppc405_0_dplb1_PLB_TAttribute : std_logic_vector(0 to 15);
  signal ppc405_0_dplb1_PLB_UABus : std_logic_vector(0 to 31);
  signal ppc405_0_dplb1_PLB_abort : std_logic;
  signal ppc405_0_dplb1_PLB_busLock : std_logic;
  signal ppc405_0_dplb1_PLB_lockErr : std_logic;
  signal ppc405_0_dplb1_PLB_masterID : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_rdBurst : std_logic;
  signal ppc405_0_dplb1_PLB_rdPendPri : std_logic_vector(0 to 1);
  signal ppc405_0_dplb1_PLB_rdPendReq : std_logic;
  signal ppc405_0_dplb1_PLB_rdPrim : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_PLB_reqPri : std_logic_vector(0 to 1);
  signal ppc405_0_dplb1_PLB_size : std_logic_vector(0 to 3);
  signal ppc405_0_dplb1_PLB_type : std_logic_vector(0 to 2);
  signal ppc405_0_dplb1_PLB_wrBurst : std_logic;
  signal ppc405_0_dplb1_PLB_wrDBus : std_logic_vector(0 to 63);
  signal ppc405_0_dplb1_PLB_wrPendPri : std_logic_vector(0 to 1);
  signal ppc405_0_dplb1_PLB_wrPendReq : std_logic;
  signal ppc405_0_dplb1_PLB_wrPrim : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_SPLB_Rst : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_MBusy : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_MIRQ : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_MRdErr : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_MWrErr : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_SSize : std_logic_vector(0 to 1);
  signal ppc405_0_dplb1_Sl_addrAck : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_rdBTerm : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_rdComp : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_rdDAck : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_rdDBus : std_logic_vector(0 to 63);
  signal ppc405_0_dplb1_Sl_rdWdAddr : std_logic_vector(0 to 3);
  signal ppc405_0_dplb1_Sl_rearbitrate : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_wait : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_wrBTerm : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_wrComp : std_logic_vector(0 to 0);
  signal ppc405_0_dplb1_Sl_wrDAck : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_MPLB_Rst : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_M_ABus : std_logic_vector(0 to 31);
  signal ppc405_0_iplb1_M_BE : std_logic_vector(0 to 7);
  signal ppc405_0_iplb1_M_MSize : std_logic_vector(0 to 1);
  signal ppc405_0_iplb1_M_RNW : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_M_TAttribute : std_logic_vector(0 to 15);
  signal ppc405_0_iplb1_M_UABus : std_logic_vector(0 to 31);
  signal ppc405_0_iplb1_M_abort : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_M_busLock : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_M_lockErr : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_M_priority : std_logic_vector(0 to 1);
  signal ppc405_0_iplb1_M_rdBurst : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_M_request : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_M_size : std_logic_vector(0 to 3);
  signal ppc405_0_iplb1_M_type : std_logic_vector(0 to 2);
  signal ppc405_0_iplb1_M_wrBurst : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_M_wrDBus : std_logic_vector(0 to 63);
  signal ppc405_0_iplb1_PLB_ABus : std_logic_vector(0 to 31);
  signal ppc405_0_iplb1_PLB_BE : std_logic_vector(0 to 7);
  signal ppc405_0_iplb1_PLB_MAddrAck : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_MBusy : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_MRdBTerm : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_MRdDAck : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_MRdDBus : std_logic_vector(0 to 63);
  signal ppc405_0_iplb1_PLB_MRdErr : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_MRdWdAddr : std_logic_vector(0 to 3);
  signal ppc405_0_iplb1_PLB_MRearbitrate : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_MSSize : std_logic_vector(0 to 1);
  signal ppc405_0_iplb1_PLB_MSize : std_logic_vector(0 to 1);
  signal ppc405_0_iplb1_PLB_MTimeout : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_MWrBTerm : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_MWrDAck : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_MWrErr : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_PAValid : std_logic;
  signal ppc405_0_iplb1_PLB_RNW : std_logic;
  signal ppc405_0_iplb1_PLB_SAValid : std_logic;
  signal ppc405_0_iplb1_PLB_TAttribute : std_logic_vector(0 to 15);
  signal ppc405_0_iplb1_PLB_UABus : std_logic_vector(0 to 31);
  signal ppc405_0_iplb1_PLB_abort : std_logic;
  signal ppc405_0_iplb1_PLB_busLock : std_logic;
  signal ppc405_0_iplb1_PLB_lockErr : std_logic;
  signal ppc405_0_iplb1_PLB_masterID : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_rdBurst : std_logic;
  signal ppc405_0_iplb1_PLB_rdPendPri : std_logic_vector(0 to 1);
  signal ppc405_0_iplb1_PLB_rdPendReq : std_logic;
  signal ppc405_0_iplb1_PLB_rdPrim : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_PLB_reqPri : std_logic_vector(0 to 1);
  signal ppc405_0_iplb1_PLB_size : std_logic_vector(0 to 3);
  signal ppc405_0_iplb1_PLB_type : std_logic_vector(0 to 2);
  signal ppc405_0_iplb1_PLB_wrBurst : std_logic;
  signal ppc405_0_iplb1_PLB_wrDBus : std_logic_vector(0 to 63);
  signal ppc405_0_iplb1_PLB_wrPendPri : std_logic_vector(0 to 1);
  signal ppc405_0_iplb1_PLB_wrPendReq : std_logic;
  signal ppc405_0_iplb1_PLB_wrPrim : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_SPLB_Rst : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_MBusy : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_MIRQ : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_MRdErr : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_MWrErr : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_SSize : std_logic_vector(0 to 1);
  signal ppc405_0_iplb1_Sl_addrAck : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_rdBTerm : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_rdComp : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_rdDAck : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_rdDBus : std_logic_vector(0 to 63);
  signal ppc405_0_iplb1_Sl_rdWdAddr : std_logic_vector(0 to 3);
  signal ppc405_0_iplb1_Sl_rearbitrate : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_wait : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_wrBTerm : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_wrComp : std_logic_vector(0 to 0);
  signal ppc405_0_iplb1_Sl_wrDAck : std_logic_vector(0 to 0);
  signal ppc405_0_jtagppc_bus_C405JTGTDO : std_logic;
  signal ppc405_0_jtagppc_bus_C405JTGTDOEN : std_logic;
  signal ppc405_0_jtagppc_bus_JTGC405TCK : std_logic;
  signal ppc405_0_jtagppc_bus_JTGC405TDI : std_logic;
  signal ppc405_0_jtagppc_bus_JTGC405TMS : std_logic;
  signal ppc405_0_jtagppc_bus_JTGC405TRSTNEG : std_logic;
  signal ppc_reset_bus_Chip_Reset_Req : std_logic;
  signal ppc_reset_bus_Core_Reset_Req : std_logic;
  signal ppc_reset_bus_RstcPPCresetcore : std_logic;
  signal ppc_reset_bus_RstcPPCresetsys : std_logic;
  signal ppc_reset_bus_RstsPPCresetchip : std_logic;
  signal ppc_reset_bus_System_Reset_Req : std_logic;
  signal sys_bus_reset : std_logic_vector(0 to 0);
  signal sys_periph_reset : std_logic_vector(0 to 0);
  signal sys_rst_s : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_Addr : std_logic_vector(0 to 31);
  signal xps_bram_if_cntlr_1_port_BRAM_Clk : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_Din : std_logic_vector(0 to 63);
  signal xps_bram_if_cntlr_1_port_BRAM_Dout : std_logic_vector(0 to 63);
  signal xps_bram_if_cntlr_1_port_BRAM_EN : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_Rst : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_WEN : std_logic_vector(0 to 7);
  signal xps_timebase_wdt_0_Timebase_Interrupt : std_logic;
  signal xps_timebase_wdt_0_WDT_Interrupt : std_logic;
  signal xps_timer_0_Interrupt : std_logic;

  attribute BUFFER_TYPE : STRING;
  attribute BOX_TYPE : STRING;
  attribute BUFFER_TYPE of fpga_0_SysACE_CompactFlash_SysACE_CLK_pin : signal is "BUFGP";
  attribute BOX_TYPE of ppc405_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of plb_wrapper : component is "user_black_box";
  attribute BOX_TYPE of xps_bram_if_cntlr_1_wrapper : component is "user_black_box";
  attribute BOX_TYPE of plb_bram_if_cntlr_1_bram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of leds_4bit_wrapper : component is "user_black_box";
  attribute BOX_TYPE of leds_positions_wrapper : component is "user_black_box";
  attribute BOX_TYPE of push_buttons_position_wrapper : component is "user_black_box";
  attribute BOX_TYPE of iic_eeprom_wrapper : component is "user_black_box";
  attribute BOX_TYPE of sysace_compactflash_wrapper : component is "user_black_box";
  attribute BOX_TYPE of ddr_sdram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of ppc405_0_iplb1_wrapper : component is "user_black_box";
  attribute BOX_TYPE of ppc405_0_dplb1_wrapper : component is "user_black_box";
  attribute BOX_TYPE of mgt_wrapper_wrapper : component is "user_black_box";
  attribute BOX_TYPE of trimode_mac_gmii_wrapper : component is "user_black_box";
  attribute BOX_TYPE of flash_wrapper : component is "user_black_box";
  attribute BOX_TYPE of xps_timebase_wdt_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of xps_timer_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of rs232_uart_wrapper : component is "user_black_box";
  attribute BOX_TYPE of clock_generator_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of jtagppc_cntlr_inst_wrapper : component is "user_black_box";
  attribute BOX_TYPE of proc_sys_reset_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of xps_intc_0_wrapper : component is "user_black_box";

begin

  -- Internal assignments

  fpga_0_SysACE_CompactFlash_SysACE_MPA_pin <= fpga_0_SysACE_CompactFlash_SysACE_MPA_pin_vslice_6_1_concat;
  fpga_0_FLASH_Mem_A_pin <= fpga_0_FLASH_Mem_A_pin_vslice_9_29_concat;
  dcm_clk_s <= fpga_0_clk_1_sys_clk_pin;
  sys_rst_s <= fpga_0_rst_1_sys_rst_pin;
  pgassign7(0 to 0) <= B"0";
  pgassign8(0 to 8) <= B"000000000";
  pgassign9(0 to 1) <= B"00";
  fpga_0_DDR_SDRAM_DDR_Clk_pin <= pgassign1(0);
  fpga_0_DDR_SDRAM_DDR_Clk_n_pin <= pgassign2(0);
  fpga_0_DDR_SDRAM_DDR_CE_pin <= pgassign3(0);
  fpga_0_DDR_SDRAM_DDR_CS_n_pin <= pgassign4(0);
  fpga_0_FLASH_Mem_OEN_pin <= pgassign5(0);
  fpga_0_FLASH_Mem_CE_pin <= pgassign6(0);
  fpga_0_SysACE_CompactFlash_SysACE_MPA_pin_vslice_6_1_concat(6 downto 1) <= pgassign10(6 downto 1);
  fpga_0_FLASH_Mem_A_pin_vslice_9_29_concat(9 to 29) <= pgassign11(9 to 29);
  pgassign12(9) <= Push_Buttons_Position_IP2INTC_Irpt;
  pgassign12(8) <= IIC_EEPROM_IIC2INTC_Irpt;
  pgassign12(7) <= SysACE_CompactFlash_SysACE_IRQ;
  pgassign12(6) <= TriMode_MAC_GMII_TemacIntc0_Irpt;
  pgassign12(5) <= xps_timebase_wdt_0_Timebase_Interrupt;
  pgassign12(4) <= xps_timebase_wdt_0_WDT_Interrupt;
  pgassign12(3) <= xps_timer_0_Interrupt;
  pgassign12(2) <= RS232_Uart_IP2INTC_Irpt;
  pgassign12(1) <= DDR_SDRAM_SDMA2_Rx_IntOut;
  pgassign12(0) <= DDR_SDRAM_SDMA2_Tx_IntOut;
  net_gnd0 <= '0';
  net_gnd1(0 to 0) <= B"0";
  net_gnd10(0 to 9) <= B"0000000000";
  net_gnd128(0 to 127) <= B"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  net_gnd16(0 to 15) <= B"0000000000000000";
  net_gnd2(0 to 1) <= B"00";
  net_gnd3(0 to 2) <= B"000";
  net_gnd30(29 downto 0) <= B"000000000000000000000000000000";
  net_gnd32(31 downto 0) <= B"00000000000000000000000000000000";
  net_gnd36(0 to 35) <= B"000000000000000000000000000000000000";
  net_gnd4(0 to 3) <= B"0000";
  net_gnd6(5 downto 0) <= B"000000";
  net_gnd64(0 to 63) <= B"0000000000000000000000000000000000000000000000000000000000000000";
  net_gnd8(0 to 7) <= B"00000000";
  net_vcc0 <= '1';
  net_vcc4(0 to 3) <= B"1111";

  ppc405_0 : ppc405_0_wrapper
    port map (
      C405CPMCORESLEEPREQ => open,
      C405CPMMSRCE => open,
      C405CPMMSREE => open,
      C405CPMTIMERIRQ => open,
      C405CPMTIMERRESETREQ => open,
      C405XXXMACHINECHECK => open,
      CPMC405CLOCK => clk_300_0000MHzDCM0,
      CPMC405CORECLKINACTIVE => net_gnd0,
      CPMC405CPUCLKEN => net_vcc0,
      CPMC405JTAGCLKEN => net_vcc0,
      CPMC405TIMERCLKEN => net_vcc0,
      CPMC405TIMERTICK => net_vcc0,
      MCBCPUCLKEN => net_vcc0,
      MCBTIMEREN => net_vcc0,
      MCPPCRST => net_vcc0,
      CPMDCRCLK => net_vcc0,
      CPMFCMCLK => net_vcc0,
      C405RSTCHIPRESETREQ => ppc_reset_bus_Chip_Reset_Req,
      C405RSTCORERESETREQ => ppc_reset_bus_Core_Reset_Req,
      C405RSTSYSRESETREQ => ppc_reset_bus_System_Reset_Req,
      RSTC405RESETCHIP => ppc_reset_bus_RstsPPCresetchip,
      RSTC405RESETCORE => ppc_reset_bus_RstcPPCresetcore,
      RSTC405RESETSYS => ppc_reset_bus_RstcPPCresetsys,
      APUFCMDECODED => open,
      APUFCMDECUDI => open,
      APUFCMDECUDIVALID => open,
      APUFCMENDIAN => open,
      APUFCMFLUSH => open,
      APUFCMINSTRUCTION => open,
      APUFCMINSTRVALID => open,
      APUFCMLOADBYTEEN => open,
      APUFCMLOADDATA => open,
      APUFCMLOADDVALID => open,
      APUFCMOPERANDVALID => open,
      APUFCMRADATA => open,
      APUFCMRBDATA => open,
      APUFCMWRITEBACKOK => open,
      APUFCMXERCA => open,
      FCMAPUCR => net_gnd4,
      FCMAPUDCDCREN => net_gnd0,
      FCMAPUDCDFORCEALIGN => net_gnd0,
      FCMAPUDCDFORCEBESTEERING => net_gnd0,
      FCMAPUDCDFPUOP => net_gnd0,
      FCMAPUDCDGPRWRITE => net_gnd0,
      FCMAPUDCDLDSTBYTE => net_gnd0,
      FCMAPUDCDLDSTDW => net_gnd0,
      FCMAPUDCDLDSTHW => net_gnd0,
      FCMAPUDCDLDSTQW => net_gnd0,
      FCMAPUDCDLDSTWD => net_gnd0,
      FCMAPUDCDLOAD => net_gnd0,
      FCMAPUDCDPRIVOP => net_gnd0,
      FCMAPUDCDRAEN => net_gnd0,
      FCMAPUDCDRBEN => net_gnd0,
      FCMAPUDCDSTORE => net_gnd0,
      FCMAPUDCDTRAPBE => net_gnd0,
      FCMAPUDCDTRAPLE => net_gnd0,
      FCMAPUDCDUPDATE => net_gnd0,
      FCMAPUDCDXERCAEN => net_gnd0,
      FCMAPUDCDXEROVEN => net_gnd0,
      FCMAPUDECODEBUSY => net_gnd0,
      FCMAPUDONE => net_gnd0,
      FCMAPUEXCEPTION => net_gnd0,
      FCMAPUEXEBLOCKINGMCO => net_gnd0,
      FCMAPUEXECRFIELD => net_gnd3,
      FCMAPUEXENONBLOCKINGMCO => net_gnd0,
      FCMAPUINSTRACK => net_gnd0,
      FCMAPULOADWAIT => net_gnd0,
      FCMAPURESULT => net_gnd32(31 downto 0),
      FCMAPURESULTVALID => net_gnd0,
      FCMAPUSLEEPNOTREADY => net_gnd0,
      FCMAPUXERCA => net_gnd0,
      FCMAPUXEROV => net_gnd0,
      IPLB0_PLB_Clk => clk_100_0000MHzDCM0,
      IPLB0_PLB_Rst => plb_MPLB_Rst(1),
      IPLB0_PLB_MBusy => plb_PLB_MBusy(1),
      IPLB0_PLB_MRdErr => plb_PLB_MRdErr(1),
      IPLB0_PLB_MWrErr => plb_PLB_MWrErr(1),
      IPLB0_PLB_MWrBTerm => plb_PLB_MWrBTerm(1),
      IPLB0_PLB_MWrDAck => plb_PLB_MWrDAck(1),
      IPLB0_PLB_MAddrAck => plb_PLB_MAddrAck(1),
      IPLB0_PLB_MRdBTerm => plb_PLB_MRdBTerm(1),
      IPLB0_PLB_MRdDAck => plb_PLB_MRdDAck(1),
      IPLB0_PLB_MRdDBus => plb_PLB_MRdDBus(64 to 127),
      IPLB0_PLB_MRearbitrate => plb_PLB_MRearbitrate(1),
      IPLB0_PLB_MSSize => plb_PLB_MSSize(2 to 3),
      IPLB0_PLB_MTimeout => plb_PLB_MTimeout(1),
      IPLB0_PLB_MRdWdAddr => plb_PLB_MRdWdAddr(4 to 7),
      IPLB0_M_ABus => plb_M_ABus(32 to 63),
      IPLB0_M_BE => plb_M_BE(8 to 15),
      IPLB0_M_MSize => plb_M_MSize(2 to 3),
      IPLB0_M_rdBurst => plb_M_rdBurst(1),
      IPLB0_M_request => plb_M_request(1),
      IPLB0_M_RNW => plb_M_RNW(1),
      IPLB0_M_size => plb_M_size(4 to 7),
      IPLB0_M_wrBurst => plb_M_wrBurst(1),
      IPLB0_M_wrDBus => plb_M_wrDBus(64 to 127),
      IPLB0_M_abort => plb_M_abort(1),
      IPLB0_M_UABus => plb_M_UABus(32 to 63),
      IPLB0_M_busLock => plb_M_busLock(1),
      IPLB0_M_lockErr => plb_M_lockErr(1),
      IPLB0_M_priority => plb_M_priority(2 to 3),
      IPLB0_M_type => plb_M_type(3 to 5),
      IPLB0_M_TAttribute => plb_M_TAttribute(16 to 31),
      DPLB0_PLB_Clk => clk_100_0000MHzDCM0,
      DPLB0_PLB_Rst => plb_MPLB_Rst(0),
      DPLB0_PLB_MBusy => plb_PLB_MBusy(0),
      DPLB0_PLB_MRdErr => plb_PLB_MRdErr(0),
      DPLB0_PLB_MWrErr => plb_PLB_MWrErr(0),
      DPLB0_PLB_MWrBTerm => plb_PLB_MWrBTerm(0),
      DPLB0_PLB_MWrDAck => plb_PLB_MWrDAck(0),
      DPLB0_PLB_MAddrAck => plb_PLB_MAddrAck(0),
      DPLB0_PLB_MRdBTerm => plb_PLB_MRdBTerm(0),
      DPLB0_PLB_MRdDAck => plb_PLB_MRdDAck(0),
      DPLB0_PLB_MRdDBus => plb_PLB_MRdDBus(0 to 63),
      DPLB0_PLB_MRearbitrate => plb_PLB_MRearbitrate(0),
      DPLB0_PLB_MSSize => plb_PLB_MSSize(0 to 1),
      DPLB0_PLB_MTimeout => plb_PLB_MTimeout(0),
      DPLB0_PLB_MRdWdAddr => plb_PLB_MRdWdAddr(0 to 3),
      DPLB0_M_ABus => plb_M_ABus(0 to 31),
      DPLB0_M_BE => plb_M_BE(0 to 7),
      DPLB0_M_MSize => plb_M_MSize(0 to 1),
      DPLB0_M_rdBurst => plb_M_rdBurst(0),
      DPLB0_M_request => plb_M_request(0),
      DPLB0_M_RNW => plb_M_RNW(0),
      DPLB0_M_size => plb_M_size(0 to 3),
      DPLB0_M_wrBurst => plb_M_wrBurst(0),
      DPLB0_M_wrDBus => plb_M_wrDBus(0 to 63),
      DPLB0_M_abort => plb_M_abort(0),
      DPLB0_M_UABus => plb_M_UABus(0 to 31),
      DPLB0_M_busLock => plb_M_busLock(0),
      DPLB0_M_lockErr => plb_M_lockErr(0),
      DPLB0_M_priority => plb_M_priority(0 to 1),
      DPLB0_M_type => plb_M_type(0 to 2),
      DPLB0_M_TAttribute => plb_M_TAttribute(0 to 15),
      IPLB1_PLB_Clk => clk_100_0000MHzDCM0,
      IPLB1_PLB_Rst => ppc405_0_iplb1_MPLB_Rst(0),
      IPLB1_PLB_MBusy => ppc405_0_iplb1_PLB_MBusy(0),
      IPLB1_PLB_MRdErr => ppc405_0_iplb1_PLB_MRdErr(0),
      IPLB1_PLB_MWrErr => ppc405_0_iplb1_PLB_MWrErr(0),
      IPLB1_PLB_MWrBTerm => ppc405_0_iplb1_PLB_MWrBTerm(0),
      IPLB1_PLB_MWrDAck => ppc405_0_iplb1_PLB_MWrDAck(0),
      IPLB1_PLB_MAddrAck => ppc405_0_iplb1_PLB_MAddrAck(0),
      IPLB1_PLB_MRdBTerm => ppc405_0_iplb1_PLB_MRdBTerm(0),
      IPLB1_PLB_MRdDAck => ppc405_0_iplb1_PLB_MRdDAck(0),
      IPLB1_PLB_MRdDBus => ppc405_0_iplb1_PLB_MRdDBus,
      IPLB1_PLB_MRearbitrate => ppc405_0_iplb1_PLB_MRearbitrate(0),
      IPLB1_PLB_MSSize => ppc405_0_iplb1_PLB_MSSize,
      IPLB1_PLB_MTimeout => ppc405_0_iplb1_PLB_MTimeout(0),
      IPLB1_PLB_MRdWdAddr => ppc405_0_iplb1_PLB_MRdWdAddr,
      IPLB1_M_ABus => ppc405_0_iplb1_M_ABus,
      IPLB1_M_BE => ppc405_0_iplb1_M_BE,
      IPLB1_M_MSize => ppc405_0_iplb1_M_MSize,
      IPLB1_M_rdBurst => ppc405_0_iplb1_M_rdBurst(0),
      IPLB1_M_request => ppc405_0_iplb1_M_request(0),
      IPLB1_M_RNW => ppc405_0_iplb1_M_RNW(0),
      IPLB1_M_size => ppc405_0_iplb1_M_size,
      IPLB1_M_wrBurst => ppc405_0_iplb1_M_wrBurst(0),
      IPLB1_M_wrDBus => ppc405_0_iplb1_M_wrDBus,
      IPLB1_M_abort => ppc405_0_iplb1_M_abort(0),
      IPLB1_M_UABus => ppc405_0_iplb1_M_UABus,
      IPLB1_M_busLock => ppc405_0_iplb1_M_busLock(0),
      IPLB1_M_lockErr => ppc405_0_iplb1_M_lockErr(0),
      IPLB1_M_priority => ppc405_0_iplb1_M_priority,
      IPLB1_M_type => ppc405_0_iplb1_M_type,
      IPLB1_M_TAttribute => ppc405_0_iplb1_M_TAttribute,
      DPLB1_PLB_Clk => clk_100_0000MHzDCM0,
      DPLB1_PLB_Rst => ppc405_0_dplb1_MPLB_Rst(0),
      DPLB1_PLB_MBusy => ppc405_0_dplb1_PLB_MBusy(0),
      DPLB1_PLB_MRdErr => ppc405_0_dplb1_PLB_MRdErr(0),
      DPLB1_PLB_MWrErr => ppc405_0_dplb1_PLB_MWrErr(0),
      DPLB1_PLB_MWrBTerm => ppc405_0_dplb1_PLB_MWrBTerm(0),
      DPLB1_PLB_MWrDAck => ppc405_0_dplb1_PLB_MWrDAck(0),
      DPLB1_PLB_MAddrAck => ppc405_0_dplb1_PLB_MAddrAck(0),
      DPLB1_PLB_MRdBTerm => ppc405_0_dplb1_PLB_MRdBTerm(0),
      DPLB1_PLB_MRdDAck => ppc405_0_dplb1_PLB_MRdDAck(0),
      DPLB1_PLB_MRdDBus => ppc405_0_dplb1_PLB_MRdDBus,
      DPLB1_PLB_MRearbitrate => ppc405_0_dplb1_PLB_MRearbitrate(0),
      DPLB1_PLB_MSSize => ppc405_0_dplb1_PLB_MSSize,
      DPLB1_PLB_MTimeout => ppc405_0_dplb1_PLB_MTimeout(0),
      DPLB1_PLB_MRdWdAddr => ppc405_0_dplb1_PLB_MRdWdAddr,
      DPLB1_M_ABus => ppc405_0_dplb1_M_ABus,
      DPLB1_M_BE => ppc405_0_dplb1_M_BE,
      DPLB1_M_MSize => ppc405_0_dplb1_M_MSize,
      DPLB1_M_rdBurst => ppc405_0_dplb1_M_rdBurst(0),
      DPLB1_M_request => ppc405_0_dplb1_M_request(0),
      DPLB1_M_RNW => ppc405_0_dplb1_M_RNW(0),
      DPLB1_M_size => ppc405_0_dplb1_M_size,
      DPLB1_M_wrBurst => ppc405_0_dplb1_M_wrBurst(0),
      DPLB1_M_wrDBus => ppc405_0_dplb1_M_wrDBus,
      DPLB1_M_abort => ppc405_0_dplb1_M_abort(0),
      DPLB1_M_UABus => ppc405_0_dplb1_M_UABus,
      DPLB1_M_busLock => ppc405_0_dplb1_M_busLock(0),
      DPLB1_M_lockErr => ppc405_0_dplb1_M_lockErr(0),
      DPLB1_M_priority => ppc405_0_dplb1_M_priority,
      DPLB1_M_type => ppc405_0_dplb1_M_type,
      DPLB1_M_TAttribute => ppc405_0_dplb1_M_TAttribute,
      BRAMDSOCMCLK => net_vcc0,
      BRAMDSOCMRDDBUS => net_gnd32(31 downto 0),
      DSARCVALUE => net_gnd8,
      DSCNTLVALUE => net_gnd8,
      DSOCMBRAMABUS => open,
      DSOCMBRAMBYTEWRITE => open,
      DSOCMBRAMEN => open,
      DSOCMBRAMWRDBUS => open,
      DSOCMBUSY => open,
      DSOCMRDADDRVALID => open,
      DSOCMWRADDRVALID => open,
      DSOCMRWCOMPLETE => net_vcc0,
      BRAMISOCMCLK => net_vcc0,
      BRAMISOCMRDDBUS => net_gnd64,
      BRAMISOCMDCRRDDBUS => net_gnd32(31 downto 0),
      ISARCVALUE => net_gnd8,
      ISCNTLVALUE => net_gnd8,
      ISOCMBRAMEN => open,
      ISOCMBRAMEVENWRITEEN => open,
      ISOCMBRAMODDWRITEEN => open,
      ISOCMBRAMRDABUS => open,
      ISOCMBRAMWRABUS => open,
      ISOCMBRAMWRDBUS => open,
      ISOCMDCRBRAMEVENEN => open,
      ISOCMDCRBRAMODDEN => open,
      ISOCMDCRBRAMRDSELECT => open,
      DCREMACABUS => open,
      DCREMACCLK => open,
      DCREMACDBUS => open,
      DCREMACENABLER => open,
      DCREMACREAD => open,
      DCREMACWRITE => open,
      EMACDCRACK => net_gnd0,
      EMACDCRDBUS => net_gnd32(31 downto 0),
      EXTDCRABUS => open,
      EXTDCRDBUSOUT => open,
      EXTDCRREAD => open,
      EXTDCRWRITE => open,
      EXTDCRACK => net_gnd0,
      EXTDCRDBUSIN => net_gnd32(31 downto 0),
      EICC405CRITINPUTIRQ => net_gnd0,
      EICC405EXTINPUTIRQ => ppc405_0_EICC405EXTINPUTIRQ,
      C405JTGCAPTUREDR => open,
      C405JTGEXTEST => open,
      C405JTGPGMOUT => open,
      C405JTGSHIFTDR => open,
      C405JTGTDO => ppc405_0_jtagppc_bus_C405JTGTDO,
      C405JTGTDOEN => ppc405_0_jtagppc_bus_C405JTGTDOEN,
      C405JTGUPDATEDR => open,
      MCBJTAGEN => net_vcc0,
      JTGC405BNDSCANTDO => net_gnd0,
      JTGC405TCK => ppc405_0_jtagppc_bus_JTGC405TCK,
      JTGC405TDI => ppc405_0_jtagppc_bus_JTGC405TDI,
      JTGC405TMS => ppc405_0_jtagppc_bus_JTGC405TMS,
      JTGC405TRSTNEG => ppc405_0_jtagppc_bus_JTGC405TRSTNEG,
      C405DBGMSRWE => open,
      C405DBGSTOPACK => open,
      C405DBGWBCOMPLETE => open,
      C405DBGWBFULL => open,
      C405DBGWBIAR => open,
      DBGC405DEBUGHALT => net_gnd0,
      DBGC405DEBUGHALTNEG => net_vcc0,
      DBGC405EXTBUSHOLDACK => net_gnd0,
      DBGC405UNCONDDEBUGEVENT => net_gnd0,
      C405DBGLOADDATAONAPUDBUS => open,
      C405TRCCYCLE => open,
      C405TRCEVENEXECUTIONSTATUS => open,
      C405TRCODDEXECUTIONSTATUS => open,
      C405TRCTRACESTATUS => open,
      C405TRCTRIGGEREVENTOUT => open,
      C405TRCTRIGGEREVENTTYPE => open,
      TRCC405TRACEDISABLE => net_gnd0,
      TRCC405TRIGGEREVENTIN => net_gnd0
    );

  plb : plb_wrapper
    port map (
      PLB_Clk => clk_100_0000MHzDCM0,
      SYS_Rst => sys_bus_reset(0),
      PLB_Rst => open,
      SPLB_Rst => plb_SPLB_Rst,
      MPLB_Rst => plb_MPLB_Rst,
      PLB_dcrAck => open,
      PLB_dcrDBus => open,
      DCR_ABus => net_gnd10,
      DCR_DBus => net_gnd32(31 downto 0),
      DCR_Read => net_gnd0,
      DCR_Write => net_gnd0,
      M_ABus => plb_M_ABus,
      M_UABus => plb_M_UABus,
      M_BE => plb_M_BE,
      M_RNW => plb_M_RNW,
      M_abort => plb_M_abort,
      M_busLock => plb_M_busLock,
      M_TAttribute => plb_M_TAttribute,
      M_lockErr => plb_M_lockErr,
      M_MSize => plb_M_MSize,
      M_priority => plb_M_priority,
      M_rdBurst => plb_M_rdBurst,
      M_request => plb_M_request,
      M_size => plb_M_size,
      M_type => plb_M_type,
      M_wrBurst => plb_M_wrBurst,
      M_wrDBus => plb_M_wrDBus,
      Sl_addrAck => plb_Sl_addrAck,
      Sl_MRdErr => plb_Sl_MRdErr,
      Sl_MWrErr => plb_Sl_MWrErr,
      Sl_MBusy => plb_Sl_MBusy,
      Sl_rdBTerm => plb_Sl_rdBTerm,
      Sl_rdComp => plb_Sl_rdComp,
      Sl_rdDAck => plb_Sl_rdDAck,
      Sl_rdDBus => plb_Sl_rdDBus,
      Sl_rdWdAddr => plb_Sl_rdWdAddr,
      Sl_rearbitrate => plb_Sl_rearbitrate,
      Sl_SSize => plb_Sl_SSize,
      Sl_wait => plb_Sl_wait,
      Sl_wrBTerm => plb_Sl_wrBTerm,
      Sl_wrComp => plb_Sl_wrComp,
      Sl_wrDAck => plb_Sl_wrDAck,
      Sl_MIRQ => plb_Sl_MIRQ,
      PLB_MIRQ => open,
      PLB_ABus => plb_PLB_ABus,
      PLB_UABus => plb_PLB_UABus,
      PLB_BE => plb_PLB_BE,
      PLB_MAddrAck => plb_PLB_MAddrAck,
      PLB_MTimeout => plb_PLB_MTimeout,
      PLB_MBusy => plb_PLB_MBusy,
      PLB_MRdErr => plb_PLB_MRdErr,
      PLB_MWrErr => plb_PLB_MWrErr,
      PLB_MRdBTerm => plb_PLB_MRdBTerm,
      PLB_MRdDAck => plb_PLB_MRdDAck,
      PLB_MRdDBus => plb_PLB_MRdDBus,
      PLB_MRdWdAddr => plb_PLB_MRdWdAddr,
      PLB_MRearbitrate => plb_PLB_MRearbitrate,
      PLB_MWrBTerm => plb_PLB_MWrBTerm,
      PLB_MWrDAck => plb_PLB_MWrDAck,
      PLB_MSSize => plb_PLB_MSSize,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_RNW => plb_PLB_RNW,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_TAttribute => plb_PLB_TAttribute,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_MSize => plb_PLB_MSize,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_rdPrim => plb_PLB_rdPrim,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrPrim => plb_PLB_wrPrim,
      PLB_SaddrAck => open,
      PLB_SMRdErr => open,
      PLB_SMWrErr => open,
      PLB_SMBusy => open,
      PLB_SrdBTerm => open,
      PLB_SrdComp => open,
      PLB_SrdDAck => open,
      PLB_SrdDBus => open,
      PLB_SrdWdAddr => open,
      PLB_Srearbitrate => open,
      PLB_Sssize => open,
      PLB_Swait => open,
      PLB_SwrBTerm => open,
      PLB_SwrComp => open,
      PLB_SwrDAck => open,
      Bus_Error_Det => open
    );

  xps_bram_if_cntlr_1 : xps_bram_if_cntlr_1_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzDCM0,
      SPLB_Rst => plb_SPLB_Rst(0),
      PLB_ABus => plb_PLB_ABus,
      PLB_UABus => plb_PLB_UABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(0),
      PLB_wrPrim => plb_PLB_wrPrim(0),
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_MSize => plb_PLB_MSize,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_addrAck => plb_Sl_addrAck(0),
      Sl_SSize => plb_Sl_SSize(0 to 1),
      Sl_wait => plb_Sl_wait(0),
      Sl_rearbitrate => plb_Sl_rearbitrate(0),
      Sl_wrDAck => plb_Sl_wrDAck(0),
      Sl_wrComp => plb_Sl_wrComp(0),
      Sl_wrBTerm => plb_Sl_wrBTerm(0),
      Sl_rdDBus => plb_Sl_rdDBus(0 to 63),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(0 to 3),
      Sl_rdDAck => plb_Sl_rdDAck(0),
      Sl_rdComp => plb_Sl_rdComp(0),
      Sl_rdBTerm => plb_Sl_rdBTerm(0),
      Sl_MBusy => plb_Sl_MBusy(0 to 1),
      Sl_MWrErr => plb_Sl_MWrErr(0 to 1),
      Sl_MRdErr => plb_Sl_MRdErr(0 to 1),
      Sl_MIRQ => plb_Sl_MIRQ(0 to 1),
      BRAM_Rst => xps_bram_if_cntlr_1_port_BRAM_Rst,
      BRAM_Clk => xps_bram_if_cntlr_1_port_BRAM_Clk,
      BRAM_EN => xps_bram_if_cntlr_1_port_BRAM_EN,
      BRAM_WEN => xps_bram_if_cntlr_1_port_BRAM_WEN,
      BRAM_Addr => xps_bram_if_cntlr_1_port_BRAM_Addr,
      BRAM_Din => xps_bram_if_cntlr_1_port_BRAM_Din,
      BRAM_Dout => xps_bram_if_cntlr_1_port_BRAM_Dout
    );

  plb_bram_if_cntlr_1_bram : plb_bram_if_cntlr_1_bram_wrapper
    port map (
      BRAM_Rst_A => xps_bram_if_cntlr_1_port_BRAM_Rst,
      BRAM_Clk_A => xps_bram_if_cntlr_1_port_BRAM_Clk,
      BRAM_EN_A => xps_bram_if_cntlr_1_port_BRAM_EN,
      BRAM_WEN_A => xps_bram_if_cntlr_1_port_BRAM_WEN,
      BRAM_Addr_A => xps_bram_if_cntlr_1_port_BRAM_Addr,
      BRAM_Din_A => xps_bram_if_cntlr_1_port_BRAM_Din,
      BRAM_Dout_A => xps_bram_if_cntlr_1_port_BRAM_Dout,
      BRAM_Rst_B => net_gnd0,
      BRAM_Clk_B => net_gnd0,
      BRAM_EN_B => net_gnd0,
      BRAM_WEN_B => net_gnd8,
      BRAM_Addr_B => net_gnd32(31 downto 0),
      BRAM_Din_B => open,
      BRAM_Dout_B => net_gnd64
    );

  LEDs_4Bit : leds_4bit_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzDCM0,
      SPLB_Rst => plb_SPLB_Rst(1),
      PLB_ABus => plb_PLB_ABus,
      PLB_UABus => plb_PLB_UABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(1),
      PLB_wrPrim => plb_PLB_wrPrim(1),
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_MSize => plb_PLB_MSize,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_addrAck => plb_Sl_addrAck(1),
      Sl_SSize => plb_Sl_SSize(2 to 3),
      Sl_wait => plb_Sl_wait(1),
      Sl_rearbitrate => plb_Sl_rearbitrate(1),
      Sl_wrDAck => plb_Sl_wrDAck(1),
      Sl_wrComp => plb_Sl_wrComp(1),
      Sl_wrBTerm => plb_Sl_wrBTerm(1),
      Sl_rdDBus => plb_Sl_rdDBus(64 to 127),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(4 to 7),
      Sl_rdDAck => plb_Sl_rdDAck(1),
      Sl_rdComp => plb_Sl_rdComp(1),
      Sl_rdBTerm => plb_Sl_rdBTerm(1),
      Sl_MBusy => plb_Sl_MBusy(2 to 3),
      Sl_MWrErr => plb_Sl_MWrErr(2 to 3),
      Sl_MRdErr => plb_Sl_MRdErr(2 to 3),
      Sl_MIRQ => plb_Sl_MIRQ(2 to 3),
      IP2INTC_Irpt => open,
      GPIO_IO_I => fpga_0_LEDs_4Bit_GPIO_IO_pin_I,
      GPIO_IO_O => fpga_0_LEDs_4Bit_GPIO_IO_pin_O,
      GPIO_IO_T => fpga_0_LEDs_4Bit_GPIO_IO_pin_T,
      GPIO2_IO_I => net_gnd32(31 downto 0),
      GPIO2_IO_O => open,
      GPIO2_IO_T => open
    );

  LEDs_Positions : leds_positions_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzDCM0,
      SPLB_Rst => plb_SPLB_Rst(2),
      PLB_ABus => plb_PLB_ABus,
      PLB_UABus => plb_PLB_UABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(2),
      PLB_wrPrim => plb_PLB_wrPrim(2),
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_MSize => plb_PLB_MSize,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_addrAck => plb_Sl_addrAck(2),
      Sl_SSize => plb_Sl_SSize(4 to 5),
      Sl_wait => plb_Sl_wait(2),
      Sl_rearbitrate => plb_Sl_rearbitrate(2),
      Sl_wrDAck => plb_Sl_wrDAck(2),
      Sl_wrComp => plb_Sl_wrComp(2),
      Sl_wrBTerm => plb_Sl_wrBTerm(2),
      Sl_rdDBus => plb_Sl_rdDBus(128 to 191),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(8 to 11),
      Sl_rdDAck => plb_Sl_rdDAck(2),
      Sl_rdComp => plb_Sl_rdComp(2),
      Sl_rdBTerm => plb_Sl_rdBTerm(2),
      Sl_MBusy => plb_Sl_MBusy(4 to 5),
      Sl_MWrErr => plb_Sl_MWrErr(4 to 5),
      Sl_MRdErr => plb_Sl_MRdErr(4 to 5),
      Sl_MIRQ => plb_Sl_MIRQ(4 to 5),
      IP2INTC_Irpt => open,
      GPIO_IO_I => fpga_0_LEDs_Positions_GPIO_IO_pin_I,
      GPIO_IO_O => fpga_0_LEDs_Positions_GPIO_IO_pin_O,
      GPIO_IO_T => fpga_0_LEDs_Positions_GPIO_IO_pin_T,
      GPIO2_IO_I => net_gnd32(31 downto 0),
      GPIO2_IO_O => open,
      GPIO2_IO_T => open
    );

  Push_Buttons_Position : push_buttons_position_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzDCM0,
      SPLB_Rst => plb_SPLB_Rst(3),
      PLB_ABus => plb_PLB_ABus,
      PLB_UABus => plb_PLB_UABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(3),
      PLB_wrPrim => plb_PLB_wrPrim(3),
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_MSize => plb_PLB_MSize,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_addrAck => plb_Sl_addrAck(3),
      Sl_SSize => plb_Sl_SSize(6 to 7),
      Sl_wait => plb_Sl_wait(3),
      Sl_rearbitrate => plb_Sl_rearbitrate(3),
      Sl_wrDAck => plb_Sl_wrDAck(3),
      Sl_wrComp => plb_Sl_wrComp(3),
      Sl_wrBTerm => plb_Sl_wrBTerm(3),
      Sl_rdDBus => plb_Sl_rdDBus(192 to 255),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(12 to 15),
      Sl_rdDAck => plb_Sl_rdDAck(3),
      Sl_rdComp => plb_Sl_rdComp(3),
      Sl_rdBTerm => plb_Sl_rdBTerm(3),
      Sl_MBusy => plb_Sl_MBusy(6 to 7),
      Sl_MWrErr => plb_Sl_MWrErr(6 to 7),
      Sl_MRdErr => plb_Sl_MRdErr(6 to 7),
      Sl_MIRQ => plb_Sl_MIRQ(6 to 7),
      IP2INTC_Irpt => Push_Buttons_Position_IP2INTC_Irpt,
      GPIO_IO_I => fpga_0_Push_Buttons_Position_GPIO_IO_pin_I,
      GPIO_IO_O => fpga_0_Push_Buttons_Position_GPIO_IO_pin_O,
      GPIO_IO_T => fpga_0_Push_Buttons_Position_GPIO_IO_pin_T,
      GPIO2_IO_I => net_gnd32(31 downto 0),
      GPIO2_IO_O => open,
      GPIO2_IO_T => open
    );

  IIC_EEPROM : iic_eeprom_wrapper
    port map (
      Sda_I => fpga_0_IIC_EEPROM_Sda_pin_I,
      Sda_O => fpga_0_IIC_EEPROM_Sda_pin_O,
      Sda_T => fpga_0_IIC_EEPROM_Sda_pin_T,
      Scl_I => fpga_0_IIC_EEPROM_Scl_pin_I,
      Scl_O => fpga_0_IIC_EEPROM_Scl_pin_O,
      Scl_T => fpga_0_IIC_EEPROM_Scl_pin_T,
      Gpo => open,
      IIC2INTC_Irpt => IIC_EEPROM_IIC2INTC_Irpt,
      SPLB_Clk => clk_100_0000MHzDCM0,
      SPLB_Rst => plb_SPLB_Rst(4),
      PLB_ABus => plb_PLB_ABus,
      PLB_UABus => plb_PLB_UABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(4),
      PLB_wrPrim => plb_PLB_wrPrim(4),
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_MSize => plb_PLB_MSize,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_addrAck => plb_Sl_addrAck(4),
      Sl_SSize => plb_Sl_SSize(8 to 9),
      Sl_wait => plb_Sl_wait(4),
      Sl_rearbitrate => plb_Sl_rearbitrate(4),
      Sl_wrDAck => plb_Sl_wrDAck(4),
      Sl_wrComp => plb_Sl_wrComp(4),
      Sl_wrBTerm => plb_Sl_wrBTerm(4),
      Sl_rdDBus => plb_Sl_rdDBus(256 to 319),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(16 to 19),
      Sl_rdDAck => plb_Sl_rdDAck(4),
      Sl_rdComp => plb_Sl_rdComp(4),
      Sl_rdBTerm => plb_Sl_rdBTerm(4),
      Sl_MBusy => plb_Sl_MBusy(8 to 9),
      Sl_MWrErr => plb_Sl_MWrErr(8 to 9),
      Sl_MRdErr => plb_Sl_MRdErr(8 to 9),
      Sl_MIRQ => plb_Sl_MIRQ(8 to 9)
    );

  SysACE_CompactFlash : sysace_compactflash_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzDCM0,
      SPLB_Rst => plb_SPLB_Rst(5),
      PLB_ABus => plb_PLB_ABus,
      PLB_UABus => plb_PLB_UABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(5),
      PLB_wrPrim => plb_PLB_wrPrim(5),
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_MSize => plb_PLB_MSize,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_addrAck => plb_Sl_addrAck(5),
      Sl_SSize => plb_Sl_SSize(10 to 11),
      Sl_wait => plb_Sl_wait(5),
      Sl_rearbitrate => plb_Sl_rearbitrate(5),
      Sl_wrDAck => plb_Sl_wrDAck(5),
      Sl_wrComp => plb_Sl_wrComp(5),
      Sl_wrBTerm => plb_Sl_wrBTerm(5),
      Sl_rdDBus => plb_Sl_rdDBus(320 to 383),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(20 to 23),
      Sl_rdDAck => plb_Sl_rdDAck(5),
      Sl_rdComp => plb_Sl_rdComp(5),
      Sl_rdBTerm => plb_Sl_rdBTerm(5),
      Sl_MBusy => plb_Sl_MBusy(10 to 11),
      Sl_MWrErr => plb_Sl_MWrErr(10 to 11),
      Sl_MRdErr => plb_Sl_MRdErr(10 to 11),
      Sl_MIRQ => plb_Sl_MIRQ(10 to 11),
      SysACE_MPA => pgassign10,
      SysACE_CLK => fpga_0_SysACE_CompactFlash_SysACE_CLK_pin,
      SysACE_MPIRQ => fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin,
      SysACE_MPD_I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I,
      SysACE_MPD_O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O,
      SysACE_MPD_T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T,
      SysACE_CEN => fpga_0_SysACE_CompactFlash_SysACE_CEN_pin,
      SysACE_OEN => fpga_0_SysACE_CompactFlash_SysACE_OEN_pin,
      SysACE_WEN => fpga_0_SysACE_CompactFlash_SysACE_WEN_pin,
      SysACE_IRQ => SysACE_CompactFlash_SysACE_IRQ
    );

  DDR_SDRAM : ddr_sdram_wrapper
    port map (
      FSL0_M_Clk => net_vcc0,
      FSL0_M_Write => net_gnd0,
      FSL0_M_Data => net_gnd32(31 downto 0),
      FSL0_M_Control => net_gnd0,
      FSL0_M_Full => open,
      FSL0_S_Clk => net_gnd0,
      FSL0_S_Read => net_gnd0,
      FSL0_S_Data => open,
      FSL0_S_Control => open,
      FSL0_S_Exists => open,
      FSL0_B_M_Clk => net_vcc0,
      FSL0_B_M_Write => net_gnd0,
      FSL0_B_M_Data => net_gnd32(31 downto 0),
      FSL0_B_M_Control => net_gnd0,
      FSL0_B_M_Full => open,
      FSL0_B_S_Clk => net_gnd0,
      FSL0_B_S_Read => net_gnd0,
      FSL0_B_S_Data => open,
      FSL0_B_S_Control => open,
      FSL0_B_S_Exists => open,
      SPLB0_Clk => clk_100_0000MHzDCM0,
      SPLB0_Rst => ppc405_0_iplb1_SPLB_Rst(0),
      SPLB0_PLB_ABus => ppc405_0_iplb1_PLB_ABus,
      SPLB0_PLB_PAValid => ppc405_0_iplb1_PLB_PAValid,
      SPLB0_PLB_SAValid => ppc405_0_iplb1_PLB_SAValid,
      SPLB0_PLB_masterID => ppc405_0_iplb1_PLB_masterID(0 to 0),
      SPLB0_PLB_RNW => ppc405_0_iplb1_PLB_RNW,
      SPLB0_PLB_BE => ppc405_0_iplb1_PLB_BE,
      SPLB0_PLB_UABus => ppc405_0_iplb1_PLB_UABus,
      SPLB0_PLB_rdPrim => ppc405_0_iplb1_PLB_rdPrim(0),
      SPLB0_PLB_wrPrim => ppc405_0_iplb1_PLB_wrPrim(0),
      SPLB0_PLB_abort => ppc405_0_iplb1_PLB_abort,
      SPLB0_PLB_busLock => ppc405_0_iplb1_PLB_busLock,
      SPLB0_PLB_MSize => ppc405_0_iplb1_PLB_MSize,
      SPLB0_PLB_size => ppc405_0_iplb1_PLB_size,
      SPLB0_PLB_type => ppc405_0_iplb1_PLB_type,
      SPLB0_PLB_lockErr => ppc405_0_iplb1_PLB_lockErr,
      SPLB0_PLB_wrPendReq => ppc405_0_iplb1_PLB_wrPendReq,
      SPLB0_PLB_wrPendPri => ppc405_0_iplb1_PLB_wrPendPri,
      SPLB0_PLB_rdPendReq => ppc405_0_iplb1_PLB_rdPendReq,
      SPLB0_PLB_rdPendPri => ppc405_0_iplb1_PLB_rdPendPri,
      SPLB0_PLB_reqPri => ppc405_0_iplb1_PLB_reqPri,
      SPLB0_PLB_TAttribute => ppc405_0_iplb1_PLB_TAttribute,
      SPLB0_PLB_rdBurst => ppc405_0_iplb1_PLB_rdBurst,
      SPLB0_PLB_wrBurst => ppc405_0_iplb1_PLB_wrBurst,
      SPLB0_PLB_wrDBus => ppc405_0_iplb1_PLB_wrDBus,
      SPLB0_Sl_addrAck => ppc405_0_iplb1_Sl_addrAck(0),
      SPLB0_Sl_SSize => ppc405_0_iplb1_Sl_SSize,
      SPLB0_Sl_wait => ppc405_0_iplb1_Sl_wait(0),
      SPLB0_Sl_rearbitrate => ppc405_0_iplb1_Sl_rearbitrate(0),
      SPLB0_Sl_wrDAck => ppc405_0_iplb1_Sl_wrDAck(0),
      SPLB0_Sl_wrComp => ppc405_0_iplb1_Sl_wrComp(0),
      SPLB0_Sl_wrBTerm => ppc405_0_iplb1_Sl_wrBTerm(0),
      SPLB0_Sl_rdDBus => ppc405_0_iplb1_Sl_rdDBus,
      SPLB0_Sl_rdWdAddr => ppc405_0_iplb1_Sl_rdWdAddr,
      SPLB0_Sl_rdDAck => ppc405_0_iplb1_Sl_rdDAck(0),
      SPLB0_Sl_rdComp => ppc405_0_iplb1_Sl_rdComp(0),
      SPLB0_Sl_rdBTerm => ppc405_0_iplb1_Sl_rdBTerm(0),
      SPLB0_Sl_MBusy => ppc405_0_iplb1_Sl_MBusy(0 to 0),
      SPLB0_Sl_MRdErr => ppc405_0_iplb1_Sl_MRdErr(0 to 0),
      SPLB0_Sl_MWrErr => ppc405_0_iplb1_Sl_MWrErr(0 to 0),
      SPLB0_Sl_MIRQ => ppc405_0_iplb1_Sl_MIRQ(0 to 0),
      SDMA0_Clk => net_gnd0,
      SDMA0_Rx_IntOut => open,
      SDMA0_Tx_IntOut => open,
      SDMA0_RstOut => open,
      SDMA0_TX_D => open,
      SDMA0_TX_Rem => open,
      SDMA0_TX_SOF => open,
      SDMA0_TX_EOF => open,
      SDMA0_TX_SOP => open,
      SDMA0_TX_EOP => open,
      SDMA0_TX_Src_Rdy => open,
      SDMA0_TX_Dst_Rdy => net_vcc0,
      SDMA0_RX_D => net_gnd32(31 downto 0),
      SDMA0_RX_Rem => net_vcc4,
      SDMA0_RX_SOF => net_vcc0,
      SDMA0_RX_EOF => net_vcc0,
      SDMA0_RX_SOP => net_vcc0,
      SDMA0_RX_EOP => net_vcc0,
      SDMA0_RX_Src_Rdy => net_vcc0,
      SDMA0_RX_Dst_Rdy => open,
      SDMA_CTRL0_Clk => net_vcc0,
      SDMA_CTRL0_Rst => net_gnd0,
      SDMA_CTRL0_PLB_ABus => net_gnd32(31 downto 0),
      SDMA_CTRL0_PLB_PAValid => net_gnd0,
      SDMA_CTRL0_PLB_SAValid => net_gnd0,
      SDMA_CTRL0_PLB_masterID => net_gnd1(0 to 0),
      SDMA_CTRL0_PLB_RNW => net_gnd0,
      SDMA_CTRL0_PLB_BE => net_gnd8,
      SDMA_CTRL0_PLB_UABus => net_gnd32(31 downto 0),
      SDMA_CTRL0_PLB_rdPrim => net_gnd0,
      SDMA_CTRL0_PLB_wrPrim => net_gnd0,
      SDMA_CTRL0_PLB_abort => net_gnd0,
      SDMA_CTRL0_PLB_busLock => net_gnd0,
      SDMA_CTRL0_PLB_MSize => net_gnd2,
      SDMA_CTRL0_PLB_size => net_gnd4,
      SDMA_CTRL0_PLB_type => net_gnd3,
      SDMA_CTRL0_PLB_lockErr => net_gnd0,
      SDMA_CTRL0_PLB_wrPendReq => net_gnd0,
      SDMA_CTRL0_PLB_wrPendPri => net_gnd2,
      SDMA_CTRL0_PLB_rdPendReq => net_gnd0,
      SDMA_CTRL0_PLB_rdPendPri => net_gnd2,
      SDMA_CTRL0_PLB_reqPri => net_gnd2,
      SDMA_CTRL0_PLB_TAttribute => net_gnd16,
      SDMA_CTRL0_PLB_rdBurst => net_gnd0,
      SDMA_CTRL0_PLB_wrBurst => net_gnd0,
      SDMA_CTRL0_PLB_wrDBus => net_gnd64,
      SDMA_CTRL0_Sl_addrAck => open,
      SDMA_CTRL0_Sl_SSize => open,
      SDMA_CTRL0_Sl_wait => open,
      SDMA_CTRL0_Sl_rearbitrate => open,
      SDMA_CTRL0_Sl_wrDAck => open,
      SDMA_CTRL0_Sl_wrComp => open,
      SDMA_CTRL0_Sl_wrBTerm => open,
      SDMA_CTRL0_Sl_rdDBus => open,
      SDMA_CTRL0_Sl_rdWdAddr => open,
      SDMA_CTRL0_Sl_rdDAck => open,
      SDMA_CTRL0_Sl_rdComp => open,
      SDMA_CTRL0_Sl_rdBTerm => open,
      SDMA_CTRL0_Sl_MBusy => open,
      SDMA_CTRL0_Sl_MRdErr => open,
      SDMA_CTRL0_Sl_MWrErr => open,
      SDMA_CTRL0_Sl_MIRQ => open,
      PIM0_Addr => net_gnd32,
      PIM0_AddrReq => net_gnd0,
      PIM0_AddrAck => open,
      PIM0_RNW => net_gnd0,
      PIM0_Size => net_gnd4(0 to 3),
      PIM0_RdModWr => net_gnd0,
      PIM0_WrFIFO_Data => net_gnd64(0 to 63),
      PIM0_WrFIFO_BE => net_gnd8(0 to 7),
      PIM0_WrFIFO_Push => net_gnd0,
      PIM0_RdFIFO_Data => open,
      PIM0_RdFIFO_Pop => net_gnd0,
      PIM0_RdFIFO_RdWdAddr => open,
      PIM0_WrFIFO_Empty => open,
      PIM0_WrFIFO_AlmostFull => open,
      PIM0_WrFIFO_Flush => net_gnd0,
      PIM0_RdFIFO_Empty => open,
      PIM0_RdFIFO_Flush => net_gnd0,
      PIM0_RdFIFO_Latency => open,
      PIM0_InitDone => open,
      PPC440MC0_MIMCReadNotWrite => net_gnd0,
      PPC440MC0_MIMCAddress => net_gnd36,
      PPC440MC0_MIMCAddressValid => net_gnd0,
      PPC440MC0_MIMCWriteData => net_gnd128,
      PPC440MC0_MIMCWriteDataValid => net_gnd0,
      PPC440MC0_MIMCByteEnable => net_gnd16,
      PPC440MC0_MIMCBankConflict => net_gnd0,
      PPC440MC0_MIMCRowConflict => net_gnd0,
      PPC440MC0_MCMIReadData => open,
      PPC440MC0_MCMIReadDataValid => open,
      PPC440MC0_MCMIReadDataErr => open,
      PPC440MC0_MCMIAddrReadyToAccept => open,
      VFBC0_Cmd_Clk => net_gnd0,
      VFBC0_Cmd_Reset => net_gnd0,
      VFBC0_Cmd_Data => net_gnd32,
      VFBC0_Cmd_Write => net_gnd0,
      VFBC0_Cmd_End => net_gnd0,
      VFBC0_Cmd_Full => open,
      VFBC0_Cmd_Almost_Full => open,
      VFBC0_Cmd_Idle => open,
      VFBC0_Wd_Clk => net_gnd0,
      VFBC0_Wd_Reset => net_gnd0,
      VFBC0_Wd_Write => net_gnd0,
      VFBC0_Wd_End_Burst => net_gnd0,
      VFBC0_Wd_Flush => net_gnd0,
      VFBC0_Wd_Data => net_gnd32,
      VFBC0_Wd_Data_BE => net_gnd4(0 to 3),
      VFBC0_Wd_Full => open,
      VFBC0_Wd_Almost_Full => open,
      VFBC0_Rd_Clk => net_gnd0,
      VFBC0_Rd_Reset => net_gnd0,
      VFBC0_Rd_Read => net_gnd0,
      VFBC0_Rd_End_Burst => net_gnd0,
      VFBC0_Rd_Flush => net_gnd0,
      VFBC0_Rd_Data => open,
      VFBC0_Rd_Empty => open,
      VFBC0_Rd_Almost_Empty => open,
      MCB0_cmd_clk => net_gnd0,
      MCB0_cmd_en => net_gnd0,
      MCB0_cmd_instr => net_gnd3(0 to 2),
      MCB0_cmd_bl => net_gnd6,
      MCB0_cmd_byte_addr => net_gnd30,
      MCB0_cmd_empty => open,
      MCB0_cmd_full => open,
      MCB0_wr_clk => net_gnd0,
      MCB0_wr_en => net_gnd0,
      MCB0_wr_mask => net_gnd8(0 to 7),
      MCB0_wr_data => net_gnd64(0 to 63),
      MCB0_wr_full => open,
      MCB0_wr_empty => open,
      MCB0_wr_count => open,
      MCB0_wr_underrun => open,
      MCB0_wr_error => open,
      MCB0_rd_clk => net_gnd0,
      MCB0_rd_en => net_gnd0,
      MCB0_rd_data => open,
      MCB0_rd_full => open,
      MCB0_rd_empty => open,
      MCB0_rd_count => open,
      MCB0_rd_overflow => open,
      MCB0_rd_error => open,
      FSL1_M_Clk => net_vcc0,
      FSL1_M_Write => net_gnd0,
      FSL1_M_Data => net_gnd32(31 downto 0),
      FSL1_M_Control => net_gnd0,
      FSL1_M_Full => open,
      FSL1_S_Clk => net_gnd0,
      FSL1_S_Read => net_gnd0,
      FSL1_S_Data => open,
      FSL1_S_Control => open,
      FSL1_S_Exists => open,
      FSL1_B_M_Clk => net_vcc0,
      FSL1_B_M_Write => net_gnd0,
      FSL1_B_M_Data => net_gnd32(31 downto 0),
      FSL1_B_M_Control => net_gnd0,
      FSL1_B_M_Full => open,
      FSL1_B_S_Clk => net_gnd0,
      FSL1_B_S_Read => net_gnd0,
      FSL1_B_S_Data => open,
      FSL1_B_S_Control => open,
      FSL1_B_S_Exists => open,
      SPLB1_Clk => clk_100_0000MHzDCM0,
      SPLB1_Rst => ppc405_0_dplb1_SPLB_Rst(0),
      SPLB1_PLB_ABus => ppc405_0_dplb1_PLB_ABus,
      SPLB1_PLB_PAValid => ppc405_0_dplb1_PLB_PAValid,
      SPLB1_PLB_SAValid => ppc405_0_dplb1_PLB_SAValid,
      SPLB1_PLB_masterID => ppc405_0_dplb1_PLB_masterID(0 to 0),
      SPLB1_PLB_RNW => ppc405_0_dplb1_PLB_RNW,
      SPLB1_PLB_BE => ppc405_0_dplb1_PLB_BE,
      SPLB1_PLB_UABus => ppc405_0_dplb1_PLB_UABus,
      SPLB1_PLB_rdPrim => ppc405_0_dplb1_PLB_rdPrim(0),
      SPLB1_PLB_wrPrim => ppc405_0_dplb1_PLB_wrPrim(0),
      SPLB1_PLB_abort => ppc405_0_dplb1_PLB_abort,
      SPLB1_PLB_busLock => ppc405_0_dplb1_PLB_busLock,
      SPLB1_PLB_MSize => ppc405_0_dplb1_PLB_MSize,
      SPLB1_PLB_size => ppc405_0_dplb1_PLB_size,
      SPLB1_PLB_type => ppc405_0_dplb1_PLB_type,
      SPLB1_PLB_lockErr => ppc405_0_dplb1_PLB_lockErr,
      SPLB1_PLB_wrPendReq => ppc405_0_dplb1_PLB_wrPendReq,
      SPLB1_PLB_wrPendPri => ppc405_0_dplb1_PLB_wrPendPri,
      SPLB1_PLB_rdPendReq => ppc405_0_dplb1_PLB_rdPendReq,
      SPLB1_PLB_rdPendPri => ppc405_0_dplb1_PLB_rdPendPri,
      SPLB1_PLB_reqPri => ppc405_0_dplb1_PLB_reqPri,
      SPLB1_PLB_TAttribute => ppc405_0_dplb1_PLB_TAttribute,
      SPLB1_PLB_rdBurst => ppc405_0_dplb1_PLB_rdBurst,
      SPLB1_PLB_wrBurst => ppc405_0_dplb1_PLB_wrBurst,
      SPLB1_PLB_wrDBus => ppc405_0_dplb1_PLB_wrDBus,
      SPLB1_Sl_addrAck => ppc405_0_dplb1_Sl_addrAck(0),
      SPLB1_Sl_SSize => ppc405_0_dplb1_Sl_SSize,
      SPLB1_Sl_wait => ppc405_0_dplb1_Sl_wait(0),
      SPLB1_Sl_rearbitrate => ppc405_0_dplb1_Sl_rearbitrate(0),
      SPLB1_Sl_wrDAck => ppc405_0_dplb1_Sl_wrDAck(0),
      SPLB1_Sl_wrComp => ppc405_0_dplb1_Sl_wrComp(0),
      SPLB1_Sl_wrBTerm => ppc405_0_dplb1_Sl_wrBTerm(0),
      SPLB1_Sl_rdDBus => ppc405_0_dplb1_Sl_rdDBus,
      SPLB1_Sl_rdWdAddr => ppc405_0_dplb1_Sl_rdWdAddr,
      SPLB1_Sl_rdDAck => ppc405_0_dplb1_Sl_rdDAck(0),
      SPLB1_Sl_rdComp => ppc405_0_dplb1_Sl_rdComp(0),
      SPLB1_Sl_rdBTerm => ppc405_0_dplb1_Sl_rdBTerm(0),
      SPLB1_Sl_MBusy => ppc405_0_dplb1_Sl_MBusy(0 to 0),
      SPLB1_Sl_MRdErr => ppc405_0_dplb1_Sl_MRdErr(0 to 0),
      SPLB1_Sl_MWrErr => ppc405_0_dplb1_Sl_MWrErr(0 to 0),
      SPLB1_Sl_MIRQ => ppc405_0_dplb1_Sl_MIRQ(0 to 0),
      SDMA1_Clk => net_gnd0,
      SDMA1_Rx_IntOut => open,
      SDMA1_Tx_IntOut => open,
      SDMA1_RstOut => open,
      SDMA1_TX_D => open,
      SDMA1_TX_Rem => open,
      SDMA1_TX_SOF => open,
      SDMA1_TX_EOF => open,
      SDMA1_TX_SOP => open,
      SDMA1_TX_EOP => open,
      SDMA1_TX_Src_Rdy => open,
      SDMA1_TX_Dst_Rdy => net_vcc0,
      SDMA1_RX_D => net_gnd32(31 downto 0),
      SDMA1_RX_Rem => net_vcc4,
      SDMA1_RX_SOF => net_vcc0,
      SDMA1_RX_EOF => net_vcc0,
      SDMA1_RX_SOP => net_vcc0,
      SDMA1_RX_EOP => net_vcc0,
      SDMA1_RX_Src_Rdy => net_vcc0,
      SDMA1_RX_Dst_Rdy => open,
      SDMA_CTRL1_Clk => net_vcc0,
      SDMA_CTRL1_Rst => net_gnd0,
      SDMA_CTRL1_PLB_ABus => net_gnd32(31 downto 0),
      SDMA_CTRL1_PLB_PAValid => net_gnd0,
      SDMA_CTRL1_PLB_SAValid => net_gnd0,
      SDMA_CTRL1_PLB_masterID => net_gnd1(0 to 0),
      SDMA_CTRL1_PLB_RNW => net_gnd0,
      SDMA_CTRL1_PLB_BE => net_gnd8,
      SDMA_CTRL1_PLB_UABus => net_gnd32(31 downto 0),
      SDMA_CTRL1_PLB_rdPrim => net_gnd0,
      SDMA_CTRL1_PLB_wrPrim => net_gnd0,
      SDMA_CTRL1_PLB_abort => net_gnd0,
      SDMA_CTRL1_PLB_busLock => net_gnd0,
      SDMA_CTRL1_PLB_MSize => net_gnd2,
      SDMA_CTRL1_PLB_size => net_gnd4,
      SDMA_CTRL1_PLB_type => net_gnd3,
      SDMA_CTRL1_PLB_lockErr => net_gnd0,
      SDMA_CTRL1_PLB_wrPendReq => net_gnd0,
      SDMA_CTRL1_PLB_wrPendPri => net_gnd2,
      SDMA_CTRL1_PLB_rdPendReq => net_gnd0,
      SDMA_CTRL1_PLB_rdPendPri => net_gnd2,
      SDMA_CTRL1_PLB_reqPri => net_gnd2,
      SDMA_CTRL1_PLB_TAttribute => net_gnd16,
      SDMA_CTRL1_PLB_rdBurst => net_gnd0,
      SDMA_CTRL1_PLB_wrBurst => net_gnd0,
      SDMA_CTRL1_PLB_wrDBus => net_gnd64,
      SDMA_CTRL1_Sl_addrAck => open,
      SDMA_CTRL1_Sl_SSize => open,
      SDMA_CTRL1_Sl_wait => open,
      SDMA_CTRL1_Sl_rearbitrate => open,
      SDMA_CTRL1_Sl_wrDAck => open,
      SDMA_CTRL1_Sl_wrComp => open,
      SDMA_CTRL1_Sl_wrBTerm => open,
      SDMA_CTRL1_Sl_rdDBus => open,
      SDMA_CTRL1_Sl_rdWdAddr => open,
      SDMA_CTRL1_Sl_rdDAck => open,
      SDMA_CTRL1_Sl_rdComp => open,
      SDMA_CTRL1_Sl_rdBTerm => open,
      SDMA_CTRL1_Sl_MBusy => open,
      SDMA_CTRL1_Sl_MRdErr => open,
      SDMA_CTRL1_Sl_MWrErr => open,
      SDMA_CTRL1_Sl_MIRQ => open,
      PIM1_Addr => net_gnd32,
      PIM1_AddrReq => net_gnd0,
      PIM1_AddrAck => open,
      PIM1_RNW => net_gnd0,
      PIM1_Size => net_gnd4(0 to 3),
      PIM1_RdModWr => net_gnd0,
      PIM1_WrFIFO_Data => net_gnd64(0 to 63),
      PIM1_WrFIFO_BE => net_gnd8(0 to 7),
      PIM1_WrFIFO_Push => net_gnd0,
      PIM1_RdFIFO_Data => open,
      PIM1_RdFIFO_Pop => net_gnd0,
      PIM1_RdFIFO_RdWdAddr => open,
      PIM1_WrFIFO_Empty => open,
      PIM1_WrFIFO_AlmostFull => open,
      PIM1_WrFIFO_Flush => net_gnd0,
      PIM1_RdFIFO_Empty => open,
      PIM1_RdFIFO_Flush => net_gnd0,
      PIM1_RdFIFO_Latency => open,
      PIM1_InitDone => open,
      PPC440MC1_MIMCReadNotWrite => net_gnd0,
      PPC440MC1_MIMCAddress => net_gnd36,
      PPC440MC1_MIMCAddressValid => net_gnd0,
      PPC440MC1_MIMCWriteData => net_gnd128,
      PPC440MC1_MIMCWriteDataValid => net_gnd0,
      PPC440MC1_MIMCByteEnable => net_gnd16,
      PPC440MC1_MIMCBankConflict => net_gnd0,
      PPC440MC1_MIMCRowConflict => net_gnd0,
      PPC440MC1_MCMIReadData => open,
      PPC440MC1_MCMIReadDataValid => open,
      PPC440MC1_MCMIReadDataErr => open,
      PPC440MC1_MCMIAddrReadyToAccept => open,
      VFBC1_Cmd_Clk => net_gnd0,
      VFBC1_Cmd_Reset => net_gnd0,
      VFBC1_Cmd_Data => net_gnd32,
      VFBC1_Cmd_Write => net_gnd0,
      VFBC1_Cmd_End => net_gnd0,
      VFBC1_Cmd_Full => open,
      VFBC1_Cmd_Almost_Full => open,
      VFBC1_Cmd_Idle => open,
      VFBC1_Wd_Clk => net_gnd0,
      VFBC1_Wd_Reset => net_gnd0,
      VFBC1_Wd_Write => net_gnd0,
      VFBC1_Wd_End_Burst => net_gnd0,
      VFBC1_Wd_Flush => net_gnd0,
      VFBC1_Wd_Data => net_gnd32,
      VFBC1_Wd_Data_BE => net_gnd4(0 to 3),
      VFBC1_Wd_Full => open,
      VFBC1_Wd_Almost_Full => open,
      VFBC1_Rd_Clk => net_gnd0,
      VFBC1_Rd_Reset => net_gnd0,
      VFBC1_Rd_Read => net_gnd0,
      VFBC1_Rd_End_Burst => net_gnd0,
      VFBC1_Rd_Flush => net_gnd0,
      VFBC1_Rd_Data => open,
      VFBC1_Rd_Empty => open,
      VFBC1_Rd_Almost_Empty => open,
      MCB1_cmd_clk => net_gnd0,
      MCB1_cmd_en => net_gnd0,
      MCB1_cmd_instr => net_gnd3(0 to 2),
      MCB1_cmd_bl => net_gnd6,
      MCB1_cmd_byte_addr => net_gnd30,
      MCB1_cmd_empty => open,
      MCB1_cmd_full => open,
      MCB1_wr_clk => net_gnd0,
      MCB1_wr_en => net_gnd0,
      MCB1_wr_mask => net_gnd8(0 to 7),
      MCB1_wr_data => net_gnd64(0 to 63),
      MCB1_wr_full => open,
      MCB1_wr_empty => open,
      MCB1_wr_count => open,
      MCB1_wr_underrun => open,
      MCB1_wr_error => open,
      MCB1_rd_clk => net_gnd0,
      MCB1_rd_en => net_gnd0,
      MCB1_rd_data => open,
      MCB1_rd_full => open,
      MCB1_rd_empty => open,
      MCB1_rd_count => open,
      MCB1_rd_overflow => open,
      MCB1_rd_error => open,
      FSL2_M_Clk => net_vcc0,
      FSL2_M_Write => net_gnd0,
      FSL2_M_Data => net_gnd32(31 downto 0),
      FSL2_M_Control => net_gnd0,
      FSL2_M_Full => open,
      FSL2_S_Clk => net_gnd0,
      FSL2_S_Read => net_gnd0,
      FSL2_S_Data => open,
      FSL2_S_Control => open,
      FSL2_S_Exists => open,
      FSL2_B_M_Clk => net_vcc0,
      FSL2_B_M_Write => net_gnd0,
      FSL2_B_M_Data => net_gnd32(31 downto 0),
      FSL2_B_M_Control => net_gnd0,
      FSL2_B_M_Full => open,
      FSL2_B_S_Clk => net_gnd0,
      FSL2_B_S_Read => net_gnd0,
      FSL2_B_S_Data => open,
      FSL2_B_S_Control => open,
      FSL2_B_S_Exists => open,
      SPLB2_Clk => net_vcc0,
      SPLB2_Rst => net_gnd0,
      SPLB2_PLB_ABus => net_gnd32(31 downto 0),
      SPLB2_PLB_PAValid => net_gnd0,
      SPLB2_PLB_SAValid => net_gnd0,
      SPLB2_PLB_masterID => net_gnd1(0 to 0),
      SPLB2_PLB_RNW => net_gnd0,
      SPLB2_PLB_BE => net_gnd8,
      SPLB2_PLB_UABus => net_gnd32(31 downto 0),
      SPLB2_PLB_rdPrim => net_gnd0,
      SPLB2_PLB_wrPrim => net_gnd0,
      SPLB2_PLB_abort => net_gnd0,
      SPLB2_PLB_busLock => net_gnd0,
      SPLB2_PLB_MSize => net_gnd2,
      SPLB2_PLB_size => net_gnd4,
      SPLB2_PLB_type => net_gnd3,
      SPLB2_PLB_lockErr => net_gnd0,
      SPLB2_PLB_wrPendReq => net_gnd0,
      SPLB2_PLB_wrPendPri => net_gnd2,
      SPLB2_PLB_rdPendReq => net_gnd0,
      SPLB2_PLB_rdPendPri => net_gnd2,
      SPLB2_PLB_reqPri => net_gnd2,
      SPLB2_PLB_TAttribute => net_gnd16,
      SPLB2_PLB_rdBurst => net_gnd0,
      SPLB2_PLB_wrBurst => net_gnd0,
      SPLB2_PLB_wrDBus => net_gnd64,
      SPLB2_Sl_addrAck => open,
      SPLB2_Sl_SSize => open,
      SPLB2_Sl_wait => open,
      SPLB2_Sl_rearbitrate => open,
      SPLB2_Sl_wrDAck => open,
      SPLB2_Sl_wrComp => open,
      SPLB2_Sl_wrBTerm => open,
      SPLB2_Sl_rdDBus => open,
      SPLB2_Sl_rdWdAddr => open,
      SPLB2_Sl_rdDAck => open,
      SPLB2_Sl_rdComp => open,
      SPLB2_Sl_rdBTerm => open,
      SPLB2_Sl_MBusy => open,
      SPLB2_Sl_MRdErr => open,
      SPLB2_Sl_MWrErr => open,
      SPLB2_Sl_MIRQ => open,
      SDMA2_Clk => clk_100_0000MHzDCM0,
      SDMA2_Rx_IntOut => DDR_SDRAM_SDMA2_Rx_IntOut,
      SDMA2_Tx_IntOut => DDR_SDRAM_SDMA2_Tx_IntOut,
      SDMA2_RstOut => TriMode_MAC_GMII_LLINK0_LL_RST_ACK,
      SDMA2_TX_D => TriMode_MAC_GMII_LLINK0_LL_Tx_Data,
      SDMA2_TX_Rem => TriMode_MAC_GMII_LLINK0_LL_Tx_Rem,
      SDMA2_TX_SOF => TriMode_MAC_GMII_LLINK0_LL_Tx_SOF_n,
      SDMA2_TX_EOF => TriMode_MAC_GMII_LLINK0_LL_Tx_EOF_n,
      SDMA2_TX_SOP => TriMode_MAC_GMII_LLINK0_LL_Tx_SOP_n,
      SDMA2_TX_EOP => TriMode_MAC_GMII_LLINK0_LL_Tx_EOP_n,
      SDMA2_TX_Src_Rdy => TriMode_MAC_GMII_LLINK0_LL_Tx_SrcRdy_n,
      SDMA2_TX_Dst_Rdy => TriMode_MAC_GMII_LLINK0_LL_Tx_DstRdy_n,
      SDMA2_RX_D => TriMode_MAC_GMII_LLINK0_LL_Rx_Data,
      SDMA2_RX_Rem => TriMode_MAC_GMII_LLINK0_LL_Rx_Rem,
      SDMA2_RX_SOF => TriMode_MAC_GMII_LLINK0_LL_Rx_SOF_n,
      SDMA2_RX_EOF => TriMode_MAC_GMII_LLINK0_LL_Rx_EOF_n,
      SDMA2_RX_SOP => TriMode_MAC_GMII_LLINK0_LL_Rx_SOP_n,
      SDMA2_RX_EOP => TriMode_MAC_GMII_LLINK0_LL_Rx_EOP_n,
      SDMA2_RX_Src_Rdy => TriMode_MAC_GMII_LLINK0_LL_Rx_SrcRdy_n,
      SDMA2_RX_Dst_Rdy => TriMode_MAC_GMII_LLINK0_LL_Rx_DstRdy_n,
      SDMA_CTRL2_Clk => clk_100_0000MHzDCM0,
      SDMA_CTRL2_Rst => plb_SPLB_Rst(6),
      SDMA_CTRL2_PLB_ABus => plb_PLB_ABus,
      SDMA_CTRL2_PLB_PAValid => plb_PLB_PAValid,
      SDMA_CTRL2_PLB_SAValid => plb_PLB_SAValid,
      SDMA_CTRL2_PLB_masterID => plb_PLB_masterID(0 to 0),
      SDMA_CTRL2_PLB_RNW => plb_PLB_RNW,
      SDMA_CTRL2_PLB_BE => plb_PLB_BE,
      SDMA_CTRL2_PLB_UABus => plb_PLB_UABus,
      SDMA_CTRL2_PLB_rdPrim => plb_PLB_rdPrim(6),
      SDMA_CTRL2_PLB_wrPrim => plb_PLB_wrPrim(6),
      SDMA_CTRL2_PLB_abort => plb_PLB_abort,
      SDMA_CTRL2_PLB_busLock => plb_PLB_busLock,
      SDMA_CTRL2_PLB_MSize => plb_PLB_MSize,
      SDMA_CTRL2_PLB_size => plb_PLB_size,
      SDMA_CTRL2_PLB_type => plb_PLB_type,
      SDMA_CTRL2_PLB_lockErr => plb_PLB_lockErr,
      SDMA_CTRL2_PLB_wrPendReq => plb_PLB_wrPendReq,
      SDMA_CTRL2_PLB_wrPendPri => plb_PLB_wrPendPri,
      SDMA_CTRL2_PLB_rdPendReq => plb_PLB_rdPendReq,
      SDMA_CTRL2_PLB_rdPendPri => plb_PLB_rdPendPri,
      SDMA_CTRL2_PLB_reqPri => plb_PLB_reqPri,
      SDMA_CTRL2_PLB_TAttribute => plb_PLB_TAttribute,
      SDMA_CTRL2_PLB_rdBurst => plb_PLB_rdBurst,
      SDMA_CTRL2_PLB_wrBurst => plb_PLB_wrBurst,
      SDMA_CTRL2_PLB_wrDBus => plb_PLB_wrDBus,
      SDMA_CTRL2_Sl_addrAck => plb_Sl_addrAck(6),
      SDMA_CTRL2_Sl_SSize => plb_Sl_SSize(12 to 13),
      SDMA_CTRL2_Sl_wait => plb_Sl_wait(6),
      SDMA_CTRL2_Sl_rearbitrate => plb_Sl_rearbitrate(6),
      SDMA_CTRL2_Sl_wrDAck => plb_Sl_wrDAck(6),
      SDMA_CTRL2_Sl_wrComp => plb_Sl_wrComp(6),
      SDMA_CTRL2_Sl_wrBTerm => plb_Sl_wrBTerm(6),
      SDMA_CTRL2_Sl_rdDBus => plb_Sl_rdDBus(384 to 447),
      SDMA_CTRL2_Sl_rdWdAddr => plb_Sl_rdWdAddr(24 to 27),
      SDMA_CTRL2_Sl_rdDAck => plb_Sl_rdDAck(6),
      SDMA_CTRL2_Sl_rdComp => plb_Sl_rdComp(6),
      SDMA_CTRL2_Sl_rdBTerm => plb_Sl_rdBTerm(6),
      SDMA_CTRL2_Sl_MBusy => plb_Sl_MBusy(12 to 13),
      SDMA_CTRL2_Sl_MRdErr => plb_Sl_MRdErr(12 to 13),
      SDMA_CTRL2_Sl_MWrErr => plb_Sl_MWrErr(12 to 13),
      SDMA_CTRL2_Sl_MIRQ => plb_Sl_MIRQ(12 to 13),
      PIM2_Addr => net_gnd32,
      PIM2_AddrReq => net_gnd0,
      PIM2_AddrAck => open,
      PIM2_RNW => net_gnd0,
      PIM2_Size => net_gnd4(0 to 3),
      PIM2_RdModWr => net_gnd0,
      PIM2_WrFIFO_Data => net_gnd64(0 to 63),
      PIM2_WrFIFO_BE => net_gnd8(0 to 7),
      PIM2_WrFIFO_Push => net_gnd0,
      PIM2_RdFIFO_Data => open,
      PIM2_RdFIFO_Pop => net_gnd0,
      PIM2_RdFIFO_RdWdAddr => open,
      PIM2_WrFIFO_Empty => open,
      PIM2_WrFIFO_AlmostFull => open,
      PIM2_WrFIFO_Flush => net_gnd0,
      PIM2_RdFIFO_Empty => open,
      PIM2_RdFIFO_Flush => net_gnd0,
      PIM2_RdFIFO_Latency => open,
      PIM2_InitDone => open,
      PPC440MC2_MIMCReadNotWrite => net_gnd0,
      PPC440MC2_MIMCAddress => net_gnd36,
      PPC440MC2_MIMCAddressValid => net_gnd0,
      PPC440MC2_MIMCWriteData => net_gnd128,
      PPC440MC2_MIMCWriteDataValid => net_gnd0,
      PPC440MC2_MIMCByteEnable => net_gnd16,
      PPC440MC2_MIMCBankConflict => net_gnd0,
      PPC440MC2_MIMCRowConflict => net_gnd0,
      PPC440MC2_MCMIReadData => open,
      PPC440MC2_MCMIReadDataValid => open,
      PPC440MC2_MCMIReadDataErr => open,
      PPC440MC2_MCMIAddrReadyToAccept => open,
      VFBC2_Cmd_Clk => net_gnd0,
      VFBC2_Cmd_Reset => net_gnd0,
      VFBC2_Cmd_Data => net_gnd32,
      VFBC2_Cmd_Write => net_gnd0,
      VFBC2_Cmd_End => net_gnd0,
      VFBC2_Cmd_Full => open,
      VFBC2_Cmd_Almost_Full => open,
      VFBC2_Cmd_Idle => open,
      VFBC2_Wd_Clk => net_gnd0,
      VFBC2_Wd_Reset => net_gnd0,
      VFBC2_Wd_Write => net_gnd0,
      VFBC2_Wd_End_Burst => net_gnd0,
      VFBC2_Wd_Flush => net_gnd0,
      VFBC2_Wd_Data => net_gnd32,
      VFBC2_Wd_Data_BE => net_gnd4(0 to 3),
      VFBC2_Wd_Full => open,
      VFBC2_Wd_Almost_Full => open,
      VFBC2_Rd_Clk => net_gnd0,
      VFBC2_Rd_Reset => net_gnd0,
      VFBC2_Rd_Read => net_gnd0,
      VFBC2_Rd_End_Burst => net_gnd0,
      VFBC2_Rd_Flush => net_gnd0,
      VFBC2_Rd_Data => open,
      VFBC2_Rd_Empty => open,
      VFBC2_Rd_Almost_Empty => open,
      MCB2_cmd_clk => net_gnd0,
      MCB2_cmd_en => net_gnd0,
      MCB2_cmd_instr => net_gnd3(0 to 2),
      MCB2_cmd_bl => net_gnd6,
      MCB2_cmd_byte_addr => net_gnd30,
      MCB2_cmd_empty => open,
      MCB2_cmd_full => open,
      MCB2_wr_clk => net_gnd0,
      MCB2_wr_en => net_gnd0,
      MCB2_wr_mask => net_gnd8(0 to 7),
      MCB2_wr_data => net_gnd64(0 to 63),
      MCB2_wr_full => open,
      MCB2_wr_empty => open,
      MCB2_wr_count => open,
      MCB2_wr_underrun => open,
      MCB2_wr_error => open,
      MCB2_rd_clk => net_gnd0,
      MCB2_rd_en => net_gnd0,
      MCB2_rd_data => open,
      MCB2_rd_full => open,
      MCB2_rd_empty => open,
      MCB2_rd_count => open,
      MCB2_rd_overflow => open,
      MCB2_rd_error => open,
      FSL3_M_Clk => net_vcc0,
      FSL3_M_Write => net_gnd0,
      FSL3_M_Data => net_gnd32(31 downto 0),
      FSL3_M_Control => net_gnd0,
      FSL3_M_Full => open,
      FSL3_S_Clk => net_gnd0,
      FSL3_S_Read => net_gnd0,
      FSL3_S_Data => open,
      FSL3_S_Control => open,
      FSL3_S_Exists => open,
      FSL3_B_M_Clk => net_vcc0,
      FSL3_B_M_Write => net_gnd0,
      FSL3_B_M_Data => net_gnd32(31 downto 0),
      FSL3_B_M_Control => net_gnd0,
      FSL3_B_M_Full => open,
      FSL3_B_S_Clk => net_gnd0,
      FSL3_B_S_Read => net_gnd0,
      FSL3_B_S_Data => open,
      FSL3_B_S_Control => open,
      FSL3_B_S_Exists => open,
      SPLB3_Clk => net_vcc0,
      SPLB3_Rst => net_gnd0,
      SPLB3_PLB_ABus => net_gnd32(31 downto 0),
      SPLB3_PLB_PAValid => net_gnd0,
      SPLB3_PLB_SAValid => net_gnd0,
      SPLB3_PLB_masterID => net_gnd1(0 to 0),
      SPLB3_PLB_RNW => net_gnd0,
      SPLB3_PLB_BE => net_gnd8,
      SPLB3_PLB_UABus => net_gnd32(31 downto 0),
      SPLB3_PLB_rdPrim => net_gnd0,
      SPLB3_PLB_wrPrim => net_gnd0,
      SPLB3_PLB_abort => net_gnd0,
      SPLB3_PLB_busLock => net_gnd0,
      SPLB3_PLB_MSize => net_gnd2,
      SPLB3_PLB_size => net_gnd4,
      SPLB3_PLB_type => net_gnd3,
      SPLB3_PLB_lockErr => net_gnd0,
      SPLB3_PLB_wrPendReq => net_gnd0,
      SPLB3_PLB_wrPendPri => net_gnd2,
      SPLB3_PLB_rdPendReq => net_gnd0,
      SPLB3_PLB_rdPendPri => net_gnd2,
      SPLB3_PLB_reqPri => net_gnd2,
      SPLB3_PLB_TAttribute => net_gnd16,
      SPLB3_PLB_rdBurst => net_gnd0,
      SPLB3_PLB_wrBurst => net_gnd0,
      SPLB3_PLB_wrDBus => net_gnd64,
      SPLB3_Sl_addrAck => open,
      SPLB3_Sl_SSize => open,
      SPLB3_Sl_wait => open,
      SPLB3_Sl_rearbitrate => open,
      SPLB3_Sl_wrDAck => open,
      SPLB3_Sl_wrComp => open,
      SPLB3_Sl_wrBTerm => open,
      SPLB3_Sl_rdDBus => open,
      SPLB3_Sl_rdWdAddr => open,
      SPLB3_Sl_rdDAck => open,
      SPLB3_Sl_rdComp => open,
      SPLB3_Sl_rdBTerm => open,
      SPLB3_Sl_MBusy => open,
      SPLB3_Sl_MRdErr => open,
      SPLB3_Sl_MWrErr => open,
      SPLB3_Sl_MIRQ => open,
      SDMA3_Clk => net_gnd0,
      SDMA3_Rx_IntOut => open,
      SDMA3_Tx_IntOut => open,
      SDMA3_RstOut => open,
      SDMA3_TX_D => open,
      SDMA3_TX_Rem => open,
      SDMA3_TX_SOF => open,
      SDMA3_TX_EOF => open,
      SDMA3_TX_SOP => open,
      SDMA3_TX_EOP => open,
      SDMA3_TX_Src_Rdy => open,
      SDMA3_TX_Dst_Rdy => net_vcc0,
      SDMA3_RX_D => net_gnd32(31 downto 0),
      SDMA3_RX_Rem => net_vcc4,
      SDMA3_RX_SOF => net_vcc0,
      SDMA3_RX_EOF => net_vcc0,
      SDMA3_RX_SOP => net_vcc0,
      SDMA3_RX_EOP => net_vcc0,
      SDMA3_RX_Src_Rdy => net_vcc0,
      SDMA3_RX_Dst_Rdy => open,
      SDMA_CTRL3_Clk => net_vcc0,
      SDMA_CTRL3_Rst => net_gnd0,
      SDMA_CTRL3_PLB_ABus => net_gnd32(31 downto 0),
      SDMA_CTRL3_PLB_PAValid => net_gnd0,
      SDMA_CTRL3_PLB_SAValid => net_gnd0,
      SDMA_CTRL3_PLB_masterID => net_gnd1(0 to 0),
      SDMA_CTRL3_PLB_RNW => net_gnd0,
      SDMA_CTRL3_PLB_BE => net_gnd8,
      SDMA_CTRL3_PLB_UABus => net_gnd32(31 downto 0),
      SDMA_CTRL3_PLB_rdPrim => net_gnd0,
      SDMA_CTRL3_PLB_wrPrim => net_gnd0,
      SDMA_CTRL3_PLB_abort => net_gnd0,
      SDMA_CTRL3_PLB_busLock => net_gnd0,
      SDMA_CTRL3_PLB_MSize => net_gnd2,
      SDMA_CTRL3_PLB_size => net_gnd4,
      SDMA_CTRL3_PLB_type => net_gnd3,
      SDMA_CTRL3_PLB_lockErr => net_gnd0,
      SDMA_CTRL3_PLB_wrPendReq => net_gnd0,
      SDMA_CTRL3_PLB_wrPendPri => net_gnd2,
      SDMA_CTRL3_PLB_rdPendReq => net_gnd0,
      SDMA_CTRL3_PLB_rdPendPri => net_gnd2,
      SDMA_CTRL3_PLB_reqPri => net_gnd2,
      SDMA_CTRL3_PLB_TAttribute => net_gnd16,
      SDMA_CTRL3_PLB_rdBurst => net_gnd0,
      SDMA_CTRL3_PLB_wrBurst => net_gnd0,
      SDMA_CTRL3_PLB_wrDBus => net_gnd64,
      SDMA_CTRL3_Sl_addrAck => open,
      SDMA_CTRL3_Sl_SSize => open,
      SDMA_CTRL3_Sl_wait => open,
      SDMA_CTRL3_Sl_rearbitrate => open,
      SDMA_CTRL3_Sl_wrDAck => open,
      SDMA_CTRL3_Sl_wrComp => open,
      SDMA_CTRL3_Sl_wrBTerm => open,
      SDMA_CTRL3_Sl_rdDBus => open,
      SDMA_CTRL3_Sl_rdWdAddr => open,
      SDMA_CTRL3_Sl_rdDAck => open,
      SDMA_CTRL3_Sl_rdComp => open,
      SDMA_CTRL3_Sl_rdBTerm => open,
      SDMA_CTRL3_Sl_MBusy => open,
      SDMA_CTRL3_Sl_MRdErr => open,
      SDMA_CTRL3_Sl_MWrErr => open,
      SDMA_CTRL3_Sl_MIRQ => open,
      PIM3_Addr => net_gnd32,
      PIM3_AddrReq => net_gnd0,
      PIM3_AddrAck => open,
      PIM3_RNW => net_gnd0,
      PIM3_Size => net_gnd4(0 to 3),
      PIM3_RdModWr => net_gnd0,
      PIM3_WrFIFO_Data => net_gnd64(0 to 63),
      PIM3_WrFIFO_BE => net_gnd8(0 to 7),
      PIM3_WrFIFO_Push => net_gnd0,
      PIM3_RdFIFO_Data => open,
      PIM3_RdFIFO_Pop => net_gnd0,
      PIM3_RdFIFO_RdWdAddr => open,
      PIM3_WrFIFO_Empty => open,
      PIM3_WrFIFO_AlmostFull => open,
      PIM3_WrFIFO_Flush => net_gnd0,
      PIM3_RdFIFO_Empty => open,
      PIM3_RdFIFO_Flush => net_gnd0,
      PIM3_RdFIFO_Latency => open,
      PIM3_InitDone => open,
      PPC440MC3_MIMCReadNotWrite => net_gnd0,
      PPC440MC3_MIMCAddress => net_gnd36,
      PPC440MC3_MIMCAddressValid => net_gnd0,
      PPC440MC3_MIMCWriteData => net_gnd128,
      PPC440MC3_MIMCWriteDataValid => net_gnd0,
      PPC440MC3_MIMCByteEnable => net_gnd16,
      PPC440MC3_MIMCBankConflict => net_gnd0,
      PPC440MC3_MIMCRowConflict => net_gnd0,
      PPC440MC3_MCMIReadData => open,
      PPC440MC3_MCMIReadDataValid => open,
      PPC440MC3_MCMIReadDataErr => open,
      PPC440MC3_MCMIAddrReadyToAccept => open,
      VFBC3_Cmd_Clk => net_gnd0,
      VFBC3_Cmd_Reset => net_gnd0,
      VFBC3_Cmd_Data => net_gnd32,
      VFBC3_Cmd_Write => net_gnd0,
      VFBC3_Cmd_End => net_gnd0,
      VFBC3_Cmd_Full => open,
      VFBC3_Cmd_Almost_Full => open,
      VFBC3_Cmd_Idle => open,
      VFBC3_Wd_Clk => net_gnd0,
      VFBC3_Wd_Reset => net_gnd0,
      VFBC3_Wd_Write => net_gnd0,
      VFBC3_Wd_End_Burst => net_gnd0,
      VFBC3_Wd_Flush => net_gnd0,
      VFBC3_Wd_Data => net_gnd32,
      VFBC3_Wd_Data_BE => net_gnd4(0 to 3),
      VFBC3_Wd_Full => open,
      VFBC3_Wd_Almost_Full => open,
      VFBC3_Rd_Clk => net_gnd0,
      VFBC3_Rd_Reset => net_gnd0,
      VFBC3_Rd_Read => net_gnd0,
      VFBC3_Rd_End_Burst => net_gnd0,
      VFBC3_Rd_Flush => net_gnd0,
      VFBC3_Rd_Data => open,
      VFBC3_Rd_Empty => open,
      VFBC3_Rd_Almost_Empty => open,
      MCB3_cmd_clk => net_gnd0,
      MCB3_cmd_en => net_gnd0,
      MCB3_cmd_instr => net_gnd3(0 to 2),
      MCB3_cmd_bl => net_gnd6,
      MCB3_cmd_byte_addr => net_gnd30,
      MCB3_cmd_empty => open,
      MCB3_cmd_full => open,
      MCB3_wr_clk => net_gnd0,
      MCB3_wr_en => net_gnd0,
      MCB3_wr_mask => net_gnd8(0 to 7),
      MCB3_wr_data => net_gnd64(0 to 63),
      MCB3_wr_full => open,
      MCB3_wr_empty => open,
      MCB3_wr_count => open,
      MCB3_wr_underrun => open,
      MCB3_wr_error => open,
      MCB3_rd_clk => net_gnd0,
      MCB3_rd_en => net_gnd0,
      MCB3_rd_data => open,
      MCB3_rd_full => open,
      MCB3_rd_empty => open,
      MCB3_rd_count => open,
      MCB3_rd_overflow => open,
      MCB3_rd_error => open,
      FSL4_M_Clk => net_vcc0,
      FSL4_M_Write => net_gnd0,
      FSL4_M_Data => net_gnd32(31 downto 0),
      FSL4_M_Control => net_gnd0,
      FSL4_M_Full => open,
      FSL4_S_Clk => net_gnd0,
      FSL4_S_Read => net_gnd0,
      FSL4_S_Data => open,
      FSL4_S_Control => open,
      FSL4_S_Exists => open,
      FSL4_B_M_Clk => net_vcc0,
      FSL4_B_M_Write => net_gnd0,
      FSL4_B_M_Data => net_gnd32(31 downto 0),
      FSL4_B_M_Control => net_gnd0,
      FSL4_B_M_Full => open,
      FSL4_B_S_Clk => net_gnd0,
      FSL4_B_S_Read => net_gnd0,
      FSL4_B_S_Data => open,
      FSL4_B_S_Control => open,
      FSL4_B_S_Exists => open,
      SPLB4_Clk => net_vcc0,
      SPLB4_Rst => net_gnd0,
      SPLB4_PLB_ABus => net_gnd32(31 downto 0),
      SPLB4_PLB_PAValid => net_gnd0,
      SPLB4_PLB_SAValid => net_gnd0,
      SPLB4_PLB_masterID => net_gnd1(0 to 0),
      SPLB4_PLB_RNW => net_gnd0,
      SPLB4_PLB_BE => net_gnd8,
      SPLB4_PLB_UABus => net_gnd32(31 downto 0),
      SPLB4_PLB_rdPrim => net_gnd0,
      SPLB4_PLB_wrPrim => net_gnd0,
      SPLB4_PLB_abort => net_gnd0,
      SPLB4_PLB_busLock => net_gnd0,
      SPLB4_PLB_MSize => net_gnd2,
      SPLB4_PLB_size => net_gnd4,
      SPLB4_PLB_type => net_gnd3,
      SPLB4_PLB_lockErr => net_gnd0,
      SPLB4_PLB_wrPendReq => net_gnd0,
      SPLB4_PLB_wrPendPri => net_gnd2,
      SPLB4_PLB_rdPendReq => net_gnd0,
      SPLB4_PLB_rdPendPri => net_gnd2,
      SPLB4_PLB_reqPri => net_gnd2,
      SPLB4_PLB_TAttribute => net_gnd16,
      SPLB4_PLB_rdBurst => net_gnd0,
      SPLB4_PLB_wrBurst => net_gnd0,
      SPLB4_PLB_wrDBus => net_gnd64,
      SPLB4_Sl_addrAck => open,
      SPLB4_Sl_SSize => open,
      SPLB4_Sl_wait => open,
      SPLB4_Sl_rearbitrate => open,
      SPLB4_Sl_wrDAck => open,
      SPLB4_Sl_wrComp => open,
      SPLB4_Sl_wrBTerm => open,
      SPLB4_Sl_rdDBus => open,
      SPLB4_Sl_rdWdAddr => open,
      SPLB4_Sl_rdDAck => open,
      SPLB4_Sl_rdComp => open,
      SPLB4_Sl_rdBTerm => open,
      SPLB4_Sl_MBusy => open,
      SPLB4_Sl_MRdErr => open,
      SPLB4_Sl_MWrErr => open,
      SPLB4_Sl_MIRQ => open,
      SDMA4_Clk => net_gnd0,
      SDMA4_Rx_IntOut => open,
      SDMA4_Tx_IntOut => open,
      SDMA4_RstOut => open,
      SDMA4_TX_D => open,
      SDMA4_TX_Rem => open,
      SDMA4_TX_SOF => open,
      SDMA4_TX_EOF => open,
      SDMA4_TX_SOP => open,
      SDMA4_TX_EOP => open,
      SDMA4_TX_Src_Rdy => open,
      SDMA4_TX_Dst_Rdy => net_vcc0,
      SDMA4_RX_D => net_gnd32(31 downto 0),
      SDMA4_RX_Rem => net_vcc4,
      SDMA4_RX_SOF => net_vcc0,
      SDMA4_RX_EOF => net_vcc0,
      SDMA4_RX_SOP => net_vcc0,
      SDMA4_RX_EOP => net_vcc0,
      SDMA4_RX_Src_Rdy => net_vcc0,
      SDMA4_RX_Dst_Rdy => open,
      SDMA_CTRL4_Clk => net_vcc0,
      SDMA_CTRL4_Rst => net_gnd0,
      SDMA_CTRL4_PLB_ABus => net_gnd32(31 downto 0),
      SDMA_CTRL4_PLB_PAValid => net_gnd0,
      SDMA_CTRL4_PLB_SAValid => net_gnd0,
      SDMA_CTRL4_PLB_masterID => net_gnd1(0 to 0),
      SDMA_CTRL4_PLB_RNW => net_gnd0,
      SDMA_CTRL4_PLB_BE => net_gnd8,
      SDMA_CTRL4_PLB_UABus => net_gnd32(31 downto 0),
      SDMA_CTRL4_PLB_rdPrim => net_gnd0,
      SDMA_CTRL4_PLB_wrPrim => net_gnd0,
      SDMA_CTRL4_PLB_abort => net_gnd0,
      SDMA_CTRL4_PLB_busLock => net_gnd0,
      SDMA_CTRL4_PLB_MSize => net_gnd2,
      SDMA_CTRL4_PLB_size => net_gnd4,
      SDMA_CTRL4_PLB_type => net_gnd3,
      SDMA_CTRL4_PLB_lockErr => net_gnd0,
      SDMA_CTRL4_PLB_wrPendReq => net_gnd0,
      SDMA_CTRL4_PLB_wrPendPri => net_gnd2,
      SDMA_CTRL4_PLB_rdPendReq => net_gnd0,
      SDMA_CTRL4_PLB_rdPendPri => net_gnd2,
      SDMA_CTRL4_PLB_reqPri => net_gnd2,
      SDMA_CTRL4_PLB_TAttribute => net_gnd16,
      SDMA_CTRL4_PLB_rdBurst => net_gnd0,
      SDMA_CTRL4_PLB_wrBurst => net_gnd0,
      SDMA_CTRL4_PLB_wrDBus => net_gnd64,
      SDMA_CTRL4_Sl_addrAck => open,
      SDMA_CTRL4_Sl_SSize => open,
      SDMA_CTRL4_Sl_wait => open,
      SDMA_CTRL4_Sl_rearbitrate => open,
      SDMA_CTRL4_Sl_wrDAck => open,
      SDMA_CTRL4_Sl_wrComp => open,
      SDMA_CTRL4_Sl_wrBTerm => open,
      SDMA_CTRL4_Sl_rdDBus => open,
      SDMA_CTRL4_Sl_rdWdAddr => open,
      SDMA_CTRL4_Sl_rdDAck => open,
      SDMA_CTRL4_Sl_rdComp => open,
      SDMA_CTRL4_Sl_rdBTerm => open,
      SDMA_CTRL4_Sl_MBusy => open,
      SDMA_CTRL4_Sl_MRdErr => open,
      SDMA_CTRL4_Sl_MWrErr => open,
      SDMA_CTRL4_Sl_MIRQ => open,
      PIM4_Addr => net_gnd32,
      PIM4_AddrReq => net_gnd0,
      PIM4_AddrAck => open,
      PIM4_RNW => net_gnd0,
      PIM4_Size => net_gnd4(0 to 3),
      PIM4_RdModWr => net_gnd0,
      PIM4_WrFIFO_Data => net_gnd64(0 to 63),
      PIM4_WrFIFO_BE => net_gnd8(0 to 7),
      PIM4_WrFIFO_Push => net_gnd0,
      PIM4_RdFIFO_Data => open,
      PIM4_RdFIFO_Pop => net_gnd0,
      PIM4_RdFIFO_RdWdAddr => open,
      PIM4_WrFIFO_Empty => open,
      PIM4_WrFIFO_AlmostFull => open,
      PIM4_WrFIFO_Flush => net_gnd0,
      PIM4_RdFIFO_Empty => open,
      PIM4_RdFIFO_Flush => net_gnd0,
      PIM4_RdFIFO_Latency => open,
      PIM4_InitDone => open,
      PPC440MC4_MIMCReadNotWrite => net_gnd0,
      PPC440MC4_MIMCAddress => net_gnd36,
      PPC440MC4_MIMCAddressValid => net_gnd0,
      PPC440MC4_MIMCWriteData => net_gnd128,
      PPC440MC4_MIMCWriteDataValid => net_gnd0,
      PPC440MC4_MIMCByteEnable => net_gnd16,
      PPC440MC4_MIMCBankConflict => net_gnd0,
      PPC440MC4_MIMCRowConflict => net_gnd0,
      PPC440MC4_MCMIReadData => open,
      PPC440MC4_MCMIReadDataValid => open,
      PPC440MC4_MCMIReadDataErr => open,
      PPC440MC4_MCMIAddrReadyToAccept => open,
      VFBC4_Cmd_Clk => net_gnd0,
      VFBC4_Cmd_Reset => net_gnd0,
      VFBC4_Cmd_Data => net_gnd32,
      VFBC4_Cmd_Write => net_gnd0,
      VFBC4_Cmd_End => net_gnd0,
      VFBC4_Cmd_Full => open,
      VFBC4_Cmd_Almost_Full => open,
      VFBC4_Cmd_Idle => open,
      VFBC4_Wd_Clk => net_gnd0,
      VFBC4_Wd_Reset => net_gnd0,
      VFBC4_Wd_Write => net_gnd0,
      VFBC4_Wd_End_Burst => net_gnd0,
      VFBC4_Wd_Flush => net_gnd0,
      VFBC4_Wd_Data => net_gnd32,
      VFBC4_Wd_Data_BE => net_gnd4(0 to 3),
      VFBC4_Wd_Full => open,
      VFBC4_Wd_Almost_Full => open,
      VFBC4_Rd_Clk => net_gnd0,
      VFBC4_Rd_Reset => net_gnd0,
      VFBC4_Rd_Read => net_gnd0,
      VFBC4_Rd_End_Burst => net_gnd0,
      VFBC4_Rd_Flush => net_gnd0,
      VFBC4_Rd_Data => open,
      VFBC4_Rd_Empty => open,
      VFBC4_Rd_Almost_Empty => open,
      MCB4_cmd_clk => net_gnd0,
      MCB4_cmd_en => net_gnd0,
      MCB4_cmd_instr => net_gnd3(0 to 2),
      MCB4_cmd_bl => net_gnd6,
      MCB4_cmd_byte_addr => net_gnd30,
      MCB4_cmd_empty => open,
      MCB4_cmd_full => open,
      MCB4_wr_clk => net_gnd0,
      MCB4_wr_en => net_gnd0,
      MCB4_wr_mask => net_gnd8(0 to 7),
      MCB4_wr_data => net_gnd64(0 to 63),
      MCB4_wr_full => open,
      MCB4_wr_empty => open,
      MCB4_wr_count => open,
      MCB4_wr_underrun => open,
      MCB4_wr_error => open,
      MCB4_rd_clk => net_gnd0,
      MCB4_rd_en => net_gnd0,
      MCB4_rd_data => open,
      MCB4_rd_full => open,
      MCB4_rd_empty => open,
      MCB4_rd_count => open,
      MCB4_rd_overflow => open,
      MCB4_rd_error => open,
      FSL5_M_Clk => net_vcc0,
      FSL5_M_Write => net_gnd0,
      FSL5_M_Data => net_gnd32(31 downto 0),
      FSL5_M_Control => net_gnd0,
      FSL5_M_Full => open,
      FSL5_S_Clk => net_gnd0,
      FSL5_S_Read => net_gnd0,
      FSL5_S_Data => open,
      FSL5_S_Control => open,
      FSL5_S_Exists => open,
      FSL5_B_M_Clk => net_vcc0,
      FSL5_B_M_Write => net_gnd0,
      FSL5_B_M_Data => net_gnd32(31 downto 0),
      FSL5_B_M_Control => net_gnd0,
      FSL5_B_M_Full => open,
      FSL5_B_S_Clk => net_gnd0,
      FSL5_B_S_Read => net_gnd0,
      FSL5_B_S_Data => open,
      FSL5_B_S_Control => open,
      FSL5_B_S_Exists => open,
      SPLB5_Clk => net_vcc0,
      SPLB5_Rst => net_gnd0,
      SPLB5_PLB_ABus => net_gnd32(31 downto 0),
      SPLB5_PLB_PAValid => net_gnd0,
      SPLB5_PLB_SAValid => net_gnd0,
      SPLB5_PLB_masterID => net_gnd1(0 to 0),
      SPLB5_PLB_RNW => net_gnd0,
      SPLB5_PLB_BE => net_gnd8,
      SPLB5_PLB_UABus => net_gnd32(31 downto 0),
      SPLB5_PLB_rdPrim => net_gnd0,
      SPLB5_PLB_wrPrim => net_gnd0,
      SPLB5_PLB_abort => net_gnd0,
      SPLB5_PLB_busLock => net_gnd0,
      SPLB5_PLB_MSize => net_gnd2,
      SPLB5_PLB_size => net_gnd4,
      SPLB5_PLB_type => net_gnd3,
      SPLB5_PLB_lockErr => net_gnd0,
      SPLB5_PLB_wrPendReq => net_gnd0,
      SPLB5_PLB_wrPendPri => net_gnd2,
      SPLB5_PLB_rdPendReq => net_gnd0,
      SPLB5_PLB_rdPendPri => net_gnd2,
      SPLB5_PLB_reqPri => net_gnd2,
      SPLB5_PLB_TAttribute => net_gnd16,
      SPLB5_PLB_rdBurst => net_gnd0,
      SPLB5_PLB_wrBurst => net_gnd0,
      SPLB5_PLB_wrDBus => net_gnd64,
      SPLB5_Sl_addrAck => open,
      SPLB5_Sl_SSize => open,
      SPLB5_Sl_wait => open,
      SPLB5_Sl_rearbitrate => open,
      SPLB5_Sl_wrDAck => open,
      SPLB5_Sl_wrComp => open,
      SPLB5_Sl_wrBTerm => open,
      SPLB5_Sl_rdDBus => open,
      SPLB5_Sl_rdWdAddr => open,
      SPLB5_Sl_rdDAck => open,
      SPLB5_Sl_rdComp => open,
      SPLB5_Sl_rdBTerm => open,
      SPLB5_Sl_MBusy => open,
      SPLB5_Sl_MRdErr => open,
      SPLB5_Sl_MWrErr => open,
      SPLB5_Sl_MIRQ => open,
      SDMA5_Clk => net_gnd0,
      SDMA5_Rx_IntOut => open,
      SDMA5_Tx_IntOut => open,
      SDMA5_RstOut => open,
      SDMA5_TX_D => open,
      SDMA5_TX_Rem => open,
      SDMA5_TX_SOF => open,
      SDMA5_TX_EOF => open,
      SDMA5_TX_SOP => open,
      SDMA5_TX_EOP => open,
      SDMA5_TX_Src_Rdy => open,
      SDMA5_TX_Dst_Rdy => net_vcc0,
      SDMA5_RX_D => net_gnd32(31 downto 0),
      SDMA5_RX_Rem => net_vcc4,
      SDMA5_RX_SOF => net_vcc0,
      SDMA5_RX_EOF => net_vcc0,
      SDMA5_RX_SOP => net_vcc0,
      SDMA5_RX_EOP => net_vcc0,
      SDMA5_RX_Src_Rdy => net_vcc0,
      SDMA5_RX_Dst_Rdy => open,
      SDMA_CTRL5_Clk => net_vcc0,
      SDMA_CTRL5_Rst => net_gnd0,
      SDMA_CTRL5_PLB_ABus => net_gnd32(31 downto 0),
      SDMA_CTRL5_PLB_PAValid => net_gnd0,
      SDMA_CTRL5_PLB_SAValid => net_gnd0,
      SDMA_CTRL5_PLB_masterID => net_gnd1(0 to 0),
      SDMA_CTRL5_PLB_RNW => net_gnd0,
      SDMA_CTRL5_PLB_BE => net_gnd8,
      SDMA_CTRL5_PLB_UABus => net_gnd32(31 downto 0),
      SDMA_CTRL5_PLB_rdPrim => net_gnd0,
      SDMA_CTRL5_PLB_wrPrim => net_gnd0,
      SDMA_CTRL5_PLB_abort => net_gnd0,
      SDMA_CTRL5_PLB_busLock => net_gnd0,
      SDMA_CTRL5_PLB_MSize => net_gnd2,
      SDMA_CTRL5_PLB_size => net_gnd4,
      SDMA_CTRL5_PLB_type => net_gnd3,
      SDMA_CTRL5_PLB_lockErr => net_gnd0,
      SDMA_CTRL5_PLB_wrPendReq => net_gnd0,
      SDMA_CTRL5_PLB_wrPendPri => net_gnd2,
      SDMA_CTRL5_PLB_rdPendReq => net_gnd0,
      SDMA_CTRL5_PLB_rdPendPri => net_gnd2,
      SDMA_CTRL5_PLB_reqPri => net_gnd2,
      SDMA_CTRL5_PLB_TAttribute => net_gnd16,
      SDMA_CTRL5_PLB_rdBurst => net_gnd0,
      SDMA_CTRL5_PLB_wrBurst => net_gnd0,
      SDMA_CTRL5_PLB_wrDBus => net_gnd64,
      SDMA_CTRL5_Sl_addrAck => open,
      SDMA_CTRL5_Sl_SSize => open,
      SDMA_CTRL5_Sl_wait => open,
      SDMA_CTRL5_Sl_rearbitrate => open,
      SDMA_CTRL5_Sl_wrDAck => open,
      SDMA_CTRL5_Sl_wrComp => open,
      SDMA_CTRL5_Sl_wrBTerm => open,
      SDMA_CTRL5_Sl_rdDBus => open,
      SDMA_CTRL5_Sl_rdWdAddr => open,
      SDMA_CTRL5_Sl_rdDAck => open,
      SDMA_CTRL5_Sl_rdComp => open,
      SDMA_CTRL5_Sl_rdBTerm => open,
      SDMA_CTRL5_Sl_MBusy => open,
      SDMA_CTRL5_Sl_MRdErr => open,
      SDMA_CTRL5_Sl_MWrErr => open,
      SDMA_CTRL5_Sl_MIRQ => open,
      PIM5_Addr => net_gnd32,
      PIM5_AddrReq => net_gnd0,
      PIM5_AddrAck => open,
      PIM5_RNW => net_gnd0,
      PIM5_Size => net_gnd4(0 to 3),
      PIM5_RdModWr => net_gnd0,
      PIM5_WrFIFO_Data => net_gnd64(0 to 63),
      PIM5_WrFIFO_BE => net_gnd8(0 to 7),
      PIM5_WrFIFO_Push => net_gnd0,
      PIM5_RdFIFO_Data => open,
      PIM5_RdFIFO_Pop => net_gnd0,
      PIM5_RdFIFO_RdWdAddr => open,
      PIM5_WrFIFO_Empty => open,
      PIM5_WrFIFO_AlmostFull => open,
      PIM5_WrFIFO_Flush => net_gnd0,
      PIM5_RdFIFO_Empty => open,
      PIM5_RdFIFO_Flush => net_gnd0,
      PIM5_RdFIFO_Latency => open,
      PIM5_InitDone => open,
      PPC440MC5_MIMCReadNotWrite => net_gnd0,
      PPC440MC5_MIMCAddress => net_gnd36,
      PPC440MC5_MIMCAddressValid => net_gnd0,
      PPC440MC5_MIMCWriteData => net_gnd128,
      PPC440MC5_MIMCWriteDataValid => net_gnd0,
      PPC440MC5_MIMCByteEnable => net_gnd16,
      PPC440MC5_MIMCBankConflict => net_gnd0,
      PPC440MC5_MIMCRowConflict => net_gnd0,
      PPC440MC5_MCMIReadData => open,
      PPC440MC5_MCMIReadDataValid => open,
      PPC440MC5_MCMIReadDataErr => open,
      PPC440MC5_MCMIAddrReadyToAccept => open,
      VFBC5_Cmd_Clk => net_gnd0,
      VFBC5_Cmd_Reset => net_gnd0,
      VFBC5_Cmd_Data => net_gnd32,
      VFBC5_Cmd_Write => net_gnd0,
      VFBC5_Cmd_End => net_gnd0,
      VFBC5_Cmd_Full => open,
      VFBC5_Cmd_Almost_Full => open,
      VFBC5_Cmd_Idle => open,
      VFBC5_Wd_Clk => net_gnd0,
      VFBC5_Wd_Reset => net_gnd0,
      VFBC5_Wd_Write => net_gnd0,
      VFBC5_Wd_End_Burst => net_gnd0,
      VFBC5_Wd_Flush => net_gnd0,
      VFBC5_Wd_Data => net_gnd32,
      VFBC5_Wd_Data_BE => net_gnd4(0 to 3),
      VFBC5_Wd_Full => open,
      VFBC5_Wd_Almost_Full => open,
      VFBC5_Rd_Clk => net_gnd0,
      VFBC5_Rd_Reset => net_gnd0,
      VFBC5_Rd_Read => net_gnd0,
      VFBC5_Rd_End_Burst => net_gnd0,
      VFBC5_Rd_Flush => net_gnd0,
      VFBC5_Rd_Data => open,
      VFBC5_Rd_Empty => open,
      VFBC5_Rd_Almost_Empty => open,
      MCB5_cmd_clk => net_gnd0,
      MCB5_cmd_en => net_gnd0,
      MCB5_cmd_instr => net_gnd3(0 to 2),
      MCB5_cmd_bl => net_gnd6,
      MCB5_cmd_byte_addr => net_gnd30,
      MCB5_cmd_empty => open,
      MCB5_cmd_full => open,
      MCB5_wr_clk => net_gnd0,
      MCB5_wr_en => net_gnd0,
      MCB5_wr_mask => net_gnd8(0 to 7),
      MCB5_wr_data => net_gnd64(0 to 63),
      MCB5_wr_full => open,
      MCB5_wr_empty => open,
      MCB5_wr_count => open,
      MCB5_wr_underrun => open,
      MCB5_wr_error => open,
      MCB5_rd_clk => net_gnd0,
      MCB5_rd_en => net_gnd0,
      MCB5_rd_data => open,
      MCB5_rd_full => open,
      MCB5_rd_empty => open,
      MCB5_rd_count => open,
      MCB5_rd_overflow => open,
      MCB5_rd_error => open,
      FSL6_M_Clk => net_vcc0,
      FSL6_M_Write => net_gnd0,
      FSL6_M_Data => net_gnd32(31 downto 0),
      FSL6_M_Control => net_gnd0,
      FSL6_M_Full => open,
      FSL6_S_Clk => net_gnd0,
      FSL6_S_Read => net_gnd0,
      FSL6_S_Data => open,
      FSL6_S_Control => open,
      FSL6_S_Exists => open,
      FSL6_B_M_Clk => net_vcc0,
      FSL6_B_M_Write => net_gnd0,
      FSL6_B_M_Data => net_gnd32(31 downto 0),
      FSL6_B_M_Control => net_gnd0,
      FSL6_B_M_Full => open,
      FSL6_B_S_Clk => net_gnd0,
      FSL6_B_S_Read => net_gnd0,
      FSL6_B_S_Data => open,
      FSL6_B_S_Control => open,
      FSL6_B_S_Exists => open,
      SPLB6_Clk => net_vcc0,
      SPLB6_Rst => net_gnd0,
      SPLB6_PLB_ABus => net_gnd32(31 downto 0),
      SPLB6_PLB_PAValid => net_gnd0,
      SPLB6_PLB_SAValid => net_gnd0,
      SPLB6_PLB_masterID => net_gnd1(0 to 0),
      SPLB6_PLB_RNW => net_gnd0,
      SPLB6_PLB_BE => net_gnd8,
      SPLB6_PLB_UABus => net_gnd32(31 downto 0),
      SPLB6_PLB_rdPrim => net_gnd0,
      SPLB6_PLB_wrPrim => net_gnd0,
      SPLB6_PLB_abort => net_gnd0,
      SPLB6_PLB_busLock => net_gnd0,
      SPLB6_PLB_MSize => net_gnd2,
      SPLB6_PLB_size => net_gnd4,
      SPLB6_PLB_type => net_gnd3,
      SPLB6_PLB_lockErr => net_gnd0,
      SPLB6_PLB_wrPendReq => net_gnd0,
      SPLB6_PLB_wrPendPri => net_gnd2,
      SPLB6_PLB_rdPendReq => net_gnd0,
      SPLB6_PLB_rdPendPri => net_gnd2,
      SPLB6_PLB_reqPri => net_gnd2,
      SPLB6_PLB_TAttribute => net_gnd16,
      SPLB6_PLB_rdBurst => net_gnd0,
      SPLB6_PLB_wrBurst => net_gnd0,
      SPLB6_PLB_wrDBus => net_gnd64,
      SPLB6_Sl_addrAck => open,
      SPLB6_Sl_SSize => open,
      SPLB6_Sl_wait => open,
      SPLB6_Sl_rearbitrate => open,
      SPLB6_Sl_wrDAck => open,
      SPLB6_Sl_wrComp => open,
      SPLB6_Sl_wrBTerm => open,
      SPLB6_Sl_rdDBus => open,
      SPLB6_Sl_rdWdAddr => open,
      SPLB6_Sl_rdDAck => open,
      SPLB6_Sl_rdComp => open,
      SPLB6_Sl_rdBTerm => open,
      SPLB6_Sl_MBusy => open,
      SPLB6_Sl_MRdErr => open,
      SPLB6_Sl_MWrErr => open,
      SPLB6_Sl_MIRQ => open,
      SDMA6_Clk => net_gnd0,
      SDMA6_Rx_IntOut => open,
      SDMA6_Tx_IntOut => open,
      SDMA6_RstOut => open,
      SDMA6_TX_D => open,
      SDMA6_TX_Rem => open,
      SDMA6_TX_SOF => open,
      SDMA6_TX_EOF => open,
      SDMA6_TX_SOP => open,
      SDMA6_TX_EOP => open,
      SDMA6_TX_Src_Rdy => open,
      SDMA6_TX_Dst_Rdy => net_vcc0,
      SDMA6_RX_D => net_gnd32(31 downto 0),
      SDMA6_RX_Rem => net_vcc4,
      SDMA6_RX_SOF => net_vcc0,
      SDMA6_RX_EOF => net_vcc0,
      SDMA6_RX_SOP => net_vcc0,
      SDMA6_RX_EOP => net_vcc0,
      SDMA6_RX_Src_Rdy => net_vcc0,
      SDMA6_RX_Dst_Rdy => open,
      SDMA_CTRL6_Clk => net_vcc0,
      SDMA_CTRL6_Rst => net_gnd0,
      SDMA_CTRL6_PLB_ABus => net_gnd32(31 downto 0),
      SDMA_CTRL6_PLB_PAValid => net_gnd0,
      SDMA_CTRL6_PLB_SAValid => net_gnd0,
      SDMA_CTRL6_PLB_masterID => net_gnd1(0 to 0),
      SDMA_CTRL6_PLB_RNW => net_gnd0,
      SDMA_CTRL6_PLB_BE => net_gnd8,
      SDMA_CTRL6_PLB_UABus => net_gnd32(31 downto 0),
      SDMA_CTRL6_PLB_rdPrim => net_gnd0,
      SDMA_CTRL6_PLB_wrPrim => net_gnd0,
      SDMA_CTRL6_PLB_abort => net_gnd0,
      SDMA_CTRL6_PLB_busLock => net_gnd0,
      SDMA_CTRL6_PLB_MSize => net_gnd2,
      SDMA_CTRL6_PLB_size => net_gnd4,
      SDMA_CTRL6_PLB_type => net_gnd3,
      SDMA_CTRL6_PLB_lockErr => net_gnd0,
      SDMA_CTRL6_PLB_wrPendReq => net_gnd0,
      SDMA_CTRL6_PLB_wrPendPri => net_gnd2,
      SDMA_CTRL6_PLB_rdPendReq => net_gnd0,
      SDMA_CTRL6_PLB_rdPendPri => net_gnd2,
      SDMA_CTRL6_PLB_reqPri => net_gnd2,
      SDMA_CTRL6_PLB_TAttribute => net_gnd16,
      SDMA_CTRL6_PLB_rdBurst => net_gnd0,
      SDMA_CTRL6_PLB_wrBurst => net_gnd0,
      SDMA_CTRL6_PLB_wrDBus => net_gnd64,
      SDMA_CTRL6_Sl_addrAck => open,
      SDMA_CTRL6_Sl_SSize => open,
      SDMA_CTRL6_Sl_wait => open,
      SDMA_CTRL6_Sl_rearbitrate => open,
      SDMA_CTRL6_Sl_wrDAck => open,
      SDMA_CTRL6_Sl_wrComp => open,
      SDMA_CTRL6_Sl_wrBTerm => open,
      SDMA_CTRL6_Sl_rdDBus => open,
      SDMA_CTRL6_Sl_rdWdAddr => open,
      SDMA_CTRL6_Sl_rdDAck => open,
      SDMA_CTRL6_Sl_rdComp => open,
      SDMA_CTRL6_Sl_rdBTerm => open,
      SDMA_CTRL6_Sl_MBusy => open,
      SDMA_CTRL6_Sl_MRdErr => open,
      SDMA_CTRL6_Sl_MWrErr => open,
      SDMA_CTRL6_Sl_MIRQ => open,
      PIM6_Addr => net_gnd32,
      PIM6_AddrReq => net_gnd0,
      PIM6_AddrAck => open,
      PIM6_RNW => net_gnd0,
      PIM6_Size => net_gnd4(0 to 3),
      PIM6_RdModWr => net_gnd0,
      PIM6_WrFIFO_Data => net_gnd64(0 to 63),
      PIM6_WrFIFO_BE => net_gnd8(0 to 7),
      PIM6_WrFIFO_Push => net_gnd0,
      PIM6_RdFIFO_Data => open,
      PIM6_RdFIFO_Pop => net_gnd0,
      PIM6_RdFIFO_RdWdAddr => open,
      PIM6_WrFIFO_Empty => open,
      PIM6_WrFIFO_AlmostFull => open,
      PIM6_WrFIFO_Flush => net_gnd0,
      PIM6_RdFIFO_Empty => open,
      PIM6_RdFIFO_Flush => net_gnd0,
      PIM6_RdFIFO_Latency => open,
      PIM6_InitDone => open,
      PPC440MC6_MIMCReadNotWrite => net_gnd0,
      PPC440MC6_MIMCAddress => net_gnd36,
      PPC440MC6_MIMCAddressValid => net_gnd0,
      PPC440MC6_MIMCWriteData => net_gnd128,
      PPC440MC6_MIMCWriteDataValid => net_gnd0,
      PPC440MC6_MIMCByteEnable => net_gnd16,
      PPC440MC6_MIMCBankConflict => net_gnd0,
      PPC440MC6_MIMCRowConflict => net_gnd0,
      PPC440MC6_MCMIReadData => open,
      PPC440MC6_MCMIReadDataValid => open,
      PPC440MC6_MCMIReadDataErr => open,
      PPC440MC6_MCMIAddrReadyToAccept => open,
      VFBC6_Cmd_Clk => net_gnd0,
      VFBC6_Cmd_Reset => net_gnd0,
      VFBC6_Cmd_Data => net_gnd32,
      VFBC6_Cmd_Write => net_gnd0,
      VFBC6_Cmd_End => net_gnd0,
      VFBC6_Cmd_Full => open,
      VFBC6_Cmd_Almost_Full => open,
      VFBC6_Cmd_Idle => open,
      VFBC6_Wd_Clk => net_gnd0,
      VFBC6_Wd_Reset => net_gnd0,
      VFBC6_Wd_Write => net_gnd0,
      VFBC6_Wd_End_Burst => net_gnd0,
      VFBC6_Wd_Flush => net_gnd0,
      VFBC6_Wd_Data => net_gnd32,
      VFBC6_Wd_Data_BE => net_gnd4(0 to 3),
      VFBC6_Wd_Full => open,
      VFBC6_Wd_Almost_Full => open,
      VFBC6_Rd_Clk => net_gnd0,
      VFBC6_Rd_Reset => net_gnd0,
      VFBC6_Rd_Read => net_gnd0,
      VFBC6_Rd_End_Burst => net_gnd0,
      VFBC6_Rd_Flush => net_gnd0,
      VFBC6_Rd_Data => open,
      VFBC6_Rd_Empty => open,
      VFBC6_Rd_Almost_Empty => open,
      MCB6_cmd_clk => net_gnd0,
      MCB6_cmd_en => net_gnd0,
      MCB6_cmd_instr => net_gnd3(0 to 2),
      MCB6_cmd_bl => net_gnd6,
      MCB6_cmd_byte_addr => net_gnd30,
      MCB6_cmd_empty => open,
      MCB6_cmd_full => open,
      MCB6_wr_clk => net_gnd0,
      MCB6_wr_en => net_gnd0,
      MCB6_wr_mask => net_gnd8(0 to 7),
      MCB6_wr_data => net_gnd64(0 to 63),
      MCB6_wr_full => open,
      MCB6_wr_empty => open,
      MCB6_wr_count => open,
      MCB6_wr_underrun => open,
      MCB6_wr_error => open,
      MCB6_rd_clk => net_gnd0,
      MCB6_rd_en => net_gnd0,
      MCB6_rd_data => open,
      MCB6_rd_full => open,
      MCB6_rd_empty => open,
      MCB6_rd_count => open,
      MCB6_rd_overflow => open,
      MCB6_rd_error => open,
      FSL7_M_Clk => net_vcc0,
      FSL7_M_Write => net_gnd0,
      FSL7_M_Data => net_gnd32(31 downto 0),
      FSL7_M_Control => net_gnd0,
      FSL7_M_Full => open,
      FSL7_S_Clk => net_gnd0,
      FSL7_S_Read => net_gnd0,
      FSL7_S_Data => open,
      FSL7_S_Control => open,
      FSL7_S_Exists => open,
      FSL7_B_M_Clk => net_vcc0,
      FSL7_B_M_Write => net_gnd0,
      FSL7_B_M_Data => net_gnd32(31 downto 0),
      FSL7_B_M_Control => net_gnd0,
      FSL7_B_M_Full => open,
      FSL7_B_S_Clk => net_gnd0,
      FSL7_B_S_Read => net_gnd0,
      FSL7_B_S_Data => open,
      FSL7_B_S_Control => open,
      FSL7_B_S_Exists => open,
      SPLB7_Clk => net_vcc0,
      SPLB7_Rst => net_gnd0,
      SPLB7_PLB_ABus => net_gnd32(31 downto 0),
      SPLB7_PLB_PAValid => net_gnd0,
      SPLB7_PLB_SAValid => net_gnd0,
      SPLB7_PLB_masterID => net_gnd1(0 to 0),
      SPLB7_PLB_RNW => net_gnd0,
      SPLB7_PLB_BE => net_gnd8,
      SPLB7_PLB_UABus => net_gnd32(31 downto 0),
      SPLB7_PLB_rdPrim => net_gnd0,
      SPLB7_PLB_wrPrim => net_gnd0,
      SPLB7_PLB_abort => net_gnd0,
      SPLB7_PLB_busLock => net_gnd0,
      SPLB7_PLB_MSize => net_gnd2,
      SPLB7_PLB_size => net_gnd4,
      SPLB7_PLB_type => net_gnd3,
      SPLB7_PLB_lockErr => net_gnd0,
      SPLB7_PLB_wrPendReq => net_gnd0,
      SPLB7_PLB_wrPendPri => net_gnd2,
      SPLB7_PLB_rdPendReq => net_gnd0,
      SPLB7_PLB_rdPendPri => net_gnd2,
      SPLB7_PLB_reqPri => net_gnd2,
      SPLB7_PLB_TAttribute => net_gnd16,
      SPLB7_PLB_rdBurst => net_gnd0,
      SPLB7_PLB_wrBurst => net_gnd0,
      SPLB7_PLB_wrDBus => net_gnd64,
      SPLB7_Sl_addrAck => open,
      SPLB7_Sl_SSize => open,
      SPLB7_Sl_wait => open,
      SPLB7_Sl_rearbitrate => open,
      SPLB7_Sl_wrDAck => open,
      SPLB7_Sl_wrComp => open,
      SPLB7_Sl_wrBTerm => open,
      SPLB7_Sl_rdDBus => open,
      SPLB7_Sl_rdWdAddr => open,
      SPLB7_Sl_rdDAck => open,
      SPLB7_Sl_rdComp => open,
      SPLB7_Sl_rdBTerm => open,
      SPLB7_Sl_MBusy => open,
      SPLB7_Sl_MRdErr => open,
      SPLB7_Sl_MWrErr => open,
      SPLB7_Sl_MIRQ => open,
      SDMA7_Clk => net_gnd0,
      SDMA7_Rx_IntOut => open,
      SDMA7_Tx_IntOut => open,
      SDMA7_RstOut => open,
      SDMA7_TX_D => open,
      SDMA7_TX_Rem => open,
      SDMA7_TX_SOF => open,
      SDMA7_TX_EOF => open,
      SDMA7_TX_SOP => open,
      SDMA7_TX_EOP => open,
      SDMA7_TX_Src_Rdy => open,
      SDMA7_TX_Dst_Rdy => net_vcc0,
      SDMA7_RX_D => net_gnd32(31 downto 0),
      SDMA7_RX_Rem => net_vcc4,
      SDMA7_RX_SOF => net_vcc0,
      SDMA7_RX_EOF => net_vcc0,
      SDMA7_RX_SOP => net_vcc0,
      SDMA7_RX_EOP => net_vcc0,
      SDMA7_RX_Src_Rdy => net_vcc0,
      SDMA7_RX_Dst_Rdy => open,
      SDMA_CTRL7_Clk => net_vcc0,
      SDMA_CTRL7_Rst => net_gnd0,
      SDMA_CTRL7_PLB_ABus => net_gnd32(31 downto 0),
      SDMA_CTRL7_PLB_PAValid => net_gnd0,
      SDMA_CTRL7_PLB_SAValid => net_gnd0,
      SDMA_CTRL7_PLB_masterID => net_gnd1(0 to 0),
      SDMA_CTRL7_PLB_RNW => net_gnd0,
      SDMA_CTRL7_PLB_BE => net_gnd8,
      SDMA_CTRL7_PLB_UABus => net_gnd32(31 downto 0),
      SDMA_CTRL7_PLB_rdPrim => net_gnd0,
      SDMA_CTRL7_PLB_wrPrim => net_gnd0,
      SDMA_CTRL7_PLB_abort => net_gnd0,
      SDMA_CTRL7_PLB_busLock => net_gnd0,
      SDMA_CTRL7_PLB_MSize => net_gnd2,
      SDMA_CTRL7_PLB_size => net_gnd4,
      SDMA_CTRL7_PLB_type => net_gnd3,
      SDMA_CTRL7_PLB_lockErr => net_gnd0,
      SDMA_CTRL7_PLB_wrPendReq => net_gnd0,
      SDMA_CTRL7_PLB_wrPendPri => net_gnd2,
      SDMA_CTRL7_PLB_rdPendReq => net_gnd0,
      SDMA_CTRL7_PLB_rdPendPri => net_gnd2,
      SDMA_CTRL7_PLB_reqPri => net_gnd2,
      SDMA_CTRL7_PLB_TAttribute => net_gnd16,
      SDMA_CTRL7_PLB_rdBurst => net_gnd0,
      SDMA_CTRL7_PLB_wrBurst => net_gnd0,
      SDMA_CTRL7_PLB_wrDBus => net_gnd64,
      SDMA_CTRL7_Sl_addrAck => open,
      SDMA_CTRL7_Sl_SSize => open,
      SDMA_CTRL7_Sl_wait => open,
      SDMA_CTRL7_Sl_rearbitrate => open,
      SDMA_CTRL7_Sl_wrDAck => open,
      SDMA_CTRL7_Sl_wrComp => open,
      SDMA_CTRL7_Sl_wrBTerm => open,
      SDMA_CTRL7_Sl_rdDBus => open,
      SDMA_CTRL7_Sl_rdWdAddr => open,
      SDMA_CTRL7_Sl_rdDAck => open,
      SDMA_CTRL7_Sl_rdComp => open,
      SDMA_CTRL7_Sl_rdBTerm => open,
      SDMA_CTRL7_Sl_MBusy => open,
      SDMA_CTRL7_Sl_MRdErr => open,
      SDMA_CTRL7_Sl_MWrErr => open,
      SDMA_CTRL7_Sl_MIRQ => open,
      PIM7_Addr => net_gnd32,
      PIM7_AddrReq => net_gnd0,
      PIM7_AddrAck => open,
      PIM7_RNW => net_gnd0,
      PIM7_Size => net_gnd4(0 to 3),
      PIM7_RdModWr => net_gnd0,
      PIM7_WrFIFO_Data => net_gnd64(0 to 63),
      PIM7_WrFIFO_BE => net_gnd8(0 to 7),
      PIM7_WrFIFO_Push => net_gnd0,
      PIM7_RdFIFO_Data => open,
      PIM7_RdFIFO_Pop => net_gnd0,
      PIM7_RdFIFO_RdWdAddr => open,
      PIM7_WrFIFO_Empty => open,
      PIM7_WrFIFO_AlmostFull => open,
      PIM7_WrFIFO_Flush => net_gnd0,
      PIM7_RdFIFO_Empty => open,
      PIM7_RdFIFO_Flush => net_gnd0,
      PIM7_RdFIFO_Latency => open,
      PIM7_InitDone => open,
      PPC440MC7_MIMCReadNotWrite => net_gnd0,
      PPC440MC7_MIMCAddress => net_gnd36,
      PPC440MC7_MIMCAddressValid => net_gnd0,
      PPC440MC7_MIMCWriteData => net_gnd128,
      PPC440MC7_MIMCWriteDataValid => net_gnd0,
      PPC440MC7_MIMCByteEnable => net_gnd16,
      PPC440MC7_MIMCBankConflict => net_gnd0,
      PPC440MC7_MIMCRowConflict => net_gnd0,
      PPC440MC7_MCMIReadData => open,
      PPC440MC7_MCMIReadDataValid => open,
      PPC440MC7_MCMIReadDataErr => open,
      PPC440MC7_MCMIAddrReadyToAccept => open,
      VFBC7_Cmd_Clk => net_gnd0,
      VFBC7_Cmd_Reset => net_gnd0,
      VFBC7_Cmd_Data => net_gnd32,
      VFBC7_Cmd_Write => net_gnd0,
      VFBC7_Cmd_End => net_gnd0,
      VFBC7_Cmd_Full => open,
      VFBC7_Cmd_Almost_Full => open,
      VFBC7_Cmd_Idle => open,
      VFBC7_Wd_Clk => net_gnd0,
      VFBC7_Wd_Reset => net_gnd0,
      VFBC7_Wd_Write => net_gnd0,
      VFBC7_Wd_End_Burst => net_gnd0,
      VFBC7_Wd_Flush => net_gnd0,
      VFBC7_Wd_Data => net_gnd32,
      VFBC7_Wd_Data_BE => net_gnd4(0 to 3),
      VFBC7_Wd_Full => open,
      VFBC7_Wd_Almost_Full => open,
      VFBC7_Rd_Clk => net_gnd0,
      VFBC7_Rd_Reset => net_gnd0,
      VFBC7_Rd_Read => net_gnd0,
      VFBC7_Rd_End_Burst => net_gnd0,
      VFBC7_Rd_Flush => net_gnd0,
      VFBC7_Rd_Data => open,
      VFBC7_Rd_Empty => open,
      VFBC7_Rd_Almost_Empty => open,
      MCB7_cmd_clk => net_gnd0,
      MCB7_cmd_en => net_gnd0,
      MCB7_cmd_instr => net_gnd3(0 to 2),
      MCB7_cmd_bl => net_gnd6,
      MCB7_cmd_byte_addr => net_gnd30,
      MCB7_cmd_empty => open,
      MCB7_cmd_full => open,
      MCB7_wr_clk => net_gnd0,
      MCB7_wr_en => net_gnd0,
      MCB7_wr_mask => net_gnd8(0 to 7),
      MCB7_wr_data => net_gnd64(0 to 63),
      MCB7_wr_full => open,
      MCB7_wr_empty => open,
      MCB7_wr_count => open,
      MCB7_wr_underrun => open,
      MCB7_wr_error => open,
      MCB7_rd_clk => net_gnd0,
      MCB7_rd_en => net_gnd0,
      MCB7_rd_data => open,
      MCB7_rd_full => open,
      MCB7_rd_empty => open,
      MCB7_rd_count => open,
      MCB7_rd_overflow => open,
      MCB7_rd_error => open,
      MPMC_CTRL_Clk => net_vcc0,
      MPMC_CTRL_Rst => net_gnd0,
      MPMC_CTRL_PLB_ABus => net_gnd32(31 downto 0),
      MPMC_CTRL_PLB_PAValid => net_gnd0,
      MPMC_CTRL_PLB_SAValid => net_gnd0,
      MPMC_CTRL_PLB_masterID => net_gnd1(0 to 0),
      MPMC_CTRL_PLB_RNW => net_gnd0,
      MPMC_CTRL_PLB_BE => net_gnd8,
      MPMC_CTRL_PLB_UABus => net_gnd32(31 downto 0),
      MPMC_CTRL_PLB_rdPrim => net_gnd0,
      MPMC_CTRL_PLB_wrPrim => net_gnd0,
      MPMC_CTRL_PLB_abort => net_gnd0,
      MPMC_CTRL_PLB_busLock => net_gnd0,
      MPMC_CTRL_PLB_MSize => net_gnd2,
      MPMC_CTRL_PLB_size => net_gnd4,
      MPMC_CTRL_PLB_type => net_gnd3,
      MPMC_CTRL_PLB_lockErr => net_gnd0,
      MPMC_CTRL_PLB_wrPendReq => net_gnd0,
      MPMC_CTRL_PLB_wrPendPri => net_gnd2,
      MPMC_CTRL_PLB_rdPendReq => net_gnd0,
      MPMC_CTRL_PLB_rdPendPri => net_gnd2,
      MPMC_CTRL_PLB_reqPri => net_gnd2,
      MPMC_CTRL_PLB_TAttribute => net_gnd16,
      MPMC_CTRL_PLB_rdBurst => net_gnd0,
      MPMC_CTRL_PLB_wrBurst => net_gnd0,
      MPMC_CTRL_PLB_wrDBus => net_gnd64,
      MPMC_CTRL_Sl_addrAck => open,
      MPMC_CTRL_Sl_SSize => open,
      MPMC_CTRL_Sl_wait => open,
      MPMC_CTRL_Sl_rearbitrate => open,
      MPMC_CTRL_Sl_wrDAck => open,
      MPMC_CTRL_Sl_wrComp => open,
      MPMC_CTRL_Sl_wrBTerm => open,
      MPMC_CTRL_Sl_rdDBus => open,
      MPMC_CTRL_Sl_rdWdAddr => open,
      MPMC_CTRL_Sl_rdDAck => open,
      MPMC_CTRL_Sl_rdComp => open,
      MPMC_CTRL_Sl_rdBTerm => open,
      MPMC_CTRL_Sl_MBusy => open,
      MPMC_CTRL_Sl_MRdErr => open,
      MPMC_CTRL_Sl_MWrErr => open,
      MPMC_CTRL_Sl_MIRQ => open,
      MPMC_Clk0 => clk_100_0000MHzDCM0,
      MPMC_Clk0_DIV2 => net_vcc0,
      MPMC_Clk90 => clk_100_0000MHz90DCM0,
      MPMC_Clk_200MHz => clk_200_0000MHz,
      MPMC_Rst => sys_periph_reset(0),
      MPMC_Clk_Mem => net_vcc0,
      MPMC_Clk_Mem_2x => net_vcc0,
      MPMC_Clk_Mem_2x_180 => net_vcc0,
      MPMC_Clk_Mem_2x_CE0 => net_vcc0,
      MPMC_Clk_Mem_2x_CE90 => net_vcc0,
      MPMC_Clk_Rd_Base => net_vcc0,
      MPMC_PLL_Lock => net_gnd0,
      MPMC_Idelayctrl_Rdy_I => net_vcc0,
      MPMC_Idelayctrl_Rdy_O => open,
      MPMC_InitDone => open,
      MPMC_ECC_Intr => open,
      MPMC_DCM_PSEN => open,
      MPMC_DCM_PSINCDEC => open,
      MPMC_DCM_PSDONE => net_gnd0,
      MPMC_MCB_DRP_Clk => net_vcc0,
      SDRAM_Clk => open,
      SDRAM_CE => open,
      SDRAM_CS_n => open,
      SDRAM_RAS_n => open,
      SDRAM_CAS_n => open,
      SDRAM_WE_n => open,
      SDRAM_BankAddr => open,
      SDRAM_Addr => open,
      SDRAM_DQ => open,
      SDRAM_DM => open,
      DDR_Clk => pgassign1(0 to 0),
      DDR_Clk_n => pgassign2(0 to 0),
      DDR_CE => pgassign3(0 to 0),
      DDR_CS_n => pgassign4(0 to 0),
      DDR_RAS_n => fpga_0_DDR_SDRAM_DDR_RAS_n_pin,
      DDR_CAS_n => fpga_0_DDR_SDRAM_DDR_CAS_n_pin,
      DDR_WE_n => fpga_0_DDR_SDRAM_DDR_WE_n_pin,
      DDR_BankAddr => fpga_0_DDR_SDRAM_DDR_BankAddr_pin,
      DDR_Addr => fpga_0_DDR_SDRAM_DDR_Addr_pin,
      DDR_DQ => fpga_0_DDR_SDRAM_DDR_DQ_pin,
      DDR_DM => fpga_0_DDR_SDRAM_DDR_DM_pin,
      DDR_DQS => fpga_0_DDR_SDRAM_DDR_DQS_pin,
      DDR_DQS_Div_O => open,
      DDR_DQS_Div_I => net_gnd0,
      DDR2_Clk => open,
      DDR2_Clk_n => open,
      DDR2_CE => open,
      DDR2_CS_n => open,
      DDR2_ODT => open,
      DDR2_RAS_n => open,
      DDR2_CAS_n => open,
      DDR2_WE_n => open,
      DDR2_BankAddr => open,
      DDR2_Addr => open,
      DDR2_DQ => open,
      DDR2_DM => open,
      DDR2_DQS => open,
      DDR2_DQS_n => open,
      DDR2_DQS_Div_O => open,
      DDR2_DQS_Div_I => net_gnd0,
      DDR3_Clk => open,
      DDR3_Clk_n => open,
      DDR3_CE => open,
      DDR3_CS_n => open,
      DDR3_ODT => open,
      DDR3_RAS_n => open,
      DDR3_CAS_n => open,
      DDR3_WE_n => open,
      DDR3_BankAddr => open,
      DDR3_Addr => open,
      DDR3_DQ => open,
      DDR3_DM => open,
      DDR3_Reset_n => open,
      DDR3_DQS => open,
      DDR3_DQS_n => open,
      mcbx_dram_addr => open,
      mcbx_dram_ba => open,
      mcbx_dram_ras_n => open,
      mcbx_dram_cas_n => open,
      mcbx_dram_we_n => open,
      mcbx_dram_cke => open,
      mcbx_dram_clk => open,
      mcbx_dram_clk_n => open,
      mcbx_dram_dq => open,
      mcbx_dram_dqs => open,
      mcbx_dram_dqs_n => open,
      mcbx_dram_udqs => open,
      mcbx_dram_udqs_n => open,
      mcbx_dram_udm => open,
      mcbx_dram_ldm => open,
      mcbx_dram_odt => open,
      mcbx_dram_ddr3_rst => open,
      selfrefresh_enter => net_gnd0,
      selfrefresh_mode => open,
      calib_recal => net_gnd0,
      rzq => open,
      zio => open
    );

  ppc405_0_iplb1 : ppc405_0_iplb1_wrapper
    port map (
      PLB_Clk => clk_100_0000MHzDCM0,
      SYS_Rst => sys_bus_reset(0),
      PLB_Rst => open,
      SPLB_Rst => ppc405_0_iplb1_SPLB_Rst(0 to 0),
      MPLB_Rst => ppc405_0_iplb1_MPLB_Rst(0 to 0),
      PLB_dcrAck => open,
      PLB_dcrDBus => open,
      DCR_ABus => net_gnd10,
      DCR_DBus => net_gnd32(31 downto 0),
      DCR_Read => net_gnd0,
      DCR_Write => net_gnd0,
      M_ABus => ppc405_0_iplb1_M_ABus,
      M_UABus => ppc405_0_iplb1_M_UABus,
      M_BE => ppc405_0_iplb1_M_BE,
      M_RNW => ppc405_0_iplb1_M_RNW(0 to 0),
      M_abort => ppc405_0_iplb1_M_abort(0 to 0),
      M_busLock => ppc405_0_iplb1_M_busLock(0 to 0),
      M_TAttribute => ppc405_0_iplb1_M_TAttribute,
      M_lockErr => ppc405_0_iplb1_M_lockErr(0 to 0),
      M_MSize => ppc405_0_iplb1_M_MSize,
      M_priority => ppc405_0_iplb1_M_priority,
      M_rdBurst => ppc405_0_iplb1_M_rdBurst(0 to 0),
      M_request => ppc405_0_iplb1_M_request(0 to 0),
      M_size => ppc405_0_iplb1_M_size,
      M_type => ppc405_0_iplb1_M_type,
      M_wrBurst => ppc405_0_iplb1_M_wrBurst(0 to 0),
      M_wrDBus => ppc405_0_iplb1_M_wrDBus,
      Sl_addrAck => ppc405_0_iplb1_Sl_addrAck(0 to 0),
      Sl_MRdErr => ppc405_0_iplb1_Sl_MRdErr(0 to 0),
      Sl_MWrErr => ppc405_0_iplb1_Sl_MWrErr(0 to 0),
      Sl_MBusy => ppc405_0_iplb1_Sl_MBusy(0 to 0),
      Sl_rdBTerm => ppc405_0_iplb1_Sl_rdBTerm(0 to 0),
      Sl_rdComp => ppc405_0_iplb1_Sl_rdComp(0 to 0),
      Sl_rdDAck => ppc405_0_iplb1_Sl_rdDAck(0 to 0),
      Sl_rdDBus => ppc405_0_iplb1_Sl_rdDBus,
      Sl_rdWdAddr => ppc405_0_iplb1_Sl_rdWdAddr,
      Sl_rearbitrate => ppc405_0_iplb1_Sl_rearbitrate(0 to 0),
      Sl_SSize => ppc405_0_iplb1_Sl_SSize,
      Sl_wait => ppc405_0_iplb1_Sl_wait(0 to 0),
      Sl_wrBTerm => ppc405_0_iplb1_Sl_wrBTerm(0 to 0),
      Sl_wrComp => ppc405_0_iplb1_Sl_wrComp(0 to 0),
      Sl_wrDAck => ppc405_0_iplb1_Sl_wrDAck(0 to 0),
      Sl_MIRQ => ppc405_0_iplb1_Sl_MIRQ(0 to 0),
      PLB_MIRQ => open,
      PLB_ABus => ppc405_0_iplb1_PLB_ABus,
      PLB_UABus => ppc405_0_iplb1_PLB_UABus,
      PLB_BE => ppc405_0_iplb1_PLB_BE,
      PLB_MAddrAck => ppc405_0_iplb1_PLB_MAddrAck(0 to 0),
      PLB_MTimeout => ppc405_0_iplb1_PLB_MTimeout(0 to 0),
      PLB_MBusy => ppc405_0_iplb1_PLB_MBusy(0 to 0),
      PLB_MRdErr => ppc405_0_iplb1_PLB_MRdErr(0 to 0),
      PLB_MWrErr => ppc405_0_iplb1_PLB_MWrErr(0 to 0),
      PLB_MRdBTerm => ppc405_0_iplb1_PLB_MRdBTerm(0 to 0),
      PLB_MRdDAck => ppc405_0_iplb1_PLB_MRdDAck(0 to 0),
      PLB_MRdDBus => ppc405_0_iplb1_PLB_MRdDBus,
      PLB_MRdWdAddr => ppc405_0_iplb1_PLB_MRdWdAddr,
      PLB_MRearbitrate => ppc405_0_iplb1_PLB_MRearbitrate(0 to 0),
      PLB_MWrBTerm => ppc405_0_iplb1_PLB_MWrBTerm(0 to 0),
      PLB_MWrDAck => ppc405_0_iplb1_PLB_MWrDAck(0 to 0),
      PLB_MSSize => ppc405_0_iplb1_PLB_MSSize,
      PLB_PAValid => ppc405_0_iplb1_PLB_PAValid,
      PLB_RNW => ppc405_0_iplb1_PLB_RNW,
      PLB_SAValid => ppc405_0_iplb1_PLB_SAValid,
      PLB_abort => ppc405_0_iplb1_PLB_abort,
      PLB_busLock => ppc405_0_iplb1_PLB_busLock,
      PLB_TAttribute => ppc405_0_iplb1_PLB_TAttribute,
      PLB_lockErr => ppc405_0_iplb1_PLB_lockErr,
      PLB_masterID => ppc405_0_iplb1_PLB_masterID(0 to 0),
      PLB_MSize => ppc405_0_iplb1_PLB_MSize,
      PLB_rdPendPri => ppc405_0_iplb1_PLB_rdPendPri,
      PLB_wrPendPri => ppc405_0_iplb1_PLB_wrPendPri,
      PLB_rdPendReq => ppc405_0_iplb1_PLB_rdPendReq,
      PLB_wrPendReq => ppc405_0_iplb1_PLB_wrPendReq,
      PLB_rdBurst => ppc405_0_iplb1_PLB_rdBurst,
      PLB_rdPrim => ppc405_0_iplb1_PLB_rdPrim(0 to 0),
      PLB_reqPri => ppc405_0_iplb1_PLB_reqPri,
      PLB_size => ppc405_0_iplb1_PLB_size,
      PLB_type => ppc405_0_iplb1_PLB_type,
      PLB_wrBurst => ppc405_0_iplb1_PLB_wrBurst,
      PLB_wrDBus => ppc405_0_iplb1_PLB_wrDBus,
      PLB_wrPrim => ppc405_0_iplb1_PLB_wrPrim(0 to 0),
      PLB_SaddrAck => open,
      PLB_SMRdErr => open,
      PLB_SMWrErr => open,
      PLB_SMBusy => open,
      PLB_SrdBTerm => open,
      PLB_SrdComp => open,
      PLB_SrdDAck => open,
      PLB_SrdDBus => open,
      PLB_SrdWdAddr => open,
      PLB_Srearbitrate => open,
      PLB_Sssize => open,
      PLB_Swait => open,
      PLB_SwrBTerm => open,
      PLB_SwrComp => open,
      PLB_SwrDAck => open,
      Bus_Error_Det => open
    );

  ppc405_0_dplb1 : ppc405_0_dplb1_wrapper
    port map (
      PLB_Clk => clk_100_0000MHzDCM0,
      SYS_Rst => sys_bus_reset(0),
      PLB_Rst => open,
      SPLB_Rst => ppc405_0_dplb1_SPLB_Rst(0 to 0),
      MPLB_Rst => ppc405_0_dplb1_MPLB_Rst(0 to 0),
      PLB_dcrAck => open,
      PLB_dcrDBus => open,
      DCR_ABus => net_gnd10,
      DCR_DBus => net_gnd32(31 downto 0),
      DCR_Read => net_gnd0,
      DCR_Write => net_gnd0,
      M_ABus => ppc405_0_dplb1_M_ABus,
      M_UABus => ppc405_0_dplb1_M_UABus,
      M_BE => ppc405_0_dplb1_M_BE,
      M_RNW => ppc405_0_dplb1_M_RNW(0 to 0),
      M_abort => ppc405_0_dplb1_M_abort(0 to 0),
      M_busLock => ppc405_0_dplb1_M_busLock(0 to 0),
      M_TAttribute => ppc405_0_dplb1_M_TAttribute,
      M_lockErr => ppc405_0_dplb1_M_lockErr(0 to 0),
      M_MSize => ppc405_0_dplb1_M_MSize,
      M_priority => ppc405_0_dplb1_M_priority,
      M_rdBurst => ppc405_0_dplb1_M_rdBurst(0 to 0),
      M_request => ppc405_0_dplb1_M_request(0 to 0),
      M_size => ppc405_0_dplb1_M_size,
      M_type => ppc405_0_dplb1_M_type,
      M_wrBurst => ppc405_0_dplb1_M_wrBurst(0 to 0),
      M_wrDBus => ppc405_0_dplb1_M_wrDBus,
      Sl_addrAck => ppc405_0_dplb1_Sl_addrAck(0 to 0),
      Sl_MRdErr => ppc405_0_dplb1_Sl_MRdErr(0 to 0),
      Sl_MWrErr => ppc405_0_dplb1_Sl_MWrErr(0 to 0),
      Sl_MBusy => ppc405_0_dplb1_Sl_MBusy(0 to 0),
      Sl_rdBTerm => ppc405_0_dplb1_Sl_rdBTerm(0 to 0),
      Sl_rdComp => ppc405_0_dplb1_Sl_rdComp(0 to 0),
      Sl_rdDAck => ppc405_0_dplb1_Sl_rdDAck(0 to 0),
      Sl_rdDBus => ppc405_0_dplb1_Sl_rdDBus,
      Sl_rdWdAddr => ppc405_0_dplb1_Sl_rdWdAddr,
      Sl_rearbitrate => ppc405_0_dplb1_Sl_rearbitrate(0 to 0),
      Sl_SSize => ppc405_0_dplb1_Sl_SSize,
      Sl_wait => ppc405_0_dplb1_Sl_wait(0 to 0),
      Sl_wrBTerm => ppc405_0_dplb1_Sl_wrBTerm(0 to 0),
      Sl_wrComp => ppc405_0_dplb1_Sl_wrComp(0 to 0),
      Sl_wrDAck => ppc405_0_dplb1_Sl_wrDAck(0 to 0),
      Sl_MIRQ => ppc405_0_dplb1_Sl_MIRQ(0 to 0),
      PLB_MIRQ => open,
      PLB_ABus => ppc405_0_dplb1_PLB_ABus,
      PLB_UABus => ppc405_0_dplb1_PLB_UABus,
      PLB_BE => ppc405_0_dplb1_PLB_BE,
      PLB_MAddrAck => ppc405_0_dplb1_PLB_MAddrAck(0 to 0),
      PLB_MTimeout => ppc405_0_dplb1_PLB_MTimeout(0 to 0),
      PLB_MBusy => ppc405_0_dplb1_PLB_MBusy(0 to 0),
      PLB_MRdErr => ppc405_0_dplb1_PLB_MRdErr(0 to 0),
      PLB_MWrErr => ppc405_0_dplb1_PLB_MWrErr(0 to 0),
      PLB_MRdBTerm => ppc405_0_dplb1_PLB_MRdBTerm(0 to 0),
      PLB_MRdDAck => ppc405_0_dplb1_PLB_MRdDAck(0 to 0),
      PLB_MRdDBus => ppc405_0_dplb1_PLB_MRdDBus,
      PLB_MRdWdAddr => ppc405_0_dplb1_PLB_MRdWdAddr,
      PLB_MRearbitrate => ppc405_0_dplb1_PLB_MRearbitrate(0 to 0),
      PLB_MWrBTerm => ppc405_0_dplb1_PLB_MWrBTerm(0 to 0),
      PLB_MWrDAck => ppc405_0_dplb1_PLB_MWrDAck(0 to 0),
      PLB_MSSize => ppc405_0_dplb1_PLB_MSSize,
      PLB_PAValid => ppc405_0_dplb1_PLB_PAValid,
      PLB_RNW => ppc405_0_dplb1_PLB_RNW,
      PLB_SAValid => ppc405_0_dplb1_PLB_SAValid,
      PLB_abort => ppc405_0_dplb1_PLB_abort,
      PLB_busLock => ppc405_0_dplb1_PLB_busLock,
      PLB_TAttribute => ppc405_0_dplb1_PLB_TAttribute,
      PLB_lockErr => ppc405_0_dplb1_PLB_lockErr,
      PLB_masterID => ppc405_0_dplb1_PLB_masterID(0 to 0),
      PLB_MSize => ppc405_0_dplb1_PLB_MSize,
      PLB_rdPendPri => ppc405_0_dplb1_PLB_rdPendPri,
      PLB_wrPendPri => ppc405_0_dplb1_PLB_wrPendPri,
      PLB_rdPendReq => ppc405_0_dplb1_PLB_rdPendReq,
      PLB_wrPendReq => ppc405_0_dplb1_PLB_wrPendReq,
      PLB_rdBurst => ppc405_0_dplb1_PLB_rdBurst,
      PLB_rdPrim => ppc405_0_dplb1_PLB_rdPrim(0 to 0),
      PLB_reqPri => ppc405_0_dplb1_PLB_reqPri,
      PLB_size => ppc405_0_dplb1_PLB_size,
      PLB_type => ppc405_0_dplb1_PLB_type,
      PLB_wrBurst => ppc405_0_dplb1_PLB_wrBurst,
      PLB_wrDBus => ppc405_0_dplb1_PLB_wrDBus,
      PLB_wrPrim => ppc405_0_dplb1_PLB_wrPrim(0 to 0),
      PLB_SaddrAck => open,
      PLB_SMRdErr => open,
      PLB_SMWrErr => open,
      PLB_SMBusy => open,
      PLB_SrdBTerm => open,
      PLB_SrdComp => open,
      PLB_SrdDAck => open,
      PLB_SrdDBus => open,
      PLB_SrdWdAddr => open,
      PLB_Srearbitrate => open,
      PLB_Sssize => open,
      PLB_Swait => open,
      PLB_SwrBTerm => open,
      PLB_SwrComp => open,
      PLB_SwrDAck => open,
      Bus_Error_Det => open
    );

  MGT_wrapper : mgt_wrapper_wrapper
    port map (
      CLK => clk_100_0000MHzDCM0
    );

  TriMode_MAC_GMII : trimode_mac_gmii_wrapper
    port map (
      TemacIntc0_Irpt => TriMode_MAC_GMII_TemacIntc0_Irpt,
      TemacIntc1_Irpt => open,
      TemacPhy_RST_n => fpga_0_TriMode_MAC_GMII_TemacPhy_RST_n_pin,
      GTX_CLK_0 => clk_125_0000MHz,
      MGTCLK_P => net_gnd0,
      MGTCLK_N => net_gnd0,
      REFCLK => clk_200_0000MHz,
      DCLK => net_gnd0,
      SPLB_Clk => clk_100_0000MHzDCM0,
      SPLB_Rst => plb_SPLB_Rst(7),
      Core_Clk => net_gnd0,
      PLB_ABus => plb_PLB_ABus,
      PLB_UABus => plb_PLB_UABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(7),
      PLB_wrPrim => plb_PLB_wrPrim(7),
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_MSize => plb_PLB_MSize,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_addrAck => plb_Sl_addrAck(7),
      Sl_SSize => plb_Sl_SSize(14 to 15),
      Sl_wait => plb_Sl_wait(7),
      Sl_rearbitrate => plb_Sl_rearbitrate(7),
      Sl_wrDAck => plb_Sl_wrDAck(7),
      Sl_wrComp => plb_Sl_wrComp(7),
      Sl_wrBTerm => plb_Sl_wrBTerm(7),
      Sl_rdDBus => plb_Sl_rdDBus(448 to 511),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(28 to 31),
      Sl_rdDAck => plb_Sl_rdDAck(7),
      Sl_rdComp => plb_Sl_rdComp(7),
      Sl_rdBTerm => plb_Sl_rdBTerm(7),
      Sl_MBusy => plb_Sl_MBusy(14 to 15),
      Sl_MWrErr => plb_Sl_MWrErr(14 to 15),
      Sl_MRdErr => plb_Sl_MRdErr(14 to 15),
      Sl_MIRQ => plb_Sl_MIRQ(14 to 15),
      LlinkTemac0_CLK => clk_100_0000MHzDCM0,
      LlinkTemac0_RST => TriMode_MAC_GMII_LLINK0_LL_RST_ACK,
      LlinkTemac0_SOP_n => TriMode_MAC_GMII_LLINK0_LL_Tx_SOP_n,
      LlinkTemac0_EOP_n => TriMode_MAC_GMII_LLINK0_LL_Tx_EOP_n,
      LlinkTemac0_SOF_n => TriMode_MAC_GMII_LLINK0_LL_Tx_SOF_n,
      LlinkTemac0_EOF_n => TriMode_MAC_GMII_LLINK0_LL_Tx_EOF_n,
      LlinkTemac0_REM => TriMode_MAC_GMII_LLINK0_LL_Tx_Rem,
      LlinkTemac0_Data => TriMode_MAC_GMII_LLINK0_LL_Tx_Data,
      LlinkTemac0_SRC_RDY_n => TriMode_MAC_GMII_LLINK0_LL_Tx_SrcRdy_n,
      Temac0Llink_DST_RDY_n => TriMode_MAC_GMII_LLINK0_LL_Tx_DstRdy_n,
      Temac0Llink_SOP_n => TriMode_MAC_GMII_LLINK0_LL_Rx_SOP_n,
      Temac0Llink_EOP_n => TriMode_MAC_GMII_LLINK0_LL_Rx_EOP_n,
      Temac0Llink_SOF_n => TriMode_MAC_GMII_LLINK0_LL_Rx_SOF_n,
      Temac0Llink_EOF_n => TriMode_MAC_GMII_LLINK0_LL_Rx_EOF_n,
      Temac0Llink_REM => TriMode_MAC_GMII_LLINK0_LL_Rx_Rem,
      Temac0Llink_Data => TriMode_MAC_GMII_LLINK0_LL_Rx_Data,
      Temac0Llink_SRC_RDY_n => TriMode_MAC_GMII_LLINK0_LL_Rx_SrcRdy_n,
      LlinkTemac0_DST_RDY_n => TriMode_MAC_GMII_LLINK0_LL_Rx_DstRdy_n,
      LlinkTemac1_CLK => net_vcc0,
      LlinkTemac1_RST => net_vcc0,
      LlinkTemac1_SOP_n => net_vcc0,
      LlinkTemac1_EOP_n => net_vcc0,
      LlinkTemac1_SOF_n => net_vcc0,
      LlinkTemac1_EOF_n => net_vcc0,
      LlinkTemac1_REM => net_vcc4,
      LlinkTemac1_Data => net_gnd32(31 downto 0),
      LlinkTemac1_SRC_RDY_n => net_vcc0,
      Temac1Llink_DST_RDY_n => open,
      Temac1Llink_SOP_n => open,
      Temac1Llink_EOP_n => open,
      Temac1Llink_SOF_n => open,
      Temac1Llink_EOF_n => open,
      Temac1Llink_REM => open,
      Temac1Llink_Data => open,
      Temac1Llink_SRC_RDY_n => open,
      LlinkTemac1_DST_RDY_n => net_vcc0,
      MII_TXD_0 => open,
      MII_TX_EN_0 => open,
      MII_TX_ER_0 => open,
      MII_RXD_0 => net_gnd4(0 to 3),
      MII_RX_DV_0 => net_gnd0,
      MII_RX_ER_0 => net_gnd0,
      MII_RX_CLK_0 => net_gnd0,
      MII_TX_CLK_0 => fpga_0_TriMode_MAC_GMII_MII_TX_CLK_0_pin,
      MII_TXD_1 => open,
      MII_TX_EN_1 => open,
      MII_TX_ER_1 => open,
      MII_RXD_1 => net_gnd4(0 to 3),
      MII_RX_DV_1 => net_gnd0,
      MII_RX_ER_1 => net_gnd0,
      MII_RX_CLK_1 => net_gnd0,
      MII_TX_CLK_1 => net_gnd0,
      GMII_TXD_0 => fpga_0_TriMode_MAC_GMII_GMII_TXD_0_pin,
      GMII_TX_EN_0 => fpga_0_TriMode_MAC_GMII_GMII_TX_EN_0_pin,
      GMII_TX_ER_0 => fpga_0_TriMode_MAC_GMII_GMII_TX_ER_0_pin,
      GMII_TX_CLK_0 => fpga_0_TriMode_MAC_GMII_GMII_TX_CLK_0_pin,
      GMII_RXD_0 => fpga_0_TriMode_MAC_GMII_GMII_RXD_0_pin,
      GMII_RX_DV_0 => fpga_0_TriMode_MAC_GMII_GMII_RX_DV_0_pin,
      GMII_RX_ER_0 => fpga_0_TriMode_MAC_GMII_GMII_RX_ER_0_pin,
      GMII_RX_CLK_0 => fpga_0_TriMode_MAC_GMII_GMII_RX_CLK_0_pin,
      GMII_TXD_1 => open,
      GMII_TX_EN_1 => open,
      GMII_TX_ER_1 => open,
      GMII_TX_CLK_1 => open,
      GMII_RXD_1 => net_gnd8(0 to 7),
      GMII_RX_DV_1 => net_gnd0,
      GMII_RX_ER_1 => net_gnd0,
      GMII_RX_CLK_1 => net_gnd0,
      TXP_0 => open,
      TXN_0 => open,
      RXP_0 => net_vcc0,
      RXN_0 => net_gnd0,
      TXP_1 => open,
      TXN_1 => open,
      RXP_1 => net_vcc0,
      RXN_1 => net_gnd0,
      RGMII_TXD_0 => open,
      RGMII_TX_CTL_0 => open,
      RGMII_TXC_0 => open,
      RGMII_RXD_0 => net_gnd4(0 to 3),
      RGMII_RX_CTL_0 => net_gnd0,
      RGMII_RXC_0 => net_gnd0,
      RGMII_TXD_1 => open,
      RGMII_TX_CTL_1 => open,
      RGMII_TXC_1 => open,
      RGMII_RXD_1 => net_gnd4(0 to 3),
      RGMII_RX_CTL_1 => net_gnd0,
      RGMII_RXC_1 => net_gnd0,
      MDC_0 => fpga_0_TriMode_MAC_GMII_MDC_0_pin,
      MDC_1 => open,
      HostMiimRdy => net_gnd0,
      HostRdData => net_gnd32,
      HostMiimSel => open,
      HostReq => open,
      HostAddr => open,
      HostEmac1Sel => open,
      Temac0AvbTxClk => open,
      Temac0AvbTxClkEn => open,
      Temac0AvbRxClk => open,
      Temac0AvbRxClkEn => open,
      Avb2Mac0TxData => net_gnd8(0 to 7),
      Avb2Mac0TxDataValid => net_gnd0,
      Avb2Mac0TxUnderrun => net_gnd0,
      Mac02AvbTxAck => open,
      Mac02AvbRxData => open,
      Mac02AvbRxDataValid => open,
      Mac02AvbRxFrameGood => open,
      Mac02AvbRxFrameBad => open,
      Temac02AvbTxData => open,
      Temac02AvbTxDataValid => open,
      Temac02AvbTxUnderrun => open,
      Avb2Temac0TxAck => net_gnd0,
      Avb2Temac0RxData => net_gnd8(0 to 7),
      Avb2Temac0RxDataValid => net_gnd0,
      Avb2Temac0RxFrameGood => net_gnd0,
      Avb2Temac0RxFrameBad => net_gnd0,
      Temac1AvbTxClk => open,
      Temac1AvbTxClkEn => open,
      Temac1AvbRxClk => open,
      Temac1AvbRxClkEn => open,
      Avb2Mac1TxData => net_gnd8(0 to 7),
      Avb2Mac1TxDataValid => net_gnd0,
      Avb2Mac1TxUnderrun => net_gnd0,
      Mac12AvbTxAck => open,
      Mac12AvbRxData => open,
      Mac12AvbRxDataValid => open,
      Mac12AvbRxFrameGood => open,
      Mac12AvbRxFrameBad => open,
      Temac12AvbTxData => open,
      Temac12AvbTxDataValid => open,
      Temac12AvbTxUnderrun => open,
      Avb2Temac1TxAck => net_gnd0,
      Avb2Temac1RxData => net_gnd8(0 to 7),
      Avb2Temac1RxDataValid => net_gnd0,
      Avb2Temac1RxFrameGood => net_gnd0,
      Avb2Temac1RxFrameBad => net_gnd0,
      TxClientClk_0 => open,
      ClientTxStat_0 => open,
      ClientTxStatsVld_0 => open,
      ClientTxStatsByteVld_0 => open,
      RxClientClk_0 => open,
      ClientRxStats_0 => open,
      ClientRxStatsVld_0 => open,
      ClientRxStatsByteVld_0 => open,
      TxClientClk_1 => open,
      ClientTxStat_1 => open,
      ClientTxStatsVld_1 => open,
      ClientTxStatsByteVld_1 => open,
      RxClientClk_1 => open,
      ClientRxStats_1 => open,
      ClientRxStatsVld_1 => open,
      ClientRxStatsByteVld_1 => open,
      MDIO_0_I => fpga_0_TriMode_MAC_GMII_MDIO_0_pin_I,
      MDIO_0_O => fpga_0_TriMode_MAC_GMII_MDIO_0_pin_O,
      MDIO_0_T => fpga_0_TriMode_MAC_GMII_MDIO_0_pin_T,
      MDIO_1_I => net_vcc0,
      MDIO_1_O => open,
      MDIO_1_T => open
    );

  FLASH : flash_wrapper
    port map (
      MCH_SPLB_Clk => clk_100_0000MHzDCM0,
      RdClk => clk_100_0000MHzDCM0,
      MCH_SPLB_Rst => plb_SPLB_Rst(8),
      MCH0_Access_Control => net_gnd0,
      MCH0_Access_Data => net_gnd32(31 downto 0),
      MCH0_Access_Write => net_gnd0,
      MCH0_Access_Full => open,
      MCH0_ReadData_Control => open,
      MCH0_ReadData_Data => open,
      MCH0_ReadData_Read => net_gnd0,
      MCH0_ReadData_Exists => open,
      MCH1_Access_Control => net_gnd0,
      MCH1_Access_Data => net_gnd32(31 downto 0),
      MCH1_Access_Write => net_gnd0,
      MCH1_Access_Full => open,
      MCH1_ReadData_Control => open,
      MCH1_ReadData_Data => open,
      MCH1_ReadData_Read => net_gnd0,
      MCH1_ReadData_Exists => open,
      MCH2_Access_Control => net_gnd0,
      MCH2_Access_Data => net_gnd32(31 downto 0),
      MCH2_Access_Write => net_gnd0,
      MCH2_Access_Full => open,
      MCH2_ReadData_Control => open,
      MCH2_ReadData_Data => open,
      MCH2_ReadData_Read => net_gnd0,
      MCH2_ReadData_Exists => open,
      MCH3_Access_Control => net_gnd0,
      MCH3_Access_Data => net_gnd32(31 downto 0),
      MCH3_Access_Write => net_gnd0,
      MCH3_Access_Full => open,
      MCH3_ReadData_Control => open,
      MCH3_ReadData_Data => open,
      MCH3_ReadData_Read => net_gnd0,
      MCH3_ReadData_Exists => open,
      PLB_ABus => plb_PLB_ABus,
      PLB_UABus => plb_PLB_UABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(8),
      PLB_wrPrim => plb_PLB_wrPrim(8),
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_MSize => plb_PLB_MSize,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_addrAck => plb_Sl_addrAck(8),
      Sl_SSize => plb_Sl_SSize(16 to 17),
      Sl_wait => plb_Sl_wait(8),
      Sl_rearbitrate => plb_Sl_rearbitrate(8),
      Sl_wrDAck => plb_Sl_wrDAck(8),
      Sl_wrComp => plb_Sl_wrComp(8),
      Sl_wrBTerm => plb_Sl_wrBTerm(8),
      Sl_rdDBus => plb_Sl_rdDBus(512 to 575),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(32 to 35),
      Sl_rdDAck => plb_Sl_rdDAck(8),
      Sl_rdComp => plb_Sl_rdComp(8),
      Sl_rdBTerm => plb_Sl_rdBTerm(8),
      Sl_MBusy => plb_Sl_MBusy(16 to 17),
      Sl_MWrErr => plb_Sl_MWrErr(16 to 17),
      Sl_MRdErr => plb_Sl_MRdErr(16 to 17),
      Sl_MIRQ => plb_Sl_MIRQ(16 to 17),
      Mem_DQ_I => fpga_0_FLASH_Mem_DQ_pin_I,
      Mem_DQ_O => fpga_0_FLASH_Mem_DQ_pin_O,
      Mem_DQ_T => fpga_0_FLASH_Mem_DQ_pin_T,
      Mem_A => pgassign11,
      Mem_RPN => open,
      Mem_CEN => open,
      Mem_OEN => pgassign5(0 to 0),
      Mem_WEN => fpga_0_FLASH_Mem_WEN_pin,
      Mem_QWEN => open,
      Mem_BEN => open,
      Mem_CE => pgassign6(0 to 0),
      Mem_ADV_LDN => open,
      Mem_LBON => open,
      Mem_CKEN => open,
      Mem_RNW => open
    );

  xps_timebase_wdt_0 : xps_timebase_wdt_0_wrapper
    port map (
      WDT_Reset => open,
      Timebase_Interrupt => xps_timebase_wdt_0_Timebase_Interrupt,
      WDT_Interrupt => xps_timebase_wdt_0_WDT_Interrupt,
      SPLB_Clk => clk_100_0000MHzDCM0,
      SPLB_Rst => plb_SPLB_Rst(9),
      PLB_ABus => plb_PLB_ABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_wrDBus => plb_PLB_wrDBus,
      Sl_addrAck => plb_Sl_addrAck(9),
      Sl_SSize => plb_Sl_SSize(18 to 19),
      Sl_wait => plb_Sl_wait(9),
      Sl_rearbitrate => plb_Sl_rearbitrate(9),
      Sl_wrDAck => plb_Sl_wrDAck(9),
      Sl_wrComp => plb_Sl_wrComp(9),
      Sl_rdDBus => plb_Sl_rdDBus(576 to 639),
      Sl_rdDAck => plb_Sl_rdDAck(9),
      Sl_rdComp => plb_Sl_rdComp(9),
      Sl_MBusy => plb_Sl_MBusy(18 to 19),
      Sl_MWrErr => plb_Sl_MWrErr(18 to 19),
      Sl_MRdErr => plb_Sl_MRdErr(18 to 19),
      PLB_UABus => plb_PLB_UABus,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(9),
      PLB_wrPrim => plb_PLB_wrPrim(9),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_MSize => plb_PLB_MSize,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_wrBTerm => plb_Sl_wrBTerm(9),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(36 to 39),
      Sl_rdBTerm => plb_Sl_rdBTerm(9),
      Sl_MIRQ => plb_Sl_MIRQ(18 to 19)
    );

  xps_timer_0 : xps_timer_0_wrapper
    port map (
      CaptureTrig0 => net_gnd0,
      CaptureTrig1 => net_gnd0,
      GenerateOut0 => open,
      GenerateOut1 => open,
      PWM0 => open,
      Interrupt => xps_timer_0_Interrupt,
      Freeze => net_gnd0,
      SPLB_Clk => clk_100_0000MHzDCM0,
      SPLB_Rst => plb_SPLB_Rst(10),
      PLB_ABus => plb_PLB_ABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_wrDBus => plb_PLB_wrDBus,
      Sl_addrAck => plb_Sl_addrAck(10),
      Sl_SSize => plb_Sl_SSize(20 to 21),
      Sl_wait => plb_Sl_wait(10),
      Sl_rearbitrate => plb_Sl_rearbitrate(10),
      Sl_wrDAck => plb_Sl_wrDAck(10),
      Sl_wrComp => plb_Sl_wrComp(10),
      Sl_rdDBus => plb_Sl_rdDBus(640 to 703),
      Sl_rdDAck => plb_Sl_rdDAck(10),
      Sl_rdComp => plb_Sl_rdComp(10),
      Sl_MBusy => plb_Sl_MBusy(20 to 21),
      Sl_MWrErr => plb_Sl_MWrErr(20 to 21),
      Sl_MRdErr => plb_Sl_MRdErr(20 to 21),
      PLB_UABus => plb_PLB_UABus,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(10),
      PLB_wrPrim => plb_PLB_wrPrim(10),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_MSize => plb_PLB_MSize,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_wrBTerm => plb_Sl_wrBTerm(10),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(40 to 43),
      Sl_rdBTerm => plb_Sl_rdBTerm(10),
      Sl_MIRQ => plb_Sl_MIRQ(20 to 21)
    );

  RS232_Uart : rs232_uart_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzDCM0,
      SPLB_Rst => plb_SPLB_Rst(11),
      PLB_ABus => plb_PLB_ABus,
      PLB_UABus => plb_PLB_UABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(11),
      PLB_wrPrim => plb_PLB_wrPrim(11),
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_MSize => plb_PLB_MSize,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_addrAck => plb_Sl_addrAck(11),
      Sl_SSize => plb_Sl_SSize(22 to 23),
      Sl_wait => plb_Sl_wait(11),
      Sl_rearbitrate => plb_Sl_rearbitrate(11),
      Sl_wrDAck => plb_Sl_wrDAck(11),
      Sl_wrComp => plb_Sl_wrComp(11),
      Sl_wrBTerm => plb_Sl_wrBTerm(11),
      Sl_rdDBus => plb_Sl_rdDBus(704 to 767),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(44 to 47),
      Sl_rdDAck => plb_Sl_rdDAck(11),
      Sl_rdComp => plb_Sl_rdComp(11),
      Sl_rdBTerm => plb_Sl_rdBTerm(11),
      Sl_MBusy => plb_Sl_MBusy(22 to 23),
      Sl_MWrErr => plb_Sl_MWrErr(22 to 23),
      Sl_MRdErr => plb_Sl_MRdErr(22 to 23),
      Sl_MIRQ => plb_Sl_MIRQ(22 to 23),
      baudoutN => open,
      ctsN => net_gnd0,
      dcdN => net_gnd0,
      ddis => open,
      dsrN => net_gnd0,
      dtrN => open,
      out1N => open,
      out2N => open,
      rclk => net_gnd0,
      riN => net_gnd0,
      rtsN => open,
      rxrdyN => open,
      sin => fpga_0_RS232_Uart_sin_pin,
      sout => fpga_0_RS232_Uart_sout_pin,
      IP2INTC_Irpt => RS232_Uart_IP2INTC_Irpt,
      txrdyN => open,
      xin => net_gnd0,
      xout => open,
      Freeze => net_gnd0
    );

  clock_generator_0 : clock_generator_0_wrapper
    port map (
      CLKIN => dcm_clk_s,
      CLKOUT0 => clk_100_0000MHz90DCM0,
      CLKOUT1 => clk_100_0000MHzDCM0,
      CLKOUT2 => clk_125_0000MHz,
      CLKOUT3 => clk_200_0000MHz,
      CLKOUT4 => clk_300_0000MHzDCM0,
      CLKOUT5 => open,
      CLKOUT6 => open,
      CLKOUT7 => open,
      CLKOUT8 => open,
      CLKOUT9 => open,
      CLKOUT10 => open,
      CLKOUT11 => open,
      CLKOUT12 => open,
      CLKOUT13 => open,
      CLKOUT14 => open,
      CLKOUT15 => open,
      CLKFBIN => net_gnd0,
      CLKFBOUT => open,
      PSCLK => net_gnd0,
      PSEN => net_gnd0,
      PSINCDEC => net_gnd0,
      PSDONE => open,
      RST => sys_rst_s,
      LOCKED => Dcm_all_locked
    );

  jtagppc_cntlr_inst : jtagppc_cntlr_inst_wrapper
    port map (
      TRSTNEG => net_vcc0,
      HALTNEG0 => net_vcc0,
      DBGC405DEBUGHALT0 => open,
      HALTNEG1 => net_vcc0,
      DBGC405DEBUGHALT1 => open,
      C405JTGTDO0 => ppc405_0_jtagppc_bus_C405JTGTDO,
      C405JTGTDOEN0 => ppc405_0_jtagppc_bus_C405JTGTDOEN,
      JTGC405TCK0 => ppc405_0_jtagppc_bus_JTGC405TCK,
      JTGC405TDI0 => ppc405_0_jtagppc_bus_JTGC405TDI,
      JTGC405TMS0 => ppc405_0_jtagppc_bus_JTGC405TMS,
      JTGC405TRSTNEG0 => ppc405_0_jtagppc_bus_JTGC405TRSTNEG,
      C405JTGTDO1 => net_gnd0,
      C405JTGTDOEN1 => net_gnd0,
      JTGC405TCK1 => open,
      JTGC405TDI1 => open,
      JTGC405TMS1 => open,
      JTGC405TRSTNEG1 => open
    );

  proc_sys_reset_0 : proc_sys_reset_0_wrapper
    port map (
      Slowest_sync_clk => clk_100_0000MHzDCM0,
      Ext_Reset_In => sys_rst_s,
      Aux_Reset_In => net_gnd0,
      MB_Debug_Sys_Rst => net_gnd0,
      Core_Reset_Req_0 => ppc_reset_bus_Core_Reset_Req,
      Chip_Reset_Req_0 => ppc_reset_bus_Chip_Reset_Req,
      System_Reset_Req_0 => ppc_reset_bus_System_Reset_Req,
      Core_Reset_Req_1 => net_gnd0,
      Chip_Reset_Req_1 => net_gnd0,
      System_Reset_Req_1 => net_gnd0,
      Dcm_locked => Dcm_all_locked,
      RstcPPCresetcore_0 => ppc_reset_bus_RstcPPCresetcore,
      RstcPPCresetchip_0 => ppc_reset_bus_RstsPPCresetchip,
      RstcPPCresetsys_0 => ppc_reset_bus_RstcPPCresetsys,
      RstcPPCresetcore_1 => open,
      RstcPPCresetchip_1 => open,
      RstcPPCresetsys_1 => open,
      MB_Reset => open,
      Bus_Struct_Reset => sys_bus_reset(0 to 0),
      Peripheral_Reset => sys_periph_reset(0 to 0)
    );

  xps_intc_0 : xps_intc_0_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzDCM0,
      SPLB_Rst => plb_SPLB_Rst(12),
      PLB_ABus => plb_PLB_ABus,
      PLB_PAValid => plb_PLB_PAValid,
      PLB_masterID => plb_PLB_masterID(0 to 0),
      PLB_RNW => plb_PLB_RNW,
      PLB_BE => plb_PLB_BE,
      PLB_size => plb_PLB_size,
      PLB_type => plb_PLB_type,
      PLB_wrDBus => plb_PLB_wrDBus,
      PLB_UABus => plb_PLB_UABus,
      PLB_SAValid => plb_PLB_SAValid,
      PLB_rdPrim => plb_PLB_rdPrim(12),
      PLB_wrPrim => plb_PLB_wrPrim(12),
      PLB_abort => plb_PLB_abort,
      PLB_busLock => plb_PLB_busLock,
      PLB_MSize => plb_PLB_MSize,
      PLB_lockErr => plb_PLB_lockErr,
      PLB_wrBurst => plb_PLB_wrBurst,
      PLB_rdBurst => plb_PLB_rdBurst,
      PLB_wrPendReq => plb_PLB_wrPendReq,
      PLB_rdPendReq => plb_PLB_rdPendReq,
      PLB_wrPendPri => plb_PLB_wrPendPri,
      PLB_rdPendPri => plb_PLB_rdPendPri,
      PLB_reqPri => plb_PLB_reqPri,
      PLB_TAttribute => plb_PLB_TAttribute,
      Sl_addrAck => plb_Sl_addrAck(12),
      Sl_SSize => plb_Sl_SSize(24 to 25),
      Sl_wait => plb_Sl_wait(12),
      Sl_rearbitrate => plb_Sl_rearbitrate(12),
      Sl_wrDAck => plb_Sl_wrDAck(12),
      Sl_wrComp => plb_Sl_wrComp(12),
      Sl_rdDBus => plb_Sl_rdDBus(768 to 831),
      Sl_rdDAck => plb_Sl_rdDAck(12),
      Sl_rdComp => plb_Sl_rdComp(12),
      Sl_MBusy => plb_Sl_MBusy(24 to 25),
      Sl_MWrErr => plb_Sl_MWrErr(24 to 25),
      Sl_MRdErr => plb_Sl_MRdErr(24 to 25),
      Sl_wrBTerm => plb_Sl_wrBTerm(12),
      Sl_rdWdAddr => plb_Sl_rdWdAddr(48 to 51),
      Sl_rdBTerm => plb_Sl_rdBTerm(12),
      Sl_MIRQ => plb_Sl_MIRQ(24 to 25),
      Intr => pgassign12,
      Irq => ppc405_0_EICC405EXTINPUTIRQ
    );

  iobuf_0 : IOBUF
    port map (
      I => fpga_0_LEDs_4Bit_GPIO_IO_pin_O(0),
      IO => fpga_0_LEDs_4Bit_GPIO_IO_pin(0),
      O => fpga_0_LEDs_4Bit_GPIO_IO_pin_I(0),
      T => fpga_0_LEDs_4Bit_GPIO_IO_pin_T(0)
    );

  iobuf_1 : IOBUF
    port map (
      I => fpga_0_LEDs_4Bit_GPIO_IO_pin_O(1),
      IO => fpga_0_LEDs_4Bit_GPIO_IO_pin(1),
      O => fpga_0_LEDs_4Bit_GPIO_IO_pin_I(1),
      T => fpga_0_LEDs_4Bit_GPIO_IO_pin_T(1)
    );

  iobuf_2 : IOBUF
    port map (
      I => fpga_0_LEDs_4Bit_GPIO_IO_pin_O(2),
      IO => fpga_0_LEDs_4Bit_GPIO_IO_pin(2),
      O => fpga_0_LEDs_4Bit_GPIO_IO_pin_I(2),
      T => fpga_0_LEDs_4Bit_GPIO_IO_pin_T(2)
    );

  iobuf_3 : IOBUF
    port map (
      I => fpga_0_LEDs_4Bit_GPIO_IO_pin_O(3),
      IO => fpga_0_LEDs_4Bit_GPIO_IO_pin(3),
      O => fpga_0_LEDs_4Bit_GPIO_IO_pin_I(3),
      T => fpga_0_LEDs_4Bit_GPIO_IO_pin_T(3)
    );

  iobuf_4 : IOBUF
    port map (
      I => fpga_0_LEDs_Positions_GPIO_IO_pin_O(0),
      IO => fpga_0_LEDs_Positions_GPIO_IO_pin(0),
      O => fpga_0_LEDs_Positions_GPIO_IO_pin_I(0),
      T => fpga_0_LEDs_Positions_GPIO_IO_pin_T(0)
    );

  iobuf_5 : IOBUF
    port map (
      I => fpga_0_LEDs_Positions_GPIO_IO_pin_O(1),
      IO => fpga_0_LEDs_Positions_GPIO_IO_pin(1),
      O => fpga_0_LEDs_Positions_GPIO_IO_pin_I(1),
      T => fpga_0_LEDs_Positions_GPIO_IO_pin_T(1)
    );

  iobuf_6 : IOBUF
    port map (
      I => fpga_0_LEDs_Positions_GPIO_IO_pin_O(2),
      IO => fpga_0_LEDs_Positions_GPIO_IO_pin(2),
      O => fpga_0_LEDs_Positions_GPIO_IO_pin_I(2),
      T => fpga_0_LEDs_Positions_GPIO_IO_pin_T(2)
    );

  iobuf_7 : IOBUF
    port map (
      I => fpga_0_LEDs_Positions_GPIO_IO_pin_O(3),
      IO => fpga_0_LEDs_Positions_GPIO_IO_pin(3),
      O => fpga_0_LEDs_Positions_GPIO_IO_pin_I(3),
      T => fpga_0_LEDs_Positions_GPIO_IO_pin_T(3)
    );

  iobuf_8 : IOBUF
    port map (
      I => fpga_0_LEDs_Positions_GPIO_IO_pin_O(4),
      IO => fpga_0_LEDs_Positions_GPIO_IO_pin(4),
      O => fpga_0_LEDs_Positions_GPIO_IO_pin_I(4),
      T => fpga_0_LEDs_Positions_GPIO_IO_pin_T(4)
    );

  iobuf_9 : IOBUF
    port map (
      I => fpga_0_Push_Buttons_Position_GPIO_IO_pin_O(0),
      IO => fpga_0_Push_Buttons_Position_GPIO_IO_pin(0),
      O => fpga_0_Push_Buttons_Position_GPIO_IO_pin_I(0),
      T => fpga_0_Push_Buttons_Position_GPIO_IO_pin_T(0)
    );

  iobuf_10 : IOBUF
    port map (
      I => fpga_0_Push_Buttons_Position_GPIO_IO_pin_O(1),
      IO => fpga_0_Push_Buttons_Position_GPIO_IO_pin(1),
      O => fpga_0_Push_Buttons_Position_GPIO_IO_pin_I(1),
      T => fpga_0_Push_Buttons_Position_GPIO_IO_pin_T(1)
    );

  iobuf_11 : IOBUF
    port map (
      I => fpga_0_Push_Buttons_Position_GPIO_IO_pin_O(2),
      IO => fpga_0_Push_Buttons_Position_GPIO_IO_pin(2),
      O => fpga_0_Push_Buttons_Position_GPIO_IO_pin_I(2),
      T => fpga_0_Push_Buttons_Position_GPIO_IO_pin_T(2)
    );

  iobuf_12 : IOBUF
    port map (
      I => fpga_0_Push_Buttons_Position_GPIO_IO_pin_O(3),
      IO => fpga_0_Push_Buttons_Position_GPIO_IO_pin(3),
      O => fpga_0_Push_Buttons_Position_GPIO_IO_pin_I(3),
      T => fpga_0_Push_Buttons_Position_GPIO_IO_pin_T(3)
    );

  iobuf_13 : IOBUF
    port map (
      I => fpga_0_Push_Buttons_Position_GPIO_IO_pin_O(4),
      IO => fpga_0_Push_Buttons_Position_GPIO_IO_pin(4),
      O => fpga_0_Push_Buttons_Position_GPIO_IO_pin_I(4),
      T => fpga_0_Push_Buttons_Position_GPIO_IO_pin_T(4)
    );

  iobuf_14 : IOBUF
    port map (
      I => fpga_0_IIC_EEPROM_Sda_pin_O,
      IO => fpga_0_IIC_EEPROM_Sda_pin,
      O => fpga_0_IIC_EEPROM_Sda_pin_I,
      T => fpga_0_IIC_EEPROM_Sda_pin_T
    );

  iobuf_15 : IOBUF
    port map (
      I => fpga_0_IIC_EEPROM_Scl_pin_O,
      IO => fpga_0_IIC_EEPROM_Scl_pin,
      O => fpga_0_IIC_EEPROM_Scl_pin_I,
      T => fpga_0_IIC_EEPROM_Scl_pin_T
    );

  iobuf_16 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(15),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(15),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(15),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(15)
    );

  iobuf_17 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(14),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(14),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(14),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(14)
    );

  iobuf_18 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(13),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(13),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(13),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(13)
    );

  iobuf_19 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(12),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(12),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(12),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(12)
    );

  iobuf_20 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(11),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(11),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(11),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(11)
    );

  iobuf_21 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(10),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(10),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(10),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(10)
    );

  iobuf_22 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(9),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(9),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(9),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(9)
    );

  iobuf_23 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(8),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(8),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(8),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(8)
    );

  iobuf_24 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(7),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(7),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(7),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(7)
    );

  iobuf_25 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(6),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(6),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(6),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(6)
    );

  iobuf_26 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(5),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(5),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(5),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(5)
    );

  iobuf_27 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(4),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(4),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(4),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(4)
    );

  iobuf_28 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(3),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(3),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(3),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(3)
    );

  iobuf_29 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(2),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(2),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(2),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(2)
    );

  iobuf_30 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(1),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(1),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(1),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(1)
    );

  iobuf_31 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(0),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(0),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(0),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(0)
    );

  iobuf_32 : IOBUF
    port map (
      I => fpga_0_TriMode_MAC_GMII_MDIO_0_pin_O,
      IO => fpga_0_TriMode_MAC_GMII_MDIO_0_pin,
      O => fpga_0_TriMode_MAC_GMII_MDIO_0_pin_I,
      T => fpga_0_TriMode_MAC_GMII_MDIO_0_pin_T
    );

  iobuf_33 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(0),
      IO => fpga_0_FLASH_Mem_DQ_pin(0),
      O => fpga_0_FLASH_Mem_DQ_pin_I(0),
      T => fpga_0_FLASH_Mem_DQ_pin_T(0)
    );

  iobuf_34 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(1),
      IO => fpga_0_FLASH_Mem_DQ_pin(1),
      O => fpga_0_FLASH_Mem_DQ_pin_I(1),
      T => fpga_0_FLASH_Mem_DQ_pin_T(1)
    );

  iobuf_35 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(2),
      IO => fpga_0_FLASH_Mem_DQ_pin(2),
      O => fpga_0_FLASH_Mem_DQ_pin_I(2),
      T => fpga_0_FLASH_Mem_DQ_pin_T(2)
    );

  iobuf_36 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(3),
      IO => fpga_0_FLASH_Mem_DQ_pin(3),
      O => fpga_0_FLASH_Mem_DQ_pin_I(3),
      T => fpga_0_FLASH_Mem_DQ_pin_T(3)
    );

  iobuf_37 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(4),
      IO => fpga_0_FLASH_Mem_DQ_pin(4),
      O => fpga_0_FLASH_Mem_DQ_pin_I(4),
      T => fpga_0_FLASH_Mem_DQ_pin_T(4)
    );

  iobuf_38 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(5),
      IO => fpga_0_FLASH_Mem_DQ_pin(5),
      O => fpga_0_FLASH_Mem_DQ_pin_I(5),
      T => fpga_0_FLASH_Mem_DQ_pin_T(5)
    );

  iobuf_39 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(6),
      IO => fpga_0_FLASH_Mem_DQ_pin(6),
      O => fpga_0_FLASH_Mem_DQ_pin_I(6),
      T => fpga_0_FLASH_Mem_DQ_pin_T(6)
    );

  iobuf_40 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(7),
      IO => fpga_0_FLASH_Mem_DQ_pin(7),
      O => fpga_0_FLASH_Mem_DQ_pin_I(7),
      T => fpga_0_FLASH_Mem_DQ_pin_T(7)
    );

  iobuf_41 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(8),
      IO => fpga_0_FLASH_Mem_DQ_pin(8),
      O => fpga_0_FLASH_Mem_DQ_pin_I(8),
      T => fpga_0_FLASH_Mem_DQ_pin_T(8)
    );

  iobuf_42 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(9),
      IO => fpga_0_FLASH_Mem_DQ_pin(9),
      O => fpga_0_FLASH_Mem_DQ_pin_I(9),
      T => fpga_0_FLASH_Mem_DQ_pin_T(9)
    );

  iobuf_43 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(10),
      IO => fpga_0_FLASH_Mem_DQ_pin(10),
      O => fpga_0_FLASH_Mem_DQ_pin_I(10),
      T => fpga_0_FLASH_Mem_DQ_pin_T(10)
    );

  iobuf_44 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(11),
      IO => fpga_0_FLASH_Mem_DQ_pin(11),
      O => fpga_0_FLASH_Mem_DQ_pin_I(11),
      T => fpga_0_FLASH_Mem_DQ_pin_T(11)
    );

  iobuf_45 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(12),
      IO => fpga_0_FLASH_Mem_DQ_pin(12),
      O => fpga_0_FLASH_Mem_DQ_pin_I(12),
      T => fpga_0_FLASH_Mem_DQ_pin_T(12)
    );

  iobuf_46 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(13),
      IO => fpga_0_FLASH_Mem_DQ_pin(13),
      O => fpga_0_FLASH_Mem_DQ_pin_I(13),
      T => fpga_0_FLASH_Mem_DQ_pin_T(13)
    );

  iobuf_47 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(14),
      IO => fpga_0_FLASH_Mem_DQ_pin(14),
      O => fpga_0_FLASH_Mem_DQ_pin_I(14),
      T => fpga_0_FLASH_Mem_DQ_pin_T(14)
    );

  iobuf_48 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(15),
      IO => fpga_0_FLASH_Mem_DQ_pin(15),
      O => fpga_0_FLASH_Mem_DQ_pin_I(15),
      T => fpga_0_FLASH_Mem_DQ_pin_T(15)
    );

  iobuf_49 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(16),
      IO => fpga_0_FLASH_Mem_DQ_pin(16),
      O => fpga_0_FLASH_Mem_DQ_pin_I(16),
      T => fpga_0_FLASH_Mem_DQ_pin_T(16)
    );

  iobuf_50 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(17),
      IO => fpga_0_FLASH_Mem_DQ_pin(17),
      O => fpga_0_FLASH_Mem_DQ_pin_I(17),
      T => fpga_0_FLASH_Mem_DQ_pin_T(17)
    );

  iobuf_51 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(18),
      IO => fpga_0_FLASH_Mem_DQ_pin(18),
      O => fpga_0_FLASH_Mem_DQ_pin_I(18),
      T => fpga_0_FLASH_Mem_DQ_pin_T(18)
    );

  iobuf_52 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(19),
      IO => fpga_0_FLASH_Mem_DQ_pin(19),
      O => fpga_0_FLASH_Mem_DQ_pin_I(19),
      T => fpga_0_FLASH_Mem_DQ_pin_T(19)
    );

  iobuf_53 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(20),
      IO => fpga_0_FLASH_Mem_DQ_pin(20),
      O => fpga_0_FLASH_Mem_DQ_pin_I(20),
      T => fpga_0_FLASH_Mem_DQ_pin_T(20)
    );

  iobuf_54 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(21),
      IO => fpga_0_FLASH_Mem_DQ_pin(21),
      O => fpga_0_FLASH_Mem_DQ_pin_I(21),
      T => fpga_0_FLASH_Mem_DQ_pin_T(21)
    );

  iobuf_55 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(22),
      IO => fpga_0_FLASH_Mem_DQ_pin(22),
      O => fpga_0_FLASH_Mem_DQ_pin_I(22),
      T => fpga_0_FLASH_Mem_DQ_pin_T(22)
    );

  iobuf_56 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(23),
      IO => fpga_0_FLASH_Mem_DQ_pin(23),
      O => fpga_0_FLASH_Mem_DQ_pin_I(23),
      T => fpga_0_FLASH_Mem_DQ_pin_T(23)
    );

  iobuf_57 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(24),
      IO => fpga_0_FLASH_Mem_DQ_pin(24),
      O => fpga_0_FLASH_Mem_DQ_pin_I(24),
      T => fpga_0_FLASH_Mem_DQ_pin_T(24)
    );

  iobuf_58 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(25),
      IO => fpga_0_FLASH_Mem_DQ_pin(25),
      O => fpga_0_FLASH_Mem_DQ_pin_I(25),
      T => fpga_0_FLASH_Mem_DQ_pin_T(25)
    );

  iobuf_59 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(26),
      IO => fpga_0_FLASH_Mem_DQ_pin(26),
      O => fpga_0_FLASH_Mem_DQ_pin_I(26),
      T => fpga_0_FLASH_Mem_DQ_pin_T(26)
    );

  iobuf_60 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(27),
      IO => fpga_0_FLASH_Mem_DQ_pin(27),
      O => fpga_0_FLASH_Mem_DQ_pin_I(27),
      T => fpga_0_FLASH_Mem_DQ_pin_T(27)
    );

  iobuf_61 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(28),
      IO => fpga_0_FLASH_Mem_DQ_pin(28),
      O => fpga_0_FLASH_Mem_DQ_pin_I(28),
      T => fpga_0_FLASH_Mem_DQ_pin_T(28)
    );

  iobuf_62 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(29),
      IO => fpga_0_FLASH_Mem_DQ_pin(29),
      O => fpga_0_FLASH_Mem_DQ_pin_I(29),
      T => fpga_0_FLASH_Mem_DQ_pin_T(29)
    );

  iobuf_63 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(30),
      IO => fpga_0_FLASH_Mem_DQ_pin(30),
      O => fpga_0_FLASH_Mem_DQ_pin_I(30),
      T => fpga_0_FLASH_Mem_DQ_pin_T(30)
    );

  iobuf_64 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(31),
      IO => fpga_0_FLASH_Mem_DQ_pin(31),
      O => fpga_0_FLASH_Mem_DQ_pin_I(31),
      T => fpga_0_FLASH_Mem_DQ_pin_T(31)
    );

end architecture STRUCTURE;


-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
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
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
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
  end component;

  attribute BUFFER_TYPE : STRING;
  attribute BOX_TYPE : STRING;
  attribute BUFFER_TYPE of fpga_0_SysACE_CompactFlash_SysACE_CLK_pin : signal is "BUFGP";
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      fpga_0_LEDs_4Bit_GPIO_IO_pin => fpga_0_LEDs_4Bit_GPIO_IO_pin,
      fpga_0_LEDs_Positions_GPIO_IO_pin => fpga_0_LEDs_Positions_GPIO_IO_pin,
      fpga_0_Push_Buttons_Position_GPIO_IO_pin => fpga_0_Push_Buttons_Position_GPIO_IO_pin,
      fpga_0_IIC_EEPROM_Sda_pin => fpga_0_IIC_EEPROM_Sda_pin,
      fpga_0_IIC_EEPROM_Scl_pin => fpga_0_IIC_EEPROM_Scl_pin,
      fpga_0_SysACE_CompactFlash_SysACE_MPA_pin => fpga_0_SysACE_CompactFlash_SysACE_MPA_pin,
      fpga_0_SysACE_CompactFlash_SysACE_CLK_pin => fpga_0_SysACE_CompactFlash_SysACE_CLK_pin,
      fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin => fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin,
      fpga_0_SysACE_CompactFlash_SysACE_CEN_pin => fpga_0_SysACE_CompactFlash_SysACE_CEN_pin,
      fpga_0_SysACE_CompactFlash_SysACE_OEN_pin => fpga_0_SysACE_CompactFlash_SysACE_OEN_pin,
      fpga_0_SysACE_CompactFlash_SysACE_WEN_pin => fpga_0_SysACE_CompactFlash_SysACE_WEN_pin,
      fpga_0_SysACE_CompactFlash_SysACE_MPD_pin => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin,
      fpga_0_DDR_SDRAM_DDR_Clk_pin => fpga_0_DDR_SDRAM_DDR_Clk_pin,
      fpga_0_DDR_SDRAM_DDR_Clk_n_pin => fpga_0_DDR_SDRAM_DDR_Clk_n_pin,
      fpga_0_DDR_SDRAM_DDR_CE_pin => fpga_0_DDR_SDRAM_DDR_CE_pin,
      fpga_0_DDR_SDRAM_DDR_CS_n_pin => fpga_0_DDR_SDRAM_DDR_CS_n_pin,
      fpga_0_DDR_SDRAM_DDR_RAS_n_pin => fpga_0_DDR_SDRAM_DDR_RAS_n_pin,
      fpga_0_DDR_SDRAM_DDR_CAS_n_pin => fpga_0_DDR_SDRAM_DDR_CAS_n_pin,
      fpga_0_DDR_SDRAM_DDR_WE_n_pin => fpga_0_DDR_SDRAM_DDR_WE_n_pin,
      fpga_0_DDR_SDRAM_DDR_BankAddr_pin => fpga_0_DDR_SDRAM_DDR_BankAddr_pin,
      fpga_0_DDR_SDRAM_DDR_Addr_pin => fpga_0_DDR_SDRAM_DDR_Addr_pin,
      fpga_0_DDR_SDRAM_DDR_DQ_pin => fpga_0_DDR_SDRAM_DDR_DQ_pin,
      fpga_0_DDR_SDRAM_DDR_DM_pin => fpga_0_DDR_SDRAM_DDR_DM_pin,
      fpga_0_DDR_SDRAM_DDR_DQS_pin => fpga_0_DDR_SDRAM_DDR_DQS_pin,
      fpga_0_TriMode_MAC_GMII_TemacPhy_RST_n_pin => fpga_0_TriMode_MAC_GMII_TemacPhy_RST_n_pin,
      fpga_0_TriMode_MAC_GMII_MII_TX_CLK_0_pin => fpga_0_TriMode_MAC_GMII_MII_TX_CLK_0_pin,
      fpga_0_TriMode_MAC_GMII_GMII_TXD_0_pin => fpga_0_TriMode_MAC_GMII_GMII_TXD_0_pin,
      fpga_0_TriMode_MAC_GMII_GMII_TX_EN_0_pin => fpga_0_TriMode_MAC_GMII_GMII_TX_EN_0_pin,
      fpga_0_TriMode_MAC_GMII_GMII_TX_ER_0_pin => fpga_0_TriMode_MAC_GMII_GMII_TX_ER_0_pin,
      fpga_0_TriMode_MAC_GMII_GMII_TX_CLK_0_pin => fpga_0_TriMode_MAC_GMII_GMII_TX_CLK_0_pin,
      fpga_0_TriMode_MAC_GMII_GMII_RXD_0_pin => fpga_0_TriMode_MAC_GMII_GMII_RXD_0_pin,
      fpga_0_TriMode_MAC_GMII_GMII_RX_DV_0_pin => fpga_0_TriMode_MAC_GMII_GMII_RX_DV_0_pin,
      fpga_0_TriMode_MAC_GMII_GMII_RX_ER_0_pin => fpga_0_TriMode_MAC_GMII_GMII_RX_ER_0_pin,
      fpga_0_TriMode_MAC_GMII_GMII_RX_CLK_0_pin => fpga_0_TriMode_MAC_GMII_GMII_RX_CLK_0_pin,
      fpga_0_TriMode_MAC_GMII_MDC_0_pin => fpga_0_TriMode_MAC_GMII_MDC_0_pin,
      fpga_0_TriMode_MAC_GMII_MDIO_0_pin => fpga_0_TriMode_MAC_GMII_MDIO_0_pin,
      fpga_0_FLASH_Mem_A_pin => fpga_0_FLASH_Mem_A_pin,
      fpga_0_FLASH_Mem_OEN_pin => fpga_0_FLASH_Mem_OEN_pin,
      fpga_0_FLASH_Mem_WEN_pin => fpga_0_FLASH_Mem_WEN_pin,
      fpga_0_FLASH_Mem_CE_pin => fpga_0_FLASH_Mem_CE_pin,
      fpga_0_FLASH_Mem_DQ_pin => fpga_0_FLASH_Mem_DQ_pin,
      fpga_0_RS232_Uart_sin_pin => fpga_0_RS232_Uart_sin_pin,
      fpga_0_RS232_Uart_sout_pin => fpga_0_RS232_Uart_sout_pin,
      fpga_0_clk_1_sys_clk_pin => fpga_0_clk_1_sys_clk_pin,
      fpga_0_rst_1_sys_rst_pin => fpga_0_rst_1_sys_rst_pin
    );

end architecture STRUCTURE;


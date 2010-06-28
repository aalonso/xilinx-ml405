-------------------------------------------------------------------------------
-- mgt_wrapper_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library mgt_protector_v1_00_a;
use mgt_protector_v1_00_a.all;

entity mgt_wrapper_wrapper is
  port (
    CLK : in std_logic
  );

  attribute x_core_info : STRING;
  attribute x_core_info of mgt_wrapper_wrapper : entity is "mgt_protector_v1_00_a";

end mgt_wrapper_wrapper;

architecture STRUCTURE of mgt_wrapper_wrapper is

  component mgt_protector is
    generic (
      C_NUM_TILES : INTEGER;
      C_USE_0 : std_logic;
      C_USE_1 : std_logic;
      C_USE_2 : std_logic;
      C_USE_3 : std_logic;
      C_USE_4 : std_logic;
      C_USE_5 : std_logic;
      C_USE_6 : std_logic;
      C_USE_7 : std_logic;
      C_USE_8 : std_logic;
      C_USE_9 : std_logic;
      C_USE_10 : std_logic;
      C_USE_11 : std_logic;
      C_USE_12 : std_logic;
      C_USE_13 : std_logic;
      C_USE_14 : std_logic;
      C_USE_15 : std_logic
    );
    port (
      CLK : in std_logic
    );
  end component;

begin

  MGT_wrapper : mgt_protector
    generic map (
      C_NUM_TILES => 4,
      C_USE_0 => '1',
      C_USE_1 => '1',
      C_USE_2 => '1',
      C_USE_3 => '1',
      C_USE_4 => '1',
      C_USE_5 => '1',
      C_USE_6 => '1',
      C_USE_7 => '1',
      C_USE_8 => '1',
      C_USE_9 => '1',
      C_USE_10 => '1',
      C_USE_11 => '1',
      C_USE_12 => '1',
      C_USE_13 => '1',
      C_USE_14 => '1',
      C_USE_15 => '1'
    )
    port map (
      CLK => CLK
    );

end architecture STRUCTURE;


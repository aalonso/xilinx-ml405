-------------------------------------------------------------------------------
-- plb_bram_if_cntlr_1_bram_elaborate.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity plb_bram_if_cntlr_1_bram_elaborate is
  generic (
    C_MEMSIZE : integer;
    C_PORT_DWIDTH : integer;
    C_PORT_AWIDTH : integer;
    C_NUM_WE : integer;
    C_FAMILY : string
    );
  port (
    BRAM_Rst_A : in std_logic;
    BRAM_Clk_A : in std_logic;
    BRAM_EN_A : in std_logic;
    BRAM_WEN_A : in std_logic_vector(0 to C_NUM_WE-1);
    BRAM_Addr_A : in std_logic_vector(0 to C_PORT_AWIDTH-1);
    BRAM_Din_A : out std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Dout_A : in std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Rst_B : in std_logic;
    BRAM_Clk_B : in std_logic;
    BRAM_EN_B : in std_logic;
    BRAM_WEN_B : in std_logic_vector(0 to C_NUM_WE-1);
    BRAM_Addr_B : in std_logic_vector(0 to C_PORT_AWIDTH-1);
    BRAM_Din_B : out std_logic_vector(0 to C_PORT_DWIDTH-1);
    BRAM_Dout_B : in std_logic_vector(0 to C_PORT_DWIDTH-1)
  );

  attribute keep_hierarchy : STRING;
  attribute keep_hierarchy of plb_bram_if_cntlr_1_bram_elaborate : entity is "yes";

end plb_bram_if_cntlr_1_bram_elaborate;

architecture STRUCTURE of plb_bram_if_cntlr_1_bram_elaborate is

  component RAMB16 is
    generic (
      WRITE_MODE_A : string;
      WRITE_MODE_B : string;
      INIT_FILE : string;
      READ_WIDTH_A : integer;
      READ_WIDTH_B : integer;
      WRITE_WIDTH_A : integer;
      WRITE_WIDTH_B : integer;
      RAM_EXTENSION_A : string;
      RAM_EXTENSION_B : string
    );
    port (
      ADDRA : in std_logic_vector(14 downto 0);
      CASCADEINA : in std_logic;
      CASCADEOUTA : out std_logic;
      CLKA : in std_logic;
      DIA : in std_logic_vector(31 downto 0);
      DIPA : in std_logic_vector(3 downto 0);
      DOA : out std_logic_vector(31 downto 0);
      DOPA : out std_logic_vector(3 downto 0);
      ENA : in std_logic;
      REGCEA : in std_logic;
      SSRA : in std_logic;
      WEA : in std_logic_vector(3 downto 0);
      ADDRB : in std_logic_vector(14 downto 0);
      CASCADEINB : in std_logic;
      CASCADEOUTB : out std_logic;
      CLKB : in std_logic;
      DIB : in std_logic_vector(31 downto 0);
      DIPB : in std_logic_vector(3 downto 0);
      DOB : out std_logic_vector(31 downto 0);
      DOPB : out std_logic_vector(3 downto 0);
      ENB : in std_logic;
      REGCEB : in std_logic;
      SSRB : in std_logic;
      WEB : in std_logic_vector(3 downto 0)
    );
  end component;

  attribute BMM_INFO : STRING;

  attribute BMM_INFO of ramb16_0: label is " ";
  attribute BMM_INFO of ramb16_1: label is " ";
  attribute BMM_INFO of ramb16_2: label is " ";
  attribute BMM_INFO of ramb16_3: label is " ";
  attribute BMM_INFO of ramb16_4: label is " ";
  attribute BMM_INFO of ramb16_5: label is " ";
  attribute BMM_INFO of ramb16_6: label is " ";
  attribute BMM_INFO of ramb16_7: label is " ";
  attribute BMM_INFO of ramb16_8: label is " ";
  attribute BMM_INFO of ramb16_9: label is " ";
  attribute BMM_INFO of ramb16_10: label is " ";
  attribute BMM_INFO of ramb16_11: label is " ";
  attribute BMM_INFO of ramb16_12: label is " ";
  attribute BMM_INFO of ramb16_13: label is " ";
  attribute BMM_INFO of ramb16_14: label is " ";
  attribute BMM_INFO of ramb16_15: label is " ";
  attribute BMM_INFO of ramb16_16: label is " ";
  attribute BMM_INFO of ramb16_17: label is " ";
  attribute BMM_INFO of ramb16_18: label is " ";
  attribute BMM_INFO of ramb16_19: label is " ";
  attribute BMM_INFO of ramb16_20: label is " ";
  attribute BMM_INFO of ramb16_21: label is " ";
  attribute BMM_INFO of ramb16_22: label is " ";
  attribute BMM_INFO of ramb16_23: label is " ";
  attribute BMM_INFO of ramb16_24: label is " ";
  attribute BMM_INFO of ramb16_25: label is " ";
  attribute BMM_INFO of ramb16_26: label is " ";
  attribute BMM_INFO of ramb16_27: label is " ";
  attribute BMM_INFO of ramb16_28: label is " ";
  attribute BMM_INFO of ramb16_29: label is " ";
  attribute BMM_INFO of ramb16_30: label is " ";
  attribute BMM_INFO of ramb16_31: label is " ";
  -- Internal signals

  signal net_gnd0 : std_logic;
  signal net_gnd4 : std_logic_vector(3 downto 0);
  signal pgassign1 : std_logic_vector(0 to 0);
  signal pgassign2 : std_logic_vector(0 to 0);
  signal pgassign3 : std_logic_vector(0 to 29);
  signal pgassign4 : std_logic_vector(14 downto 0);
  signal pgassign5 : std_logic_vector(31 downto 0);
  signal pgassign6 : std_logic_vector(31 downto 0);
  signal pgassign7 : std_logic_vector(3 downto 0);
  signal pgassign8 : std_logic_vector(14 downto 0);
  signal pgassign9 : std_logic_vector(31 downto 0);
  signal pgassign10 : std_logic_vector(31 downto 0);
  signal pgassign11 : std_logic_vector(3 downto 0);
  signal pgassign12 : std_logic_vector(14 downto 0);
  signal pgassign13 : std_logic_vector(31 downto 0);
  signal pgassign14 : std_logic_vector(31 downto 0);
  signal pgassign15 : std_logic_vector(3 downto 0);
  signal pgassign16 : std_logic_vector(14 downto 0);
  signal pgassign17 : std_logic_vector(31 downto 0);
  signal pgassign18 : std_logic_vector(31 downto 0);
  signal pgassign19 : std_logic_vector(3 downto 0);
  signal pgassign20 : std_logic_vector(14 downto 0);
  signal pgassign21 : std_logic_vector(31 downto 0);
  signal pgassign22 : std_logic_vector(31 downto 0);
  signal pgassign23 : std_logic_vector(3 downto 0);
  signal pgassign24 : std_logic_vector(14 downto 0);
  signal pgassign25 : std_logic_vector(31 downto 0);
  signal pgassign26 : std_logic_vector(31 downto 0);
  signal pgassign27 : std_logic_vector(3 downto 0);
  signal pgassign28 : std_logic_vector(14 downto 0);
  signal pgassign29 : std_logic_vector(31 downto 0);
  signal pgassign30 : std_logic_vector(31 downto 0);
  signal pgassign31 : std_logic_vector(3 downto 0);
  signal pgassign32 : std_logic_vector(14 downto 0);
  signal pgassign33 : std_logic_vector(31 downto 0);
  signal pgassign34 : std_logic_vector(31 downto 0);
  signal pgassign35 : std_logic_vector(3 downto 0);
  signal pgassign36 : std_logic_vector(14 downto 0);
  signal pgassign37 : std_logic_vector(31 downto 0);
  signal pgassign38 : std_logic_vector(31 downto 0);
  signal pgassign39 : std_logic_vector(3 downto 0);
  signal pgassign40 : std_logic_vector(14 downto 0);
  signal pgassign41 : std_logic_vector(31 downto 0);
  signal pgassign42 : std_logic_vector(31 downto 0);
  signal pgassign43 : std_logic_vector(3 downto 0);
  signal pgassign44 : std_logic_vector(14 downto 0);
  signal pgassign45 : std_logic_vector(31 downto 0);
  signal pgassign46 : std_logic_vector(31 downto 0);
  signal pgassign47 : std_logic_vector(3 downto 0);
  signal pgassign48 : std_logic_vector(14 downto 0);
  signal pgassign49 : std_logic_vector(31 downto 0);
  signal pgassign50 : std_logic_vector(31 downto 0);
  signal pgassign51 : std_logic_vector(3 downto 0);
  signal pgassign52 : std_logic_vector(14 downto 0);
  signal pgassign53 : std_logic_vector(31 downto 0);
  signal pgassign54 : std_logic_vector(31 downto 0);
  signal pgassign55 : std_logic_vector(3 downto 0);
  signal pgassign56 : std_logic_vector(14 downto 0);
  signal pgassign57 : std_logic_vector(31 downto 0);
  signal pgassign58 : std_logic_vector(31 downto 0);
  signal pgassign59 : std_logic_vector(3 downto 0);
  signal pgassign60 : std_logic_vector(14 downto 0);
  signal pgassign61 : std_logic_vector(31 downto 0);
  signal pgassign62 : std_logic_vector(31 downto 0);
  signal pgassign63 : std_logic_vector(3 downto 0);
  signal pgassign64 : std_logic_vector(14 downto 0);
  signal pgassign65 : std_logic_vector(31 downto 0);
  signal pgassign66 : std_logic_vector(31 downto 0);
  signal pgassign67 : std_logic_vector(3 downto 0);
  signal pgassign68 : std_logic_vector(14 downto 0);
  signal pgassign69 : std_logic_vector(31 downto 0);
  signal pgassign70 : std_logic_vector(31 downto 0);
  signal pgassign71 : std_logic_vector(3 downto 0);
  signal pgassign72 : std_logic_vector(14 downto 0);
  signal pgassign73 : std_logic_vector(31 downto 0);
  signal pgassign74 : std_logic_vector(31 downto 0);
  signal pgassign75 : std_logic_vector(3 downto 0);
  signal pgassign76 : std_logic_vector(14 downto 0);
  signal pgassign77 : std_logic_vector(31 downto 0);
  signal pgassign78 : std_logic_vector(31 downto 0);
  signal pgassign79 : std_logic_vector(3 downto 0);
  signal pgassign80 : std_logic_vector(14 downto 0);
  signal pgassign81 : std_logic_vector(31 downto 0);
  signal pgassign82 : std_logic_vector(31 downto 0);
  signal pgassign83 : std_logic_vector(3 downto 0);
  signal pgassign84 : std_logic_vector(14 downto 0);
  signal pgassign85 : std_logic_vector(31 downto 0);
  signal pgassign86 : std_logic_vector(31 downto 0);
  signal pgassign87 : std_logic_vector(3 downto 0);
  signal pgassign88 : std_logic_vector(14 downto 0);
  signal pgassign89 : std_logic_vector(31 downto 0);
  signal pgassign90 : std_logic_vector(31 downto 0);
  signal pgassign91 : std_logic_vector(3 downto 0);
  signal pgassign92 : std_logic_vector(14 downto 0);
  signal pgassign93 : std_logic_vector(31 downto 0);
  signal pgassign94 : std_logic_vector(31 downto 0);
  signal pgassign95 : std_logic_vector(3 downto 0);
  signal pgassign96 : std_logic_vector(14 downto 0);
  signal pgassign97 : std_logic_vector(31 downto 0);
  signal pgassign98 : std_logic_vector(31 downto 0);
  signal pgassign99 : std_logic_vector(3 downto 0);
  signal pgassign100 : std_logic_vector(14 downto 0);
  signal pgassign101 : std_logic_vector(31 downto 0);
  signal pgassign102 : std_logic_vector(31 downto 0);
  signal pgassign103 : std_logic_vector(3 downto 0);
  signal pgassign104 : std_logic_vector(14 downto 0);
  signal pgassign105 : std_logic_vector(31 downto 0);
  signal pgassign106 : std_logic_vector(31 downto 0);
  signal pgassign107 : std_logic_vector(3 downto 0);
  signal pgassign108 : std_logic_vector(14 downto 0);
  signal pgassign109 : std_logic_vector(31 downto 0);
  signal pgassign110 : std_logic_vector(31 downto 0);
  signal pgassign111 : std_logic_vector(3 downto 0);
  signal pgassign112 : std_logic_vector(14 downto 0);
  signal pgassign113 : std_logic_vector(31 downto 0);
  signal pgassign114 : std_logic_vector(31 downto 0);
  signal pgassign115 : std_logic_vector(3 downto 0);
  signal pgassign116 : std_logic_vector(14 downto 0);
  signal pgassign117 : std_logic_vector(31 downto 0);
  signal pgassign118 : std_logic_vector(31 downto 0);
  signal pgassign119 : std_logic_vector(3 downto 0);
  signal pgassign120 : std_logic_vector(14 downto 0);
  signal pgassign121 : std_logic_vector(31 downto 0);
  signal pgassign122 : std_logic_vector(31 downto 0);
  signal pgassign123 : std_logic_vector(3 downto 0);
  signal pgassign124 : std_logic_vector(14 downto 0);
  signal pgassign125 : std_logic_vector(31 downto 0);
  signal pgassign126 : std_logic_vector(31 downto 0);
  signal pgassign127 : std_logic_vector(3 downto 0);
  signal pgassign128 : std_logic_vector(14 downto 0);
  signal pgassign129 : std_logic_vector(31 downto 0);
  signal pgassign130 : std_logic_vector(31 downto 0);
  signal pgassign131 : std_logic_vector(3 downto 0);
  signal pgassign132 : std_logic_vector(14 downto 0);
  signal pgassign133 : std_logic_vector(31 downto 0);
  signal pgassign134 : std_logic_vector(31 downto 0);
  signal pgassign135 : std_logic_vector(3 downto 0);
  signal pgassign136 : std_logic_vector(14 downto 0);
  signal pgassign137 : std_logic_vector(31 downto 0);
  signal pgassign138 : std_logic_vector(31 downto 0);
  signal pgassign139 : std_logic_vector(3 downto 0);
  signal pgassign140 : std_logic_vector(14 downto 0);
  signal pgassign141 : std_logic_vector(31 downto 0);
  signal pgassign142 : std_logic_vector(31 downto 0);
  signal pgassign143 : std_logic_vector(3 downto 0);
  signal pgassign144 : std_logic_vector(14 downto 0);
  signal pgassign145 : std_logic_vector(31 downto 0);
  signal pgassign146 : std_logic_vector(31 downto 0);
  signal pgassign147 : std_logic_vector(3 downto 0);
  signal pgassign148 : std_logic_vector(14 downto 0);
  signal pgassign149 : std_logic_vector(31 downto 0);
  signal pgassign150 : std_logic_vector(31 downto 0);
  signal pgassign151 : std_logic_vector(3 downto 0);
  signal pgassign152 : std_logic_vector(14 downto 0);
  signal pgassign153 : std_logic_vector(31 downto 0);
  signal pgassign154 : std_logic_vector(31 downto 0);
  signal pgassign155 : std_logic_vector(3 downto 0);
  signal pgassign156 : std_logic_vector(14 downto 0);
  signal pgassign157 : std_logic_vector(31 downto 0);
  signal pgassign158 : std_logic_vector(31 downto 0);
  signal pgassign159 : std_logic_vector(3 downto 0);
  signal pgassign160 : std_logic_vector(14 downto 0);
  signal pgassign161 : std_logic_vector(31 downto 0);
  signal pgassign162 : std_logic_vector(31 downto 0);
  signal pgassign163 : std_logic_vector(3 downto 0);
  signal pgassign164 : std_logic_vector(14 downto 0);
  signal pgassign165 : std_logic_vector(31 downto 0);
  signal pgassign166 : std_logic_vector(31 downto 0);
  signal pgassign167 : std_logic_vector(3 downto 0);
  signal pgassign168 : std_logic_vector(14 downto 0);
  signal pgassign169 : std_logic_vector(31 downto 0);
  signal pgassign170 : std_logic_vector(31 downto 0);
  signal pgassign171 : std_logic_vector(3 downto 0);
  signal pgassign172 : std_logic_vector(14 downto 0);
  signal pgassign173 : std_logic_vector(31 downto 0);
  signal pgassign174 : std_logic_vector(31 downto 0);
  signal pgassign175 : std_logic_vector(3 downto 0);
  signal pgassign176 : std_logic_vector(14 downto 0);
  signal pgassign177 : std_logic_vector(31 downto 0);
  signal pgassign178 : std_logic_vector(31 downto 0);
  signal pgassign179 : std_logic_vector(3 downto 0);
  signal pgassign180 : std_logic_vector(14 downto 0);
  signal pgassign181 : std_logic_vector(31 downto 0);
  signal pgassign182 : std_logic_vector(31 downto 0);
  signal pgassign183 : std_logic_vector(3 downto 0);
  signal pgassign184 : std_logic_vector(14 downto 0);
  signal pgassign185 : std_logic_vector(31 downto 0);
  signal pgassign186 : std_logic_vector(31 downto 0);
  signal pgassign187 : std_logic_vector(3 downto 0);
  signal pgassign188 : std_logic_vector(14 downto 0);
  signal pgassign189 : std_logic_vector(31 downto 0);
  signal pgassign190 : std_logic_vector(31 downto 0);
  signal pgassign191 : std_logic_vector(3 downto 0);
  signal pgassign192 : std_logic_vector(14 downto 0);
  signal pgassign193 : std_logic_vector(31 downto 0);
  signal pgassign194 : std_logic_vector(31 downto 0);
  signal pgassign195 : std_logic_vector(3 downto 0);
  signal pgassign196 : std_logic_vector(14 downto 0);
  signal pgassign197 : std_logic_vector(31 downto 0);
  signal pgassign198 : std_logic_vector(31 downto 0);
  signal pgassign199 : std_logic_vector(3 downto 0);
  signal pgassign200 : std_logic_vector(14 downto 0);
  signal pgassign201 : std_logic_vector(31 downto 0);
  signal pgassign202 : std_logic_vector(31 downto 0);
  signal pgassign203 : std_logic_vector(3 downto 0);
  signal pgassign204 : std_logic_vector(14 downto 0);
  signal pgassign205 : std_logic_vector(31 downto 0);
  signal pgassign206 : std_logic_vector(31 downto 0);
  signal pgassign207 : std_logic_vector(3 downto 0);
  signal pgassign208 : std_logic_vector(14 downto 0);
  signal pgassign209 : std_logic_vector(31 downto 0);
  signal pgassign210 : std_logic_vector(31 downto 0);
  signal pgassign211 : std_logic_vector(3 downto 0);
  signal pgassign212 : std_logic_vector(14 downto 0);
  signal pgassign213 : std_logic_vector(31 downto 0);
  signal pgassign214 : std_logic_vector(31 downto 0);
  signal pgassign215 : std_logic_vector(3 downto 0);
  signal pgassign216 : std_logic_vector(14 downto 0);
  signal pgassign217 : std_logic_vector(31 downto 0);
  signal pgassign218 : std_logic_vector(31 downto 0);
  signal pgassign219 : std_logic_vector(3 downto 0);
  signal pgassign220 : std_logic_vector(14 downto 0);
  signal pgassign221 : std_logic_vector(31 downto 0);
  signal pgassign222 : std_logic_vector(31 downto 0);
  signal pgassign223 : std_logic_vector(3 downto 0);
  signal pgassign224 : std_logic_vector(14 downto 0);
  signal pgassign225 : std_logic_vector(31 downto 0);
  signal pgassign226 : std_logic_vector(31 downto 0);
  signal pgassign227 : std_logic_vector(3 downto 0);
  signal pgassign228 : std_logic_vector(14 downto 0);
  signal pgassign229 : std_logic_vector(31 downto 0);
  signal pgassign230 : std_logic_vector(31 downto 0);
  signal pgassign231 : std_logic_vector(3 downto 0);
  signal pgassign232 : std_logic_vector(14 downto 0);
  signal pgassign233 : std_logic_vector(31 downto 0);
  signal pgassign234 : std_logic_vector(31 downto 0);
  signal pgassign235 : std_logic_vector(3 downto 0);
  signal pgassign236 : std_logic_vector(14 downto 0);
  signal pgassign237 : std_logic_vector(31 downto 0);
  signal pgassign238 : std_logic_vector(31 downto 0);
  signal pgassign239 : std_logic_vector(3 downto 0);
  signal pgassign240 : std_logic_vector(14 downto 0);
  signal pgassign241 : std_logic_vector(31 downto 0);
  signal pgassign242 : std_logic_vector(31 downto 0);
  signal pgassign243 : std_logic_vector(3 downto 0);
  signal pgassign244 : std_logic_vector(14 downto 0);
  signal pgassign245 : std_logic_vector(31 downto 0);
  signal pgassign246 : std_logic_vector(31 downto 0);
  signal pgassign247 : std_logic_vector(3 downto 0);
  signal pgassign248 : std_logic_vector(14 downto 0);
  signal pgassign249 : std_logic_vector(31 downto 0);
  signal pgassign250 : std_logic_vector(31 downto 0);
  signal pgassign251 : std_logic_vector(3 downto 0);
  signal pgassign252 : std_logic_vector(14 downto 0);
  signal pgassign253 : std_logic_vector(31 downto 0);
  signal pgassign254 : std_logic_vector(31 downto 0);
  signal pgassign255 : std_logic_vector(3 downto 0);
  signal pgassign256 : std_logic_vector(14 downto 0);
  signal pgassign257 : std_logic_vector(31 downto 0);
  signal pgassign258 : std_logic_vector(31 downto 0);
  signal pgassign259 : std_logic_vector(3 downto 0);

begin

  -- Internal assignments

  pgassign1(0 to 0) <= B"1";
  pgassign2(0 to 0) <= B"0";
  pgassign3(0 to 29) <= B"000000000000000000000000000000";
  pgassign4(14 downto 14) <= B"1";
  pgassign4(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign4(0 downto 0) <= B"0";
  pgassign5(31 downto 2) <= B"000000000000000000000000000000";
  pgassign5(1 downto 0) <= BRAM_Dout_A(0 to 1);
  BRAM_Din_A(0 to 1) <= pgassign6(1 downto 0);
  pgassign7(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign7(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign7(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign7(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign8(14 downto 14) <= B"1";
  pgassign8(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign8(0 downto 0) <= B"0";
  pgassign9(31 downto 2) <= B"000000000000000000000000000000";
  pgassign9(1 downto 0) <= BRAM_Dout_B(0 to 1);
  BRAM_Din_B(0 to 1) <= pgassign10(1 downto 0);
  pgassign11(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign11(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign11(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign11(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign12(14 downto 14) <= B"1";
  pgassign12(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign12(0 downto 0) <= B"0";
  pgassign13(31 downto 2) <= B"000000000000000000000000000000";
  pgassign13(1 downto 0) <= BRAM_Dout_A(2 to 3);
  BRAM_Din_A(2 to 3) <= pgassign14(1 downto 0);
  pgassign15(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign15(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign15(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign15(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign16(14 downto 14) <= B"1";
  pgassign16(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign16(0 downto 0) <= B"0";
  pgassign17(31 downto 2) <= B"000000000000000000000000000000";
  pgassign17(1 downto 0) <= BRAM_Dout_B(2 to 3);
  BRAM_Din_B(2 to 3) <= pgassign18(1 downto 0);
  pgassign19(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign19(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign19(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign19(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign20(14 downto 14) <= B"1";
  pgassign20(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign20(0 downto 0) <= B"0";
  pgassign21(31 downto 2) <= B"000000000000000000000000000000";
  pgassign21(1 downto 0) <= BRAM_Dout_A(4 to 5);
  BRAM_Din_A(4 to 5) <= pgassign22(1 downto 0);
  pgassign23(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign23(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign23(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign23(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign24(14 downto 14) <= B"1";
  pgassign24(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign24(0 downto 0) <= B"0";
  pgassign25(31 downto 2) <= B"000000000000000000000000000000";
  pgassign25(1 downto 0) <= BRAM_Dout_B(4 to 5);
  BRAM_Din_B(4 to 5) <= pgassign26(1 downto 0);
  pgassign27(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign27(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign27(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign27(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign28(14 downto 14) <= B"1";
  pgassign28(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign28(0 downto 0) <= B"0";
  pgassign29(31 downto 2) <= B"000000000000000000000000000000";
  pgassign29(1 downto 0) <= BRAM_Dout_A(6 to 7);
  BRAM_Din_A(6 to 7) <= pgassign30(1 downto 0);
  pgassign31(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign31(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign31(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign31(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign32(14 downto 14) <= B"1";
  pgassign32(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign32(0 downto 0) <= B"0";
  pgassign33(31 downto 2) <= B"000000000000000000000000000000";
  pgassign33(1 downto 0) <= BRAM_Dout_B(6 to 7);
  BRAM_Din_B(6 to 7) <= pgassign34(1 downto 0);
  pgassign35(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign35(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign35(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign35(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign36(14 downto 14) <= B"1";
  pgassign36(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign36(0 downto 0) <= B"0";
  pgassign37(31 downto 2) <= B"000000000000000000000000000000";
  pgassign37(1 downto 0) <= BRAM_Dout_A(8 to 9);
  BRAM_Din_A(8 to 9) <= pgassign38(1 downto 0);
  pgassign39(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign39(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign39(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign39(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign40(14 downto 14) <= B"1";
  pgassign40(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign40(0 downto 0) <= B"0";
  pgassign41(31 downto 2) <= B"000000000000000000000000000000";
  pgassign41(1 downto 0) <= BRAM_Dout_B(8 to 9);
  BRAM_Din_B(8 to 9) <= pgassign42(1 downto 0);
  pgassign43(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign43(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign43(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign43(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign44(14 downto 14) <= B"1";
  pgassign44(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign44(0 downto 0) <= B"0";
  pgassign45(31 downto 2) <= B"000000000000000000000000000000";
  pgassign45(1 downto 0) <= BRAM_Dout_A(10 to 11);
  BRAM_Din_A(10 to 11) <= pgassign46(1 downto 0);
  pgassign47(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign47(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign47(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign47(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign48(14 downto 14) <= B"1";
  pgassign48(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign48(0 downto 0) <= B"0";
  pgassign49(31 downto 2) <= B"000000000000000000000000000000";
  pgassign49(1 downto 0) <= BRAM_Dout_B(10 to 11);
  BRAM_Din_B(10 to 11) <= pgassign50(1 downto 0);
  pgassign51(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign51(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign51(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign51(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign52(14 downto 14) <= B"1";
  pgassign52(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign52(0 downto 0) <= B"0";
  pgassign53(31 downto 2) <= B"000000000000000000000000000000";
  pgassign53(1 downto 0) <= BRAM_Dout_A(12 to 13);
  BRAM_Din_A(12 to 13) <= pgassign54(1 downto 0);
  pgassign55(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign55(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign55(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign55(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign56(14 downto 14) <= B"1";
  pgassign56(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign56(0 downto 0) <= B"0";
  pgassign57(31 downto 2) <= B"000000000000000000000000000000";
  pgassign57(1 downto 0) <= BRAM_Dout_B(12 to 13);
  BRAM_Din_B(12 to 13) <= pgassign58(1 downto 0);
  pgassign59(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign59(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign59(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign59(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign60(14 downto 14) <= B"1";
  pgassign60(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign60(0 downto 0) <= B"0";
  pgassign61(31 downto 2) <= B"000000000000000000000000000000";
  pgassign61(1 downto 0) <= BRAM_Dout_A(14 to 15);
  BRAM_Din_A(14 to 15) <= pgassign62(1 downto 0);
  pgassign63(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign63(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign63(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign63(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign64(14 downto 14) <= B"1";
  pgassign64(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign64(0 downto 0) <= B"0";
  pgassign65(31 downto 2) <= B"000000000000000000000000000000";
  pgassign65(1 downto 0) <= BRAM_Dout_B(14 to 15);
  BRAM_Din_B(14 to 15) <= pgassign66(1 downto 0);
  pgassign67(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign67(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign67(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign67(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign68(14 downto 14) <= B"1";
  pgassign68(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign68(0 downto 0) <= B"0";
  pgassign69(31 downto 2) <= B"000000000000000000000000000000";
  pgassign69(1 downto 0) <= BRAM_Dout_A(16 to 17);
  BRAM_Din_A(16 to 17) <= pgassign70(1 downto 0);
  pgassign71(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign71(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign71(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign71(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign72(14 downto 14) <= B"1";
  pgassign72(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign72(0 downto 0) <= B"0";
  pgassign73(31 downto 2) <= B"000000000000000000000000000000";
  pgassign73(1 downto 0) <= BRAM_Dout_B(16 to 17);
  BRAM_Din_B(16 to 17) <= pgassign74(1 downto 0);
  pgassign75(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign75(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign75(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign75(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign76(14 downto 14) <= B"1";
  pgassign76(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign76(0 downto 0) <= B"0";
  pgassign77(31 downto 2) <= B"000000000000000000000000000000";
  pgassign77(1 downto 0) <= BRAM_Dout_A(18 to 19);
  BRAM_Din_A(18 to 19) <= pgassign78(1 downto 0);
  pgassign79(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign79(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign79(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign79(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign80(14 downto 14) <= B"1";
  pgassign80(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign80(0 downto 0) <= B"0";
  pgassign81(31 downto 2) <= B"000000000000000000000000000000";
  pgassign81(1 downto 0) <= BRAM_Dout_B(18 to 19);
  BRAM_Din_B(18 to 19) <= pgassign82(1 downto 0);
  pgassign83(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign83(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign83(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign83(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign84(14 downto 14) <= B"1";
  pgassign84(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign84(0 downto 0) <= B"0";
  pgassign85(31 downto 2) <= B"000000000000000000000000000000";
  pgassign85(1 downto 0) <= BRAM_Dout_A(20 to 21);
  BRAM_Din_A(20 to 21) <= pgassign86(1 downto 0);
  pgassign87(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign87(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign87(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign87(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign88(14 downto 14) <= B"1";
  pgassign88(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign88(0 downto 0) <= B"0";
  pgassign89(31 downto 2) <= B"000000000000000000000000000000";
  pgassign89(1 downto 0) <= BRAM_Dout_B(20 to 21);
  BRAM_Din_B(20 to 21) <= pgassign90(1 downto 0);
  pgassign91(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign91(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign91(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign91(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign92(14 downto 14) <= B"1";
  pgassign92(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign92(0 downto 0) <= B"0";
  pgassign93(31 downto 2) <= B"000000000000000000000000000000";
  pgassign93(1 downto 0) <= BRAM_Dout_A(22 to 23);
  BRAM_Din_A(22 to 23) <= pgassign94(1 downto 0);
  pgassign95(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign95(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign95(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign95(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign96(14 downto 14) <= B"1";
  pgassign96(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign96(0 downto 0) <= B"0";
  pgassign97(31 downto 2) <= B"000000000000000000000000000000";
  pgassign97(1 downto 0) <= BRAM_Dout_B(22 to 23);
  BRAM_Din_B(22 to 23) <= pgassign98(1 downto 0);
  pgassign99(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign99(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign99(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign99(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign100(14 downto 14) <= B"1";
  pgassign100(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign100(0 downto 0) <= B"0";
  pgassign101(31 downto 2) <= B"000000000000000000000000000000";
  pgassign101(1 downto 0) <= BRAM_Dout_A(24 to 25);
  BRAM_Din_A(24 to 25) <= pgassign102(1 downto 0);
  pgassign103(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign103(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign103(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign103(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign104(14 downto 14) <= B"1";
  pgassign104(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign104(0 downto 0) <= B"0";
  pgassign105(31 downto 2) <= B"000000000000000000000000000000";
  pgassign105(1 downto 0) <= BRAM_Dout_B(24 to 25);
  BRAM_Din_B(24 to 25) <= pgassign106(1 downto 0);
  pgassign107(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign107(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign107(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign107(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign108(14 downto 14) <= B"1";
  pgassign108(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign108(0 downto 0) <= B"0";
  pgassign109(31 downto 2) <= B"000000000000000000000000000000";
  pgassign109(1 downto 0) <= BRAM_Dout_A(26 to 27);
  BRAM_Din_A(26 to 27) <= pgassign110(1 downto 0);
  pgassign111(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign111(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign111(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign111(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign112(14 downto 14) <= B"1";
  pgassign112(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign112(0 downto 0) <= B"0";
  pgassign113(31 downto 2) <= B"000000000000000000000000000000";
  pgassign113(1 downto 0) <= BRAM_Dout_B(26 to 27);
  BRAM_Din_B(26 to 27) <= pgassign114(1 downto 0);
  pgassign115(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign115(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign115(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign115(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign116(14 downto 14) <= B"1";
  pgassign116(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign116(0 downto 0) <= B"0";
  pgassign117(31 downto 2) <= B"000000000000000000000000000000";
  pgassign117(1 downto 0) <= BRAM_Dout_A(28 to 29);
  BRAM_Din_A(28 to 29) <= pgassign118(1 downto 0);
  pgassign119(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign119(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign119(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign119(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign120(14 downto 14) <= B"1";
  pgassign120(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign120(0 downto 0) <= B"0";
  pgassign121(31 downto 2) <= B"000000000000000000000000000000";
  pgassign121(1 downto 0) <= BRAM_Dout_B(28 to 29);
  BRAM_Din_B(28 to 29) <= pgassign122(1 downto 0);
  pgassign123(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign123(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign123(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign123(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign124(14 downto 14) <= B"1";
  pgassign124(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign124(0 downto 0) <= B"0";
  pgassign125(31 downto 2) <= B"000000000000000000000000000000";
  pgassign125(1 downto 0) <= BRAM_Dout_A(30 to 31);
  BRAM_Din_A(30 to 31) <= pgassign126(1 downto 0);
  pgassign127(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign127(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign127(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign127(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign128(14 downto 14) <= B"1";
  pgassign128(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign128(0 downto 0) <= B"0";
  pgassign129(31 downto 2) <= B"000000000000000000000000000000";
  pgassign129(1 downto 0) <= BRAM_Dout_B(30 to 31);
  BRAM_Din_B(30 to 31) <= pgassign130(1 downto 0);
  pgassign131(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign131(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign131(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign131(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign132(14 downto 14) <= B"1";
  pgassign132(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign132(0 downto 0) <= B"0";
  pgassign133(31 downto 2) <= B"000000000000000000000000000000";
  pgassign133(1 downto 0) <= BRAM_Dout_A(32 to 33);
  BRAM_Din_A(32 to 33) <= pgassign134(1 downto 0);
  pgassign135(3 downto 3) <= BRAM_WEN_A(4 to 4);
  pgassign135(2 downto 2) <= BRAM_WEN_A(4 to 4);
  pgassign135(1 downto 1) <= BRAM_WEN_A(4 to 4);
  pgassign135(0 downto 0) <= BRAM_WEN_A(4 to 4);
  pgassign136(14 downto 14) <= B"1";
  pgassign136(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign136(0 downto 0) <= B"0";
  pgassign137(31 downto 2) <= B"000000000000000000000000000000";
  pgassign137(1 downto 0) <= BRAM_Dout_B(32 to 33);
  BRAM_Din_B(32 to 33) <= pgassign138(1 downto 0);
  pgassign139(3 downto 3) <= BRAM_WEN_B(4 to 4);
  pgassign139(2 downto 2) <= BRAM_WEN_B(4 to 4);
  pgassign139(1 downto 1) <= BRAM_WEN_B(4 to 4);
  pgassign139(0 downto 0) <= BRAM_WEN_B(4 to 4);
  pgassign140(14 downto 14) <= B"1";
  pgassign140(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign140(0 downto 0) <= B"0";
  pgassign141(31 downto 2) <= B"000000000000000000000000000000";
  pgassign141(1 downto 0) <= BRAM_Dout_A(34 to 35);
  BRAM_Din_A(34 to 35) <= pgassign142(1 downto 0);
  pgassign143(3 downto 3) <= BRAM_WEN_A(4 to 4);
  pgassign143(2 downto 2) <= BRAM_WEN_A(4 to 4);
  pgassign143(1 downto 1) <= BRAM_WEN_A(4 to 4);
  pgassign143(0 downto 0) <= BRAM_WEN_A(4 to 4);
  pgassign144(14 downto 14) <= B"1";
  pgassign144(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign144(0 downto 0) <= B"0";
  pgassign145(31 downto 2) <= B"000000000000000000000000000000";
  pgassign145(1 downto 0) <= BRAM_Dout_B(34 to 35);
  BRAM_Din_B(34 to 35) <= pgassign146(1 downto 0);
  pgassign147(3 downto 3) <= BRAM_WEN_B(4 to 4);
  pgassign147(2 downto 2) <= BRAM_WEN_B(4 to 4);
  pgassign147(1 downto 1) <= BRAM_WEN_B(4 to 4);
  pgassign147(0 downto 0) <= BRAM_WEN_B(4 to 4);
  pgassign148(14 downto 14) <= B"1";
  pgassign148(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign148(0 downto 0) <= B"0";
  pgassign149(31 downto 2) <= B"000000000000000000000000000000";
  pgassign149(1 downto 0) <= BRAM_Dout_A(36 to 37);
  BRAM_Din_A(36 to 37) <= pgassign150(1 downto 0);
  pgassign151(3 downto 3) <= BRAM_WEN_A(4 to 4);
  pgassign151(2 downto 2) <= BRAM_WEN_A(4 to 4);
  pgassign151(1 downto 1) <= BRAM_WEN_A(4 to 4);
  pgassign151(0 downto 0) <= BRAM_WEN_A(4 to 4);
  pgassign152(14 downto 14) <= B"1";
  pgassign152(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign152(0 downto 0) <= B"0";
  pgassign153(31 downto 2) <= B"000000000000000000000000000000";
  pgassign153(1 downto 0) <= BRAM_Dout_B(36 to 37);
  BRAM_Din_B(36 to 37) <= pgassign154(1 downto 0);
  pgassign155(3 downto 3) <= BRAM_WEN_B(4 to 4);
  pgassign155(2 downto 2) <= BRAM_WEN_B(4 to 4);
  pgassign155(1 downto 1) <= BRAM_WEN_B(4 to 4);
  pgassign155(0 downto 0) <= BRAM_WEN_B(4 to 4);
  pgassign156(14 downto 14) <= B"1";
  pgassign156(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign156(0 downto 0) <= B"0";
  pgassign157(31 downto 2) <= B"000000000000000000000000000000";
  pgassign157(1 downto 0) <= BRAM_Dout_A(38 to 39);
  BRAM_Din_A(38 to 39) <= pgassign158(1 downto 0);
  pgassign159(3 downto 3) <= BRAM_WEN_A(4 to 4);
  pgassign159(2 downto 2) <= BRAM_WEN_A(4 to 4);
  pgassign159(1 downto 1) <= BRAM_WEN_A(4 to 4);
  pgassign159(0 downto 0) <= BRAM_WEN_A(4 to 4);
  pgassign160(14 downto 14) <= B"1";
  pgassign160(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign160(0 downto 0) <= B"0";
  pgassign161(31 downto 2) <= B"000000000000000000000000000000";
  pgassign161(1 downto 0) <= BRAM_Dout_B(38 to 39);
  BRAM_Din_B(38 to 39) <= pgassign162(1 downto 0);
  pgassign163(3 downto 3) <= BRAM_WEN_B(4 to 4);
  pgassign163(2 downto 2) <= BRAM_WEN_B(4 to 4);
  pgassign163(1 downto 1) <= BRAM_WEN_B(4 to 4);
  pgassign163(0 downto 0) <= BRAM_WEN_B(4 to 4);
  pgassign164(14 downto 14) <= B"1";
  pgassign164(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign164(0 downto 0) <= B"0";
  pgassign165(31 downto 2) <= B"000000000000000000000000000000";
  pgassign165(1 downto 0) <= BRAM_Dout_A(40 to 41);
  BRAM_Din_A(40 to 41) <= pgassign166(1 downto 0);
  pgassign167(3 downto 3) <= BRAM_WEN_A(5 to 5);
  pgassign167(2 downto 2) <= BRAM_WEN_A(5 to 5);
  pgassign167(1 downto 1) <= BRAM_WEN_A(5 to 5);
  pgassign167(0 downto 0) <= BRAM_WEN_A(5 to 5);
  pgassign168(14 downto 14) <= B"1";
  pgassign168(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign168(0 downto 0) <= B"0";
  pgassign169(31 downto 2) <= B"000000000000000000000000000000";
  pgassign169(1 downto 0) <= BRAM_Dout_B(40 to 41);
  BRAM_Din_B(40 to 41) <= pgassign170(1 downto 0);
  pgassign171(3 downto 3) <= BRAM_WEN_B(5 to 5);
  pgassign171(2 downto 2) <= BRAM_WEN_B(5 to 5);
  pgassign171(1 downto 1) <= BRAM_WEN_B(5 to 5);
  pgassign171(0 downto 0) <= BRAM_WEN_B(5 to 5);
  pgassign172(14 downto 14) <= B"1";
  pgassign172(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign172(0 downto 0) <= B"0";
  pgassign173(31 downto 2) <= B"000000000000000000000000000000";
  pgassign173(1 downto 0) <= BRAM_Dout_A(42 to 43);
  BRAM_Din_A(42 to 43) <= pgassign174(1 downto 0);
  pgassign175(3 downto 3) <= BRAM_WEN_A(5 to 5);
  pgassign175(2 downto 2) <= BRAM_WEN_A(5 to 5);
  pgassign175(1 downto 1) <= BRAM_WEN_A(5 to 5);
  pgassign175(0 downto 0) <= BRAM_WEN_A(5 to 5);
  pgassign176(14 downto 14) <= B"1";
  pgassign176(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign176(0 downto 0) <= B"0";
  pgassign177(31 downto 2) <= B"000000000000000000000000000000";
  pgassign177(1 downto 0) <= BRAM_Dout_B(42 to 43);
  BRAM_Din_B(42 to 43) <= pgassign178(1 downto 0);
  pgassign179(3 downto 3) <= BRAM_WEN_B(5 to 5);
  pgassign179(2 downto 2) <= BRAM_WEN_B(5 to 5);
  pgassign179(1 downto 1) <= BRAM_WEN_B(5 to 5);
  pgassign179(0 downto 0) <= BRAM_WEN_B(5 to 5);
  pgassign180(14 downto 14) <= B"1";
  pgassign180(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign180(0 downto 0) <= B"0";
  pgassign181(31 downto 2) <= B"000000000000000000000000000000";
  pgassign181(1 downto 0) <= BRAM_Dout_A(44 to 45);
  BRAM_Din_A(44 to 45) <= pgassign182(1 downto 0);
  pgassign183(3 downto 3) <= BRAM_WEN_A(5 to 5);
  pgassign183(2 downto 2) <= BRAM_WEN_A(5 to 5);
  pgassign183(1 downto 1) <= BRAM_WEN_A(5 to 5);
  pgassign183(0 downto 0) <= BRAM_WEN_A(5 to 5);
  pgassign184(14 downto 14) <= B"1";
  pgassign184(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign184(0 downto 0) <= B"0";
  pgassign185(31 downto 2) <= B"000000000000000000000000000000";
  pgassign185(1 downto 0) <= BRAM_Dout_B(44 to 45);
  BRAM_Din_B(44 to 45) <= pgassign186(1 downto 0);
  pgassign187(3 downto 3) <= BRAM_WEN_B(5 to 5);
  pgassign187(2 downto 2) <= BRAM_WEN_B(5 to 5);
  pgassign187(1 downto 1) <= BRAM_WEN_B(5 to 5);
  pgassign187(0 downto 0) <= BRAM_WEN_B(5 to 5);
  pgassign188(14 downto 14) <= B"1";
  pgassign188(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign188(0 downto 0) <= B"0";
  pgassign189(31 downto 2) <= B"000000000000000000000000000000";
  pgassign189(1 downto 0) <= BRAM_Dout_A(46 to 47);
  BRAM_Din_A(46 to 47) <= pgassign190(1 downto 0);
  pgassign191(3 downto 3) <= BRAM_WEN_A(5 to 5);
  pgassign191(2 downto 2) <= BRAM_WEN_A(5 to 5);
  pgassign191(1 downto 1) <= BRAM_WEN_A(5 to 5);
  pgassign191(0 downto 0) <= BRAM_WEN_A(5 to 5);
  pgassign192(14 downto 14) <= B"1";
  pgassign192(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign192(0 downto 0) <= B"0";
  pgassign193(31 downto 2) <= B"000000000000000000000000000000";
  pgassign193(1 downto 0) <= BRAM_Dout_B(46 to 47);
  BRAM_Din_B(46 to 47) <= pgassign194(1 downto 0);
  pgassign195(3 downto 3) <= BRAM_WEN_B(5 to 5);
  pgassign195(2 downto 2) <= BRAM_WEN_B(5 to 5);
  pgassign195(1 downto 1) <= BRAM_WEN_B(5 to 5);
  pgassign195(0 downto 0) <= BRAM_WEN_B(5 to 5);
  pgassign196(14 downto 14) <= B"1";
  pgassign196(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign196(0 downto 0) <= B"0";
  pgassign197(31 downto 2) <= B"000000000000000000000000000000";
  pgassign197(1 downto 0) <= BRAM_Dout_A(48 to 49);
  BRAM_Din_A(48 to 49) <= pgassign198(1 downto 0);
  pgassign199(3 downto 3) <= BRAM_WEN_A(6 to 6);
  pgassign199(2 downto 2) <= BRAM_WEN_A(6 to 6);
  pgassign199(1 downto 1) <= BRAM_WEN_A(6 to 6);
  pgassign199(0 downto 0) <= BRAM_WEN_A(6 to 6);
  pgassign200(14 downto 14) <= B"1";
  pgassign200(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign200(0 downto 0) <= B"0";
  pgassign201(31 downto 2) <= B"000000000000000000000000000000";
  pgassign201(1 downto 0) <= BRAM_Dout_B(48 to 49);
  BRAM_Din_B(48 to 49) <= pgassign202(1 downto 0);
  pgassign203(3 downto 3) <= BRAM_WEN_B(6 to 6);
  pgassign203(2 downto 2) <= BRAM_WEN_B(6 to 6);
  pgassign203(1 downto 1) <= BRAM_WEN_B(6 to 6);
  pgassign203(0 downto 0) <= BRAM_WEN_B(6 to 6);
  pgassign204(14 downto 14) <= B"1";
  pgassign204(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign204(0 downto 0) <= B"0";
  pgassign205(31 downto 2) <= B"000000000000000000000000000000";
  pgassign205(1 downto 0) <= BRAM_Dout_A(50 to 51);
  BRAM_Din_A(50 to 51) <= pgassign206(1 downto 0);
  pgassign207(3 downto 3) <= BRAM_WEN_A(6 to 6);
  pgassign207(2 downto 2) <= BRAM_WEN_A(6 to 6);
  pgassign207(1 downto 1) <= BRAM_WEN_A(6 to 6);
  pgassign207(0 downto 0) <= BRAM_WEN_A(6 to 6);
  pgassign208(14 downto 14) <= B"1";
  pgassign208(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign208(0 downto 0) <= B"0";
  pgassign209(31 downto 2) <= B"000000000000000000000000000000";
  pgassign209(1 downto 0) <= BRAM_Dout_B(50 to 51);
  BRAM_Din_B(50 to 51) <= pgassign210(1 downto 0);
  pgassign211(3 downto 3) <= BRAM_WEN_B(6 to 6);
  pgassign211(2 downto 2) <= BRAM_WEN_B(6 to 6);
  pgassign211(1 downto 1) <= BRAM_WEN_B(6 to 6);
  pgassign211(0 downto 0) <= BRAM_WEN_B(6 to 6);
  pgassign212(14 downto 14) <= B"1";
  pgassign212(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign212(0 downto 0) <= B"0";
  pgassign213(31 downto 2) <= B"000000000000000000000000000000";
  pgassign213(1 downto 0) <= BRAM_Dout_A(52 to 53);
  BRAM_Din_A(52 to 53) <= pgassign214(1 downto 0);
  pgassign215(3 downto 3) <= BRAM_WEN_A(6 to 6);
  pgassign215(2 downto 2) <= BRAM_WEN_A(6 to 6);
  pgassign215(1 downto 1) <= BRAM_WEN_A(6 to 6);
  pgassign215(0 downto 0) <= BRAM_WEN_A(6 to 6);
  pgassign216(14 downto 14) <= B"1";
  pgassign216(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign216(0 downto 0) <= B"0";
  pgassign217(31 downto 2) <= B"000000000000000000000000000000";
  pgassign217(1 downto 0) <= BRAM_Dout_B(52 to 53);
  BRAM_Din_B(52 to 53) <= pgassign218(1 downto 0);
  pgassign219(3 downto 3) <= BRAM_WEN_B(6 to 6);
  pgassign219(2 downto 2) <= BRAM_WEN_B(6 to 6);
  pgassign219(1 downto 1) <= BRAM_WEN_B(6 to 6);
  pgassign219(0 downto 0) <= BRAM_WEN_B(6 to 6);
  pgassign220(14 downto 14) <= B"1";
  pgassign220(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign220(0 downto 0) <= B"0";
  pgassign221(31 downto 2) <= B"000000000000000000000000000000";
  pgassign221(1 downto 0) <= BRAM_Dout_A(54 to 55);
  BRAM_Din_A(54 to 55) <= pgassign222(1 downto 0);
  pgassign223(3 downto 3) <= BRAM_WEN_A(6 to 6);
  pgassign223(2 downto 2) <= BRAM_WEN_A(6 to 6);
  pgassign223(1 downto 1) <= BRAM_WEN_A(6 to 6);
  pgassign223(0 downto 0) <= BRAM_WEN_A(6 to 6);
  pgassign224(14 downto 14) <= B"1";
  pgassign224(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign224(0 downto 0) <= B"0";
  pgassign225(31 downto 2) <= B"000000000000000000000000000000";
  pgassign225(1 downto 0) <= BRAM_Dout_B(54 to 55);
  BRAM_Din_B(54 to 55) <= pgassign226(1 downto 0);
  pgassign227(3 downto 3) <= BRAM_WEN_B(6 to 6);
  pgassign227(2 downto 2) <= BRAM_WEN_B(6 to 6);
  pgassign227(1 downto 1) <= BRAM_WEN_B(6 to 6);
  pgassign227(0 downto 0) <= BRAM_WEN_B(6 to 6);
  pgassign228(14 downto 14) <= B"1";
  pgassign228(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign228(0 downto 0) <= B"0";
  pgassign229(31 downto 2) <= B"000000000000000000000000000000";
  pgassign229(1 downto 0) <= BRAM_Dout_A(56 to 57);
  BRAM_Din_A(56 to 57) <= pgassign230(1 downto 0);
  pgassign231(3 downto 3) <= BRAM_WEN_A(7 to 7);
  pgassign231(2 downto 2) <= BRAM_WEN_A(7 to 7);
  pgassign231(1 downto 1) <= BRAM_WEN_A(7 to 7);
  pgassign231(0 downto 0) <= BRAM_WEN_A(7 to 7);
  pgassign232(14 downto 14) <= B"1";
  pgassign232(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign232(0 downto 0) <= B"0";
  pgassign233(31 downto 2) <= B"000000000000000000000000000000";
  pgassign233(1 downto 0) <= BRAM_Dout_B(56 to 57);
  BRAM_Din_B(56 to 57) <= pgassign234(1 downto 0);
  pgassign235(3 downto 3) <= BRAM_WEN_B(7 to 7);
  pgassign235(2 downto 2) <= BRAM_WEN_B(7 to 7);
  pgassign235(1 downto 1) <= BRAM_WEN_B(7 to 7);
  pgassign235(0 downto 0) <= BRAM_WEN_B(7 to 7);
  pgassign236(14 downto 14) <= B"1";
  pgassign236(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign236(0 downto 0) <= B"0";
  pgassign237(31 downto 2) <= B"000000000000000000000000000000";
  pgassign237(1 downto 0) <= BRAM_Dout_A(58 to 59);
  BRAM_Din_A(58 to 59) <= pgassign238(1 downto 0);
  pgassign239(3 downto 3) <= BRAM_WEN_A(7 to 7);
  pgassign239(2 downto 2) <= BRAM_WEN_A(7 to 7);
  pgassign239(1 downto 1) <= BRAM_WEN_A(7 to 7);
  pgassign239(0 downto 0) <= BRAM_WEN_A(7 to 7);
  pgassign240(14 downto 14) <= B"1";
  pgassign240(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign240(0 downto 0) <= B"0";
  pgassign241(31 downto 2) <= B"000000000000000000000000000000";
  pgassign241(1 downto 0) <= BRAM_Dout_B(58 to 59);
  BRAM_Din_B(58 to 59) <= pgassign242(1 downto 0);
  pgassign243(3 downto 3) <= BRAM_WEN_B(7 to 7);
  pgassign243(2 downto 2) <= BRAM_WEN_B(7 to 7);
  pgassign243(1 downto 1) <= BRAM_WEN_B(7 to 7);
  pgassign243(0 downto 0) <= BRAM_WEN_B(7 to 7);
  pgassign244(14 downto 14) <= B"1";
  pgassign244(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign244(0 downto 0) <= B"0";
  pgassign245(31 downto 2) <= B"000000000000000000000000000000";
  pgassign245(1 downto 0) <= BRAM_Dout_A(60 to 61);
  BRAM_Din_A(60 to 61) <= pgassign246(1 downto 0);
  pgassign247(3 downto 3) <= BRAM_WEN_A(7 to 7);
  pgassign247(2 downto 2) <= BRAM_WEN_A(7 to 7);
  pgassign247(1 downto 1) <= BRAM_WEN_A(7 to 7);
  pgassign247(0 downto 0) <= BRAM_WEN_A(7 to 7);
  pgassign248(14 downto 14) <= B"1";
  pgassign248(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign248(0 downto 0) <= B"0";
  pgassign249(31 downto 2) <= B"000000000000000000000000000000";
  pgassign249(1 downto 0) <= BRAM_Dout_B(60 to 61);
  BRAM_Din_B(60 to 61) <= pgassign250(1 downto 0);
  pgassign251(3 downto 3) <= BRAM_WEN_B(7 to 7);
  pgassign251(2 downto 2) <= BRAM_WEN_B(7 to 7);
  pgassign251(1 downto 1) <= BRAM_WEN_B(7 to 7);
  pgassign251(0 downto 0) <= BRAM_WEN_B(7 to 7);
  pgassign252(14 downto 14) <= B"1";
  pgassign252(13 downto 1) <= BRAM_Addr_A(16 to 28);
  pgassign252(0 downto 0) <= B"0";
  pgassign253(31 downto 2) <= B"000000000000000000000000000000";
  pgassign253(1 downto 0) <= BRAM_Dout_A(62 to 63);
  BRAM_Din_A(62 to 63) <= pgassign254(1 downto 0);
  pgassign255(3 downto 3) <= BRAM_WEN_A(7 to 7);
  pgassign255(2 downto 2) <= BRAM_WEN_A(7 to 7);
  pgassign255(1 downto 1) <= BRAM_WEN_A(7 to 7);
  pgassign255(0 downto 0) <= BRAM_WEN_A(7 to 7);
  pgassign256(14 downto 14) <= B"1";
  pgassign256(13 downto 1) <= BRAM_Addr_B(16 to 28);
  pgassign256(0 downto 0) <= B"0";
  pgassign257(31 downto 2) <= B"000000000000000000000000000000";
  pgassign257(1 downto 0) <= BRAM_Dout_B(62 to 63);
  BRAM_Din_B(62 to 63) <= pgassign258(1 downto 0);
  pgassign259(3 downto 3) <= BRAM_WEN_B(7 to 7);
  pgassign259(2 downto 2) <= BRAM_WEN_B(7 to 7);
  pgassign259(1 downto 1) <= BRAM_WEN_B(7 to 7);
  pgassign259(0 downto 0) <= BRAM_WEN_B(7 to 7);
  net_gnd0 <= '0';
  net_gnd4(3 downto 0) <= B"0000";

  ramb16_0 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_0.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign4,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign5,
      DIPA => net_gnd4,
      DOA => pgassign6,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign7,
      ADDRB => pgassign8,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign9,
      DIPB => net_gnd4,
      DOB => pgassign10,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign11
    );

  ramb16_1 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_1.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign12,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign13,
      DIPA => net_gnd4,
      DOA => pgassign14,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign15,
      ADDRB => pgassign16,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign17,
      DIPB => net_gnd4,
      DOB => pgassign18,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign19
    );

  ramb16_2 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_2.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign20,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign21,
      DIPA => net_gnd4,
      DOA => pgassign22,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign23,
      ADDRB => pgassign24,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign25,
      DIPB => net_gnd4,
      DOB => pgassign26,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign27
    );

  ramb16_3 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_3.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign28,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign29,
      DIPA => net_gnd4,
      DOA => pgassign30,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign31,
      ADDRB => pgassign32,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign33,
      DIPB => net_gnd4,
      DOB => pgassign34,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign35
    );

  ramb16_4 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_4.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign36,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign37,
      DIPA => net_gnd4,
      DOA => pgassign38,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign39,
      ADDRB => pgassign40,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign41,
      DIPB => net_gnd4,
      DOB => pgassign42,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign43
    );

  ramb16_5 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_5.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign44,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign45,
      DIPA => net_gnd4,
      DOA => pgassign46,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign47,
      ADDRB => pgassign48,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign49,
      DIPB => net_gnd4,
      DOB => pgassign50,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign51
    );

  ramb16_6 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_6.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign52,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign53,
      DIPA => net_gnd4,
      DOA => pgassign54,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign55,
      ADDRB => pgassign56,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign57,
      DIPB => net_gnd4,
      DOB => pgassign58,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign59
    );

  ramb16_7 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_7.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign60,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign61,
      DIPA => net_gnd4,
      DOA => pgassign62,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign63,
      ADDRB => pgassign64,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign65,
      DIPB => net_gnd4,
      DOB => pgassign66,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign67
    );

  ramb16_8 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_8.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign68,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign69,
      DIPA => net_gnd4,
      DOA => pgassign70,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign71,
      ADDRB => pgassign72,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign73,
      DIPB => net_gnd4,
      DOB => pgassign74,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign75
    );

  ramb16_9 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_9.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign76,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign77,
      DIPA => net_gnd4,
      DOA => pgassign78,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign79,
      ADDRB => pgassign80,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign81,
      DIPB => net_gnd4,
      DOB => pgassign82,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign83
    );

  ramb16_10 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_10.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign84,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign85,
      DIPA => net_gnd4,
      DOA => pgassign86,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign87,
      ADDRB => pgassign88,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign89,
      DIPB => net_gnd4,
      DOB => pgassign90,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign91
    );

  ramb16_11 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_11.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign92,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign93,
      DIPA => net_gnd4,
      DOA => pgassign94,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign95,
      ADDRB => pgassign96,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign97,
      DIPB => net_gnd4,
      DOB => pgassign98,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign99
    );

  ramb16_12 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_12.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign100,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign101,
      DIPA => net_gnd4,
      DOA => pgassign102,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign103,
      ADDRB => pgassign104,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign105,
      DIPB => net_gnd4,
      DOB => pgassign106,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign107
    );

  ramb16_13 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_13.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign108,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign109,
      DIPA => net_gnd4,
      DOA => pgassign110,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign111,
      ADDRB => pgassign112,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign113,
      DIPB => net_gnd4,
      DOB => pgassign114,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign115
    );

  ramb16_14 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_14.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign116,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign117,
      DIPA => net_gnd4,
      DOA => pgassign118,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign119,
      ADDRB => pgassign120,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign121,
      DIPB => net_gnd4,
      DOB => pgassign122,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign123
    );

  ramb16_15 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_15.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign124,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign125,
      DIPA => net_gnd4,
      DOA => pgassign126,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign127,
      ADDRB => pgassign128,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign129,
      DIPB => net_gnd4,
      DOB => pgassign130,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign131
    );

  ramb16_16 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_16.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign132,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign133,
      DIPA => net_gnd4,
      DOA => pgassign134,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign135,
      ADDRB => pgassign136,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign137,
      DIPB => net_gnd4,
      DOB => pgassign138,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign139
    );

  ramb16_17 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_17.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign140,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign141,
      DIPA => net_gnd4,
      DOA => pgassign142,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign143,
      ADDRB => pgassign144,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign145,
      DIPB => net_gnd4,
      DOB => pgassign146,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign147
    );

  ramb16_18 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_18.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign148,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign149,
      DIPA => net_gnd4,
      DOA => pgassign150,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign151,
      ADDRB => pgassign152,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign153,
      DIPB => net_gnd4,
      DOB => pgassign154,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign155
    );

  ramb16_19 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_19.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign156,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign157,
      DIPA => net_gnd4,
      DOA => pgassign158,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign159,
      ADDRB => pgassign160,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign161,
      DIPB => net_gnd4,
      DOB => pgassign162,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign163
    );

  ramb16_20 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_20.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign164,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign165,
      DIPA => net_gnd4,
      DOA => pgassign166,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign167,
      ADDRB => pgassign168,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign169,
      DIPB => net_gnd4,
      DOB => pgassign170,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign171
    );

  ramb16_21 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_21.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign172,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign173,
      DIPA => net_gnd4,
      DOA => pgassign174,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign175,
      ADDRB => pgassign176,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign177,
      DIPB => net_gnd4,
      DOB => pgassign178,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign179
    );

  ramb16_22 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_22.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign180,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign181,
      DIPA => net_gnd4,
      DOA => pgassign182,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign183,
      ADDRB => pgassign184,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign185,
      DIPB => net_gnd4,
      DOB => pgassign186,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign187
    );

  ramb16_23 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_23.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign188,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign189,
      DIPA => net_gnd4,
      DOA => pgassign190,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign191,
      ADDRB => pgassign192,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign193,
      DIPB => net_gnd4,
      DOB => pgassign194,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign195
    );

  ramb16_24 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_24.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign196,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign197,
      DIPA => net_gnd4,
      DOA => pgassign198,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign199,
      ADDRB => pgassign200,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign201,
      DIPB => net_gnd4,
      DOB => pgassign202,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign203
    );

  ramb16_25 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_25.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign204,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign205,
      DIPA => net_gnd4,
      DOA => pgassign206,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign207,
      ADDRB => pgassign208,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign209,
      DIPB => net_gnd4,
      DOB => pgassign210,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign211
    );

  ramb16_26 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_26.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign212,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign213,
      DIPA => net_gnd4,
      DOA => pgassign214,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign215,
      ADDRB => pgassign216,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign217,
      DIPB => net_gnd4,
      DOB => pgassign218,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign219
    );

  ramb16_27 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_27.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign220,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign221,
      DIPA => net_gnd4,
      DOA => pgassign222,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign223,
      ADDRB => pgassign224,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign225,
      DIPB => net_gnd4,
      DOB => pgassign226,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign227
    );

  ramb16_28 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_28.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign228,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign229,
      DIPA => net_gnd4,
      DOA => pgassign230,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign231,
      ADDRB => pgassign232,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign233,
      DIPB => net_gnd4,
      DOB => pgassign234,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign235
    );

  ramb16_29 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_29.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign236,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign237,
      DIPA => net_gnd4,
      DOA => pgassign238,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign239,
      ADDRB => pgassign240,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign241,
      DIPB => net_gnd4,
      DOB => pgassign242,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign243
    );

  ramb16_30 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_30.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign244,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign245,
      DIPA => net_gnd4,
      DOA => pgassign246,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign247,
      ADDRB => pgassign248,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign249,
      DIPB => net_gnd4,
      DOB => pgassign250,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign251
    );

  ramb16_31 : RAMB16
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "plb_bram_if_cntlr_1_bram_combined_31.mem",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign252,
      CASCADEINA => net_gnd0,
      CASCADEOUTA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign253,
      DIPA => net_gnd4,
      DOA => pgassign254,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign255,
      ADDRB => pgassign256,
      CASCADEINB => net_gnd0,
      CASCADEOUTB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign257,
      DIPB => net_gnd4,
      DOB => pgassign258,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign259
    );

end architecture STRUCTURE;


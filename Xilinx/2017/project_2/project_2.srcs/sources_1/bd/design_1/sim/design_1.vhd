--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
--Date        : Tue Feb 27 16:23:50 2018
--Host        : Qlala-PC running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    AN : out STD_LOGIC_VECTOR ( 0 to 7 );
    CA : out STD_LOGIC;
    CB : out STD_LOGIC;
    CC : out STD_LOGIC;
    CD : out STD_LOGIC;
    CE : out STD_LOGIC;
    CF : out STD_LOGIC;
    CG : out STD_LOGIC;
    DP : out STD_LOGIC;
    EXT_OSC : in STD_LOGIC;
    JA1 : out STD_LOGIC;
    OK_button : in STD_LOGIC;
    RST_button : in STD_LOGIC;
    SW : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=5,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=2,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_CLOCK_manager_0_0 is
  port (
    master_CLK : in STD_LOGIC;
    reset : in STD_LOGIC;
    CLK_out0 : out STD_LOGIC;
    CLK_out1 : out STD_LOGIC;
    CLK_out2 : out STD_LOGIC;
    CLK_out3 : out STD_LOGIC;
    CLK_out4 : out STD_LOGIC;
    CLK_out5 : out STD_LOGIC;
    locked : out STD_LOGIC;
    CLKFBIN : in STD_LOGIC;
    CLKFBOUT : out STD_LOGIC
  );
  end component design_1_CLOCK_manager_0_0;
  component design_1_Freq_Divider_1_1 is
  port (
    CLK : in STD_LOGIC;
    CLK_out : out STD_LOGIC
  );
  end component design_1_Freq_Divider_1_1;
  component design_1_Freq_Divider_1_0 is
  port (
    CLK : in STD_LOGIC;
    CLK_out : out STD_LOGIC
  );
  end component design_1_Freq_Divider_1_0;
  component design_1_digit_display_0_0 is
  port (
    CA : out STD_LOGIC;
    CB : out STD_LOGIC;
    CC : out STD_LOGIC;
    CD : out STD_LOGIC;
    CE : out STD_LOGIC;
    CF : out STD_LOGIC;
    CG : out STD_LOGIC;
    DP : out STD_LOGIC;
    OK_button : in STD_LOGIC;
    AN : out STD_LOGIC_VECTOR ( 0 to 7 );
    disp_byte0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    disp_byte1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    disp_byte2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    disp_byte3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC
  );
  end component design_1_digit_display_0_0;
  component design_1_switches_manager_0_0 is
  port (
    switches : in STD_LOGIC_VECTOR ( 15 downto 0 );
    reg_change : in STD_LOGIC;
    save_enable : in STD_LOGIC;
    CLK : in STD_LOGIC;
    byte0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    byte1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    byte0_saved : out STD_LOGIC_VECTOR ( 7 downto 0 );
    byte1_saved : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_1_switches_manager_0_0;
  signal CLOCK_manager_0_CLKFBOUT : STD_LOGIC;
  signal CLOCK_manager_0_CLK_out1 : STD_LOGIC;
  signal EXT_OSC_1 : STD_LOGIC;
  signal Freq_Divider_2_CLK_out : STD_LOGIC;
  signal OK_button_1 : STD_LOGIC;
  signal RST_button_1 : STD_LOGIC;
  signal SW_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal digit_display_0_AN : STD_LOGIC_VECTOR ( 0 to 7 );
  signal digit_display_0_CA : STD_LOGIC;
  signal digit_display_0_CB : STD_LOGIC;
  signal digit_display_0_CC : STD_LOGIC;
  signal digit_display_0_CD : STD_LOGIC;
  signal digit_display_0_CE : STD_LOGIC;
  signal digit_display_0_CF : STD_LOGIC;
  signal digit_display_0_CG : STD_LOGIC;
  signal digit_display_0_DP : STD_LOGIC;
  signal switches_manager_0_byte0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal switches_manager_0_byte0_saved : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal switches_manager_0_byte1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal switches_manager_0_byte1_saved : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_CLOCK_manager_0_CLK_out0_UNCONNECTED : STD_LOGIC;
  signal NLW_CLOCK_manager_0_CLK_out2_UNCONNECTED : STD_LOGIC;
  signal NLW_CLOCK_manager_0_CLK_out3_UNCONNECTED : STD_LOGIC;
  signal NLW_CLOCK_manager_0_CLK_out4_UNCONNECTED : STD_LOGIC;
  signal NLW_CLOCK_manager_0_CLK_out5_UNCONNECTED : STD_LOGIC;
  signal NLW_CLOCK_manager_0_locked_UNCONNECTED : STD_LOGIC;
  signal NLW_Freq_Divider_1_CLK_out_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of EXT_OSC : signal is "xilinx.com:signal:clock:1.0 CLK.EXT_OSC CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of EXT_OSC : signal is "XIL_INTERFACENAME CLK.EXT_OSC, ASSOCIATED_RESET RST_button, CLK_DOMAIN design_1_EXT_OSC, FREQ_HZ 100000000, PHASE 0.000";
  attribute X_INTERFACE_INFO of RST_button : signal is "xilinx.com:signal:reset:1.0 RST.RST_BUTTON RST";
  attribute X_INTERFACE_PARAMETER of RST_button : signal is "XIL_INTERFACENAME RST.RST_BUTTON, POLARITY ACTIVE_LOW";
begin
  AN(0 to 7) <= digit_display_0_AN(0 to 7);
  CA <= digit_display_0_CA;
  CB <= digit_display_0_CB;
  CC <= digit_display_0_CC;
  CD <= digit_display_0_CD;
  CE <= digit_display_0_CE;
  CF <= digit_display_0_CF;
  CG <= digit_display_0_CG;
  DP <= digit_display_0_DP;
  EXT_OSC_1 <= EXT_OSC;
  OK_button_1 <= OK_button;
  RST_button_1 <= RST_button;
  SW_1(15 downto 0) <= SW(15 downto 0);
  JA1 <= 'Z';
CLOCK_manager_0: component design_1_CLOCK_manager_0_0
     port map (
      CLKFBIN => CLOCK_manager_0_CLKFBOUT,
      CLKFBOUT => CLOCK_manager_0_CLKFBOUT,
      CLK_out0 => NLW_CLOCK_manager_0_CLK_out0_UNCONNECTED,
      CLK_out1 => CLOCK_manager_0_CLK_out1,
      CLK_out2 => NLW_CLOCK_manager_0_CLK_out2_UNCONNECTED,
      CLK_out3 => NLW_CLOCK_manager_0_CLK_out3_UNCONNECTED,
      CLK_out4 => NLW_CLOCK_manager_0_CLK_out4_UNCONNECTED,
      CLK_out5 => NLW_CLOCK_manager_0_CLK_out5_UNCONNECTED,
      locked => NLW_CLOCK_manager_0_locked_UNCONNECTED,
      master_CLK => EXT_OSC_1,
      reset => RST_button_1
    );
Freq_Divider_1: component design_1_Freq_Divider_1_0
     port map (
      CLK => CLOCK_manager_0_CLK_out1,
      CLK_out => NLW_Freq_Divider_1_CLK_out_UNCONNECTED
    );
Freq_Divider_2: component design_1_Freq_Divider_1_1
     port map (
      CLK => EXT_OSC_1,
      CLK_out => Freq_Divider_2_CLK_out
    );
digit_display_0: component design_1_digit_display_0_0
     port map (
      AN(0 to 7) => digit_display_0_AN(0 to 7),
      CA => digit_display_0_CA,
      CB => digit_display_0_CB,
      CC => digit_display_0_CC,
      CD => digit_display_0_CD,
      CE => digit_display_0_CE,
      CF => digit_display_0_CF,
      CG => digit_display_0_CG,
      CLK => Freq_Divider_2_CLK_out,
      DP => digit_display_0_DP,
      OK_button => '0',
      disp_byte0(7 downto 0) => switches_manager_0_byte0(7 downto 0),
      disp_byte1(7 downto 0) => switches_manager_0_byte1(7 downto 0),
      disp_byte2(7 downto 0) => switches_manager_0_byte0_saved(7 downto 0),
      disp_byte3(7 downto 0) => switches_manager_0_byte1_saved(7 downto 0)
    );
switches_manager_0: component design_1_switches_manager_0_0
     port map (
      CLK => EXT_OSC_1,
      byte0(7 downto 0) => switches_manager_0_byte0(7 downto 0),
      byte0_saved(7 downto 0) => switches_manager_0_byte0_saved(7 downto 0),
      byte1(7 downto 0) => switches_manager_0_byte1(7 downto 0),
      byte1_saved(7 downto 0) => switches_manager_0_byte1_saved(7 downto 0),
      reg_change => '0',
      save_enable => OK_button_1,
      switches(15 downto 0) => SW_1(15 downto 0)
    );
end STRUCTURE;

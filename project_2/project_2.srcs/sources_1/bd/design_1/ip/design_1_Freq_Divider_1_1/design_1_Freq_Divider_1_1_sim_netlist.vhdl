-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
-- Date        : Tue Feb 27 14:23:55 2018
-- Host        : Qlala-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               E:/xilinx_project/project_2/project_2.srcs/sources_1/bd/design_1/ip/design_1_Freq_Divider_1_1/design_1_Freq_Divider_1_1_sim_netlist.vhdl
-- Design      : design_1_Freq_Divider_1_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_Freq_Divider_1_1_Freq_Divider is
  port (
    CLK_out : out STD_LOGIC;
    CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_Freq_Divider_1_1_Freq_Divider : entity is "Freq_Divider";
end design_1_Freq_Divider_1_1_Freq_Divider;

architecture STRUCTURE of design_1_Freq_Divider_1_1_Freq_Divider is
  signal \^clk_out\ : STD_LOGIC;
  signal CLK_out_INST_0_i_1_n_0 : STD_LOGIC;
  signal CLK_out_INST_0_i_2_n_0 : STD_LOGIC;
  signal CLK_out_INST_0_i_3_n_0 : STD_LOGIC;
  signal CLK_out_INST_0_i_4_n_0 : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal data0 : STD_LOGIC_VECTOR ( 16 downto 1 );
  signal next_count : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \next_count0_carry__0_n_0\ : STD_LOGIC;
  signal \next_count0_carry__0_n_1\ : STD_LOGIC;
  signal \next_count0_carry__0_n_2\ : STD_LOGIC;
  signal \next_count0_carry__0_n_3\ : STD_LOGIC;
  signal \next_count0_carry__1_n_0\ : STD_LOGIC;
  signal \next_count0_carry__1_n_1\ : STD_LOGIC;
  signal \next_count0_carry__1_n_2\ : STD_LOGIC;
  signal \next_count0_carry__1_n_3\ : STD_LOGIC;
  signal \next_count0_carry__2_n_1\ : STD_LOGIC;
  signal \next_count0_carry__2_n_2\ : STD_LOGIC;
  signal \next_count0_carry__2_n_3\ : STD_LOGIC;
  signal next_count0_carry_n_0 : STD_LOGIC;
  signal next_count0_carry_n_1 : STD_LOGIC;
  signal next_count0_carry_n_2 : STD_LOGIC;
  signal next_count0_carry_n_3 : STD_LOGIC;
  signal \NLW_next_count0_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of CLK_out_INST_0_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair0";
begin
  CLK_out <= \^clk_out\;
CLK_out_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => CLK_out_INST_0_i_1_n_0,
      I1 => CLK_out_INST_0_i_2_n_0,
      I2 => CLK_out_INST_0_i_3_n_0,
      I3 => CLK_out_INST_0_i_4_n_0,
      O => \^clk_out\
    );
CLK_out_INST_0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => count(4),
      I1 => count(3),
      I2 => count(6),
      I3 => count(5),
      O => CLK_out_INST_0_i_1_n_0
    );
CLK_out_INST_0_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => count(0),
      I1 => count(15),
      I2 => count(16),
      I3 => count(2),
      I4 => count(1),
      O => CLK_out_INST_0_i_2_n_0
    );
CLK_out_INST_0_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => count(12),
      I1 => count(11),
      I2 => count(14),
      I3 => count(13),
      O => CLK_out_INST_0_i_3_n_0
    );
CLK_out_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => count(7),
      I1 => count(8),
      I2 => count(10),
      I3 => count(9),
      O => CLK_out_INST_0_i_4_n_0
    );
\count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => count(0),
      O => next_count(0)
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => next_count(0),
      Q => count(0),
      R => '0'
    );
\count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(10),
      Q => count(10),
      R => \^clk_out\
    );
\count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(11),
      Q => count(11),
      R => \^clk_out\
    );
\count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(12),
      Q => count(12),
      R => \^clk_out\
    );
\count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(13),
      Q => count(13),
      R => \^clk_out\
    );
\count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(14),
      Q => count(14),
      R => \^clk_out\
    );
\count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(15),
      Q => count(15),
      R => \^clk_out\
    );
\count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(16),
      Q => count(16),
      R => \^clk_out\
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(1),
      Q => count(1),
      R => \^clk_out\
    );
\count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(2),
      Q => count(2),
      R => \^clk_out\
    );
\count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(3),
      Q => count(3),
      R => \^clk_out\
    );
\count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(4),
      Q => count(4),
      R => \^clk_out\
    );
\count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(5),
      Q => count(5),
      R => \^clk_out\
    );
\count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(6),
      Q => count(6),
      R => \^clk_out\
    );
\count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(7),
      Q => count(7),
      R => \^clk_out\
    );
\count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(8),
      Q => count(8),
      R => \^clk_out\
    );
\count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => data0(9),
      Q => count(9),
      R => \^clk_out\
    );
next_count0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => next_count0_carry_n_0,
      CO(2) => next_count0_carry_n_1,
      CO(1) => next_count0_carry_n_2,
      CO(0) => next_count0_carry_n_3,
      CYINIT => count(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => count(4 downto 1)
    );
\next_count0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => next_count0_carry_n_0,
      CO(3) => \next_count0_carry__0_n_0\,
      CO(2) => \next_count0_carry__0_n_1\,
      CO(1) => \next_count0_carry__0_n_2\,
      CO(0) => \next_count0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => count(8 downto 5)
    );
\next_count0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_count0_carry__0_n_0\,
      CO(3) => \next_count0_carry__1_n_0\,
      CO(2) => \next_count0_carry__1_n_1\,
      CO(1) => \next_count0_carry__1_n_2\,
      CO(0) => \next_count0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => count(12 downto 9)
    );
\next_count0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \next_count0_carry__1_n_0\,
      CO(3) => \NLW_next_count0_carry__2_CO_UNCONNECTED\(3),
      CO(2) => \next_count0_carry__2_n_1\,
      CO(1) => \next_count0_carry__2_n_2\,
      CO(0) => \next_count0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => count(16 downto 13)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_Freq_Divider_1_1 is
  port (
    CLK : in STD_LOGIC;
    CLK_out : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_Freq_Divider_1_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_Freq_Divider_1_1 : entity is "design_1_Freq_Divider_1_1,Freq_Divider,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_Freq_Divider_1_1 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_Freq_Divider_1_1 : entity is "Freq_Divider,Vivado 2017.4.1";
end design_1_Freq_Divider_1_1;

architecture STRUCTURE of design_1_Freq_Divider_1_1 is
  attribute x_interface_info : string;
  attribute x_interface_info of CLK : signal is "xilinx.com:signal:clock:1.0 CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of CLK : signal is "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_EXT_OSC";
begin
U0: entity work.design_1_Freq_Divider_1_1_Freq_Divider
     port map (
      CLK => CLK,
      CLK_out => CLK_out
    );
end STRUCTURE;

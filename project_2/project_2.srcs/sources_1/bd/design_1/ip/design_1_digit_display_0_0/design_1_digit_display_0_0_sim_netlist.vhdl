-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
-- Date        : Tue Feb 27 14:25:45 2018
-- Host        : Qlala-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/xilinx_project/project_2/project_2.srcs/sources_1/bd/design_1/ip/design_1_digit_display_0_0/design_1_digit_display_0_0_sim_netlist.vhdl
-- Design      : design_1_digit_display_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_digit_display_0_0_digit_display is
  port (
    Q : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \AN[7]\ : out STD_LOGIC;
    CG : out STD_LOGIC;
    CF : out STD_LOGIC;
    CE : out STD_LOGIC;
    CD : out STD_LOGIC;
    CC : out STD_LOGIC;
    CB : out STD_LOGIC;
    CA : out STD_LOGIC;
    CLK : in STD_LOGIC;
    disp_byte0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    disp_byte3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    disp_byte2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    disp_byte1 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_digit_display_0_0_digit_display : entity is "digit_display";
end design_1_digit_display_0_0_digit_display;

architecture STRUCTURE of design_1_digit_display_0_0_digit_display is
  signal \^an[7]\ : STD_LOGIC;
  signal CA_INST_0_i_10_n_0 : STD_LOGIC;
  signal CA_INST_0_i_11_n_0 : STD_LOGIC;
  signal CA_INST_0_i_12_n_0 : STD_LOGIC;
  signal CA_INST_0_i_13_n_0 : STD_LOGIC;
  signal CA_INST_0_i_14_n_0 : STD_LOGIC;
  signal CA_INST_0_i_15_n_0 : STD_LOGIC;
  signal CA_INST_0_i_16_n_0 : STD_LOGIC;
  signal CA_INST_0_i_17_n_0 : STD_LOGIC;
  signal CA_INST_0_i_18_n_0 : STD_LOGIC;
  signal CA_INST_0_i_19_n_0 : STD_LOGIC;
  signal CA_INST_0_i_20_n_0 : STD_LOGIC;
  signal CA_INST_0_i_21_n_0 : STD_LOGIC;
  signal CA_INST_0_i_22_n_0 : STD_LOGIC;
  signal CA_INST_0_i_23_n_0 : STD_LOGIC;
  signal CA_INST_0_i_24_n_0 : STD_LOGIC;
  signal CA_INST_0_i_25_n_0 : STD_LOGIC;
  signal CA_INST_0_i_26_n_0 : STD_LOGIC;
  signal CA_INST_0_i_27_n_0 : STD_LOGIC;
  signal CA_INST_0_i_5_n_0 : STD_LOGIC;
  signal CA_INST_0_i_6_n_0 : STD_LOGIC;
  signal CA_INST_0_i_7_n_0 : STD_LOGIC;
  signal CA_INST_0_i_8_n_0 : STD_LOGIC;
  signal CA_INST_0_i_9_n_0 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \char_select[0]_i_1_n_0\ : STD_LOGIC;
  signal \char_select[0]_i_2_n_0\ : STD_LOGIC;
  signal digit : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of CA_INST_0 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of CA_INST_0_i_15 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of CA_INST_0_i_19 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of CA_INST_0_i_20 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of CA_INST_0_i_21 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of CA_INST_0_i_22 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of CA_INST_0_i_24 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of CA_INST_0_i_5 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of CB_INST_0 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of CC_INST_0 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of CD_INST_0 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of CF_INST_0 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of CG_INST_0 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \char_select[0]_i_2\ : label is "soft_lutpair2";
begin
  \AN[7]\ <= \^an[7]\;
  Q(6 downto 0) <= \^q\(6 downto 0);
CA_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4184"
    )
        port map (
      I0 => digit(1),
      I1 => digit(0),
      I2 => digit(3),
      I3 => digit(2),
      O => CA
    );
CA_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAA8AAA8AAA8"
    )
        port map (
      I0 => \^an[7]\,
      I1 => CA_INST_0_i_5_n_0,
      I2 => CA_INST_0_i_6_n_0,
      I3 => CA_INST_0_i_7_n_0,
      I4 => disp_byte0(1),
      I5 => CA_INST_0_i_8_n_0,
      O => digit(1)
    );
CA_INST_0_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888000000000000"
    )
        port map (
      I0 => disp_byte0(4),
      I1 => CA_INST_0_i_19_n_0,
      I2 => disp_byte1(4),
      I3 => CA_INST_0_i_20_n_0,
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => CA_INST_0_i_10_n_0
    );
CA_INST_0_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF08080800000000"
    )
        port map (
      I0 => disp_byte2(0),
      I1 => CA_INST_0_i_21_n_0,
      I2 => CA_INST_0_i_22_n_0,
      I3 => disp_byte1(0),
      I4 => CA_INST_0_i_23_n_0,
      I5 => \^q\(6),
      O => CA_INST_0_i_11_n_0
    );
CA_INST_0_i_12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => CA_INST_0_i_26_n_0,
      O => CA_INST_0_i_12_n_0
    );
CA_INST_0_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888000000000000"
    )
        port map (
      I0 => disp_byte0(7),
      I1 => CA_INST_0_i_19_n_0,
      I2 => disp_byte1(7),
      I3 => CA_INST_0_i_20_n_0,
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => CA_INST_0_i_13_n_0
    );
CA_INST_0_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF08080800000000"
    )
        port map (
      I0 => disp_byte2(3),
      I1 => CA_INST_0_i_21_n_0,
      I2 => CA_INST_0_i_22_n_0,
      I3 => disp_byte1(3),
      I4 => CA_INST_0_i_23_n_0,
      I5 => \^q\(6),
      O => CA_INST_0_i_14_n_0
    );
CA_INST_0_i_15: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => CA_INST_0_i_27_n_0,
      O => CA_INST_0_i_15_n_0
    );
CA_INST_0_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888000000000000"
    )
        port map (
      I0 => disp_byte0(6),
      I1 => CA_INST_0_i_19_n_0,
      I2 => disp_byte1(6),
      I3 => CA_INST_0_i_20_n_0,
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => CA_INST_0_i_16_n_0
    );
CA_INST_0_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF08080800000000"
    )
        port map (
      I0 => disp_byte2(2),
      I1 => CA_INST_0_i_21_n_0,
      I2 => CA_INST_0_i_22_n_0,
      I3 => disp_byte1(2),
      I4 => CA_INST_0_i_23_n_0,
      I5 => \^q\(6),
      O => CA_INST_0_i_17_n_0
    );
CA_INST_0_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00CCAA00F0000000"
    )
        port map (
      I0 => disp_byte3(5),
      I1 => disp_byte3(1),
      I2 => disp_byte2(5),
      I3 => \^q\(5),
      I4 => \^q\(6),
      I5 => \^q\(4),
      O => CA_INST_0_i_18_n_0
    );
CA_INST_0_i_19: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(3),
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(0),
      O => CA_INST_0_i_19_n_0
    );
CA_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAA8AAA8AAA8"
    )
        port map (
      I0 => \^an[7]\,
      I1 => CA_INST_0_i_9_n_0,
      I2 => CA_INST_0_i_10_n_0,
      I3 => CA_INST_0_i_11_n_0,
      I4 => disp_byte0(0),
      I5 => CA_INST_0_i_8_n_0,
      O => digit(0)
    );
CA_INST_0_i_20: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => CA_INST_0_i_20_n_0
    );
CA_INST_0_i_21: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => CA_INST_0_i_21_n_0
    );
CA_INST_0_i_22: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(5),
      O => CA_INST_0_i_22_n_0
    );
CA_INST_0_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(4),
      I3 => \^q\(5),
      I4 => \^q\(2),
      I5 => \^q\(3),
      O => CA_INST_0_i_23_n_0
    );
CA_INST_0_i_24: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(5),
      I2 => \^q\(4),
      O => CA_INST_0_i_24_n_0
    );
CA_INST_0_i_25: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00CCAA00F0000000"
    )
        port map (
      I0 => disp_byte3(4),
      I1 => disp_byte3(0),
      I2 => disp_byte2(4),
      I3 => \^q\(5),
      I4 => \^q\(6),
      I5 => \^q\(4),
      O => CA_INST_0_i_25_n_0
    );
CA_INST_0_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00CCAA00F0000000"
    )
        port map (
      I0 => disp_byte3(7),
      I1 => disp_byte3(3),
      I2 => disp_byte2(7),
      I3 => \^q\(5),
      I4 => \^q\(6),
      I5 => \^q\(4),
      O => CA_INST_0_i_26_n_0
    );
CA_INST_0_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00CCAA00F0000000"
    )
        port map (
      I0 => disp_byte3(6),
      I1 => disp_byte3(2),
      I2 => disp_byte2(6),
      I3 => \^q\(5),
      I4 => \^q\(6),
      I5 => \^q\(4),
      O => CA_INST_0_i_27_n_0
    );
CA_INST_0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAA8AAA8AAA8"
    )
        port map (
      I0 => \^an[7]\,
      I1 => CA_INST_0_i_12_n_0,
      I2 => CA_INST_0_i_13_n_0,
      I3 => CA_INST_0_i_14_n_0,
      I4 => disp_byte0(3),
      I5 => CA_INST_0_i_8_n_0,
      O => digit(3)
    );
CA_INST_0_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAA8AAA8AAA8"
    )
        port map (
      I0 => \^an[7]\,
      I1 => CA_INST_0_i_15_n_0,
      I2 => CA_INST_0_i_16_n_0,
      I3 => CA_INST_0_i_17_n_0,
      I4 => disp_byte0(2),
      I5 => CA_INST_0_i_8_n_0,
      O => digit(2)
    );
CA_INST_0_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => CA_INST_0_i_18_n_0,
      O => CA_INST_0_i_5_n_0
    );
CA_INST_0_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888000000000000"
    )
        port map (
      I0 => disp_byte0(5),
      I1 => CA_INST_0_i_19_n_0,
      I2 => disp_byte1(5),
      I3 => CA_INST_0_i_20_n_0,
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => CA_INST_0_i_6_n_0
    );
CA_INST_0_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF08080800000000"
    )
        port map (
      I0 => disp_byte2(1),
      I1 => CA_INST_0_i_21_n_0,
      I2 => CA_INST_0_i_22_n_0,
      I3 => disp_byte1(1),
      I4 => CA_INST_0_i_23_n_0,
      I5 => \^q\(6),
      O => CA_INST_0_i_7_n_0
    );
CA_INST_0_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000000000000000"
    )
        port map (
      I0 => \^an[7]\,
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(2),
      I5 => CA_INST_0_i_24_n_0,
      O => CA_INST_0_i_8_n_0
    );
CA_INST_0_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => CA_INST_0_i_25_n_0,
      O => CA_INST_0_i_9_n_0
    );
CB_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E448"
    )
        port map (
      I0 => digit(0),
      I1 => digit(2),
      I2 => digit(3),
      I3 => digit(1),
      O => CB
    );
CC_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B002"
    )
        port map (
      I0 => digit(1),
      I1 => digit(0),
      I2 => digit(2),
      I3 => digit(3),
      O => CC
    );
CD_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8924"
    )
        port map (
      I0 => digit(1),
      I1 => digit(0),
      I2 => digit(3),
      I3 => digit(2),
      O => CD
    );
CE_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0D4C"
    )
        port map (
      I0 => digit(1),
      I1 => digit(0),
      I2 => digit(3),
      I3 => digit(2),
      O => CE
    );
CF_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5190"
    )
        port map (
      I0 => digit(3),
      I1 => digit(2),
      I2 => digit(0),
      I3 => digit(1),
      O => CF
    );
CG_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4109"
    )
        port map (
      I0 => digit(3),
      I1 => digit(2),
      I2 => digit(1),
      I3 => digit(0),
      O => CG
    );
\char_select[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \^an[7]\,
      I1 => \char_select[0]_i_2_n_0\,
      I2 => \^q\(4),
      I3 => \^q\(5),
      I4 => \^q\(2),
      I5 => \^q\(3),
      O => \char_select[0]_i_1_n_0\
    );
\char_select[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => \char_select[0]_i_2_n_0\
    );
\char_select_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \char_select[0]_i_1_n_0\,
      Q => \^an[7]\,
      R => '0'
    );
\char_select_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^an[7]\,
      Q => \^q\(0),
      R => '0'
    );
\char_select_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(0),
      Q => \^q\(1),
      R => '0'
    );
\char_select_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(1),
      Q => \^q\(2),
      R => '0'
    );
\char_select_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(2),
      Q => \^q\(3),
      R => '0'
    );
\char_select_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(3),
      Q => \^q\(4),
      R => '0'
    );
\char_select_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(4),
      Q => \^q\(5),
      R => '0'
    );
\char_select_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \^q\(5),
      Q => \^q\(6),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_digit_display_0_0 is
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_digit_display_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_digit_display_0_0 : entity is "design_1_digit_display_0_0,digit_display,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_digit_display_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_digit_display_0_0 : entity is "digit_display,Vivado 2017.4.1";
end design_1_digit_display_0_0;

architecture STRUCTURE of design_1_digit_display_0_0 is
  signal \<const1>\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of CLK : signal is "xilinx.com:signal:clock:1.0 CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of CLK : signal is "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, PHASE 0.000";
begin
  DP <= \<const1>\;
U0: entity work.design_1_digit_display_0_0_digit_display
     port map (
      \AN[7]\ => AN(7),
      CA => CA,
      CB => CB,
      CC => CC,
      CD => CD,
      CE => CE,
      CF => CF,
      CG => CG,
      CLK => CLK,
      Q(6) => AN(0),
      Q(5) => AN(1),
      Q(4) => AN(2),
      Q(3) => AN(3),
      Q(2) => AN(4),
      Q(1) => AN(5),
      Q(0) => AN(6),
      disp_byte0(7 downto 0) => disp_byte0(7 downto 0),
      disp_byte1(7 downto 0) => disp_byte1(7 downto 0),
      disp_byte2(7 downto 0) => disp_byte2(7 downto 0),
      disp_byte3(7 downto 0) => disp_byte3(7 downto 0)
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;

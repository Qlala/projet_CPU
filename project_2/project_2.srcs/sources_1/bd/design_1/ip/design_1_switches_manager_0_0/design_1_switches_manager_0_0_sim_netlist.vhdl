-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
-- Date        : Tue Feb 27 14:25:45 2018
-- Host        : Qlala-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/xilinx_project/project_2/project_2.srcs/sources_1/bd/design_1/ip/design_1_switches_manager_0_0/design_1_switches_manager_0_0_sim_netlist.vhdl
-- Design      : design_1_switches_manager_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_switches_manager_0_0_switches_manager is
  port (
    byte0_saved : out STD_LOGIC_VECTOR ( 7 downto 0 );
    byte1_saved : out STD_LOGIC_VECTOR ( 7 downto 0 );
    save_enable : in STD_LOGIC;
    CLK : in STD_LOGIC;
    switches : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_switches_manager_0_0_switches_manager : entity is "switches_manager";
end design_1_switches_manager_0_0_switches_manager;

architecture STRUCTURE of design_1_switches_manager_0_0_switches_manager is
  signal clk_en : STD_LOGIC;
  signal clk_en_i_1_n_0 : STD_LOGIC;
begin
\byte0_saved_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(0),
      Q => byte0_saved(0),
      R => '0'
    );
\byte0_saved_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(1),
      Q => byte0_saved(1),
      R => '0'
    );
\byte0_saved_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(2),
      Q => byte0_saved(2),
      R => '0'
    );
\byte0_saved_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(3),
      Q => byte0_saved(3),
      R => '0'
    );
\byte0_saved_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(4),
      Q => byte0_saved(4),
      R => '0'
    );
\byte0_saved_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(5),
      Q => byte0_saved(5),
      R => '0'
    );
\byte0_saved_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(6),
      Q => byte0_saved(6),
      R => '0'
    );
\byte0_saved_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(7),
      Q => byte0_saved(7),
      R => '0'
    );
\byte1_saved_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(8),
      Q => byte1_saved(0),
      R => '0'
    );
\byte1_saved_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(9),
      Q => byte1_saved(1),
      R => '0'
    );
\byte1_saved_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(10),
      Q => byte1_saved(2),
      R => '0'
    );
\byte1_saved_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(11),
      Q => byte1_saved(3),
      R => '0'
    );
\byte1_saved_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(12),
      Q => byte1_saved(4),
      R => '0'
    );
\byte1_saved_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(13),
      Q => byte1_saved(5),
      R => '0'
    );
\byte1_saved_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(14),
      Q => byte1_saved(6),
      R => '0'
    );
\byte1_saved_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk_en,
      CE => '1',
      D => switches(15),
      Q => byte1_saved(7),
      R => '0'
    );
clk_en_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => save_enable,
      I1 => clk_en,
      O => clk_en_i_1_n_0
    );
clk_en_reg: unisim.vcomponents.FDRE
     port map (
      C => CLK,
      CE => '1',
      D => clk_en_i_1_n_0,
      Q => clk_en,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_switches_manager_0_0 is
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_switches_manager_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_switches_manager_0_0 : entity is "design_1_switches_manager_0_0,switches_manager,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_switches_manager_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_switches_manager_0_0 : entity is "switches_manager,Vivado 2017.4.1";
end design_1_switches_manager_0_0;

architecture STRUCTURE of design_1_switches_manager_0_0 is
  signal \^switches\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of CLK : signal is "xilinx.com:signal:clock:1.0 CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of CLK : signal is "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_EXT_OSC";
begin
  \^switches\(15 downto 0) <= switches(15 downto 0);
  byte0(7 downto 0) <= \^switches\(7 downto 0);
  byte1(7 downto 0) <= \^switches\(15 downto 8);
U0: entity work.design_1_switches_manager_0_0_switches_manager
     port map (
      CLK => CLK,
      byte0_saved(7 downto 0) => byte0_saved(7 downto 0),
      byte1_saved(7 downto 0) => byte1_saved(7 downto 0),
      save_enable => save_enable,
      switches(15 downto 0) => \^switches\(15 downto 0)
    );
end STRUCTURE;

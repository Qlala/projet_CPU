-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
-- Date        : Tue Feb 27 14:25:45 2018
-- Host        : Qlala-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/xilinx_project/project_2/project_2.srcs/sources_1/bd/design_1/ip/design_1_switches_manager_0_0/design_1_switches_manager_0_0_stub.vhdl
-- Design      : design_1_switches_manager_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_switches_manager_0_0 is
  Port ( 
    switches : in STD_LOGIC_VECTOR ( 15 downto 0 );
    reg_change : in STD_LOGIC;
    save_enable : in STD_LOGIC;
    CLK : in STD_LOGIC;
    byte0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    byte1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    byte0_saved : out STD_LOGIC_VECTOR ( 7 downto 0 );
    byte1_saved : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end design_1_switches_manager_0_0;

architecture stub of design_1_switches_manager_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "switches[15:0],reg_change,save_enable,CLK,byte0[7:0],byte1[7:0],byte0_saved[7:0],byte1_saved[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "switches_manager,Vivado 2017.4.1";
begin
end;

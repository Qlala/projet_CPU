-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
-- Date        : Tue Feb 27 14:23:55 2018
-- Host        : Qlala-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               E:/xilinx_project/project_2/project_2.srcs/sources_1/bd/design_1/ip/design_1_Freq_Divider_1_1/design_1_Freq_Divider_1_1_stub.vhdl
-- Design      : design_1_Freq_Divider_1_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_Freq_Divider_1_1 is
  Port ( 
    CLK : in STD_LOGIC;
    CLK_out : out STD_LOGIC
  );

end design_1_Freq_Divider_1_1;

architecture stub of design_1_Freq_Divider_1_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,CLK_out";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "Freq_Divider,Vivado 2017.4.1";
begin
end;
-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
-- Date        : Tue Feb 27 14:25:45 2018
-- Host        : Qlala-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/xilinx_project/project_2/project_2.srcs/sources_1/bd/design_1/ip/design_1_digit_display_0_0/design_1_digit_display_0_0_stub.vhdl
-- Design      : design_1_digit_display_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_digit_display_0_0 is
  Port ( 
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

end design_1_digit_display_0_0;

architecture stub of design_1_digit_display_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CA,CB,CC,CD,CE,CF,CG,DP,OK_button,AN[0:7],disp_byte0[7:0],disp_byte1[7:0],disp_byte2[7:0],disp_byte3[7:0],CLK";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "digit_display,Vivado 2017.4.1";
begin
end;

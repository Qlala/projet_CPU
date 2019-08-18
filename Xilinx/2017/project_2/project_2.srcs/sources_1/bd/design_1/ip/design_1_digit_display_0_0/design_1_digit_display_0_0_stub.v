// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
// Date        : Tue Feb 27 14:25:45 2018
// Host        : Qlala-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/xilinx_project/project_2/project_2.srcs/sources_1/bd/design_1/ip/design_1_digit_display_0_0/design_1_digit_display_0_0_stub.v
// Design      : design_1_digit_display_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "digit_display,Vivado 2017.4.1" *)
module design_1_digit_display_0_0(CA, CB, CC, CD, CE, CF, CG, DP, OK_button, AN, disp_byte0, 
  disp_byte1, disp_byte2, disp_byte3, CLK)
/* synthesis syn_black_box black_box_pad_pin="CA,CB,CC,CD,CE,CF,CG,DP,OK_button,AN[0:7],disp_byte0[7:0],disp_byte1[7:0],disp_byte2[7:0],disp_byte3[7:0],CLK" */;
  output CA;
  output CB;
  output CC;
  output CD;
  output CE;
  output CF;
  output CG;
  output DP;
  input OK_button;
  output [0:7]AN;
  input [7:0]disp_byte0;
  input [7:0]disp_byte1;
  input [7:0]disp_byte2;
  input [7:0]disp_byte3;
  input CLK;
endmodule

// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Mon Dec 10 18:05:32 2018
// Host        : Qlala-Blade running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/xilinx_project/git_project/projet_CPU/projet_CPU/test_project/project_base_2017/project_base_2017.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_stub.v
// Design      : blk_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4" *)
module blk_mem_gen_0(clka, ena, wea, addra, dina, clkb, rstb, enb, addrb, doutb, 
  rsta_busy, rstb_busy)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[11:0],dina[63:0],clkb,rstb,enb,addrb[11:0],doutb[63:0],rsta_busy,rstb_busy" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [11:0]addra;
  input [63:0]dina;
  input clkb;
  input rstb;
  input enb;
  input [11:0]addrb;
  output [63:0]doutb;
  output rsta_busy;
  output rstb_busy;
endmodule

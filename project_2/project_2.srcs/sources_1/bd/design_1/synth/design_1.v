//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
//Date        : Mon Feb 26 17:05:22 2018
//Host        : Qlala-PC running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (AN,
    CA,
    CB,
    CC,
    CD,
    CE,
    CF,
    CG,
    DP,
    EXT_OSC,
    OK_button);
  output [0:7]AN;
  output CA;
  output CB;
  output CC;
  output CD;
  output CE;
  output CF;
  output CG;
  output DP;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.EXT_OSC CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.EXT_OSC, CLK_DOMAIN design_1_EXT_OSC, FREQ_HZ 100000000, PHASE 0.000" *) input EXT_OSC;
  input OK_button;

  wire EXT_OSC_1;
  wire Freq_Divider_0_CLK_out;
  wire OK_button_1;
  wire [0:7]main_0_AN;
  wire main_0_CA;
  wire main_0_CB;
  wire main_0_CC;
  wire main_0_CD;
  wire main_0_CE;
  wire main_0_CF;
  wire main_0_CG;
  wire main_0_DP;

  assign AN[0:7] = main_0_AN;
  assign CA = main_0_CA;
  assign CB = main_0_CB;
  assign CC = main_0_CC;
  assign CD = main_0_CD;
  assign CE = main_0_CE;
  assign CF = main_0_CF;
  assign CG = main_0_CG;
  assign DP = main_0_DP;
  assign EXT_OSC_1 = EXT_OSC;
  assign OK_button_1 = OK_button;
  design_1_Freq_Divider_0_0 Freq_Divider_0
       (.CLK(EXT_OSC_1),
        .CLK_out(Freq_Divider_0_CLK_out));
  design_1_main_0_0 main_0
       (.AN(main_0_AN),
        .CA(main_0_CA),
        .CB(main_0_CB),
        .CC(main_0_CC),
        .CD(main_0_CD),
        .CE(main_0_CE),
        .CF(main_0_CF),
        .CG(main_0_CG),
        .CLK(Freq_Divider_0_CLK_out),
        .DP(main_0_DP),
        .OK_button(OK_button_1));
  design_1_memory_controller_0_0 memory_controller_0
       (.addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

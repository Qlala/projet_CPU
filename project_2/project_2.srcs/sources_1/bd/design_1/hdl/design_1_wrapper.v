//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
//Date        : Mon Feb 26 17:05:22 2018
//Host        : Qlala-PC running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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
  input EXT_OSC;
  input OK_button;

  wire [0:7]AN;
  wire CA;
  wire CB;
  wire CC;
  wire CD;
  wire CE;
  wire CF;
  wire CG;
  wire DP;
  wire EXT_OSC;
  wire OK_button;

  design_1 design_1_i
       (.AN(AN),
        .CA(CA),
        .CB(CB),
        .CC(CC),
        .CD(CD),
        .CE(CE),
        .CF(CF),
        .CG(CG),
        .DP(DP),
        .EXT_OSC(EXT_OSC),
        .OK_button(OK_button));
endmodule

// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
// Date        : Tue Feb 27 14:25:45 2018
// Host        : Qlala-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/xilinx_project/project_2/project_2.srcs/sources_1/bd/design_1/ip/design_1_digit_display_0_0/design_1_digit_display_0_0_sim_netlist.v
// Design      : design_1_digit_display_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_digit_display_0_0,digit_display,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "digit_display,Vivado 2017.4.1" *) 
(* NotValidForBitStream *)
module design_1_digit_display_0_0
   (CA,
    CB,
    CC,
    CD,
    CE,
    CF,
    CG,
    DP,
    OK_button,
    AN,
    disp_byte0,
    disp_byte1,
    disp_byte2,
    disp_byte3,
    CLK);
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;

  wire \<const1> ;
  wire [0:7]AN;
  wire CA;
  wire CB;
  wire CC;
  wire CD;
  wire CE;
  wire CF;
  wire CG;
  wire CLK;
  wire [7:0]disp_byte0;
  wire [7:0]disp_byte1;
  wire [7:0]disp_byte2;
  wire [7:0]disp_byte3;

  assign DP = \<const1> ;
  design_1_digit_display_0_0_digit_display U0
       (.\AN[7] (AN[7]),
        .CA(CA),
        .CB(CB),
        .CC(CC),
        .CD(CD),
        .CE(CE),
        .CF(CF),
        .CG(CG),
        .CLK(CLK),
        .Q({AN[0],AN[1],AN[2],AN[3],AN[4],AN[5],AN[6]}),
        .disp_byte0(disp_byte0),
        .disp_byte1(disp_byte1),
        .disp_byte2(disp_byte2),
        .disp_byte3(disp_byte3));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "digit_display" *) 
module design_1_digit_display_0_0_digit_display
   (Q,
    \AN[7] ,
    CG,
    CF,
    CE,
    CD,
    CC,
    CB,
    CA,
    CLK,
    disp_byte0,
    disp_byte3,
    disp_byte2,
    disp_byte1);
  output [6:0]Q;
  output \AN[7] ;
  output CG;
  output CF;
  output CE;
  output CD;
  output CC;
  output CB;
  output CA;
  input CLK;
  input [7:0]disp_byte0;
  input [7:0]disp_byte3;
  input [7:0]disp_byte2;
  input [7:0]disp_byte1;

  wire \AN[7] ;
  wire CA;
  wire CA_INST_0_i_10_n_0;
  wire CA_INST_0_i_11_n_0;
  wire CA_INST_0_i_12_n_0;
  wire CA_INST_0_i_13_n_0;
  wire CA_INST_0_i_14_n_0;
  wire CA_INST_0_i_15_n_0;
  wire CA_INST_0_i_16_n_0;
  wire CA_INST_0_i_17_n_0;
  wire CA_INST_0_i_18_n_0;
  wire CA_INST_0_i_19_n_0;
  wire CA_INST_0_i_20_n_0;
  wire CA_INST_0_i_21_n_0;
  wire CA_INST_0_i_22_n_0;
  wire CA_INST_0_i_23_n_0;
  wire CA_INST_0_i_24_n_0;
  wire CA_INST_0_i_25_n_0;
  wire CA_INST_0_i_26_n_0;
  wire CA_INST_0_i_27_n_0;
  wire CA_INST_0_i_5_n_0;
  wire CA_INST_0_i_6_n_0;
  wire CA_INST_0_i_7_n_0;
  wire CA_INST_0_i_8_n_0;
  wire CA_INST_0_i_9_n_0;
  wire CB;
  wire CC;
  wire CD;
  wire CE;
  wire CF;
  wire CG;
  wire CLK;
  wire [6:0]Q;
  wire \char_select[0]_i_1_n_0 ;
  wire \char_select[0]_i_2_n_0 ;
  wire [3:0]digit;
  wire [7:0]disp_byte0;
  wire [7:0]disp_byte1;
  wire [7:0]disp_byte2;
  wire [7:0]disp_byte3;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h4184)) 
    CA_INST_0
       (.I0(digit[1]),
        .I1(digit[0]),
        .I2(digit[3]),
        .I3(digit[2]),
        .O(CA));
  LUT6 #(
    .INIT(64'hFFFFAAA8AAA8AAA8)) 
    CA_INST_0_i_1
       (.I0(\AN[7] ),
        .I1(CA_INST_0_i_5_n_0),
        .I2(CA_INST_0_i_6_n_0),
        .I3(CA_INST_0_i_7_n_0),
        .I4(disp_byte0[1]),
        .I5(CA_INST_0_i_8_n_0),
        .O(digit[1]));
  LUT6 #(
    .INIT(64'hF888000000000000)) 
    CA_INST_0_i_10
       (.I0(disp_byte0[4]),
        .I1(CA_INST_0_i_19_n_0),
        .I2(disp_byte1[4]),
        .I3(CA_INST_0_i_20_n_0),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(CA_INST_0_i_10_n_0));
  LUT6 #(
    .INIT(64'hFF08080800000000)) 
    CA_INST_0_i_11
       (.I0(disp_byte2[0]),
        .I1(CA_INST_0_i_21_n_0),
        .I2(CA_INST_0_i_22_n_0),
        .I3(disp_byte1[0]),
        .I4(CA_INST_0_i_23_n_0),
        .I5(Q[6]),
        .O(CA_INST_0_i_11_n_0));
  LUT5 #(
    .INIT(32'h80000000)) 
    CA_INST_0_i_12
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(CA_INST_0_i_26_n_0),
        .O(CA_INST_0_i_12_n_0));
  LUT6 #(
    .INIT(64'hF888000000000000)) 
    CA_INST_0_i_13
       (.I0(disp_byte0[7]),
        .I1(CA_INST_0_i_19_n_0),
        .I2(disp_byte1[7]),
        .I3(CA_INST_0_i_20_n_0),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(CA_INST_0_i_13_n_0));
  LUT6 #(
    .INIT(64'hFF08080800000000)) 
    CA_INST_0_i_14
       (.I0(disp_byte2[3]),
        .I1(CA_INST_0_i_21_n_0),
        .I2(CA_INST_0_i_22_n_0),
        .I3(disp_byte1[3]),
        .I4(CA_INST_0_i_23_n_0),
        .I5(Q[6]),
        .O(CA_INST_0_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    CA_INST_0_i_15
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(CA_INST_0_i_27_n_0),
        .O(CA_INST_0_i_15_n_0));
  LUT6 #(
    .INIT(64'hF888000000000000)) 
    CA_INST_0_i_16
       (.I0(disp_byte0[6]),
        .I1(CA_INST_0_i_19_n_0),
        .I2(disp_byte1[6]),
        .I3(CA_INST_0_i_20_n_0),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(CA_INST_0_i_16_n_0));
  LUT6 #(
    .INIT(64'hFF08080800000000)) 
    CA_INST_0_i_17
       (.I0(disp_byte2[2]),
        .I1(CA_INST_0_i_21_n_0),
        .I2(CA_INST_0_i_22_n_0),
        .I3(disp_byte1[2]),
        .I4(CA_INST_0_i_23_n_0),
        .I5(Q[6]),
        .O(CA_INST_0_i_17_n_0));
  LUT6 #(
    .INIT(64'h00CCAA00F0000000)) 
    CA_INST_0_i_18
       (.I0(disp_byte3[5]),
        .I1(disp_byte3[1]),
        .I2(disp_byte2[5]),
        .I3(Q[5]),
        .I4(Q[6]),
        .I5(Q[4]),
        .O(CA_INST_0_i_18_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    CA_INST_0_i_19
       (.I0(Q[1]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[0]),
        .O(CA_INST_0_i_19_n_0));
  LUT6 #(
    .INIT(64'hFFFFAAA8AAA8AAA8)) 
    CA_INST_0_i_2
       (.I0(\AN[7] ),
        .I1(CA_INST_0_i_9_n_0),
        .I2(CA_INST_0_i_10_n_0),
        .I3(CA_INST_0_i_11_n_0),
        .I4(disp_byte0[0]),
        .I5(CA_INST_0_i_8_n_0),
        .O(digit[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    CA_INST_0_i_20
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(CA_INST_0_i_20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    CA_INST_0_i_21
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(CA_INST_0_i_21_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h7)) 
    CA_INST_0_i_22
       (.I0(Q[4]),
        .I1(Q[5]),
        .O(CA_INST_0_i_22_n_0));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    CA_INST_0_i_23
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[4]),
        .I3(Q[5]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(CA_INST_0_i_23_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h80)) 
    CA_INST_0_i_24
       (.I0(Q[6]),
        .I1(Q[5]),
        .I2(Q[4]),
        .O(CA_INST_0_i_24_n_0));
  LUT6 #(
    .INIT(64'h00CCAA00F0000000)) 
    CA_INST_0_i_25
       (.I0(disp_byte3[4]),
        .I1(disp_byte3[0]),
        .I2(disp_byte2[4]),
        .I3(Q[5]),
        .I4(Q[6]),
        .I5(Q[4]),
        .O(CA_INST_0_i_25_n_0));
  LUT6 #(
    .INIT(64'h00CCAA00F0000000)) 
    CA_INST_0_i_26
       (.I0(disp_byte3[7]),
        .I1(disp_byte3[3]),
        .I2(disp_byte2[7]),
        .I3(Q[5]),
        .I4(Q[6]),
        .I5(Q[4]),
        .O(CA_INST_0_i_26_n_0));
  LUT6 #(
    .INIT(64'h00CCAA00F0000000)) 
    CA_INST_0_i_27
       (.I0(disp_byte3[6]),
        .I1(disp_byte3[2]),
        .I2(disp_byte2[6]),
        .I3(Q[5]),
        .I4(Q[6]),
        .I5(Q[4]),
        .O(CA_INST_0_i_27_n_0));
  LUT6 #(
    .INIT(64'hFFFFAAA8AAA8AAA8)) 
    CA_INST_0_i_3
       (.I0(\AN[7] ),
        .I1(CA_INST_0_i_12_n_0),
        .I2(CA_INST_0_i_13_n_0),
        .I3(CA_INST_0_i_14_n_0),
        .I4(disp_byte0[3]),
        .I5(CA_INST_0_i_8_n_0),
        .O(digit[3]));
  LUT6 #(
    .INIT(64'hFFFFAAA8AAA8AAA8)) 
    CA_INST_0_i_4
       (.I0(\AN[7] ),
        .I1(CA_INST_0_i_15_n_0),
        .I2(CA_INST_0_i_16_n_0),
        .I3(CA_INST_0_i_17_n_0),
        .I4(disp_byte0[2]),
        .I5(CA_INST_0_i_8_n_0),
        .O(digit[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    CA_INST_0_i_5
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(CA_INST_0_i_18_n_0),
        .O(CA_INST_0_i_5_n_0));
  LUT6 #(
    .INIT(64'hF888000000000000)) 
    CA_INST_0_i_6
       (.I0(disp_byte0[5]),
        .I1(CA_INST_0_i_19_n_0),
        .I2(disp_byte1[5]),
        .I3(CA_INST_0_i_20_n_0),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(CA_INST_0_i_6_n_0));
  LUT6 #(
    .INIT(64'hFF08080800000000)) 
    CA_INST_0_i_7
       (.I0(disp_byte2[1]),
        .I1(CA_INST_0_i_21_n_0),
        .I2(CA_INST_0_i_22_n_0),
        .I3(disp_byte1[1]),
        .I4(CA_INST_0_i_23_n_0),
        .I5(Q[6]),
        .O(CA_INST_0_i_7_n_0));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    CA_INST_0_i_8
       (.I0(\AN[7] ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[2]),
        .I5(CA_INST_0_i_24_n_0),
        .O(CA_INST_0_i_8_n_0));
  LUT5 #(
    .INIT(32'h80000000)) 
    CA_INST_0_i_9
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(CA_INST_0_i_25_n_0),
        .O(CA_INST_0_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hE448)) 
    CB_INST_0
       (.I0(digit[0]),
        .I1(digit[2]),
        .I2(digit[3]),
        .I3(digit[1]),
        .O(CB));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hB002)) 
    CC_INST_0
       (.I0(digit[1]),
        .I1(digit[0]),
        .I2(digit[2]),
        .I3(digit[3]),
        .O(CC));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h8924)) 
    CD_INST_0
       (.I0(digit[1]),
        .I1(digit[0]),
        .I2(digit[3]),
        .I3(digit[2]),
        .O(CD));
  LUT4 #(
    .INIT(16'h0D4C)) 
    CE_INST_0
       (.I0(digit[1]),
        .I1(digit[0]),
        .I2(digit[3]),
        .I3(digit[2]),
        .O(CE));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h5190)) 
    CF_INST_0
       (.I0(digit[3]),
        .I1(digit[2]),
        .I2(digit[0]),
        .I3(digit[1]),
        .O(CF));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h4109)) 
    CG_INST_0
       (.I0(digit[3]),
        .I1(digit[2]),
        .I2(digit[1]),
        .I3(digit[0]),
        .O(CG));
  LUT6 #(
    .INIT(64'hDFFFFFFFFFFFFFFF)) 
    \char_select[0]_i_1 
       (.I0(\AN[7] ),
        .I1(\char_select[0]_i_2_n_0 ),
        .I2(Q[4]),
        .I3(Q[5]),
        .I4(Q[2]),
        .I5(Q[3]),
        .O(\char_select[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \char_select[0]_i_2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\char_select[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \char_select_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\char_select[0]_i_1_n_0 ),
        .Q(\AN[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \char_select_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\AN[7] ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \char_select_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[0]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \char_select_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[1]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \char_select_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[2]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \char_select_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[3]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \char_select_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[4]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \char_select_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[5]),
        .Q(Q[6]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif

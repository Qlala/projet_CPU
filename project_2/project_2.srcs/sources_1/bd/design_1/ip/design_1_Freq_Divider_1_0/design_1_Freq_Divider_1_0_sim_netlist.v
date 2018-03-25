// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
// Date        : Tue Feb 27 14:23:55 2018
// Host        : Qlala-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               E:/xilinx_project/project_2/project_2.srcs/sources_1/bd/design_1/ip/design_1_Freq_Divider_1_0/design_1_Freq_Divider_1_0_sim_netlist.v
// Design      : design_1_Freq_Divider_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_Freq_Divider_1_0,Freq_Divider,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "Freq_Divider,Vivado 2017.4.1" *) 
(* NotValidForBitStream *)
module design_1_Freq_Divider_1_0
   (CLK,
    CLK_out);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  output CLK_out;

  wire CLK;
  wire CLK_out;

  design_1_Freq_Divider_1_0_Freq_Divider U0
       (.CLK(CLK),
        .CLK_out(CLK_out));
endmodule

(* ORIG_REF_NAME = "Freq_Divider" *) 
module design_1_Freq_Divider_1_0_Freq_Divider
   (CLK_out,
    CLK);
  output CLK_out;
  input CLK;

  wire CLK;
  wire CLK_out;
  wire CLK_out_INST_0_i_1_n_0;
  wire CLK_out_INST_0_i_2_n_0;
  wire CLK_out_INST_0_i_3_n_0;
  wire CLK_out_INST_0_i_4_n_0;
  wire CLK_out_INST_0_i_5_n_0;
  wire CLK_out_INST_0_i_6_n_0;
  wire CLK_out_INST_0_i_7_n_0;
  wire [26:0]count;
  wire [26:1]data0;
  wire [0:0]next_count;
  wire next_count0_carry__0_n_0;
  wire next_count0_carry__0_n_1;
  wire next_count0_carry__0_n_2;
  wire next_count0_carry__0_n_3;
  wire next_count0_carry__1_n_0;
  wire next_count0_carry__1_n_1;
  wire next_count0_carry__1_n_2;
  wire next_count0_carry__1_n_3;
  wire next_count0_carry__2_n_0;
  wire next_count0_carry__2_n_1;
  wire next_count0_carry__2_n_2;
  wire next_count0_carry__2_n_3;
  wire next_count0_carry__3_n_0;
  wire next_count0_carry__3_n_1;
  wire next_count0_carry__3_n_2;
  wire next_count0_carry__3_n_3;
  wire next_count0_carry__4_n_0;
  wire next_count0_carry__4_n_1;
  wire next_count0_carry__4_n_2;
  wire next_count0_carry__4_n_3;
  wire next_count0_carry__5_n_3;
  wire next_count0_carry_n_0;
  wire next_count0_carry_n_1;
  wire next_count0_carry_n_2;
  wire next_count0_carry_n_3;
  wire [3:1]NLW_next_count0_carry__5_CO_UNCONNECTED;
  wire [3:2]NLW_next_count0_carry__5_O_UNCONNECTED;

  LUT3 #(
    .INIT(8'h01)) 
    CLK_out_INST_0
       (.I0(CLK_out_INST_0_i_1_n_0),
        .I1(CLK_out_INST_0_i_2_n_0),
        .I2(CLK_out_INST_0_i_3_n_0),
        .O(CLK_out));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    CLK_out_INST_0_i_1
       (.I0(count[15]),
        .I1(count[16]),
        .I2(count[13]),
        .I3(count[14]),
        .I4(CLK_out_INST_0_i_4_n_0),
        .O(CLK_out_INST_0_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFFBFFF)) 
    CLK_out_INST_0_i_2
       (.I0(count[8]),
        .I1(count[7]),
        .I2(count[5]),
        .I3(count[6]),
        .I4(CLK_out_INST_0_i_5_n_0),
        .O(CLK_out_INST_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFFDF)) 
    CLK_out_INST_0_i_3
       (.I0(count[26]),
        .I1(count[25]),
        .I2(count[0]),
        .I3(CLK_out_INST_0_i_6_n_0),
        .I4(CLK_out_INST_0_i_7_n_0),
        .O(CLK_out_INST_0_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFDF)) 
    CLK_out_INST_0_i_4
       (.I0(count[18]),
        .I1(count[17]),
        .I2(count[20]),
        .I3(count[19]),
        .O(CLK_out_INST_0_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    CLK_out_INST_0_i_5
       (.I0(count[10]),
        .I1(count[9]),
        .I2(count[12]),
        .I3(count[11]),
        .O(CLK_out_INST_0_i_5_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    CLK_out_INST_0_i_6
       (.I0(count[22]),
        .I1(count[21]),
        .I2(count[24]),
        .I3(count[23]),
        .O(CLK_out_INST_0_i_6_n_0));
  LUT4 #(
    .INIT(16'h7FFF)) 
    CLK_out_INST_0_i_7
       (.I0(count[2]),
        .I1(count[1]),
        .I2(count[4]),
        .I3(count[3]),
        .O(CLK_out_INST_0_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count[0]),
        .O(next_count));
  FDRE \count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(next_count),
        .Q(count[0]),
        .R(1'b0));
  FDRE \count_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[10]),
        .Q(count[10]),
        .R(CLK_out));
  FDRE \count_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[11]),
        .Q(count[11]),
        .R(CLK_out));
  FDRE \count_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[12]),
        .Q(count[12]),
        .R(CLK_out));
  FDRE \count_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[13]),
        .Q(count[13]),
        .R(CLK_out));
  FDRE \count_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[14]),
        .Q(count[14]),
        .R(CLK_out));
  FDRE \count_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[15]),
        .Q(count[15]),
        .R(CLK_out));
  FDRE \count_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[16]),
        .Q(count[16]),
        .R(CLK_out));
  FDRE \count_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[17]),
        .Q(count[17]),
        .R(CLK_out));
  FDRE \count_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[18]),
        .Q(count[18]),
        .R(CLK_out));
  FDRE \count_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[19]),
        .Q(count[19]),
        .R(CLK_out));
  FDRE \count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[1]),
        .Q(count[1]),
        .R(CLK_out));
  FDRE \count_reg[20] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[20]),
        .Q(count[20]),
        .R(CLK_out));
  FDRE \count_reg[21] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[21]),
        .Q(count[21]),
        .R(CLK_out));
  FDRE \count_reg[22] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[22]),
        .Q(count[22]),
        .R(CLK_out));
  FDRE \count_reg[23] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[23]),
        .Q(count[23]),
        .R(CLK_out));
  FDRE \count_reg[24] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[24]),
        .Q(count[24]),
        .R(CLK_out));
  FDRE \count_reg[25] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[25]),
        .Q(count[25]),
        .R(CLK_out));
  FDRE \count_reg[26] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[26]),
        .Q(count[26]),
        .R(CLK_out));
  FDRE \count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[2]),
        .Q(count[2]),
        .R(CLK_out));
  FDRE \count_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[3]),
        .Q(count[3]),
        .R(CLK_out));
  FDRE \count_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[4]),
        .Q(count[4]),
        .R(CLK_out));
  FDRE \count_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[5]),
        .Q(count[5]),
        .R(CLK_out));
  FDRE \count_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[6]),
        .Q(count[6]),
        .R(CLK_out));
  FDRE \count_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[7]),
        .Q(count[7]),
        .R(CLK_out));
  FDRE \count_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[8]),
        .Q(count[8]),
        .R(CLK_out));
  FDRE \count_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(data0[9]),
        .Q(count[9]),
        .R(CLK_out));
  CARRY4 next_count0_carry
       (.CI(1'b0),
        .CO({next_count0_carry_n_0,next_count0_carry_n_1,next_count0_carry_n_2,next_count0_carry_n_3}),
        .CYINIT(count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(count[4:1]));
  CARRY4 next_count0_carry__0
       (.CI(next_count0_carry_n_0),
        .CO({next_count0_carry__0_n_0,next_count0_carry__0_n_1,next_count0_carry__0_n_2,next_count0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(count[8:5]));
  CARRY4 next_count0_carry__1
       (.CI(next_count0_carry__0_n_0),
        .CO({next_count0_carry__1_n_0,next_count0_carry__1_n_1,next_count0_carry__1_n_2,next_count0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(count[12:9]));
  CARRY4 next_count0_carry__2
       (.CI(next_count0_carry__1_n_0),
        .CO({next_count0_carry__2_n_0,next_count0_carry__2_n_1,next_count0_carry__2_n_2,next_count0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(count[16:13]));
  CARRY4 next_count0_carry__3
       (.CI(next_count0_carry__2_n_0),
        .CO({next_count0_carry__3_n_0,next_count0_carry__3_n_1,next_count0_carry__3_n_2,next_count0_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(count[20:17]));
  CARRY4 next_count0_carry__4
       (.CI(next_count0_carry__3_n_0),
        .CO({next_count0_carry__4_n_0,next_count0_carry__4_n_1,next_count0_carry__4_n_2,next_count0_carry__4_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(count[24:21]));
  CARRY4 next_count0_carry__5
       (.CI(next_count0_carry__4_n_0),
        .CO({NLW_next_count0_carry__5_CO_UNCONNECTED[3:1],next_count0_carry__5_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_next_count0_carry__5_O_UNCONNECTED[3:2],data0[26:25]}),
        .S({1'b0,1'b0,count[26:25]}));
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

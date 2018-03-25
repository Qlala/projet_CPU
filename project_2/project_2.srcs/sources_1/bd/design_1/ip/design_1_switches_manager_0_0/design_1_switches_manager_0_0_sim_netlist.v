// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4.1 (win64) Build 2117270 Tue Jan 30 15:32:00 MST 2018
// Date        : Tue Feb 27 14:25:45 2018
// Host        : Qlala-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/xilinx_project/project_2/project_2.srcs/sources_1/bd/design_1/ip/design_1_switches_manager_0_0/design_1_switches_manager_0_0_sim_netlist.v
// Design      : design_1_switches_manager_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_switches_manager_0_0,switches_manager,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "switches_manager,Vivado 2017.4.1" *) 
(* NotValidForBitStream *)
module design_1_switches_manager_0_0
   (switches,
    reg_change,
    save_enable,
    CLK,
    byte0,
    byte1,
    byte0_saved,
    byte1_saved);
  input [15:0]switches;
  input reg_change;
  input save_enable;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME CLK, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_EXT_OSC" *) input CLK;
  output [7:0]byte0;
  output [7:0]byte1;
  output [7:0]byte0_saved;
  output [7:0]byte1_saved;

  wire CLK;
  wire [7:0]byte0_saved;
  wire [7:0]byte1_saved;
  wire save_enable;
  wire [15:0]switches;

  assign byte0[7:0] = switches[7:0];
  assign byte1[7:0] = switches[15:8];
  design_1_switches_manager_0_0_switches_manager U0
       (.CLK(CLK),
        .byte0_saved(byte0_saved),
        .byte1_saved(byte1_saved),
        .save_enable(save_enable),
        .switches(switches));
endmodule

(* ORIG_REF_NAME = "switches_manager" *) 
module design_1_switches_manager_0_0_switches_manager
   (byte0_saved,
    byte1_saved,
    save_enable,
    CLK,
    switches);
  output [7:0]byte0_saved;
  output [7:0]byte1_saved;
  input save_enable;
  input CLK;
  input [15:0]switches;

  wire CLK;
  wire [7:0]byte0_saved;
  wire [7:0]byte1_saved;
  wire clk_en;
  wire clk_en_i_1_n_0;
  wire save_enable;
  wire [15:0]switches;

  FDRE \byte0_saved_reg_reg[0] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[0]),
        .Q(byte0_saved[0]),
        .R(1'b0));
  FDRE \byte0_saved_reg_reg[1] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[1]),
        .Q(byte0_saved[1]),
        .R(1'b0));
  FDRE \byte0_saved_reg_reg[2] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[2]),
        .Q(byte0_saved[2]),
        .R(1'b0));
  FDRE \byte0_saved_reg_reg[3] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[3]),
        .Q(byte0_saved[3]),
        .R(1'b0));
  FDRE \byte0_saved_reg_reg[4] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[4]),
        .Q(byte0_saved[4]),
        .R(1'b0));
  FDRE \byte0_saved_reg_reg[5] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[5]),
        .Q(byte0_saved[5]),
        .R(1'b0));
  FDRE \byte0_saved_reg_reg[6] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[6]),
        .Q(byte0_saved[6]),
        .R(1'b0));
  FDRE \byte0_saved_reg_reg[7] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[7]),
        .Q(byte0_saved[7]),
        .R(1'b0));
  FDRE \byte1_saved_reg_reg[0] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[8]),
        .Q(byte1_saved[0]),
        .R(1'b0));
  FDRE \byte1_saved_reg_reg[1] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[9]),
        .Q(byte1_saved[1]),
        .R(1'b0));
  FDRE \byte1_saved_reg_reg[2] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[10]),
        .Q(byte1_saved[2]),
        .R(1'b0));
  FDRE \byte1_saved_reg_reg[3] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[11]),
        .Q(byte1_saved[3]),
        .R(1'b0));
  FDRE \byte1_saved_reg_reg[4] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[12]),
        .Q(byte1_saved[4]),
        .R(1'b0));
  FDRE \byte1_saved_reg_reg[5] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[13]),
        .Q(byte1_saved[5]),
        .R(1'b0));
  FDRE \byte1_saved_reg_reg[6] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[14]),
        .Q(byte1_saved[6]),
        .R(1'b0));
  FDRE \byte1_saved_reg_reg[7] 
       (.C(clk_en),
        .CE(1'b1),
        .D(switches[15]),
        .Q(byte1_saved[7]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    clk_en_i_1
       (.I0(save_enable),
        .I1(clk_en),
        .O(clk_en_i_1_n_0));
  FDRE clk_en_reg
       (.C(CLK),
        .CE(1'b1),
        .D(clk_en_i_1_n_0),
        .Q(clk_en),
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

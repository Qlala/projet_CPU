// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Aug  6 11:29:36 2019
// Host        : Qlala running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               E:/xilinx_project/CPUproject/projet_CPU/Projet_2019/project_2019/project_2019.sim/sim_1/synth/timing/xsim/test_cache_wrapper_time_synth.v
// Design      : test_cache_wrapper
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module Cache_bus_M_to_S
   (Q,
    cache_bus,
    busy,
    EN,
    CLK,
    RST,
    data,
    address,
    W_R);
  output [0:0]Q;
  output [32:0]cache_bus;
  output busy;
  input EN;
  input CLK;
  input RST;
  input [31:0]data;
  input [31:0]address;
  input W_R;

  wire CLK;
  wire EN;
  wire \FSM_sequential_curr_st[0]_i_2_n_0 ;
  wire [0:0]Q;
  wire RST;
  wire W_R;
  wire [31:0]addr_buf;
  wire [31:0]address;
  wire busy;
  wire [32:0]cache_bus;
  wire [1:1]curr_st;
  wire [31:0]data;
  wire [31:0]data_buf;
  wire \data_buf[31]_i_1_n_0 ;
  wire [1:0]\^next_st ;
  wire next_st_n_0;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h54)) 
    \FSM_sequential_curr_st[0]_i_1 
       (.I0(Q),
        .I1(W_R),
        .I2(curr_st),
        .O(\^next_st [0]));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_curr_st[0]_i_2 
       (.I0(RST),
        .O(\FSM_sequential_curr_st[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h45)) 
    \FSM_sequential_curr_st[1]_i_1 
       (.I0(Q),
        .I1(curr_st),
        .I2(W_R),
        .O(\^next_st [1]));
  (* FSM_ENCODED_STATES = "idle:00,sending_data:11,sending_addr_w:10,sending_addr_r:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_st_reg[0] 
       (.C(CLK),
        .CE(next_st_n_0),
        .CLR(\FSM_sequential_curr_st[0]_i_2_n_0 ),
        .D(\^next_st [0]),
        .Q(Q));
  (* FSM_ENCODED_STATES = "idle:00,sending_data:11,sending_addr_w:10,sending_addr_r:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_st_reg[1] 
       (.C(CLK),
        .CE(next_st_n_0),
        .CLR(\FSM_sequential_curr_st[0]_i_2_n_0 ),
        .D(\^next_st [1]),
        .Q(curr_st));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[0] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[0]),
        .Q(addr_buf[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[10] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[10]),
        .Q(addr_buf[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[11] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[11]),
        .Q(addr_buf[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[12] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[12]),
        .Q(addr_buf[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[13] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[13]),
        .Q(addr_buf[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[14] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[14]),
        .Q(addr_buf[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[15] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[15]),
        .Q(addr_buf[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[16] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[16]),
        .Q(addr_buf[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[17] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[17]),
        .Q(addr_buf[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[18] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[18]),
        .Q(addr_buf[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[19] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[19]),
        .Q(addr_buf[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[1] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[1]),
        .Q(addr_buf[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[20] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[20]),
        .Q(addr_buf[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[21] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[21]),
        .Q(addr_buf[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[22] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[22]),
        .Q(addr_buf[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[23] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[23]),
        .Q(addr_buf[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[24] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[24]),
        .Q(addr_buf[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[25] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[25]),
        .Q(addr_buf[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[26] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[26]),
        .Q(addr_buf[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[27] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[27]),
        .Q(addr_buf[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[28] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[28]),
        .Q(addr_buf[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[29] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[29]),
        .Q(addr_buf[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[2] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[2]),
        .Q(addr_buf[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[30] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[30]),
        .Q(addr_buf[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[31] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[31]),
        .Q(addr_buf[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[3] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[3]),
        .Q(addr_buf[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[4] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[4]),
        .Q(addr_buf[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[5] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[5]),
        .Q(addr_buf[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[6] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[6]),
        .Q(addr_buf[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[7] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[7]),
        .Q(addr_buf[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[8] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[8]),
        .Q(addr_buf[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \addr_buf_reg[9] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(address[9]),
        .Q(addr_buf[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hE)) 
    busy_INST_0
       (.I0(Q),
        .I1(curr_st),
        .O(busy));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[0]_INST_0 
       (.I0(data_buf[0]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[0]),
        .O(cache_bus[0]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[10]_INST_0 
       (.I0(data_buf[10]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[10]),
        .O(cache_bus[10]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[11]_INST_0 
       (.I0(data_buf[11]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[11]),
        .O(cache_bus[11]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[12]_INST_0 
       (.I0(data_buf[12]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[12]),
        .O(cache_bus[12]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[13]_INST_0 
       (.I0(data_buf[13]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[13]),
        .O(cache_bus[13]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[14]_INST_0 
       (.I0(data_buf[14]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[14]),
        .O(cache_bus[14]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[15]_INST_0 
       (.I0(data_buf[15]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[15]),
        .O(cache_bus[15]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[16]_INST_0 
       (.I0(data_buf[16]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[16]),
        .O(cache_bus[16]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[17]_INST_0 
       (.I0(data_buf[17]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[17]),
        .O(cache_bus[17]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[18]_INST_0 
       (.I0(data_buf[18]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[18]),
        .O(cache_bus[18]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[19]_INST_0 
       (.I0(data_buf[19]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[19]),
        .O(cache_bus[19]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[1]_INST_0 
       (.I0(data_buf[1]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[1]),
        .O(cache_bus[1]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[20]_INST_0 
       (.I0(data_buf[20]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[20]),
        .O(cache_bus[20]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[21]_INST_0 
       (.I0(data_buf[21]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[21]),
        .O(cache_bus[21]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[22]_INST_0 
       (.I0(data_buf[22]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[22]),
        .O(cache_bus[22]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[23]_INST_0 
       (.I0(data_buf[23]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[23]),
        .O(cache_bus[23]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[24]_INST_0 
       (.I0(data_buf[24]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[24]),
        .O(cache_bus[24]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[25]_INST_0 
       (.I0(data_buf[25]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[25]),
        .O(cache_bus[25]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[26]_INST_0 
       (.I0(data_buf[26]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[26]),
        .O(cache_bus[26]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[27]_INST_0 
       (.I0(data_buf[27]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[27]),
        .O(cache_bus[27]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[28]_INST_0 
       (.I0(data_buf[28]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[28]),
        .O(cache_bus[28]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[29]_INST_0 
       (.I0(data_buf[29]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[29]),
        .O(cache_bus[29]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[2]_INST_0 
       (.I0(data_buf[2]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[2]),
        .O(cache_bus[2]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[30]_INST_0 
       (.I0(data_buf[30]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[30]),
        .O(cache_bus[30]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[31]_INST_0 
       (.I0(data_buf[31]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[31]),
        .O(cache_bus[31]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cache_bus[32]_INST_0 
       (.I0(Q),
        .I1(curr_st),
        .O(cache_bus[32]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[3]_INST_0 
       (.I0(data_buf[3]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[3]),
        .O(cache_bus[3]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[4]_INST_0 
       (.I0(data_buf[4]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[4]),
        .O(cache_bus[4]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[5]_INST_0 
       (.I0(data_buf[5]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[5]),
        .O(cache_bus[5]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[6]_INST_0 
       (.I0(data_buf[6]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[6]),
        .O(cache_bus[6]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[7]_INST_0 
       (.I0(data_buf[7]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[7]),
        .O(cache_bus[7]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[8]_INST_0 
       (.I0(data_buf[8]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[8]),
        .O(cache_bus[8]));
  LUT4 #(
    .INIT(16'hBC80)) 
    \cache_bus[9]_INST_0 
       (.I0(data_buf[9]),
        .I1(Q),
        .I2(curr_st),
        .I3(addr_buf[9]),
        .O(cache_bus[9]));
  LUT3 #(
    .INIT(8'h02)) 
    \data_buf[31]_i_1 
       (.I0(EN),
        .I1(curr_st),
        .I2(Q),
        .O(\data_buf[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[0] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[0]),
        .Q(data_buf[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[10] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[10]),
        .Q(data_buf[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[11] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[11]),
        .Q(data_buf[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[12] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[12]),
        .Q(data_buf[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[13] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[13]),
        .Q(data_buf[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[14] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[14]),
        .Q(data_buf[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[15] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[15]),
        .Q(data_buf[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[16] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[16]),
        .Q(data_buf[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[17] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[17]),
        .Q(data_buf[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[18] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[18]),
        .Q(data_buf[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[19] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[19]),
        .Q(data_buf[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[1] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[1]),
        .Q(data_buf[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[20] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[20]),
        .Q(data_buf[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[21] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[21]),
        .Q(data_buf[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[22] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[22]),
        .Q(data_buf[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[23] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[23]),
        .Q(data_buf[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[24] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[24]),
        .Q(data_buf[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[25] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[25]),
        .Q(data_buf[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[26] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[26]),
        .Q(data_buf[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[27] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[27]),
        .Q(data_buf[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[28] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[28]),
        .Q(data_buf[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[29] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[29]),
        .Q(data_buf[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[2] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[2]),
        .Q(data_buf[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[30] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[30]),
        .Q(data_buf[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[31] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[31]),
        .Q(data_buf[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[3] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[3]),
        .Q(data_buf[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[4] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[4]),
        .Q(data_buf[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[5] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[5]),
        .Q(data_buf[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[6] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[6]),
        .Q(data_buf[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[7] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[7]),
        .Q(data_buf[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[8] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[8]),
        .Q(data_buf[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \data_buf_reg[9] 
       (.C(CLK),
        .CE(\data_buf[31]_i_1_n_0 ),
        .D(data[9]),
        .Q(data_buf[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hFE)) 
    next_st
       (.I0(curr_st),
        .I1(Q),
        .I2(EN),
        .O(next_st_n_0));
endmodule

module Cache_bus_M_to_S_peer
   (new_data,
    address,
    data,
    W_R,
    discard_addr,
    discard_valid,
    cache_bus,
    RST,
    CLK,
    ack);
  output new_data;
  output [31:0]address;
  output [31:0]data;
  output W_R;
  output [31:0]discard_addr;
  output discard_valid;
  input [33:0]cache_bus;
  input RST;
  input CLK;
  input ack;

  wire CLK;
  wire RST;
  wire W_R;
  wire W_R_i_1_n_0;
  wire ack;
  wire \addr_buf[31]_i_1_n_0 ;
  wire [31:0]address;
  wire [33:0]cache_bus;
  wire curr_st;
  wire curr_st_i_1_n_0;
  wire curr_st_i_2_n_0;
  wire [31:0]data;
  wire [31:0]discard_addr;
  wire \discard_addr[31]_i_1_n_0 ;
  wire discard_valid;
  wire discard_valid_i_1_n_0;
  wire discard_valid_i_2_n_0;
  wire new_data;
  wire next_new_data_reg;

  LUT3 #(
    .INIT(8'h08)) 
    W_R_i_1
       (.I0(cache_bus[33]),
        .I1(cache_bus[32]),
        .I2(curr_st),
        .O(W_R_i_1_n_0));
  FDSE #(
    .INIT(1'b1)) 
    W_R_reg
       (.C(CLK),
        .CE(curr_st),
        .D(1'b0),
        .Q(W_R),
        .S(W_R_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \addr_buf[31]_i_1 
       (.I0(cache_bus[32]),
        .I1(curr_st),
        .O(\addr_buf[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[0] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[0]),
        .Q(address[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[10] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[10]),
        .Q(address[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[11] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[11]),
        .Q(address[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[12] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[12]),
        .Q(address[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[13] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[13]),
        .Q(address[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[14] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[14]),
        .Q(address[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[15] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[15]),
        .Q(address[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[16] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[16]),
        .Q(address[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[17] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[17]),
        .Q(address[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[18] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[18]),
        .Q(address[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[19] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[19]),
        .Q(address[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[1] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[1]),
        .Q(address[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[20] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[20]),
        .Q(address[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[21] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[21]),
        .Q(address[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[22] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[22]),
        .Q(address[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[23] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[23]),
        .Q(address[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[24] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[24]),
        .Q(address[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[25] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[25]),
        .Q(address[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[26] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[26]),
        .Q(address[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[27] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[27]),
        .Q(address[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[28] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[28]),
        .Q(address[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[29] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[29]),
        .Q(address[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[2] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[2]),
        .Q(address[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[30] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[30]),
        .Q(address[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[31] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[31]),
        .Q(address[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[3] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[3]),
        .Q(address[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[4] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[4]),
        .Q(address[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[5] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[5]),
        .Q(address[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[6] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[6]),
        .Q(address[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[7] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[7]),
        .Q(address[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[8] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[8]),
        .Q(address[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addr_buf_reg[9] 
       (.C(CLK),
        .CE(\addr_buf[31]_i_1_n_0 ),
        .D(cache_bus[9]),
        .Q(address[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h04)) 
    curr_st_i_1
       (.I0(cache_bus[33]),
        .I1(cache_bus[32]),
        .I2(curr_st),
        .O(curr_st_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    curr_st_i_2
       (.I0(RST),
        .O(curr_st_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    curr_st_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(curr_st_i_2_n_0),
        .D(curr_st_i_1_n_0),
        .Q(curr_st));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[0] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[0]),
        .Q(data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[10] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[10]),
        .Q(data[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[11] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[11]),
        .Q(data[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[12] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[12]),
        .Q(data[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[13] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[13]),
        .Q(data[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[14] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[14]),
        .Q(data[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[15] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[15]),
        .Q(data[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[16] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[16]),
        .Q(data[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[17] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[17]),
        .Q(data[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[18] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[18]),
        .Q(data[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[19] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[19]),
        .Q(data[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[1] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[1]),
        .Q(data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[20] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[20]),
        .Q(data[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[21] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[21]),
        .Q(data[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[22] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[22]),
        .Q(data[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[23] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[23]),
        .Q(data[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[24] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[24]),
        .Q(data[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[25] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[25]),
        .Q(data[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[26] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[26]),
        .Q(data[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[27] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[27]),
        .Q(data[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[28] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[28]),
        .Q(data[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[29] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[29]),
        .Q(data[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[2] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[2]),
        .Q(data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[30] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[30]),
        .Q(data[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[31] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[31]),
        .Q(data[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[3] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[3]),
        .Q(data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[4] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[4]),
        .Q(data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[5] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[5]),
        .Q(data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[6] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[6]),
        .Q(data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[7] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[7]),
        .Q(data[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[8] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[8]),
        .Q(data[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_buf_reg[9] 
       (.C(CLK),
        .CE(curr_st),
        .D(cache_bus[9]),
        .Q(data[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h08)) 
    \discard_addr[31]_i_1 
       (.I0(new_data),
        .I1(cache_bus[32]),
        .I2(curr_st),
        .O(\discard_addr[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[0] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[0]),
        .Q(discard_addr[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[10] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[10]),
        .Q(discard_addr[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[11] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[11]),
        .Q(discard_addr[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[12] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[12]),
        .Q(discard_addr[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[13] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[13]),
        .Q(discard_addr[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[14] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[14]),
        .Q(discard_addr[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[15] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[15]),
        .Q(discard_addr[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[16] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[16]),
        .Q(discard_addr[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[17] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[17]),
        .Q(discard_addr[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[18] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[18]),
        .Q(discard_addr[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[19] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[19]),
        .Q(discard_addr[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[1] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[1]),
        .Q(discard_addr[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[20] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[20]),
        .Q(discard_addr[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[21] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[21]),
        .Q(discard_addr[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[22] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[22]),
        .Q(discard_addr[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[23] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[23]),
        .Q(discard_addr[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[24] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[24]),
        .Q(discard_addr[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[25] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[25]),
        .Q(discard_addr[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[26] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[26]),
        .Q(discard_addr[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[27] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[27]),
        .Q(discard_addr[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[28] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[28]),
        .Q(discard_addr[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[29] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[29]),
        .Q(discard_addr[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[2] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[2]),
        .Q(discard_addr[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[30] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[30]),
        .Q(discard_addr[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[31] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[31]),
        .Q(discard_addr[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[3] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[3]),
        .Q(discard_addr[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[4] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[4]),
        .Q(discard_addr[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[5] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[5]),
        .Q(discard_addr[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[6] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[6]),
        .Q(discard_addr[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[7] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[7]),
        .Q(discard_addr[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[8] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[8]),
        .Q(discard_addr[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \discard_addr_reg[9] 
       (.C(CLK),
        .CE(\discard_addr[31]_i_1_n_0 ),
        .D(address[9]),
        .Q(discard_addr[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    discard_valid_i_1
       (.I0(curr_st),
        .I1(cache_bus[32]),
        .O(discard_valid_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    discard_valid_i_2
       (.I0(curr_st),
        .O(discard_valid_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    discard_valid_reg
       (.C(CLK),
        .CE(discard_valid_i_2_n_0),
        .D(new_data),
        .Q(discard_valid),
        .R(discard_valid_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFF8)) 
    new_data_reg_i_1
       (.I0(cache_bus[32]),
        .I1(cache_bus[33]),
        .I2(curr_st),
        .I3(new_data),
        .O(next_new_data_reg));
  FDCE #(
    .INIT(1'b0)) 
    new_data_reg_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(ack),
        .D(next_new_data_reg),
        .Q(new_data));
endmodule

(* HW_HANDOFF = "test_cache.hwdef" *) 
module test_cache
   (EN_0,
    W_R_0,
    W_R_1,
    ack_0,
    address_0,
    address_1,
    busy_0,
    data_0,
    data_1,
    discard_addr_0,
    discard_valid_0,
    new_data_0,
    reset,
    sys_clock);
  input EN_0;
  input W_R_0;
  output W_R_1;
  input ack_0;
  input [31:0]address_0;
  output [31:0]address_1;
  output busy_0;
  input [31:0]data_0;
  output [31:0]data_1;
  output [31:0]discard_addr_0;
  output discard_valid_0;
  output new_data_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, ASSOCIATED_RESET reset, CLK_DOMAIN test_cache_sys_clock, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input sys_clock;

  wire EN_0;
  wire W_R_0;
  wire W_R_1;
  wire ack_0;
  wire [31:0]address_0;
  wire [31:0]address_1;
  wire busy_0;
  wire [33:0]cache_bus;
  wire [31:0]data_0;
  wire [31:0]data_1;
  wire [31:0]discard_addr_0;
  wire discard_valid_0;
  wire new_data_0;
  wire reset;
  wire sys_clock;

  (* CHECK_LICENSE_TYPE = "test_cache_Cache_bus_M_to_S_0_0,Cache_bus_M_to_S,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* ip_definition_source = "module_ref" *) 
  (* x_core_info = "Cache_bus_M_to_S,Vivado 2019.1" *) 
  test_cache_Cache_bus_M_to_S_0_0 Cache_bus_M_to_S_0
       (.CLK(sys_clock),
        .EN(EN_0),
        .RST(reset),
        .W_R(W_R_0),
        .address(address_0),
        .busy(busy_0),
        .cache_bus(cache_bus),
        .data(data_0));
  (* CHECK_LICENSE_TYPE = "test_cache_Cache_bus_M_to_S_peer_0_1,Cache_bus_M_to_S_peer,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* ip_definition_source = "module_ref" *) 
  (* x_core_info = "Cache_bus_M_to_S_peer,Vivado 2019.1" *) 
  test_cache_Cache_bus_M_to_S_peer_0_1 Cache_bus_M_to_S_peer_0
       (.CLK(sys_clock),
        .RST(reset),
        .W_R(W_R_1),
        .ack(ack_0),
        .address(address_1),
        .cache_bus(cache_bus),
        .data(data_1),
        .discard_addr(discard_addr_0),
        .discard_valid(discard_valid_0),
        .new_data(new_data_0));
endmodule

(* CHECK_LICENSE_TYPE = "test_cache_Cache_bus_M_to_S_0_0,Cache_bus_M_to_S,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "Cache_bus_M_to_S,Vivado 2019.1" *) 
module test_cache_Cache_bus_M_to_S_0_0
   (cache_bus,
    address,
    data,
    W_R,
    EN,
    busy,
    CLK,
    RST);
  output [33:0]cache_bus;
  input [31:0]address;
  input [31:0]data;
  input W_R;
  input EN;
  output busy;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, ASSOCIATED_RESET RST, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN test_cache_sys_clock, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input RST;

  wire CLK;
  wire EN;
  wire RST;
  wire W_R;
  wire [31:0]address;
  wire busy;
  wire [33:0]cache_bus;
  wire [31:0]data;

  Cache_bus_M_to_S U0
       (.CLK(CLK),
        .EN(EN),
        .Q(cache_bus[33]),
        .RST(RST),
        .W_R(W_R),
        .address(address),
        .busy(busy),
        .cache_bus(cache_bus[32:0]),
        .data(data));
endmodule

(* CHECK_LICENSE_TYPE = "test_cache_Cache_bus_M_to_S_peer_0_1,Cache_bus_M_to_S_peer,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "Cache_bus_M_to_S_peer,Vivado 2019.1" *) 
module test_cache_Cache_bus_M_to_S_peer_0_1
   (cache_bus,
    address,
    data,
    W_R,
    new_data,
    ack,
    discard_addr,
    discard_valid,
    CLK,
    RST);
  input [33:0]cache_bus;
  output [31:0]address;
  output [31:0]data;
  output W_R;
  output new_data;
  input ack;
  output [31:0]discard_addr;
  output discard_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK, ASSOCIATED_RESET RST, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN test_cache_sys_clock, INSERT_VIP 0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input RST;

  wire CLK;
  wire RST;
  wire W_R;
  wire ack;
  wire [31:0]address;
  wire [33:0]cache_bus;
  wire [31:0]data;
  wire [31:0]discard_addr;
  wire discard_valid;
  wire new_data;

  Cache_bus_M_to_S_peer U0
       (.CLK(CLK),
        .RST(RST),
        .W_R(W_R),
        .ack(ack),
        .address(address),
        .cache_bus(cache_bus),
        .data(data),
        .discard_addr(discard_addr),
        .discard_valid(discard_valid),
        .new_data(new_data));
endmodule

(* NotValidForBitStream *)
module test_cache_wrapper
   (EN_0,
    W_R_0,
    W_R_1,
    ack_0,
    address_0,
    address_1,
    busy_0,
    data_0,
    data_1,
    discard_addr_0,
    discard_valid_0,
    new_data_0,
    reset,
    sys_clock);
  input EN_0;
  input W_R_0;
  output W_R_1;
  input ack_0;
  input [31:0]address_0;
  output [31:0]address_1;
  output busy_0;
  input [31:0]data_0;
  output [31:0]data_1;
  output [31:0]discard_addr_0;
  output discard_valid_0;
  output new_data_0;
  input reset;
  input sys_clock;

  wire EN_0;
  wire EN_0_IBUF;
  wire W_R_0;
  wire W_R_0_IBUF;
  wire W_R_1;
  wire W_R_1_OBUF;
  wire ack_0;
  wire ack_0_IBUF;
  wire [31:0]address_0;
  wire [31:0]address_0_IBUF;
  wire [31:0]address_1;
  wire [31:0]address_1_OBUF;
  wire busy_0;
  wire busy_0_OBUF;
  wire [31:0]data_0;
  wire [31:0]data_0_IBUF;
  wire [31:0]data_1;
  wire [31:0]data_1_OBUF;
  wire [31:0]discard_addr_0;
  wire [31:0]discard_addr_0_OBUF;
  wire discard_valid_0;
  wire discard_valid_0_OBUF;
  wire new_data_0;
  wire new_data_0_OBUF;
  wire reset;
  wire reset_IBUF;
  wire sys_clock;
  wire sys_clock_IBUF;
  wire sys_clock_IBUF_BUFG;

initial begin
 $sdf_annotate("test_cache_wrapper_time_synth.sdf",,,,"tool_control");
end
  IBUF EN_0_IBUF_inst
       (.I(EN_0),
        .O(EN_0_IBUF));
  IBUF W_R_0_IBUF_inst
       (.I(W_R_0),
        .O(W_R_0_IBUF));
  OBUF W_R_1_OBUF_inst
       (.I(W_R_1_OBUF),
        .O(W_R_1));
  IBUF ack_0_IBUF_inst
       (.I(ack_0),
        .O(ack_0_IBUF));
  IBUF \address_0_IBUF[0]_inst 
       (.I(address_0[0]),
        .O(address_0_IBUF[0]));
  IBUF \address_0_IBUF[10]_inst 
       (.I(address_0[10]),
        .O(address_0_IBUF[10]));
  IBUF \address_0_IBUF[11]_inst 
       (.I(address_0[11]),
        .O(address_0_IBUF[11]));
  IBUF \address_0_IBUF[12]_inst 
       (.I(address_0[12]),
        .O(address_0_IBUF[12]));
  IBUF \address_0_IBUF[13]_inst 
       (.I(address_0[13]),
        .O(address_0_IBUF[13]));
  IBUF \address_0_IBUF[14]_inst 
       (.I(address_0[14]),
        .O(address_0_IBUF[14]));
  IBUF \address_0_IBUF[15]_inst 
       (.I(address_0[15]),
        .O(address_0_IBUF[15]));
  IBUF \address_0_IBUF[16]_inst 
       (.I(address_0[16]),
        .O(address_0_IBUF[16]));
  IBUF \address_0_IBUF[17]_inst 
       (.I(address_0[17]),
        .O(address_0_IBUF[17]));
  IBUF \address_0_IBUF[18]_inst 
       (.I(address_0[18]),
        .O(address_0_IBUF[18]));
  IBUF \address_0_IBUF[19]_inst 
       (.I(address_0[19]),
        .O(address_0_IBUF[19]));
  IBUF \address_0_IBUF[1]_inst 
       (.I(address_0[1]),
        .O(address_0_IBUF[1]));
  IBUF \address_0_IBUF[20]_inst 
       (.I(address_0[20]),
        .O(address_0_IBUF[20]));
  IBUF \address_0_IBUF[21]_inst 
       (.I(address_0[21]),
        .O(address_0_IBUF[21]));
  IBUF \address_0_IBUF[22]_inst 
       (.I(address_0[22]),
        .O(address_0_IBUF[22]));
  IBUF \address_0_IBUF[23]_inst 
       (.I(address_0[23]),
        .O(address_0_IBUF[23]));
  IBUF \address_0_IBUF[24]_inst 
       (.I(address_0[24]),
        .O(address_0_IBUF[24]));
  IBUF \address_0_IBUF[25]_inst 
       (.I(address_0[25]),
        .O(address_0_IBUF[25]));
  IBUF \address_0_IBUF[26]_inst 
       (.I(address_0[26]),
        .O(address_0_IBUF[26]));
  IBUF \address_0_IBUF[27]_inst 
       (.I(address_0[27]),
        .O(address_0_IBUF[27]));
  IBUF \address_0_IBUF[28]_inst 
       (.I(address_0[28]),
        .O(address_0_IBUF[28]));
  IBUF \address_0_IBUF[29]_inst 
       (.I(address_0[29]),
        .O(address_0_IBUF[29]));
  IBUF \address_0_IBUF[2]_inst 
       (.I(address_0[2]),
        .O(address_0_IBUF[2]));
  IBUF \address_0_IBUF[30]_inst 
       (.I(address_0[30]),
        .O(address_0_IBUF[30]));
  IBUF \address_0_IBUF[31]_inst 
       (.I(address_0[31]),
        .O(address_0_IBUF[31]));
  IBUF \address_0_IBUF[3]_inst 
       (.I(address_0[3]),
        .O(address_0_IBUF[3]));
  IBUF \address_0_IBUF[4]_inst 
       (.I(address_0[4]),
        .O(address_0_IBUF[4]));
  IBUF \address_0_IBUF[5]_inst 
       (.I(address_0[5]),
        .O(address_0_IBUF[5]));
  IBUF \address_0_IBUF[6]_inst 
       (.I(address_0[6]),
        .O(address_0_IBUF[6]));
  IBUF \address_0_IBUF[7]_inst 
       (.I(address_0[7]),
        .O(address_0_IBUF[7]));
  IBUF \address_0_IBUF[8]_inst 
       (.I(address_0[8]),
        .O(address_0_IBUF[8]));
  IBUF \address_0_IBUF[9]_inst 
       (.I(address_0[9]),
        .O(address_0_IBUF[9]));
  OBUF \address_1_OBUF[0]_inst 
       (.I(address_1_OBUF[0]),
        .O(address_1[0]));
  OBUF \address_1_OBUF[10]_inst 
       (.I(address_1_OBUF[10]),
        .O(address_1[10]));
  OBUF \address_1_OBUF[11]_inst 
       (.I(address_1_OBUF[11]),
        .O(address_1[11]));
  OBUF \address_1_OBUF[12]_inst 
       (.I(address_1_OBUF[12]),
        .O(address_1[12]));
  OBUF \address_1_OBUF[13]_inst 
       (.I(address_1_OBUF[13]),
        .O(address_1[13]));
  OBUF \address_1_OBUF[14]_inst 
       (.I(address_1_OBUF[14]),
        .O(address_1[14]));
  OBUF \address_1_OBUF[15]_inst 
       (.I(address_1_OBUF[15]),
        .O(address_1[15]));
  OBUF \address_1_OBUF[16]_inst 
       (.I(address_1_OBUF[16]),
        .O(address_1[16]));
  OBUF \address_1_OBUF[17]_inst 
       (.I(address_1_OBUF[17]),
        .O(address_1[17]));
  OBUF \address_1_OBUF[18]_inst 
       (.I(address_1_OBUF[18]),
        .O(address_1[18]));
  OBUF \address_1_OBUF[19]_inst 
       (.I(address_1_OBUF[19]),
        .O(address_1[19]));
  OBUF \address_1_OBUF[1]_inst 
       (.I(address_1_OBUF[1]),
        .O(address_1[1]));
  OBUF \address_1_OBUF[20]_inst 
       (.I(address_1_OBUF[20]),
        .O(address_1[20]));
  OBUF \address_1_OBUF[21]_inst 
       (.I(address_1_OBUF[21]),
        .O(address_1[21]));
  OBUF \address_1_OBUF[22]_inst 
       (.I(address_1_OBUF[22]),
        .O(address_1[22]));
  OBUF \address_1_OBUF[23]_inst 
       (.I(address_1_OBUF[23]),
        .O(address_1[23]));
  OBUF \address_1_OBUF[24]_inst 
       (.I(address_1_OBUF[24]),
        .O(address_1[24]));
  OBUF \address_1_OBUF[25]_inst 
       (.I(address_1_OBUF[25]),
        .O(address_1[25]));
  OBUF \address_1_OBUF[26]_inst 
       (.I(address_1_OBUF[26]),
        .O(address_1[26]));
  OBUF \address_1_OBUF[27]_inst 
       (.I(address_1_OBUF[27]),
        .O(address_1[27]));
  OBUF \address_1_OBUF[28]_inst 
       (.I(address_1_OBUF[28]),
        .O(address_1[28]));
  OBUF \address_1_OBUF[29]_inst 
       (.I(address_1_OBUF[29]),
        .O(address_1[29]));
  OBUF \address_1_OBUF[2]_inst 
       (.I(address_1_OBUF[2]),
        .O(address_1[2]));
  OBUF \address_1_OBUF[30]_inst 
       (.I(address_1_OBUF[30]),
        .O(address_1[30]));
  OBUF \address_1_OBUF[31]_inst 
       (.I(address_1_OBUF[31]),
        .O(address_1[31]));
  OBUF \address_1_OBUF[3]_inst 
       (.I(address_1_OBUF[3]),
        .O(address_1[3]));
  OBUF \address_1_OBUF[4]_inst 
       (.I(address_1_OBUF[4]),
        .O(address_1[4]));
  OBUF \address_1_OBUF[5]_inst 
       (.I(address_1_OBUF[5]),
        .O(address_1[5]));
  OBUF \address_1_OBUF[6]_inst 
       (.I(address_1_OBUF[6]),
        .O(address_1[6]));
  OBUF \address_1_OBUF[7]_inst 
       (.I(address_1_OBUF[7]),
        .O(address_1[7]));
  OBUF \address_1_OBUF[8]_inst 
       (.I(address_1_OBUF[8]),
        .O(address_1[8]));
  OBUF \address_1_OBUF[9]_inst 
       (.I(address_1_OBUF[9]),
        .O(address_1[9]));
  OBUF busy_0_OBUF_inst
       (.I(busy_0_OBUF),
        .O(busy_0));
  IBUF \data_0_IBUF[0]_inst 
       (.I(data_0[0]),
        .O(data_0_IBUF[0]));
  IBUF \data_0_IBUF[10]_inst 
       (.I(data_0[10]),
        .O(data_0_IBUF[10]));
  IBUF \data_0_IBUF[11]_inst 
       (.I(data_0[11]),
        .O(data_0_IBUF[11]));
  IBUF \data_0_IBUF[12]_inst 
       (.I(data_0[12]),
        .O(data_0_IBUF[12]));
  IBUF \data_0_IBUF[13]_inst 
       (.I(data_0[13]),
        .O(data_0_IBUF[13]));
  IBUF \data_0_IBUF[14]_inst 
       (.I(data_0[14]),
        .O(data_0_IBUF[14]));
  IBUF \data_0_IBUF[15]_inst 
       (.I(data_0[15]),
        .O(data_0_IBUF[15]));
  IBUF \data_0_IBUF[16]_inst 
       (.I(data_0[16]),
        .O(data_0_IBUF[16]));
  IBUF \data_0_IBUF[17]_inst 
       (.I(data_0[17]),
        .O(data_0_IBUF[17]));
  IBUF \data_0_IBUF[18]_inst 
       (.I(data_0[18]),
        .O(data_0_IBUF[18]));
  IBUF \data_0_IBUF[19]_inst 
       (.I(data_0[19]),
        .O(data_0_IBUF[19]));
  IBUF \data_0_IBUF[1]_inst 
       (.I(data_0[1]),
        .O(data_0_IBUF[1]));
  IBUF \data_0_IBUF[20]_inst 
       (.I(data_0[20]),
        .O(data_0_IBUF[20]));
  IBUF \data_0_IBUF[21]_inst 
       (.I(data_0[21]),
        .O(data_0_IBUF[21]));
  IBUF \data_0_IBUF[22]_inst 
       (.I(data_0[22]),
        .O(data_0_IBUF[22]));
  IBUF \data_0_IBUF[23]_inst 
       (.I(data_0[23]),
        .O(data_0_IBUF[23]));
  IBUF \data_0_IBUF[24]_inst 
       (.I(data_0[24]),
        .O(data_0_IBUF[24]));
  IBUF \data_0_IBUF[25]_inst 
       (.I(data_0[25]),
        .O(data_0_IBUF[25]));
  IBUF \data_0_IBUF[26]_inst 
       (.I(data_0[26]),
        .O(data_0_IBUF[26]));
  IBUF \data_0_IBUF[27]_inst 
       (.I(data_0[27]),
        .O(data_0_IBUF[27]));
  IBUF \data_0_IBUF[28]_inst 
       (.I(data_0[28]),
        .O(data_0_IBUF[28]));
  IBUF \data_0_IBUF[29]_inst 
       (.I(data_0[29]),
        .O(data_0_IBUF[29]));
  IBUF \data_0_IBUF[2]_inst 
       (.I(data_0[2]),
        .O(data_0_IBUF[2]));
  IBUF \data_0_IBUF[30]_inst 
       (.I(data_0[30]),
        .O(data_0_IBUF[30]));
  IBUF \data_0_IBUF[31]_inst 
       (.I(data_0[31]),
        .O(data_0_IBUF[31]));
  IBUF \data_0_IBUF[3]_inst 
       (.I(data_0[3]),
        .O(data_0_IBUF[3]));
  IBUF \data_0_IBUF[4]_inst 
       (.I(data_0[4]),
        .O(data_0_IBUF[4]));
  IBUF \data_0_IBUF[5]_inst 
       (.I(data_0[5]),
        .O(data_0_IBUF[5]));
  IBUF \data_0_IBUF[6]_inst 
       (.I(data_0[6]),
        .O(data_0_IBUF[6]));
  IBUF \data_0_IBUF[7]_inst 
       (.I(data_0[7]),
        .O(data_0_IBUF[7]));
  IBUF \data_0_IBUF[8]_inst 
       (.I(data_0[8]),
        .O(data_0_IBUF[8]));
  IBUF \data_0_IBUF[9]_inst 
       (.I(data_0[9]),
        .O(data_0_IBUF[9]));
  OBUF \data_1_OBUF[0]_inst 
       (.I(data_1_OBUF[0]),
        .O(data_1[0]));
  OBUF \data_1_OBUF[10]_inst 
       (.I(data_1_OBUF[10]),
        .O(data_1[10]));
  OBUF \data_1_OBUF[11]_inst 
       (.I(data_1_OBUF[11]),
        .O(data_1[11]));
  OBUF \data_1_OBUF[12]_inst 
       (.I(data_1_OBUF[12]),
        .O(data_1[12]));
  OBUF \data_1_OBUF[13]_inst 
       (.I(data_1_OBUF[13]),
        .O(data_1[13]));
  OBUF \data_1_OBUF[14]_inst 
       (.I(data_1_OBUF[14]),
        .O(data_1[14]));
  OBUF \data_1_OBUF[15]_inst 
       (.I(data_1_OBUF[15]),
        .O(data_1[15]));
  OBUF \data_1_OBUF[16]_inst 
       (.I(data_1_OBUF[16]),
        .O(data_1[16]));
  OBUF \data_1_OBUF[17]_inst 
       (.I(data_1_OBUF[17]),
        .O(data_1[17]));
  OBUF \data_1_OBUF[18]_inst 
       (.I(data_1_OBUF[18]),
        .O(data_1[18]));
  OBUF \data_1_OBUF[19]_inst 
       (.I(data_1_OBUF[19]),
        .O(data_1[19]));
  OBUF \data_1_OBUF[1]_inst 
       (.I(data_1_OBUF[1]),
        .O(data_1[1]));
  OBUF \data_1_OBUF[20]_inst 
       (.I(data_1_OBUF[20]),
        .O(data_1[20]));
  OBUF \data_1_OBUF[21]_inst 
       (.I(data_1_OBUF[21]),
        .O(data_1[21]));
  OBUF \data_1_OBUF[22]_inst 
       (.I(data_1_OBUF[22]),
        .O(data_1[22]));
  OBUF \data_1_OBUF[23]_inst 
       (.I(data_1_OBUF[23]),
        .O(data_1[23]));
  OBUF \data_1_OBUF[24]_inst 
       (.I(data_1_OBUF[24]),
        .O(data_1[24]));
  OBUF \data_1_OBUF[25]_inst 
       (.I(data_1_OBUF[25]),
        .O(data_1[25]));
  OBUF \data_1_OBUF[26]_inst 
       (.I(data_1_OBUF[26]),
        .O(data_1[26]));
  OBUF \data_1_OBUF[27]_inst 
       (.I(data_1_OBUF[27]),
        .O(data_1[27]));
  OBUF \data_1_OBUF[28]_inst 
       (.I(data_1_OBUF[28]),
        .O(data_1[28]));
  OBUF \data_1_OBUF[29]_inst 
       (.I(data_1_OBUF[29]),
        .O(data_1[29]));
  OBUF \data_1_OBUF[2]_inst 
       (.I(data_1_OBUF[2]),
        .O(data_1[2]));
  OBUF \data_1_OBUF[30]_inst 
       (.I(data_1_OBUF[30]),
        .O(data_1[30]));
  OBUF \data_1_OBUF[31]_inst 
       (.I(data_1_OBUF[31]),
        .O(data_1[31]));
  OBUF \data_1_OBUF[3]_inst 
       (.I(data_1_OBUF[3]),
        .O(data_1[3]));
  OBUF \data_1_OBUF[4]_inst 
       (.I(data_1_OBUF[4]),
        .O(data_1[4]));
  OBUF \data_1_OBUF[5]_inst 
       (.I(data_1_OBUF[5]),
        .O(data_1[5]));
  OBUF \data_1_OBUF[6]_inst 
       (.I(data_1_OBUF[6]),
        .O(data_1[6]));
  OBUF \data_1_OBUF[7]_inst 
       (.I(data_1_OBUF[7]),
        .O(data_1[7]));
  OBUF \data_1_OBUF[8]_inst 
       (.I(data_1_OBUF[8]),
        .O(data_1[8]));
  OBUF \data_1_OBUF[9]_inst 
       (.I(data_1_OBUF[9]),
        .O(data_1[9]));
  OBUF \discard_addr_0_OBUF[0]_inst 
       (.I(discard_addr_0_OBUF[0]),
        .O(discard_addr_0[0]));
  OBUF \discard_addr_0_OBUF[10]_inst 
       (.I(discard_addr_0_OBUF[10]),
        .O(discard_addr_0[10]));
  OBUF \discard_addr_0_OBUF[11]_inst 
       (.I(discard_addr_0_OBUF[11]),
        .O(discard_addr_0[11]));
  OBUF \discard_addr_0_OBUF[12]_inst 
       (.I(discard_addr_0_OBUF[12]),
        .O(discard_addr_0[12]));
  OBUF \discard_addr_0_OBUF[13]_inst 
       (.I(discard_addr_0_OBUF[13]),
        .O(discard_addr_0[13]));
  OBUF \discard_addr_0_OBUF[14]_inst 
       (.I(discard_addr_0_OBUF[14]),
        .O(discard_addr_0[14]));
  OBUF \discard_addr_0_OBUF[15]_inst 
       (.I(discard_addr_0_OBUF[15]),
        .O(discard_addr_0[15]));
  OBUF \discard_addr_0_OBUF[16]_inst 
       (.I(discard_addr_0_OBUF[16]),
        .O(discard_addr_0[16]));
  OBUF \discard_addr_0_OBUF[17]_inst 
       (.I(discard_addr_0_OBUF[17]),
        .O(discard_addr_0[17]));
  OBUF \discard_addr_0_OBUF[18]_inst 
       (.I(discard_addr_0_OBUF[18]),
        .O(discard_addr_0[18]));
  OBUF \discard_addr_0_OBUF[19]_inst 
       (.I(discard_addr_0_OBUF[19]),
        .O(discard_addr_0[19]));
  OBUF \discard_addr_0_OBUF[1]_inst 
       (.I(discard_addr_0_OBUF[1]),
        .O(discard_addr_0[1]));
  OBUF \discard_addr_0_OBUF[20]_inst 
       (.I(discard_addr_0_OBUF[20]),
        .O(discard_addr_0[20]));
  OBUF \discard_addr_0_OBUF[21]_inst 
       (.I(discard_addr_0_OBUF[21]),
        .O(discard_addr_0[21]));
  OBUF \discard_addr_0_OBUF[22]_inst 
       (.I(discard_addr_0_OBUF[22]),
        .O(discard_addr_0[22]));
  OBUF \discard_addr_0_OBUF[23]_inst 
       (.I(discard_addr_0_OBUF[23]),
        .O(discard_addr_0[23]));
  OBUF \discard_addr_0_OBUF[24]_inst 
       (.I(discard_addr_0_OBUF[24]),
        .O(discard_addr_0[24]));
  OBUF \discard_addr_0_OBUF[25]_inst 
       (.I(discard_addr_0_OBUF[25]),
        .O(discard_addr_0[25]));
  OBUF \discard_addr_0_OBUF[26]_inst 
       (.I(discard_addr_0_OBUF[26]),
        .O(discard_addr_0[26]));
  OBUF \discard_addr_0_OBUF[27]_inst 
       (.I(discard_addr_0_OBUF[27]),
        .O(discard_addr_0[27]));
  OBUF \discard_addr_0_OBUF[28]_inst 
       (.I(discard_addr_0_OBUF[28]),
        .O(discard_addr_0[28]));
  OBUF \discard_addr_0_OBUF[29]_inst 
       (.I(discard_addr_0_OBUF[29]),
        .O(discard_addr_0[29]));
  OBUF \discard_addr_0_OBUF[2]_inst 
       (.I(discard_addr_0_OBUF[2]),
        .O(discard_addr_0[2]));
  OBUF \discard_addr_0_OBUF[30]_inst 
       (.I(discard_addr_0_OBUF[30]),
        .O(discard_addr_0[30]));
  OBUF \discard_addr_0_OBUF[31]_inst 
       (.I(discard_addr_0_OBUF[31]),
        .O(discard_addr_0[31]));
  OBUF \discard_addr_0_OBUF[3]_inst 
       (.I(discard_addr_0_OBUF[3]),
        .O(discard_addr_0[3]));
  OBUF \discard_addr_0_OBUF[4]_inst 
       (.I(discard_addr_0_OBUF[4]),
        .O(discard_addr_0[4]));
  OBUF \discard_addr_0_OBUF[5]_inst 
       (.I(discard_addr_0_OBUF[5]),
        .O(discard_addr_0[5]));
  OBUF \discard_addr_0_OBUF[6]_inst 
       (.I(discard_addr_0_OBUF[6]),
        .O(discard_addr_0[6]));
  OBUF \discard_addr_0_OBUF[7]_inst 
       (.I(discard_addr_0_OBUF[7]),
        .O(discard_addr_0[7]));
  OBUF \discard_addr_0_OBUF[8]_inst 
       (.I(discard_addr_0_OBUF[8]),
        .O(discard_addr_0[8]));
  OBUF \discard_addr_0_OBUF[9]_inst 
       (.I(discard_addr_0_OBUF[9]),
        .O(discard_addr_0[9]));
  OBUF discard_valid_0_OBUF_inst
       (.I(discard_valid_0_OBUF),
        .O(discard_valid_0));
  OBUF new_data_0_OBUF_inst
       (.I(new_data_0_OBUF),
        .O(new_data_0));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  BUFG sys_clock_IBUF_BUFG_inst
       (.I(sys_clock_IBUF),
        .O(sys_clock_IBUF_BUFG));
  IBUF sys_clock_IBUF_inst
       (.I(sys_clock),
        .O(sys_clock_IBUF));
  (* hw_handoff = "test_cache.hwdef" *) 
  test_cache test_cache_i
       (.EN_0(EN_0_IBUF),
        .W_R_0(W_R_0_IBUF),
        .W_R_1(W_R_1_OBUF),
        .ack_0(ack_0_IBUF),
        .address_0(address_0_IBUF),
        .address_1(address_1_OBUF),
        .busy_0(busy_0_OBUF),
        .data_0(data_0_IBUF),
        .data_1(data_1_OBUF),
        .discard_addr_0(discard_addr_0_OBUF),
        .discard_valid_0(discard_valid_0_OBUF),
        .new_data_0(new_data_0_OBUF),
        .reset(reset_IBUF),
        .sys_clock(sys_clock_IBUF_BUFG));
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

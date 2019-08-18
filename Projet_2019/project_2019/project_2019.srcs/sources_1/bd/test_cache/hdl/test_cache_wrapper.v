//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Tue Aug  6 10:05:59 2019
//Host        : Qlala running 64-bit major release  (build 9200)
//Command     : generate_target test_cache_wrapper.bd
//Design      : test_cache_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module test_cache_wrapper
   (EN_0,
    W_R_0,
    W_R_1,
    ack_0,
    address_0,
    address_1,
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
  input [31:0]data_0;
  output [31:0]data_1;
  output [31:0]discard_addr_0;
  output discard_valid_0;
  output new_data_0;
  input reset;
  input sys_clock;

  wire EN_0;
  wire W_R_0;
  wire W_R_1;
  wire ack_0;
  wire [31:0]address_0;
  wire [31:0]address_1;
  wire [31:0]data_0;
  wire [31:0]data_1;
  wire [31:0]discard_addr_0;
  wire discard_valid_0;
  wire new_data_0;
  wire reset;
  wire sys_clock;

  test_cache test_cache_i
       (.EN_0(EN_0),
        .W_R_0(W_R_0),
        .W_R_1(W_R_1),
        .ack_0(ack_0),
        .address_0(address_0),
        .address_1(address_1),
        .data_0(data_0),
        .data_1(data_1),
        .discard_addr_0(discard_addr_0),
        .discard_valid_0(discard_valid_0),
        .new_data_0(new_data_0),
        .reset(reset),
        .sys_clock(sys_clock));
endmodule

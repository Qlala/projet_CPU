--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Fri Aug  2 19:09:25 2019
--Host        : Qlala running 64-bit major release  (build 9200)
--Command     : generate_target test_cache_wrapper.bd
--Design      : test_cache_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity test_cache_wrapper is
  port (
    EN_0 : in STD_LOGIC;
    W_R_0 : in STD_LOGIC;
    W_R_1 : out STD_LOGIC;
    address_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    address_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    data_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_addr_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_valid_0 : out STD_LOGIC;
    input_0 : in STD_LOGIC;
    output_0 : out STD_LOGIC;
    reset : in STD_LOGIC;
    s_input_0 : in STD_LOGIC;
    s_output_0 : out STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
end test_cache_wrapper;

architecture STRUCTURE of test_cache_wrapper is
  component test_cache is
  port (
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    address_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    W_R_0 : in STD_LOGIC;
    EN_0 : in STD_LOGIC;
    address_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    data_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    W_R_1 : out STD_LOGIC;
    discard_addr_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_valid_0 : out STD_LOGIC;
    input_0 : in STD_LOGIC;
    output_0 : out STD_LOGIC;
    s_input_0 : in STD_LOGIC;
    s_output_0 : out STD_LOGIC
  );
  end component test_cache;
begin
test_cache_i: component test_cache
     port map (
      EN_0 => EN_0,
      W_R_0 => W_R_0,
      W_R_1 => W_R_1,
      address_0(31 downto 0) => address_0(31 downto 0),
      address_1(31 downto 0) => address_1(31 downto 0),
      data_0(31 downto 0) => data_0(31 downto 0),
      data_1(31 downto 0) => data_1(31 downto 0),
      discard_addr_0(31 downto 0) => discard_addr_0(31 downto 0),
      discard_valid_0 => discard_valid_0,
      input_0 => input_0,
      output_0 => output_0,
      reset => reset,
      s_input_0 => s_input_0,
      s_output_0 => s_output_0,
      sys_clock => sys_clock
    );
end STRUCTURE;

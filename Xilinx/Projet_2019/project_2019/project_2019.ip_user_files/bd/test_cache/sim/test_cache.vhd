--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
--Date        : Tue Aug  6 10:40:24 2019
--Host        : Qlala running 64-bit major release  (build 9200)
--Command     : generate_target test_cache.bd
--Design      : test_cache
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity test_cache is
  port (
    EN_0 : in STD_LOGIC;
    W_R_0 : in STD_LOGIC;
    W_R_1 : out STD_LOGIC;
    ack_0 : in STD_LOGIC;
    address_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    address_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    busy_0 : out STD_LOGIC;
    data_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_addr_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_valid_0 : out STD_LOGIC;
    new_data_0 : out STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of test_cache : entity is "test_cache,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=test_cache,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_clkrst_cnt=3,synth_mode=Global}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of test_cache : entity is "test_cache.hwdef";
end test_cache;

architecture STRUCTURE of test_cache is
  component test_cache_clk_wiz_2 is
  port (
    resetn : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component test_cache_clk_wiz_2;
  component test_cache_Cache_bus_M_to_S_peer_0_1 is
  port (
    cache_bus : in STD_LOGIC_VECTOR ( 33 downto 0 );
    address : out STD_LOGIC_VECTOR ( 31 downto 0 );
    data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    W_R : out STD_LOGIC;
    new_data : out STD_LOGIC;
    ack : in STD_LOGIC;
    discard_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_valid : out STD_LOGIC;
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC
  );
  end component test_cache_Cache_bus_M_to_S_peer_0_1;
  component test_cache_Cache_bus_M_to_S_0_0 is
  port (
    cache_bus : out STD_LOGIC_VECTOR ( 33 downto 0 );
    address : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    W_R : in STD_LOGIC;
    EN : in STD_LOGIC;
    busy : out STD_LOGIC;
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC
  );
  end component test_cache_Cache_bus_M_to_S_0_0;
  signal Cache_bus_M_to_S_0_busy : STD_LOGIC;
  signal Cache_bus_M_to_S_0_cache_bus : STD_LOGIC_VECTOR ( 33 downto 0 );
  signal Cache_bus_M_to_S_peer_0_W_R : STD_LOGIC;
  signal Cache_bus_M_to_S_peer_0_address : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Cache_bus_M_to_S_peer_0_data : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Cache_bus_M_to_S_peer_0_discard_addr : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Cache_bus_M_to_S_peer_0_discard_valid : STD_LOGIC;
  signal Cache_bus_M_to_S_peer_0_new_data : STD_LOGIC;
  signal EN_0_1 : STD_LOGIC;
  signal W_R_0_1 : STD_LOGIC;
  signal ack_0_1 : STD_LOGIC;
  signal address_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal clk_wiz_clk_out1 : STD_LOGIC;
  signal data_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rst_clk_wiz_100M_peripheral_aresetn : STD_LOGIC;
  signal sys_clock_1 : STD_LOGIC;
  signal NLW_clk_wiz_locked_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of sys_clock : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK";
  attribute X_INTERFACE_PARAMETER of sys_clock : signal is "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN test_cache_sys_clock, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
begin
  EN_0_1 <= EN_0;
  W_R_0_1 <= W_R_0;
  W_R_1 <= Cache_bus_M_to_S_peer_0_W_R;
  ack_0_1 <= ack_0;
  address_0_1(31 downto 0) <= address_0(31 downto 0);
  address_1(31 downto 0) <= Cache_bus_M_to_S_peer_0_address(31 downto 0);
  busy_0 <= Cache_bus_M_to_S_0_busy;
  data_0_1(31 downto 0) <= data_0(31 downto 0);
  data_1(31 downto 0) <= Cache_bus_M_to_S_peer_0_data(31 downto 0);
  discard_addr_0(31 downto 0) <= Cache_bus_M_to_S_peer_0_discard_addr(31 downto 0);
  discard_valid_0 <= Cache_bus_M_to_S_peer_0_discard_valid;
  new_data_0 <= Cache_bus_M_to_S_peer_0_new_data;
  rst_clk_wiz_100M_peripheral_aresetn <= reset;
  sys_clock_1 <= sys_clock;
Cache_bus_M_to_S_0: component test_cache_Cache_bus_M_to_S_0_0
     port map (
      CLK => clk_wiz_clk_out1,
      EN => EN_0_1,
      RST => rst_clk_wiz_100M_peripheral_aresetn,
      W_R => W_R_0_1,
      address(31 downto 0) => address_0_1(31 downto 0),
      busy => Cache_bus_M_to_S_0_busy,
      cache_bus(33 downto 0) => Cache_bus_M_to_S_0_cache_bus(33 downto 0),
      data(31 downto 0) => data_0_1(31 downto 0)
    );
Cache_bus_M_to_S_peer_0: component test_cache_Cache_bus_M_to_S_peer_0_1
     port map (
      CLK => clk_wiz_clk_out1,
      RST => rst_clk_wiz_100M_peripheral_aresetn,
      W_R => Cache_bus_M_to_S_peer_0_W_R,
      ack => ack_0_1,
      address(31 downto 0) => Cache_bus_M_to_S_peer_0_address(31 downto 0),
      cache_bus(33 downto 0) => Cache_bus_M_to_S_0_cache_bus(33 downto 0),
      data(31 downto 0) => Cache_bus_M_to_S_peer_0_data(31 downto 0),
      discard_addr(31 downto 0) => Cache_bus_M_to_S_peer_0_discard_addr(31 downto 0),
      discard_valid => Cache_bus_M_to_S_peer_0_discard_valid,
      new_data => Cache_bus_M_to_S_peer_0_new_data
    );
clk_wiz: component test_cache_clk_wiz_2
     port map (
      clk_in1 => sys_clock_1,
      clk_out1 => clk_wiz_clk_out1,
      locked => NLW_clk_wiz_locked_UNCONNECTED,
      resetn => rst_clk_wiz_100M_peripheral_aresetn
    );
end STRUCTURE;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.11.2018 16:08:04
-- Design Name: 
-- Module Name: ext_PLL - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ext_PLL is
    generic(
    Multiplier : natural  :=1;
    intern_mult : natural:=1;
    pre_divider : natural :=1;
    pre_intern_divider : natural :=1;
    post_divider : natural :=1;
    intern_post_divider : natural :=1;
    CLK_in_period : real :=3.333
    );
    Port ( 
    CLK_in : in STD_LOGIC;
    CLK_out : out STD_LOGIC;
    RST : in std_logic --reset on low
    );
end ext_PLL;

architecture Behavioral of ext_PLL is

component symetric_freq_Divider is
    generic ( divide_by: Natural :=100 );
    Port ( CLK : in STD_LOGIC;
           CLK_out : out STD_LOGIC);
        
end component;

signal CLK_intern: std_logic;
signal CLK_in_intern : std_logic;
signal CLK_feedback_loop : std_logic;
signal CLK_feed_intern : std_logic;
signal reset : std_logic;
begin
reset <= not RST;
 PLLE2_BASE_inst : PLLE2_BASE
generic map (
  BANDWIDTH => "OPTIMIZED",  -- OPTIMIZED, HIGH, LOW
  CLKFBOUT_MULT => intern_mult,     -- Multiply value for all CLKOUT, (2-64)
  CLKFBOUT_PHASE => 0.0,     -- Phase offset in degrees of CLKFB, (-360.000-360.000).
  CLKIN1_PERIOD => 3.333,      -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
  -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
  CLKOUT0_DIVIDE => intern_post_divider ,
  CLKOUT1_DIVIDE => 1,
  CLKOUT2_DIVIDE => 1,
  CLKOUT3_DIVIDE =>1,
  CLKOUT4_DIVIDE => 1,
  CLKOUT5_DIVIDE => 1,
  -- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
  CLKOUT0_DUTY_CYCLE => 0.5,
  CLKOUT1_DUTY_CYCLE => 0.5,
  CLKOUT2_DUTY_CYCLE => 0.5,
  CLKOUT3_DUTY_CYCLE => 0.5,
  CLKOUT4_DUTY_CYCLE => 0.5,
  CLKOUT5_DUTY_CYCLE => 0.5,
  -- CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
  CLKOUT0_PHASE => 0.0,
  CLKOUT1_PHASE => 0.0,
  CLKOUT2_PHASE => 0.0,
  CLKOUT3_PHASE => 0.0,
  CLKOUT4_PHASE => 0.0,
  CLKOUT5_PHASE => 0.0,
  DIVCLK_DIVIDE => pre_intern_divider,        -- Master division value, (1-56)
  REF_JITTER1 => 0.0,        -- Reference input jitter in UI, (0.000-0.999).
  STARTUP_WAIT => "FALSE"    -- Delay DONE until PLL Locks, ("TRUE"/"FALSE")
)
port map (
  -- Clock Outputs: 1-bit (each) output: User configurable clock outputs
  CLKOUT0 => CLK_intern,   -- 1-bit output: CLKOUT0
  CLKOUT1 => open,   -- 1-bit output: CLKOUT1
  CLKOUT2 => open,   -- 1-bit output: CLKOUT2
  CLKOUT3 => open,   -- 1-bit output: CLKOUT3
  CLKOUT4 => open,   -- 1-bit output: CLKOUT4
  CLKOUT5 => open,   -- 1-bit output: CLKOUT5
  -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
  CLKFBOUT => CLK_feed_intern, -- 1-bit output: Feedback clock
  LOCKED => open,     -- 1-bit output: LOCK
  CLKIN1 => CLK_in_intern,     -- 1-bit input: Input clock
  -- Control Ports: 1-bit (each) input: PLL control ports
  PWRDWN => '0',     -- 1-bit input: Power-down
  RST => reset,           -- 1-bit input: Reset on high
  -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
  CLKFBIN => CLK_feedback_loop    -- 1-bit input: Feedback clock
);
test_mult: if multiplier > 1 generate 
    symetric_freq_Divider_inst_feed: symetric_freq_Divider generic map(divide_by=>Multiplier) port map( CLK=>CLK_feed_intern, CLK_out=>CLK_feedback_loop);
else generate
   CLK_feedback_loop<= CLK_feed_intern;
end generate;

test_pre_div : if pre_divider>1 generate 
    symetric_freq_Divider_inst_out: symetric_freq_Divider generic map(divide_by=>pre_divider) port map( CLK=>CLK_in, CLK_out=>CLK_in_intern);
else generate
    CLK_in_intern<=CLK_in;
end generate;
test_divide: if post_divider >1 generate 
    symetric_freq_Divider_inst_out: symetric_freq_Divider generic map(divide_by=>post_divider) port map( CLK=>CLK_intern, CLK_out=>CLK_out);
else generate
    CLK_out<=CLK_intern;
end generate;
end Behavioral;

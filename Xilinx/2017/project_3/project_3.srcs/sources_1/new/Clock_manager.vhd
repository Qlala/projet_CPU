----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2018 20:25:54
-- Design Name: 
-- Module Name: Freq_Divider - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity CLOCK_manager is
    generic ( 
    multiplier : natural := 64;
    Divide_0 : natural := 64;
    Divide_1 : natural := 64;
    Divide_2 : natural := 64;
    Divide_3 : natural := 64;
    Divide_4 : natural := 64;
    Divide_5 : natural := 64
    );
    Port ( master_CLK : in STD_LOGIC;
           reset : in STD_LOGIC;
           CLK_out0 : out STD_LOGIC;
           CLK_out1 : out STD_LOGIC;
           CLK_out2 : out STD_LOGIC;
           CLK_out3 : out STD_LOGIC;
           CLK_out4 : out STD_LOGIC;
           CLK_out5 : out STD_LOGIC;
           locked : out STD_LOGIC
           );
        
end CLOCK_manager;

architecture Behavioral of CLOCK_manager is
signal CLK_feedback_loop: std_logic;
signal intern_CLK_out0 : STD_LOGIC;
signal intern_CLK_out1 : STD_LOGIC;
signal intern_CLK_out2 : STD_LOGIC;
signal intern_CLK_out3 : STD_LOGIC;
signal intern_CLK_out4 : STD_LOGIC;
signal intern_CLK_out5 : STD_LOGIC;
begin
   PLLE2_BASE_inst : PLLE2_BASE
generic map (
   BANDWIDTH => "HIGH",  -- OPTIMIZED, HIGH, LOW
   CLKFBOUT_MULT => multiplier,        -- Multiply value for all CLKOUT, (2-64)
   CLKFBOUT_PHASE => 0.0,     -- Phase offset in degrees of CLKFB, (-360.000-360.000).
   CLKIN1_PERIOD => 10.0,      -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
   -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
   CLKOUT0_DIVIDE => Divide_0,
   CLKOUT1_DIVIDE => Divide_1,
   CLKOUT2_DIVIDE => Divide_2,
   CLKOUT3_DIVIDE => Divide_3,
   CLKOUT4_DIVIDE => Divide_4,
   CLKOUT5_DIVIDE => Divide_5,
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
   DIVCLK_DIVIDE => 1,        -- Master division value, (1-56)
   REF_JITTER1 => 0.0,        -- Reference input jitter in UI, (0.000-0.999).
   STARTUP_WAIT => "FALSE"    -- Delay DONE until PLL Locks, ("TRUE"/"FALSE")
)
port map (
   -- Clock Outputs: 1-bit (each) output: User configurable clock outputs
   CLKOUT0 => intern_CLK_out0,   -- 1-bit output: CLKOUT0
   CLKOUT1 => CLK_out1,   -- 1-bit output: CLKOUT1
   CLKOUT2 => CLK_out2,   -- 1-bit output: CLKOUT2
   CLKOUT3 => CLK_out3,   -- 1-bit output: CLKOUT3
   CLKOUT4 => CLK_out4,   -- 1-bit output: CLKOUT4
   CLKOUT5 => CLK_out5,   -- 1-bit output: CLKOUT5
   -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
   CLKFBOUT => CLK_feedback_loop, -- 1-bit output: Feedback clock
   LOCKED => locked,     -- 1-bit output: LOCK
   CLKIN1 => master_CLK,     -- 1-bit input: Input clock
   -- Control Ports: 1-bit (each) input: PLL control ports
   PWRDWN => '0',     -- 1-bit input: Power-down
   RST => reset,           -- 1-bit input: Reset
   -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
   CLKFBIN => CLK_feedback_loop    -- 1-bit input: Feedback clock
);
   BUFG_inst0 : BUFG
port map (
   O => CLK_out0, -- 1-bit output: Clock output
   I => intern_CLK_out0  -- 1-bit input: Clock input
);

--   BUFG_inst1 : BUFG
--   port map (
--      O => CLK_out1, -- 1-bit output: Clock output
--      I => intern_CLK_out1  -- 1-bit input: Clock input
--   );
--      BUFG_inst2 : BUFG
--   port map (
--      O => CLK_out2, -- 1-bit output: Clock output
--      I => intern_CLK_out2  -- 1-bit input: Clock input
--   );
--      BUFG_inst3 : BUFG
--   port map (
--      O => CLK_out3, -- 1-bit output: Clock output
--      I => intern_CLK_out3  -- 1-bit input: Clock input
--   );
--      BUFG_inst4: BUFG
--   port map (
--      O => CLK_out4, -- 1-bit output: Clock output
--      I => intern_CLK_out4 -- 1-bit input: Clock input
--   );
--      BUFG_inst5 : BUFG
--   port map (
--      O => CLK_out5, -- 1-bit output: Clock output
--      I => intern_CLK_out5  -- 1-bit input: Clock input
--   );
end Behavioral;
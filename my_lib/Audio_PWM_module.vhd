----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2018 19:33:24
-- Design Name: 
-- Module Name: Audio_PWM_module - Behavioral
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
use IEEE.MATH_REAL.ALL;
library my_lib;
use my_lib.my_lib.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity Audio_PWM_module is
generic(
    audio_N:natural:=16;
    base_freq:natural:=100e6;--in Hz
    sample_freq:natural:=48e3
);
Port ( 
           data : in STD_LOGIC_VECTOR (audio_N-1 downto 0);
           new_data : in STD_LOGIC;
           PWM_audio_out: out std_logic;
           sample_clk : out STD_LOGIC;
           base_clk : in STD_LOGIC;
           RST: in std_logic--RST on low
           );
end Audio_PWM_module;

architecture Behavioral of Audio_PWM_module is

component PWM is
      generic(N : natural);
      Port ( 
             PWM_out : out STD_LOGIC;
             data : in STD_LOGIC_VECTOR (N-1 downto 0);
             new_data : in STD_LOGIC;--authorise data change
             PWM_clk : out STD_LOGIC;
             clk : in STD_LOGIC);
  end component ;
constant PREC_FACTOR :natural := 2**(audio_N);
constant GCD_k : natural :=1;--GCD(sample_freq*PREC_FACTOR,base_freq);
constant ratio : real := real(sample_freq*PREC_FACTOR)/real(base_freq);
constant ideal_N : natural := natural(FLOOR(real(800e6)/(ratio*real(base_freq))));
constant corr_ratio : real := real(ideal_N)*ratio;
constant multiplier:natural :=sample_freq*PREC_FACTOR/GCD_K;
constant divider : natural :=base_freq/GCD_K;
signal intern_RST:std_logic;
signal intern_sample_clk:std_logic;
signal intern_pwm_clk :std_logic;
signal intern_PWM_audio_out:std_logic;
signal MMCM_feedback : std_logic;
begin
intern_RST<=not RST;
sample_clk<=intern_sample_clk;
--PWM_audio_out<= '0' when intern_PWM_audio_out='0' else 'Z';--adaptation du module PWM pour le filtre.
PWM_audio_out<=intern_PWM_audio_out;
--MMCME2_ADV:AdvancedMixedModeClockManager

-- MMCME2_ADV  : In order to incorporate this function into the design,
--    VHDL     : the following instance declaration needs to be placed
--  instance   : in the body of the design code.  The instance name
-- declaration : (MMCME2_ADV_inst) and/or the port declarations after the
--    code     : "=>" declaration maybe changed to properly reference and
--             : connect this function to the design.  All inputs and outputs
--             : must be connected.

--   Library   : In addition to adding the instance declaration, a use
-- declaration : statement for the UNISIM.vcomponents library needs to be
--     for     : added before the entity declaration.  This library
--   Xilinx    : contains the component declarations for all Xilinx
-- primitives  : primitives and points to the models that will be used
--             : for simulation.

--  Copy the following two statements and paste them before the
--  Entity declaration, unless they already exist.


   MMCME2_ADV_inst : MMCME2_ADV
   generic map (
      BANDWIDTH => "OPTIMIZED",      -- Jitter programming (OPTIMIZED, HIGH, LOW)
      CLKFBOUT_MULT_F => 7.86432,        -- Multiply value for all CLKOUT (2.000-64.000).
      CLKFBOUT_PHASE => 0.0,         -- Phase offset in degrees of CLKFB (-360.000-360.000).
      -- CLKIN_PERIOD: Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      CLKIN1_PERIOD => 10.0,
      CLKIN2_PERIOD => 10.0,
      -- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for CLKOUT (1-128)
      CLKOUT1_DIVIDE => 4,
      CLKOUT2_DIVIDE => 1,
      CLKOUT3_DIVIDE => 1,
      CLKOUT4_DIVIDE => 1,
      CLKOUT5_DIVIDE => 1,
      CLKOUT6_DIVIDE => 1,
      CLKOUT0_DIVIDE_F => real(4),       -- Divide amount for CLKOUT0 (1.000-128.000).
      -- CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for CLKOUT outputs (0.01-0.99).
      CLKOUT0_DUTY_CYCLE => 0.5,
      CLKOUT1_DUTY_CYCLE => 0.5,
      CLKOUT2_DUTY_CYCLE => 0.5,
      CLKOUT3_DUTY_CYCLE => 0.5,
      CLKOUT4_DUTY_CYCLE => 0.5,
      CLKOUT5_DUTY_CYCLE => 0.5,
      CLKOUT6_DUTY_CYCLE => 0.5,
      -- CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for CLKOUT outputs (-360.000-360.000).
      CLKOUT0_PHASE => 0.0,
      CLKOUT1_PHASE => 0.0,
      CLKOUT2_PHASE => 0.0,
      CLKOUT3_PHASE => 0.0,
      CLKOUT4_PHASE => 0.0,
      CLKOUT5_PHASE => 0.0,
      CLKOUT6_PHASE => 0.0,
      CLKOUT4_CASCADE => FALSE,      -- Cascade CLKOUT4 counter with CLKOUT6 (FALSE, TRUE)
      COMPENSATION => "INTERNAL",       -- ZHOLD, BUF_IN, EXTERNAL, INTERNAL
      DIVCLK_DIVIDE => 1,            -- Master division value (1-106)
      -- REF_JITTER: Reference input jitter in UI (0.000-0.999).
      REF_JITTER1 => 0.0,
      REF_JITTER2 => 0.0,
      STARTUP_WAIT => FALSE,         -- Delays DONE until MMCM is locked (FALSE, TRUE)
      -- Spread Spectrum: Spread Spectrum Attributes
      SS_EN => "FALSE",              -- Enables spread spectrum (FALSE, TRUE)
      SS_MODE => "CENTER_HIGH",      -- CENTER_HIGH, CENTER_LOW, DOWN_HIGH, DOWN_LOW
      SS_MOD_PERIOD => 10000,        -- Spread spectrum modulation period (ns) (VALUES)
      -- USE_FINE_PS: Fine phase shift enable (TRUE/FALSE)
      CLKFBOUT_USE_FINE_PS => FALSE,
      CLKOUT0_USE_FINE_PS => FALSE,
      CLKOUT1_USE_FINE_PS => FALSE,
      CLKOUT2_USE_FINE_PS => FALSE,
      CLKOUT3_USE_FINE_PS => FALSE,
      CLKOUT4_USE_FINE_PS => FALSE,
      CLKOUT5_USE_FINE_PS => FALSE,
      CLKOUT6_USE_FINE_PS => FALSE
   )
   port map (
      -- Clock Outputs: 1-bit (each) output: User configurable clock outputs
      CLKOUT0 => intern_pwm_clk,           -- 1-bit output: CLKOUT0
      --CLKOUT0B => CLKOUT0B,         -- 1-bit output: Inverted CLKOUT0
      --CLKOUT1 => CLKOUT1,           -- 1-bit output: CLKOUT1
      --CLKOUT1B => CLKOUT1B,         -- 1-bit output: Inverted CLKOUT1
      --CLKOUT2 => CLKOUT2,           -- 1-bit output: CLKOUT2
      --CLKOUT2B => CLKOUT2B,         -- 1-bit output: Inverted CLKOUT2
      --CLKOUT3 => CLKOUT3,           -- 1-bit output: CLKOUT3
      --CLKOUT3B => CLKOUT3B,         -- 1-bit output: Inverted CLKOUT3
      --CLKOUT4 => CLKOUT4,           -- 1-bit output: CLKOUT4
      --CLKOUT5 => CLKOUT5,           -- 1-bit output: CLKOUT5
      --CLKOUT6 => CLKOUT6,           -- 1-bit output: CLKOUT6
      -- DRP Ports: 16-bit (each) output: Dynamic reconfiguration ports
     -- DO => DO,                     -- 16-bit output: DRP data
     -- DRDY => DRDY,                 -- 1-bit output: DRP ready
      -- Dynamic Phase Shift Ports: 1-bit (each) output: Ports used for dynamic phase shifting of the outputs
      --PSDONE => PSDONE,             -- 1-bit output: Phase shift done
      -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
      CLKFBOUT => MMCM_feedback,         -- 1-bit output: Feedback clock
      --CLKFBOUTB => CLKFBOUTB,       -- 1-bit output: Inverted CLKFBOUT
      -- Status Ports: 1-bit (each) output: MMCM status ports
      --CLKFBSTOPPED => CLKFBSTOPPED, -- 1-bit output: Feedback clock stopped
      --CLKINSTOPPED => CLKINSTOPPED, -- 1-bit output: Input clock stopped
      --LOCKED => LOCKED,             -- 1-bit output: LOCK
      -- Clock Inputs: 1-bit (each) input: Clock inputs
      CLKIN1 => base_CLK,             -- 1-bit input: Primary clock
      CLKIN2 => '0',             -- 1-bit input: Secondary clock
      -- Control Ports: 1-bit (each) input: MMCM control ports
      CLKINSEL => '1',         -- 1-bit input: Clock select, High=CLKIN1 Low=CLKIN2
      PWRDWN => '0',             -- 1-bit input: Power-down
      RST => '0',                   -- 1-bit input: Reset
      -- DRP Ports: 7-bit (each) input: Dynamic reconfiguration ports
     DADDR => (others =>'0'),               -- 7-bit input: DRP address
      DCLK => base_CLK,                 -- 1-bit input: DRP clock
      DEN => '0',                   -- 1-bit input: DRP enable
      DI => (others=>'0'),                     -- 16-bit input: DRP data
      DWE => '0',                   -- 1-bit input: DRP write enable
      -- Dynamic Phase Shift Ports: 1-bit (each) input: Ports used for dynamic phase shifting of the outputs
      PSCLK => '0',               -- 1-bit input: Phase shift clock
      PSEN => '0',                 -- 1-bit input: Phase shift enable
      PSINCDEC => '0',         -- 1-bit input: Phase shift increment/decrement
      -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
      CLKFBIN => MMCM_feedback           -- 1-bit input: Feedback clock
   );

   -- End of MMCME2_ADV_inst instantiation
PWM_0:PWM
    generic map(
        N=>audio_N
    )
    port map(
        new_data=>new_data,
        data=>data,
        PWM_out=>intern_PWM_audio_out,
        pwm_clk=>intern_sample_clk,
        clk=>intern_pwm_clk
    );
end Behavioral;

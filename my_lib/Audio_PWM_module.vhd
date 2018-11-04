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
library my_lib;
use my_lib.my_lib.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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

 component CLOCK_manager is
      generic ( 
            multiplier : natural := 64;
            Divide_0 : natural := 64;
            Divide_1 : natural := 64;
            Divide_2 : natural := 64;
            Divide_3 : natural := 64;
            Divide_4 : natural := 64;
            Divide_5 : natural := 64
  );
  port (
    master_CLK : in STD_LOGIC;
    reset : in STD_LOGIC;
    CLK_out0 : out STD_LOGIC;
    CLK_out1 : out STD_LOGIC;
    CLK_out2 : out STD_LOGIC;
    CLK_out3 : out STD_LOGIC;
    CLK_out4 : out STD_LOGIC;
    CLK_out5 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component CLOCK_manager;
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
constant multiplier:natural :=sample_freq*PREC_FACTOR/GCD_K;
constant divider : natural :=base_freq/GCD_K;
signal intern_RST:std_logic;
signal intern_sample_clk:std_logic;
signal intern_pwm_clk :std_logic;
signal intern_PWM_audio_out:std_logic;
begin
intern_RST<=not RST;
sample_clk<=intern_sample_clk;
PWM_audio_out<= '0' when intern_PWM_audio_out='0' else 'Z';--adaptation du module PWM pour le filtre.
CLOCK_manager_0: CLOCK_manager
      generic map( 
            multiplier => multiplier,
            Divide_0  =>divider,
            Divide_1  => 1,
            Divide_2  => 3,
            Divide_3  =>16,
            Divide_4  => 16,
            Divide_5  =>16
  )
  port map(
    master_CLK => base_clk,
    reset => intern_RST,
    CLK_out0 => intern_pwm_clk
  );
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

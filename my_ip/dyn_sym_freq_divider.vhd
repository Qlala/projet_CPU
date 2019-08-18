----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2018 09:38:58
-- Design Name: 
-- Module Name: dyn_sym_freq_divider - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity dyn_sym_freq_divider is
   generic(N_bit : natural);
   Port ( 
           CLK : in STD_LOGIC;
        CLK_out : out STD_LOGIC);


end dyn_sym_freq_divider;

architecture Behavioral of dyn_sym_freq_divider is
signal divide_by : natural 
signal count : integer range 0 to divide_by/2;
signal next_count : integer range 0 to divide_by/2;
signal clk_intern : std_logic;
signal clk_sym :std_logic;

begin
count<=next_count when rising_edge(CLK)else count;
next_count<= 0 when count=divide_by/2-1 else count+1;
clk_intern<='1' when count=divide_by/2-1 else '0';
clk_sym<=not clk_sym when rising_edge(CLK_intern);
BUFG_inst : BUFG
port map (
O => CLK_out, -- 1-bit output: Clock output
I => clk_sym  -- 1-bit input: Clock input
);


end Behavioral;

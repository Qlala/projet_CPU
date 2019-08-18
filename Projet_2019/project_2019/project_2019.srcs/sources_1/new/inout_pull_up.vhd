----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.08.2019 18:46:18
-- Design Name: 
-- Module Name: inout_pull_up - Behavioral
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

entity inout_pull_up is
 Port (  
    input_bus : inout std_logic; 
    s_input : in std_logic;
    s_output : out std_logic;
    CLK : in std_logic    
 );
end inout_pull_up;

architecture Behavioral of inout_pull_up is
signal input_reg: std_logic ;
begin
   input_reg<= s_input when rising_edge(CLK)else input_reg;
    input_bus<= input_reg;
    s_output<=input_bus;
end Behavioral;

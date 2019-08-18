----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2018 14:00:44
-- Design Name: 
-- Module Name: switches_manager - Behavioral
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

entity switches_manager is
    Port ( 
            switches : in STD_LOGIC_VECTOR (15 downto 0);
           reg_change : in STD_LOGIC;
           save_enable : in STD_LOGIC;
           CLK : in std_logic;
           byte0 : out STD_LOGIC_VECTOR (7 downto 0);
           byte1 : out STD_LOGIC_VECTOR (7 downto 0);
           byte0_saved : out STD_LOGIC_VECTOR (7 downto 0);
           byte1_saved : out STD_LOGIC_VECTOR (7 downto 0)
           );
end switches_manager;

architecture Behavioral of switches_manager is
signal clk_en :std_logic;
signal byte0_saved_reg :STD_LOGIC_VECTOR (7 downto 0);
signal byte1_saved_reg :STD_LOGIC_VECTOR (7 downto 0);
signal byte0_temp :STD_LOGIC_VECTOR (7 downto 0);
signal byte1_temp :STD_LOGIC_VECTOR (7 downto 0);
begin
byte0_temp<=switches(7 downto 0);
byte1_temp<=switches(15 downto 8);
byte0<=byte0_temp;
byte1<=byte1_temp;
clk_en<=save_enable and not clk_en when rising_edge(CLK) else clk_en;
byte0_saved_reg<=byte0_temp when rising_edge(clk_en) else byte0_saved_reg;
byte1_saved_reg<=byte1_temp when rising_edge(clk_en) else byte1_saved_reg;
byte0_saved<=byte0_saved_reg;
byte1_saved<=byte1_saved_reg;
end Behavioral;

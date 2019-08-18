----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2018 21:48:12
-- Design Name: 
-- Module Name: square_signal_generator - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity square_signal_generator is
    generic(
        audio_N:natural
    );
    Port ( 
           output : out STD_LOGIC_VECTOR (audio_N-1 downto 0);
           amp : in std_logic_vector;
           offset : in std_logic_vector(audio_N-1 downto 0);
           clk : in STD_LOGIC;--clk must be symétric for best possible sound
           RST : in STD_LOGIC);
end square_signal_generator;

architecture Behavioral of square_signal_generator is
signal intern_output :STD_LOGIC_VECTOR(audio_N-1 downto 0);
begin
    intern_output<=std_logic_vector(unsigned(offset)+unsigned(amp)) when clk='1' else std_logic_vector(unsigned(offset)-unsigned(amp));
    output<=intern_output;
end Behavioral;

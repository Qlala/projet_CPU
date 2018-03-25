----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 15:01:51
-- Design Name: 
-- Module Name: GeneralPurposeRegisters - Behavioral
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

use work.CPU_package.all;
entity GeneralPurposeRegisters is
  Port ( 
  --registre sortie
  REG_A : out word ;
  REG_B : out word ;
  --selecteur de registre on a 16 registre:
  REG_A_select : std_logic_vector(3 downto 0);
  REG_B_select : std_logic_vector(3 downto 0);
  --on peut ecrire que vers le A
  REG_A_in : in word ;
  REG_A_write_en : in std_logic;
  --
  RST : in std_logic;--RST sur niveau bas
  CLK : in std_logic
  );
end GeneralPurposeRegisters;


architecture Behavioral of GeneralPurposeRegisters is
type register_bank_type is array(15 downto 0) of word; 
signal register_bank :register_bank_type;
signal next_register_bank :register_bank_type;
begin

register_bank<=(others=>(others=>'0')) when RST='0' else next_register_bank when rising_edge(CLK);
D_REG:for I in 15 downto 0 generate 
next_register_bank(I)<= REG_A_in when REG_A_write_en='1' and to_integer(unsigned(REG_A_select))=I else register_bank(to_integer(unsigned(REG_A_select)));
end generate;

REG_A<=register_bank(to_integer(unsigned(REG_A_select))) when rising_edge(CLK);
REG_B<=register_bank(to_integer(unsigned(REG_B_select))) when rising_edge(CLK);
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2018 23:19:07
-- Design Name: 
-- Module Name: RC_adder - Behavioral
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

entity RC_adder is
	generic( N: integer:=4
	);
    Port ( 
    A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
           S : out  STD_LOGIC_VECTOR (N-1 downto 0);
		Ci : in std_logic;
			 valid: out std_logic;
           Cf : out  STD_LOGIC);
end RC_adder;

architecture Behavioral of RC_adder is

component one_bit_adder is
   port ( 
   A  : in    std_logic; 
          B  : in    std_logic; 
          Ci : in    std_logic; 
          Co : out   std_logic; 
          S  : out   std_logic);
end component;
signal C : std_logic_vector(N downto 0):=(others=>'0');
begin
C(0)<=Ci;
Cf<=C(N);
RC:for I in 0 to N-1 generate 
    add: one_bit_adder port map(A=>A(I),B=>B(I),S=>S(I),Ci=>C(I),Co=>C(I+1));
end generate; 
valid<=C(N) xor C(N-1);
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2018 23:41:56
-- Design Name: 
-- Module Name: main - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity digit_display is
    Port ( 
    CA : out STD_LOGIC;
    CB : out STD_LOGIC;
    CC : out STD_LOGIC;
    CD : out STD_LOGIC;
    CE : out STD_LOGIC;
    CF : out STD_LOGIC;
    CG : out STD_LOGIC;
    DP : out STD_LOGIC;
    select_secondary : in STD_LOGIC;
    AN : out STD_LOGIC_VECTOR (7 downto 0);
    disp_byte0 : in std_logic_vector(7 downto 0);
    disp_byte1 : in std_logic_vector(7 downto 0);
    disp_byte2 : in std_logic_vector(7 downto 0);
    disp_byte3 : in std_logic_vector(7 downto 0);
    secondary_disp_byte0 : in std_logic_vector(7 downto 0);
    secondary_disp_byte1 : in std_logic_vector(7 downto 0);
    secondary_disp_byte2 : in std_logic_vector(7 downto 0);
    secondary_disp_byte3 : in std_logic_vector(7 downto 0);
    CLK : in std_logic);
    
end digit_display;

architecture Behavioral of digit_display is
signal Digital_cat: std_logic_vector (7 downto 0);
signal val : integer range 0 to 15:=0;
signal disp_number:std_logic_vector(31 downto 0);

signal digit : std_logic_vector(3 downto 0);
signal char_select: std_logic_vector(7 downto 0):="11111110";
signal next_char_select : std_logic_vector(7 downto 0):="11111101";
signal ones: std_logic_vector(6 downto 0):= (others => '1');

begin
(CA,CB,CC,CD,CE,CF,CG,DP)<=Digital_cat;
AN<=char_select;
disp_number(7 downto 0)<= secondary_disp_byte0 when select_secondary='1' else disp_byte0;
disp_number(15 downto 8)<=secondary_disp_byte1 when select_secondary='1' else disp_byte1;
disp_number(23 downto 16)<=secondary_disp_byte2 when select_secondary='1' else disp_byte2;
disp_number(31 downto 24)<=secondary_disp_byte3 when select_secondary='1' else disp_byte3;

char_select<=next_char_select when rising_edge(CLK) else char_select;
next_char_select(0)<='0' when char_select(6 downto 0)="1111111" else '1';
next_char_select(7 downto 1)<=char_select(6 downto 0);

--disp_number<= disp_number+1 when rising_edge(OK_button);
with char_select select digit <=
    disp_number(31 downto 28) when "01111111",
    disp_number(27 downto 24) when "10111111",
    disp_number(23 downto 20) when "11011111",
    disp_number(19 downto 16) when "11101111",
    disp_number(15 downto 12) when "11110111",
    disp_number(11 downto 8) when "11111011",
    disp_number(7 downto 4) when "11111101",
    disp_number(3 downto 0) when "11111110",
    "0000" when others;

with digit select Digital_cat <=
    "00000011" when "0000",
    "10011111" when "0001",
    "00100101" when "0010",
    "00001101" when "0011",
    "10011001" when "0100",
    "01001001" when "0101",
    "01000001" when "0110",
    "00011111" when "0111",
    "00000001" when "1000",
    "00001001" when "1001",
    "00010001" when "1010",
    "11000001" when "1011",
    "01100011" when "1100",
    "10000101" when "1101",
    "01100001" when "1110",
    "01110001" when "1111",
    "11111110" when others ;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2018 19:28:20
-- Design Name: 
-- Module Name: PWM_audio - Behavioral
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

entity PWM is
    generic(N : natural);
    Port ( 
           PWM_out : out STD_LOGIC;
           data : in STD_LOGIC_VECTOR (N-1 downto 0);
           new_data : in STD_LOGIC;--authorise data change
           PWM_clk : out STD_LOGIC;
           clk : in STD_LOGIC);
end PWM;

architecture Behavioral of PWM is
    signal intern_data:STD_LOGIC_VECTOR (N-1 downto 0);
    signal pulled_data:STD_LOGIC_VECTOR (N-1 downto 0);
    signal counter:unsigned (N-1 downto 0);
    signal intern_PWM_clk:std_logic;
    
begin
    reg_intern_data:process(clk,data,new_data)
    begin
        if rising_edge(clk) then
            if new_data='1' then
                pulled_data<=data;
            end if;
            counter<=counter+1;
        end if;
    
    end process;
    reg_pulled_data:process(intern_PWM_clk,data,new_data,intern_data,intern_PWM_clk)
    begin
        if rising_edge(intern_PWM_clk) then
            if new_data='1' then
               -- pulled_data<=data;
           else 
                --pulled_data<=intern_data;
            end if;
           end if;
    end process;
PWM_out<= '1' when counter < unsigned(pulled_data) else '0';
intern_PWM_clk<= '1' when counter < TO_UNSIGNED(2**(N-1),N) else '0' ;
PWM_clk<=intern_PWM_clk;
end Behavioral;

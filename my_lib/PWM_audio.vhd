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

entity PWM_audio is
    generic(audio_precision : natural);
    Port ( 
           PWM_out : out STD_LOGIC;
           data : in STD_LOGIC_VECTOR (audio_precision-1 downto 0);
           EN : in STD_LOGIC;
           PWM_clk : out STD_LOGIC;
           clk : in STD_LOGIC);
end PWM_audio;

architecture Behavioral of PWM_audio is
    signal intern_data:STD_LOGIC_VECTOR (audio_precision-1 downto 0);
    signal pulled_data:STD_LOGIC_VECTOR (audio_precision-1 downto 0);
    signal counter:STD_LOGIC_VECTOR (audio_precision-1 downto 0);
    signal intern_PWM_clk:std_logic;
    
begin
    reg_intern_data:process(clk,data,EN)
    begin
        if rising_edge(clk) then
            if EN='1' then
                intern_data<=data;
            end if;
        end if;
    
    end process;
    reg_pulled_data:process(clk,data,EN,intern_data,intern_PWM_clk)
    begin
        if rising_edge(clk) then
            if EN='1' then
                pulled_data<=data;
           else if intern_PWM_clk='1' then
                pulled_data<=intern_data;
            end if;
           end if;
        end if;  
    end process;


end Behavioral;

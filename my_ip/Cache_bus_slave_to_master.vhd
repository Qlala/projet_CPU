----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.08.2019 16:44:54
-- Design Name: 
-- Module Name: Cache_bus_slave_to_master - Behavioral
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

entity Cache_bus_slave_to_master is
    generic(N_bit:integer :=32);
  Port ( 
    --bus
    slave_cache_bus: inout std_logic_vector(N_bit +2 downto 0);
    --input
    adress : in std_logic_vector(N_bit-1 downto 0);
    data : in std_logic_vector(N_bit-1 downto 0);
    EN : in std_logic;
    
    
    CLK : in std_logic;
    RST : in std_logic
  );
end Cache_bus_slave_to_master;

architecture Behavioral of Cache_bus_slave_to_master is
signal cache_bus_driver : std_logic_vector(N_bit +2 downto 0);
--driver
alias data_adr_bus_driver : std_logic_vector(N_bit-1 downto 0) is cache_bus_driver(N_bit-1 downto 0);
alias address_flag_driver : std_logic is cache_bus_driver(N_bit);
alias WR_bus_driver : std_logic is cache_bus_driver(N_bit+1);
alias handshake_driver : std_logic is cache_bus_driver(N_bit+2);

alias data_adr_bus : std_logic_vector(N_bit-1 downto 0) is slave_cache_bus(N_bit-1 downto 0);
alias address_flag : std_logic is slave_cache_bus(N_bit);
alias WR_bus: std_logic is slave_cache_bus(N_bit+1);
alias handshake : std_logic is slave_cache_bus(N_bit+2);
--buff
signal data_buf : std_logic_vector(N_bit-1 downto 0);
signal addr_buf : std_logic_vector(N_bit-1 downto 0);
--state machine
type state_t is (idle,sending_addr_R,sending_addr_W,sending_data,fighting_over_adress_R,fighting_over_adress_W);
signal curr_state,next_state : state_t;

begin

NEXT_STATE_LOGIC:process(curr_state,data_adr_bus,address_flag,WR_bus)
begin
	next_state<=curr_state;
	case curr_state is
		when idle=>		
		when sending_addr_R=>
		when sending_addr_W=>
		when sending_data>
		when fighting over_adress_R=>
		when fighting over_adress_W=>
		when others=>
	end case;
end process;


curr_state<=next_state when rising_edge(CLK);
drive:for I in N_bit+2 downto 0 generate 
    slave_cache_bus(I)<='H' when cache_bus_driver(I)='1' else '0';
end generate;

end Behavioral;

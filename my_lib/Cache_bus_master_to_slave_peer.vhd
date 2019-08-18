----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.08.2019 16:46:44
-- Design Name: 
-- Module Name: Cache_bus_master_to_slave_peer - Behavioral
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

entity Cache_bus_M_to_S_peer is
   generic(
 N_bit:integer:=32
 );
 Port (
   --bus
   cache_bus : in std_logic_vector(N_bit+1 downto 0);
   --output
   address : out std_logic_vector(N_bit-1 downto 0);
   data : out std_logic_vector(N_bit-1 downto 0);
   W_R: out std_logic ;--read write = read=1 write=0
   new_data : out std_logic:='0';--:='H';
   ack: in std_logic:='0';-- ack on high
   --dicarded adress => if an adress is discarded it go to this port
   discard_addr : out std_logic_vector(N_bit-1 downto 0);
   discard_valid :out std_logic:='0';
   --clk
   CLK:in std_logic;
   RST : in std_logic--:='H' --reset on low
  );
end Cache_bus_M_to_S_peer;

architecture Behavioral of Cache_bus_M_to_S_peer is
alias  address_data: std_logic_vector(N_bit-1 downto 0) is cache_bus(N_bit-1 downto 0);
alias  address_flag: std_logic is cache_bus(N_bit);
alias  WR_bus: std_logic is cache_bus(N_bit+1);
--
type state_t is (idle,receiving_data);
signal next_st,curr_st: state_t:=idle;
--
signal addr_buf,data_buf : std_logic_vector(N_bit-1 downto 0);
signal next_new_data,next_new_data_reg,new_data_reg : std_logic:='0';
begin
    NEXT_STATE_LOGIC: process(cache_bus,curr_st,address_flag,WR_bus)
    begin
         next_st<=curr_st;
        case curr_st is
            when idle=>
                if address_flag='1' then
                    if WR_bus='1' then--11 => read
                        next_st<=idle;
                    else-- 10=> write
                        next_st<=receiving_data;
                    end if;          
                end if;
            when receiving_data=>
                next_st<=idle;
            when others=>
                next_st<=idle;
        end case;
    end process;
    curr_st<=idle when RST='0' else next_st when rising_edge(CLK);
    MOORE_SYNC: process(cache_bus,curr_st,new_data_reg,address_flag,address_data)
        begin
            if rising_edge(CLK) then
                case curr_st is
                    when idle=>
                        if address_flag='1' then
                            addr_buf<=address_data;
                            if WR_bus='1' then--11 => read
                                W_R<='1';
                            end if;
                            if new_data_reg='1' then
                                discard_addr<=addr_buf;
                                discard_valid<='1';
                            else
                                  discard_valid<='0';
                            end if; 
                        else
                            discard_valid<='0';      
                        end if;
                      
                    when receiving_data=>
                        data_buf<=address_data;
                        W_R<='0';
                    when others=>
                        W_R<='0';
                end case;
            end if;
        end process;
    MOORE_ASYNC:process(curr_st,WR_bus)
    begin
        case curr_st is
        when idle=>
           if address_flag='1' then
               if WR_bus='1' then--11 => read
                   next_new_data<='1';
               else
                   next_new_data<='0';
               end if;
           else
               next_new_data<='0';   
           end if;
       when receiving_data=>
           next_new_data<='1';
       when others=>
           next_new_data<='0';
       end case;
    end process;
    
address<=addr_buf;
data<=data_buf;
next_new_data_reg<=next_new_data or new_data_reg;
new_data_reg<='0' when ack='1' else next_new_data_reg when rising_edge(clk) else new_data_reg;
new_data<=new_data_reg;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.08.2019 15:29:45
-- Design Name: 
-- Module Name: Cache_bus_master_to_slave - Behavioral
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

entity Cache_bus_M_to_S is
  generic(
  N_bit:integer:=32
  );
  Port (
    --output
    cache_bus : out std_logic_vector(N_bit+1 downto 0) :=(others=>'0');
    --input
    address : in std_logic_vector(N_bit-1 downto 0);
    data : in std_logic_vector(N_bit-1 downto 0);
    W_R: in std_logic ;--read write = read=1 write=0
    EN : in std_logic;--:='L';
    busy : out std_logic;--:='L'; -- 1 si busy;
    --clk
    CLK:in std_logic;
    RST : in std_logic --:='H' --reset on low
   );
end Cache_bus_M_to_S;

architecture Behavioral of Cache_bus_M_to_S is
alias  address_data: std_logic_vector(N_bit-1 downto 0) is cache_bus(N_bit-1 downto 0);
alias  address_flag: std_logic is cache_bus(N_bit);
alias  WR_bus: std_logic is cache_bus(N_bit+1);

--
type state_t is (idle,sending_addr_W,sending_addr_R,sending_data);
signal next_st,curr_st: state_t:=idle;
--
signal data_buf,addr_buf:std_logic_vector(N_bit-1 downto 0):=(others=>'1');
begin
    NEXT_STATE_LOGIC:process(curr_st,EN,W_R)
    begin 
        next_st<=curr_st;
        case curr_st is 
            when idle=>
            if EN='1' then
                if W_R='1' then --read=1
                    next_st<=sending_addr_R;
                else
                    next_st<=sending_addr_W;
                end if;
            end if;
            when sending_addr_R=>
                next_st<=idle;
            when sending_addr_W=>
                next_st<=sending_data;
            when sending_data=>
                next_st<=idle;
            when others=>
                next_st<=idle;
         end case;   
    end process ;
 SYNC_MOORE : process(curr_st,data,address,EN)
    begin
        if rising_edge(CLK) then
         data_buf<=data_buf;
         addr_buf<=addr_buf;
         case curr_st is 
            when idle=>
            if EN='1' then
                data_buf<=data;
                addr_buf<=address;
            end if;
            when sending_addr_R=>
            when sending_addr_W=>
            when sending_data=>
            when others=>
         end case;   
        end if;
    end process;
    
    
    ASYNC_MOORE : process(curr_st)
    begin
         case curr_st is 
            when idle=>
                address_data<=(others=>'0'); 
                address_flag<='0';
                WR_bus<='0';
                busy<='0';
            when sending_addr_R=>
                address_data<=addr_buf; 
                address_flag<='1';
                WR_bus<='1';
                busy<='1';
            when sending_addr_W=>
                address_data<=addr_buf; 
                address_flag<='1';
                WR_bus<='0';
                busy<='1';
            when sending_data=>
                address_data<=data_buf; 
                address_flag<='0';
                WR_bus<='1';
                busy<='1';
            when others=>
                address_data<=(others=>'0');  
                address_flag<='0';
                WR_bus<='0';
                busy<='0';
         end case;   
    end process;
    


curr_st<=idle when RST='0' else next_st when rising_edge(CLK);
end Behavioral;

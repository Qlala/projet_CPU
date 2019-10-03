----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.10.2018 13:48:09
-- Design Name: 
-- Module Name: UART_RS232 - Behavioral
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

entity UART_RS232 is
  generic(
      N:natural:=8;
      START_B:std_logic:='0';
      STOP_B:std_logic:='1';
      DEFAULT_LINE_STATE:std_logic:='1';
  );
  Port (
   --extern port 
   TX:out std_logic:='H';
   RX: in std_logic;
   CTS : in std_logic:='H';--droit d'envoyer (ligne libre?) (asserted if the line is clear)(active on low)
   RTS : out std_logic:='H';--pret a recevoir (asserted if ready to send)(active on low)
   --port intern rx
   rx_data : out std_logic_vector(N-1 downto 0);
   rx_valid : out std_logic; --1 if valid
   rx_new_data : out  std_logic;--assert if data is valid
   rx_ack : in std_logic :='1';--asert to acknowledge data.
   
   --port intern tx
   tx_data: in std_logic_vector(N-1 downto 0);
   tx_start: in std_logic;
   tx_done : out std_logic;
   --CLK and RST
   CLK :in std_logic;
   RST : in std_logic --active on low front
  );
end UART_RS232;

architecture Behavioral of UART_RS232 is

type rx_state_t is (pending,receiving,valid,user_line_handshake,user_handshake,line_handshake);
--rx_signal
signal rx_cState : rx_state_t:=pending;
signal rx_nState : rx_state_t:=pending;

signal rx_I:natural range N-1 downto 0;
signal rx_temp_valid : std_logic:='0';

--tx signal
type tx_state_t is (pending,waiting_peer,start_bit,sending,validation,sending_delay);

signal tx_cState : tx_state_t:=pending;
signal tx_nState : tx_state_t:=pending;

signal tx_I:natural range N downto 0;
signal tx_temp_valid : std_logic:='0';
 signal tx_pulled_data :std_logic_vector(N-1 downto 0);
begin
rx_cState<= pending when RST='0' else rx_nState when rising_edge(CLK) else rx_cState;

--RX STATE MACHINE
RX_NEXT_STATE_LOGIC:process(rx_cState,RX,rx_I)
begin
    rx_nState<=rx_cState;
   case rx_cState is
       when pending =>
        if(RX=START_B) then
            rx_nState<=receiving;
            
        end if;
       when receiving  =>
        if(rx_I=N-1) then
            rx_nState<=valid;
        end if;
       when valid=>
        rx_nState<=user_line_handshake;
       when user_line_handshake=>
            if(rx_ack='1') then--allow to skip synchronisation with the user
                   if (RX=STOP_B)then--user acknowledged data
                      rx_nState<=pending;
                  else
                      rx_nState<=line_handshake;
                  end if;
            end if;
            if(rx_ack='0' and RX=STOP_B) then-- if the user want to see the data before allowing the systeme to resume
                rx_nState<=user_handshake;
            end if;
       when user_handshake=>
        if(rx_ack='1') then
            rx_nState<=pending;
        end if;
        when line_handshake=>
         if(RX=STOP_B) then
             rx_nState<=pending;
         end if;
       when others =>
           --rx_nState<=pending;
    end case; 

end process;

RX_ASYNC:process(rx_cState,rx_ack)
begin
--default
RTS<='0';
     case rx_cState is
         when pending =>
         
         when receiving  =>
            RTS<= not rx_ack;
         when valid=>
            RTS<= not rx_ack;
         when user_line_handshake=>
            RTS<= not rx_ack;
         when user_handshake=>
            RTS<='1';
         when line_handshake=>
         when others =>
            
     end case; 
end process;

RX_SYNC:process(CLK,rx_cState)
    begin
    if rising_edge (CLK) then
        if RST='0' then
            rx_I<=0;
            rx_temp_valid<='0';
            rx_data<=(others=>'0');
        else 
             case rx_cState is
                 when pending =>
                    rx_temp_valid<='0';
                    rx_I<=0;
                    rx_new_data<='0';
                 when receiving  =>
                    rx_valid<='0';--data are not valid anymore
                    rx_new_data<='0';
                    rx_I<=rx_I+1;
                    rx_data(rx_I)<=RX;
                    rx_temp_valid<=rx_temp_valid xor RX;--computing parity
                 when valid=>
                    rx_valid<='1' when rx_temp_valid=RX else '0';--checking parity
                 when user_line_handshake=>
                    rx_new_data<='1';         
                 when others =>
             end case; 
          end if;
       end if;
end process;

--TX_STATE_MACHINE
tx_cState<=pending when RST='0' else tx_nState when rising_edge(CLK) else tx_cState;
TX_NEXT_STATE_LOGIC:process(tx_cState,tx_nState,CTS)
begin
    tx_nState<=tx_cState;
    case tx_cState is
         when pending =>
            
            if(tx_start='1') then
                if(CTS='0') then
                    tx_nState<=start_bit;
                else 
                    tx_nState<=waiting_peer;
                end if;
            end if;
         when waiting_peer  =>
                if(CTS='0') then
                    tx_nState<=start_bit;
                end if;
         when start_bit=>
            tx_nState<=sending;
         when sending =>
            if(tx_I=N-1) then
                tx_nState<=validation;
            end if;
         when validation=>
            tx_nState<=pending;--STOP BIT EST LE DEFAULT LINE STATE
         when sending_delay=>
           tx_nState<=pending; 
         when others =>
       end case; 
end process;

TX_ASYNC:process(tx_cState,CTS)
begin
    case tx_cState is
        when pending =>
        when waiting_peer  =>
        when start_bit  =>
        when sending =>
        when validation=>
        when others =>
   end case; 

end process;

TX_SYNC:process(CLK,tx_cState,CTS)
begin
    if rising_edge(CLK) then
        case tx_cState is
            when pending =>
                tx_I<=0;
                
                TX<=DEFAULT_LINE_STATE;
                tx_pulled_data<=tx_data;
            when waiting_peer  =>
                tx_done<='0';
            when start_bit=>
                tx_done<='0';
                TX<=START_B;
                tx_temp_valid<='0';
            when sending =>
                tx_I<=tx_I+1;
                TX<=tx_pulled_data(tx_I);
                tx_temp_valid<=tx_temp_valid xor tx_pulled_data(tx_I);
            when validation=>
                TX<=tx_temp_valid;
                tx_done<='1';
            when sending_delay =>
                TX<=STOP_B;
            when others =>
        end case; 
    end if;

end process;

end Behavioral;

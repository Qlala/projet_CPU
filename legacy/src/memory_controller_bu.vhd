----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2018 15:41:41
-- Design Name: 
-- Module Name: memory_controller - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity memory_controller is
    Port (   
    --port DDRAM 
    ddr2_dq       : inout std_logic_vector(15 downto 0);
    ddr2_dqs_p    : inout std_logic_vector(1 downto 0);
    ddr2_dqs_n    : inout std_logic_vector(1 downto 0);
    ddr2_addr     : out   std_logic_vector(12 downto 0);
    ddr2_ba       : out   std_logic_vector(2 downto 0);
    ddr2_ras_n    : out   std_logic;
    ddr2_cas_n    : out   std_logic;
    ddr2_we_n     : out   std_logic;
    ddr2_ck_p     : out   std_logic_vector(0 downto 0);
    ddr2_ck_n     : out   std_logic_vector(0 downto 0);
    ddr2_cke      : out   std_logic_vector(0 downto 0);
    ddr2_cs_n     : out   std_logic_vector(0 downto 0);
    ddr2_dm       : out   std_logic_vector(1 downto 0);
    ddr2_odt      : out   std_logic_vector(0 downto 0); 
    --clk
    CLK                     : in    std_logic;
    master_CLK :  in  std_logic;
    RST : in std_logic;
    --interface 1
    --ne pas oublier qu'il y a un bit inutilisé dans les adresse
    upper_addr : in std_logic_vector (24 downto 0);--mot de 32 bits et adresse de 25 bit => 32M adress possible
    lower_addr : in std_logic_vector (0 downto 0):="0";--adresse basse : choisi le demi-mot de 16 bit à placer au debut
    Read_data : out STD_LOGIC_VECTOR (31 downto 0);
    Write_data : in STD_LOGIC_VECTOR (31 downto 0);
    new_command : in STD_logic;--mis a un 1 lorsque nouvelle commande 
    command_finish : out STD_logic;
    led_Test: out STD_LOGIC_VECTOR (15 downto 0);
    Write_Read : in STD_LOGIC
    );
end memory_controller;

architecture Behavioral of memory_controller is
signal app_addr                  :     std_logic_vector(26 downto 0) := (others =>'0') ;
signal app_cmd                   :     std_logic_vector(2 downto 0):= (others =>'0') ;
signal app_en                    :     std_logic:='0';
signal app_wdf_data              :    std_logic_vector(63 downto 0):= (others =>'0') ;
signal app_wdf_end               :     std_logic:='0';
signal app_wdf_mask         :    std_logic_vector(7 downto 0):="11110000" ;
signal app_wdf_wren              :     std_logic:='0';
signal app_rd_data               :    std_logic_vector(63 downto 0):= (others =>'0') ;

signal app_rd_data_end           :    std_logic:='0';
signal app_rd_data_valid         :    std_logic:='0';
signal app_rdy                   :   std_logic:='0';
signal app_wdf_rdy               :    std_logic:='0';
signal app_sr_req                :     std_logic:='0';
signal app_ref_req               :     std_logic:='0';
signal app_zq_req                :     std_logic:='0';
signal app_sr_active             :    std_logic:='0';
signal app_ref_ack               :    std_logic:='0';
signal app_zq_ack                :    std_logic:='0';
signal  ui_clk                    :   std_logic:='0';
signal ui_clk_sync_rst           :    std_logic:='0';
signal init_calib_complete       :    std_logic:='0';
-- System Clock Ports
signal sys_clk_i                      :    std_logic;
signal sys_rst:    std_logic;

signal last_new_command : std_logic;
signal command_state : std_logic;
signal next_command_state : std_logic;

--readbuffer
signal read_buffer : std_logic_vector(63 downto 0);
signal next_read_buffer : std_logic_vector(63 downto 0);
signal app_rd_data_delayed :    std_logic_vector(63 downto 0):= (others =>'0') ;
signal sync_read_data : std_logic;
signal next_sync_read_data : std_logic;
--synchronisation avec l'ui_clk
signal intern_Write_Read :std_logic;
signal intern_new_command :std_logic;
component mig_7series_0 is
  port (
    ddr2_dq       : inout std_logic_vector(15 downto 0) ;
    ddr2_dqs_p    : inout std_logic_vector(1 downto 0);
    ddr2_dqs_n    : inout std_logic_vector(1 downto 0);
    ddr2_addr     : out   std_logic_vector(12 downto 0);
    ddr2_ba       : out   std_logic_vector(2 downto 0);
    ddr2_ras_n    : out   std_logic;
    ddr2_cas_n    : out   std_logic;
    ddr2_we_n     : out   std_logic;
    ddr2_ck_p     : out   std_logic_vector(0 downto 0);
    ddr2_ck_n     : out   std_logic_vector(0 downto 0);
    ddr2_cke      : out   std_logic_vector(0 downto 0);
    ddr2_cs_n     : out   std_logic_vector(0 downto 0);
    ddr2_dm       : out   std_logic_vector(1 downto 0);
    ddr2_odt      : out   std_logic_vector(0 downto 0);
    app_addr                  : in    std_logic_vector(26 downto 0);
    app_cmd                   : in    std_logic_vector(2 downto 0);
    app_en                    : in    std_logic;
    app_wdf_data              : in    std_logic_vector(63 downto 0);
    app_wdf_end               : in    std_logic;
    app_wdf_mask         : in    std_logic_vector(7 downto 0);
    app_wdf_wren              : in    std_logic;
    app_rd_data               : out   std_logic_vector(63 downto 0);
    app_rd_data_end           : out   std_logic;
    app_rd_data_valid         : out   std_logic;
    app_rdy                   : out   std_logic;
    app_wdf_rdy               : out   std_logic;
    app_sr_req                : in    std_logic;
    app_ref_req               : in    std_logic;
    app_zq_req                : in    std_logic;
    app_sr_active             : out   std_logic;
    app_ref_ack               : out   std_logic;
    app_zq_ack                : out   std_logic;
    ui_clk                    : out   std_logic;
    ui_clk_sync_rst           : out   std_logic;
    init_calib_complete       : out   std_logic;
    --ref clock
    -- System Clock Ports
    sys_clk_i                      : in    std_logic;
    sys_rst                     : in    std_logic
  );
end component mig_7series_0;
type state_type is (not_calib,idle,waiting_ram_response_read,waiting_ram_response_write,handshake_command);
signal current_state : state_type:=not_calib;
signal next_state : state_type:=not_calib;
signal command_finish_signal:std_logic:='0';
begin

sys_clk_i <= master_CLK;
 u_mig_7series_0 : mig_7series_0
    port map (
      -- Memory interface ports
      ddr2_addr                      => ddr2_addr,
      ddr2_ba                        => ddr2_ba,
      ddr2_cas_n                     => ddr2_cas_n,
      ddr2_ck_n                      => ddr2_ck_n,
      ddr2_ck_p                      => ddr2_ck_p,
      ddr2_cke                       => ddr2_cke,
      ddr2_ras_n                     => ddr2_ras_n,
      ddr2_we_n                      => ddr2_we_n,
      ddr2_dq                        => ddr2_dq,
      ddr2_dqs_n                     => ddr2_dqs_n,
      ddr2_dqs_p                     => ddr2_dqs_p,
      init_calib_complete            => init_calib_complete,
      ddr2_cs_n                      => ddr2_cs_n,
      ddr2_dm                        => ddr2_dm,
      ddr2_odt                       => ddr2_odt,
      -- Application interface ports
      app_addr                       => app_addr,
      app_cmd                        => app_cmd,
      app_en                         => app_en,
      app_wdf_data                   => app_wdf_data,
      app_wdf_end                    => app_wdf_end,
      app_wdf_wren                   => app_wdf_wren,
      app_rd_data                    => app_rd_data,
      app_rd_data_end                => app_rd_data_end,
      app_rd_data_valid              => app_rd_data_valid,
      app_rdy                        => app_rdy,
      app_wdf_rdy                    => app_wdf_rdy,
      app_sr_req           => '0',
      app_sr_active        => open,
      app_ref_req          => '0',
      app_ref_ack          => open,
      app_zq_req           => '0',
      app_zq_ack           => open,
      ui_clk                         => ui_clk,
      ui_clk_sync_rst                => ui_clk_sync_rst,
      app_wdf_mask                   => app_wdf_mask,
      -- System Clock Ports
      sys_clk_i                       => master_CLK,
      sys_rst                        => RST
    );

--app_addr(15 downto 0)<= addr;
--last_new_command<= new_command when rising_edge(ui_clk);
--app_wdf_data(15 downto 0)<= Write_data;
--command_state<=next_command_state when rising_edge(ui_clk);
--next_command_state<='1' when new_command='1' and last_new_command='0'else '0';
--app_en<= new_command;
--app_wdf_wren<=new_command;
--app_wdf_end<=new_command and not Write_Read;
--app_wdf_wren<=new_command and not Write_Read;--active l'ecriture

--app_wdf_end<=command_state and not Write_Read;--pas obligatoire rend compte de la fin de la serie de burst
--command_finish<=init_calib_complete;
--app_rdy<='1';
current_state<=not_calib when RST= '0' else next_state when rising_edge(ui_clk);
SYNC_PROCESS: process(ui_clk)
begin
  if rising_edge(ui_clk) then
      intern_new_command <=new_command;
      intern_Write_Read <=Write_Read;
   end if;
end process SYNC_PROCESS;

process(init_calib_complete,current_state,app_rdy,intern_new_command,app_rd_data_end,app_rd_data_valid,app_wdf_rdy,intern_Write_read)
begin
 case(current_state) is
        when not_calib =>
               if init_calib_complete ='1' and app_rdy ='1' then
                        next_state<=idle;
               else
                   next_state<=current_state;
               end if;
        when idle =>
            if intern_new_command='1' then
                if intern_Write_read='0' then -- write=0
                    if  app_rdy='1' and (app_wdf_rdy='1' or app_wdf_rdy='0') then
                        next_state<=waiting_ram_response_write;
                      end if;
                else  -- read=1
                      if app_rdy='1' then
                               next_state<=waiting_ram_response_read;
                       end if;
                end if;
            else
                next_state<=current_state;
            end if;
                
         when waiting_ram_response_write =>
            if app_rdy='1' then
                next_state<=handshake_command;
             else
                    next_state<=current_state;
             end if;
        when waiting_ram_response_read =>
            if app_rd_data_valid='1' and app_rd_data_end='1'  then
                next_state<=handshake_command;
             else
                 next_state<=current_state;
             end if;
         when handshake_command=>
            if intern_new_command='0' then
                next_state<=idle;
            else
                next_state<=current_state;
            end if;
       end case;                                 
end process;
--bufer de lecture
next_Read_buffer<=app_rd_data when sync_read_data='1'  else Read_buffer;
next_sync_read_data<='1' when app_rd_data_valid='1' and current_state=waiting_ram_response_read else '0';
sync_read_data<= next_sync_read_data when rising_edge(ui_clk);
Read_buffer<=(others=>'1')when RST='0' else next_Read_buffer when rising_edge(ui_clk);
app_rd_data_delayed<=app_rd_data when rising_edge(ui_clk);

process(ui_clk)
begin
if rising_edge(ui_clk) then
 case(current_state) is
       when not_calib =>
           app_en<='0';
       when idle =>
           app_en<='0';      
           command_finish_signal<='0';
        when waiting_ram_response_write =>
            app_cmd<="000";
            app_wdf_wren<='1';
            app_wdf_end<='1';
            app_en<='1';
            app_wdf_data(31 downto 0)<=Write_data;
            command_finish_signal<='0';
       when waiting_ram_response_read =>
           app_cmd<="001";
           app_en<='1';
           command_finish_signal<='0';
        when handshake_command=>
           app_wdf_wren<='0';
           app_wdf_end<='0';
           command_finish_signal<='1';
           app_en<='0';
      end case;
      app_addr(26 downto 0)<=  upper_addr(24 downto 1) &"0" & upper_addr(1 downto 1)& lower_addr(0 downto 0) ;
end if;
end process;
app_wdf_mask<="11110000" ;--mode 32 bit
--app_addr(26)<='0';
app_sr_req<='0';

--led_Test(0)<=command_finish_signal;
--led_Test(1)<=app_wdf_rdy; 
--led_Test(2)<=app_rdy;
--led_Test(3)<=app_cmd(0);
--led_Test(4)<=RST;
--led_Test(5)<=app_rd_data_valid;
--led_Test(6)<=init_calib_complete;
--led_Test(7)<=Write_Read;
--led_Test(15)<=new_command;

command_finish<=command_finish_signal;
read_data<=Read_buffer(31 downto 0);
app_wdf_data(63 downto 31)<=(others=>'0');

end Behavioral;

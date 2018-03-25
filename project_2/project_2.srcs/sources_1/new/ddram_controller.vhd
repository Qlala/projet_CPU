----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2018 14:19:41
-- Design Name: 
-- Module Name: ddram_controller - Behavioral
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

entity ddram_controller is
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
 --interface
 rd_data : out  std_logic_vector(63 downto 0);
 wr_data : in  std_logic_vector(63 downto 0); 
 --cmd inteface
 write_cmd : in std_logic;--force la transition vers l'état
 read_cmd : in std_logic;
 read_ack : out std_logic;--1 si les donné on été pris en compte
 write_ack :  out std_logic;
 sync_rd_data_vaild: out std_logic;
 
 write_mask : in std_logic_vector(7 downto 0);
 --adress
 upper_addr : in std_logic_vector (23 downto 0);--mot de 64 bits =>
 lower_addr : in std_logic_vector (1 downto 0):="0";--adresse basse : choisi le mot de 16 bit à placer au debut
 --clock
 interface_clk: out std_logic;
 master_CLK : in std_logic;
 RST : in std_logic
 
 );
end ddram_controller;

architecture Behavioral of ddram_controller is
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
type state_type is (read,write,idle,not_calib);  
signal current_state: state_type := not_calib;
signal next_state:state_type;
signal sync_read_data : std_logic;
signal next_sync_read_data : std_logic;
signal intern_read_ack : std_logic;
signal intern_write_ack : std_logic;

begin
next_sync_read_data<='1' when app_rd_data_valid='1' else '0';
sync_read_data<= next_sync_read_data when rising_edge(ui_clk);
current_state<=next_state when rising_edge(ui_clk); 
sync_rd_data_vaild<=sync_read_data;
rd_data<=app_rd_data;
read_ack<='1' when next_state=read else '0'; 
write_ack<='1' when next_state=write else '0'; 
interface_clk<=ui_clk;
state_machine:process(init_calib_complete,current_state,app_rdy,app_rd_data_end,app_rd_data_valid,app_wdf_rdy,read_cmd,write_cmd)
begin
    case(current_state) is
        when not_calib =>
            if init_calib_complete ='1' and app_rdy ='1' then
                next_state<=idle;
            else
                next_state<=current_state;
            end if;
        when idle =>
            if app_rdy='1' then
                if read_cmd='1' then
                    next_state<=read;
                else
                    if write_cmd='1' then
                        next_state<=write;
                    else
                        next_state<=current_state;
                    end if;
                end if;
            else
                next_state<=current_state;
            end if;
           when read =>
             if app_rdy='1' then
                if read_cmd='1' then
                    next_state<=read;
                else
                    if write_cmd='1' then
                        next_state<=write;
                    else
                        next_state<=idle;
                    end if;                  
                end if;
             else
                next_state<=idle;
             end if;
             
             when write =>
               if app_rdy='1' then
                  if read_cmd='1' then
                      next_state<=read;
                  else
                      if write_cmd='1' then
                          next_state<=write;
                      else
                          next_state<=idle;
                      end if;                  
                  end if;
               else
                  next_state<=idle;
               end if;
         end case;

end process;
sync_CTRL_machin:process(ui_clk)
begin
if rising_edge(ui_clk) then--réseaux anticipé avec mémoire
    case(next_state) is
        when read =>--l'adresse est écrite si la prochaine etape était read
            app_addr(26 downto 0)<=  upper_addr(23 downto 0) &"0" & lower_addr(2 downto 1);
        when write =>
            app_addr(26 downto 0)<=  upper_addr(23 downto 0) &"0" & lower_addr(2 downto 1);
            app_wdf_data<=wr_data;
            app_wdf_mask<=write_mask;
        when idle=>
            app_addr(26 downto 0)<=(others=>'0');--remise a zero
    end case;
end if;
end process;

async_CTRL_machin: process(current_state)
begin
case(current_state) is
    when not_calib =>
        app_en<='0';
        app_wdf_wren<='0';
    when idle =>
        app_en<='0';
        app_wdf_wren<='0';
    when read =>
        app_en<='1';
        app_cmd<="001";
        app_wdf_wren<='0';
    when write =>
         app_en<='1';
         app_wdf_wren<='1';
         app_cmd<="001";
end case;
end process;

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

end Behavioral;

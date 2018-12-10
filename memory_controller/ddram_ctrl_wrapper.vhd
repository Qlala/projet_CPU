----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2018 08:46:29 AM
-- Design Name: 
-- Module Name: ddram_ctrl_wrapper - Behavioral
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
--hide some shenanigans 

entity ddram_ctrl_wrapper is
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
 write_read_cmd : in std_logic;--write_0 : read_1
 cmd_start : in std_logic;--1 si cmd
 ack : out std_logic;--1 si les donné on été pris en compte
 sync_rd_data_vaild: out std_logic;
 
 write_mask : in std_logic_vector(7 downto 0);
 --adress
 upper_addr : in std_logic_vector (23 downto 0);--mot de 64 bits => 128 MB de mémoire
 lower_addr : in std_logic_vector (1 downto 0):="00";--adresse basse : choisi le mot de 16 bit à placer au debut
 --clock
 interface_clk: out std_logic;
 master_CLK : in std_logic;--200MHZ
 RST : in std_logic--RST on low
 );
end ddram_ctrl_wrapper;

architecture Behavioral of ddram_ctrl_wrapper is
signal app_addr                  :     std_logic_vector(26 downto 0) := (others =>'0') ;
signal app_cmd                   :     std_logic_vector(2 downto 0):= (others =>'0') ;
signal app_en                    :     std_logic:='0';
signal app_wdf_data              :    std_logic_vector(63 downto 0):= (others =>'0') ;
signal app_wdf_end               :     std_logic:='0';
signal app_wdf_mask              :    std_logic_vector(7 downto 0):="00000000" ;

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
type stateT is (idle,read,write,not_calib);
signal cState : stateT:=not_calib;
signal nState : stateT:=not_calib;
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
    sys_rst                     : in    std_logic:='1'
  );
  end component;
begin

app_addr(26 downto 0)<=  upper_addr(23 downto 0) & "0" & lower_addr(1 downto 0);--rebuild the app
app_cmd<="00"&  write_read_cmd;--app cmd is built here
app_wdf_mask<= write_mask;
app_wdf_data<=wr_data;
rd_data<=app_rd_data;
sync_rd_data_vaild<=app_rd_data_valid when rising_edge(ui_clk);--on resynchronise la validation (retard)
interface_clk<=ui_clk;
cstate<=not_calib when rst='0' else nstate when rising_edge(ui_clk);
next_state_async:process(ui_clk,app_rdy,cmd_start,write_read_cmd,app_rdy)
begin
        nstate<=cstate;
        case(Cstate) is
            
            when not_calib=>
                if init_calib_complete ='1' and app_rdy ='1' then
                    nState<=idle;
                end if;
            when others=>--tous sont identique sinon
                nState<=idle;
                if app_rdy='1' then
                    if cmd_start='1' then
                        if write_read_cmd='0' then
                            nState<=write;
                        else
                            nState<=read;
                        end if;
                    end if;
                 end if;
        end case;
end process;
anticipation_state_async:process(ui_clk,app_rdy,cmd_start,write_read_cmd,app_rdy)
begin--full anticipation => signal are only consider on ui_clk rising_edge
    case(Cstate) is
        when not_calib=>
            app_en<='0';
            app_wdf_wren<='0';
        when others=>
            if app_rdy='1' then
            if cmd_start='1' then
                app_en<='1';--tout est anticipé
                app_wdf_wren<=not write_read_cmd;
            end if;
         end if;
    end case;
end process;
async_state:process(ui_clk,cstate)
begin
    ack<='0';
    case(cstate) is
        when read => 
            ack<='1';
        when write =>
            ack<='1';
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

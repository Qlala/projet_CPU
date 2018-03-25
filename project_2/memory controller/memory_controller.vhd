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
    master_CLK :    std_logic;
    
    addr : in STD_LOGIC_VECTOR (16 downto 0)
    );
end memory_controller;

architecture Behavioral of memory_controller is
signal app_addr                  :     std_logic_vector(26 downto 0) := (others =>'0') ;
signal app_cmd                   :     std_logic_vector(2 downto 0):= (others =>'0') ;
signal app_en                    :     std_logic:='0';
signal app_wdf_data              :    std_logic_vector(63 downto 0):= (others =>'0') ;
signal app_wdf_end               :     std_logic:='0';
signal app_wdf_mask         :    std_logic_vector(7 downto 0):= (others =>'0') ;
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
    -- System Clock Ports
    sys_clk_i                      : in    std_logic;
    sys_rst                     : in    std_logic
  );
end component mig_7series_0;


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
      app_sr_req                     => app_sr_req,
      app_ref_req                    => app_ref_req,
      app_zq_req                     => app_zq_req,
      app_sr_active                  => app_sr_active,
      app_ref_ack                    => app_ref_ack,
      app_zq_ack                     => app_zq_ack,
      ui_clk                         => ui_clk,
      ui_clk_sync_rst                => ui_clk_sync_rst,
      app_wdf_mask                   => app_wdf_mask,
      -- System Clock Ports
      sys_clk_i                       => sys_clk_i,
      sys_rst                        => sys_rst
    );

end Behavioral;

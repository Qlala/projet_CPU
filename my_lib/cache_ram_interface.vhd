----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2018 09:32:56 AM
-- Design Name: 
-- Module Name: cache_ram_interface - Behavioral
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
library CPU;
use CPU.CPU_arch.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cache_ram_interface is
    Port(
           --to RAM interface
                rd_data : in  std_logic_vector(63 downto 0);
                wr_data : out  std_logic_vector(63 downto 0); 
                --cmd inteface
                write_read_cmd : out std_logic;--write_0 : read_1
                cmd_start : out std_logic;--1 si cmd
                ack_ram : in std_logic;--1 si les donné on été pris en compte
                sync_rd_data_vaild: in std_logic;
                write_mask : out std_logic_vector(7 downto 0);
                --adress
                upper_addr : out std_logic_vector (23 downto 0);--mot de 64 bits => 128 MB de mémoire
                lower_addr : out std_logic_vector (1 downto 0):="00";--adresse basse : choisi le mot de 16 bit à placer au debut
                --clock
                interface_clk: in std_logic;
            --to cache interface
                line_read : out cache_line;
                line_info : out cache_line_info;--contains the adress that came with the line
                line_return : std_logic; -- assert when a line is returning from the ram
                
                line_cmd : in cache_line_cmd_bus;
                line_write : in cache_line;
                start : in std_logic; --assert when new cmd
                ack_cache : out std_logic; --acknowledge cmd;
                
                RST : in STD_LOGIC;--RST on LOW
                cache_clk : in STD_LOGIC);
end cache_ram_interface;

architecture Behavioral of cache_ram_interface is
type cmd_state is (idle,relaying_cmd,queuing_read_wait);
type queue_handler_state is (idle,push,pop)
constant queue_size : natural :=3;
type queue is array ( queue_size-1 downto 0) of cache_line_info;
signal queued_read : queue;
signal queue_state : natural range 0 to 3;

signal interface_clk_lock : std_logic; --asserted  when the current interface clock_cycle has been handled
signal arm_ic_lock : std_logic;--assert to arm the lock
begin

interface_clk_lock<= '0' when RST='0' or interface_clk='0' else arm_ic_lock or interface_clk_lock when rising_edge(cache_clk) else interface_clk_lock;


end Behavioral;

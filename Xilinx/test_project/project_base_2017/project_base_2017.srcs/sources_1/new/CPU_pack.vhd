----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/29/2018 08:10:11 AM
-- Design Name: 
-- Module Name: CPU_pack - Behavioral
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

package CPU_arch is
constant cache_line_N : natural := 64;--lié a combien on peut pull en une clock
constant cache_line_addr_N : natural:= 24;--adress 24 bit
constant cahce_line_sub_addr_N:natural :=3;
--processor data bit depth
constant word_N : natural :=32;
constant data_addr_N:integer := 25;
constant data_sub_addr_N : natural :=2;--addr at byte lvl
--data type
subtype word is std_logic_vector( word_N-1 downto 0);
subtype BYTE is std_logic_vector(7 downto 0);
--cache line type
subtype  cache_line is std_logic_vector(cache_line_N-1 downto 0);
subtype  cache_line_addr is std_logic_vector(cache_line_addr_N-1 downto 0);
subtype  cache_line_sub_addr is std_logic_vector(cahce_line_sub_addr_N-1 downto 0);

subtype RAM_addr is std_logic_vector(25 downto 0);

type extended_cache_addr is record 
    addr:cache_line_addr;
    extern_bit : std_logic;
end record;
TYPE extern_data_addr IS RECORD
    addr: std_logic_vector(data_addr_N-1 downto 0);--un bit de plus
    extern_bit : std_logic ;--1 si port extern et non ram
end record;


TYPE data_bus is record
    addr:extern_data_addr;
    data:word;
    R_W:std_logic;--read 1 : write 0 
end record;

type extended_data_bus is record
        addr:extern_data_addr;
        lower_addr : std_logic_vector(data_sub_addr_N-1 downto 0);
        data:word;
        mask : std_logic_vector(7 downto 0);--byte mask (first byte of the mask is located based on the lower adrresses);
        R_W:std_logic;--read 1 : write 0 
end record;


type cache_line_cmd_bus is record--it don't feature the data
    up_addr:cache_line_addr;
    sub_addr:cache_line_sub_addr;
    mask : std_logic_vector(7 downto 0);
    W_R: std_logic;
end record;
--rd_cache_line : cache_line;--
--wr_cache_line : cache_line;

type cache_line_info is record 
    up_addr:cache_line_addr;
    sub_addr:cache_line_sub_addr;
end record;

TYPE BYTE_data_bus is record
    addr:extern_data_addr;
    data:byte;
    lower_addr : std_logic_vector(3 downto 0);
    R_W:std_logic;
end record;

end package CPU_arch;

package body CPU_arch is

begin


end package body;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 15:17:26
-- Design Name: 
-- Module Name: CPU_package - Behavioral
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

package CPU_package is
    --architecture 32 bit
    constant arch_size :integer := 32;
    constant IO_PORT_COUNT :integer := 128;
    constant IO_PORT_SIZE: integer := 64;
    subtype IO_PORT_TYPE is std_logic_vector(IO_PORT_SIZE-1 downto 0);
    type IO_PORT_BUS_TYPE is array(IO_PORT_COUNT-1 downto 0) of IO_PORT_TYPE;
    
    subtype word is std_logic_vector(arch_size-1 downto 0);
    subtype memory_adress is std_logic_vector(24 downto 0);
    type bus_array is array(natural range <>) of std_logic_vector;
    --
end package;

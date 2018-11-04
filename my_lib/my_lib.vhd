----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2018 20:55:41
-- Design Name: 
-- Module Name: my_lib - Behavioral
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

package my_lib is
function GCD(A:natural; B:natural) return natural ;--Greatest common divisor
end package my_lib ;

package body my_lib is
function GCD(A:natural; B:natural) return natural is
     --variable gcd_X : natural;
     variable a_X : natural;
     variable b_X : natural;
     variable t:natural;
begin
    a_x:=a;
    b_x:=b;
    while b_x /=0 loop
        t:=b_x;
        b_x:=a_x rem b_x;
        a_x:=t;
    end loop;
     return a_x;
end function GCD ;

end package body;

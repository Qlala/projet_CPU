library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.numeric_std.all;

entity Cache_bus_V2_master_to_slave is
    generic(
        N_data: integer := 32;
        N_addr : integer :=N_data;
        READ_INTERFACE_SIGNAL : STD_LOGIC :='0' --define how the interface work
    );
    port (
        --bus
        data_bus : out STD_LOGIC_VECTOR(N_data-1 downto 0);
        addr_bus : out STD_LOGIC_VECTOR(N_addr-1 downto 0 );
        --bus:command info
        bus_R_W :out STD_LOGIC; -- R=0 W=1
        bus_cmd_flag : out STD_LOGIC;-- asserted('1' if a command is send)
        
        --interface
        data : in STD_LOGIC_VECTOR(N_data-1 downto 0);
        addr : in STD_LOGIC_VECTOR(N_addr-1 downto 0);
        R_W : in STD_LOGIC;
        EN : in STD_LOGIC;
        --
        clk: in  std_logic;
        rst: in  std_logic--active on low
    );
end entity;

architecture rtl of Cache_bus_V2_master_to_slave is
begin
    --TODO
end architecture;
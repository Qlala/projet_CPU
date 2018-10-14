----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.03.2018 16:01:05
-- Design Name: 
-- Module Name: main_interconnect - Behavioral
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
use work.CPU_package.all;

entity  main_interconnect is
  port (
    AN : out STD_LOGIC_VECTOR ( 0 to 7 );
    CA : out STD_LOGIC;
    CB : out STD_LOGIC;
    CC : out STD_LOGIC;
    CD : out STD_LOGIC;
    CE : out STD_LOGIC;
    CF : out STD_LOGIC;
    CG : out STD_LOGIC;
    DP : out STD_LOGIC;
    EXT_OSC : in STD_LOGIC;
    JA1 : out STD_LOGIC;
    --button
    OK_button : in STD_LOGIC;
    LEFT_button : in STD_LOGIC;
    UP_button : in STD_LOGIC;
    RIGHT_button : in STD_LOGIC;
    RST_button : in STD_LOGIC;--actif sur niveau bas
    SW : in STD_LOGIC_VECTOR ( 15 downto 0 );
    led : out STD_LOGIC_VECTOR ( 15 downto 0 );
    --ddr2
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
    ddr2_odt      : out   std_logic_vector(0 downto 0)
  ); 
end main_interconnect;

architecture Behavioral of main_interconnect is
  component CLOCK_manager is
      generic ( 
            multiplier : natural := 64;
            Divide_0 : natural := 64;
            Divide_1 : natural := 64;
            Divide_2 : natural := 64;
            Divide_3 : natural := 64;
            Divide_4 : natural := 64;
            Divide_5 : natural := 64
  );
  port (
    master_CLK : in STD_LOGIC;
    reset : in STD_LOGIC;
    CLK_out0 : out STD_LOGIC;
    CLK_out1 : out STD_LOGIC;
    CLK_out2 : out STD_LOGIC;
    CLK_out3 : out STD_LOGIC;
    CLK_out4 : out STD_LOGIC;
    CLK_out5 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component CLOCK_manager;
  
  component Freq_Divider is
  generic ( divide_by: Natural :=100 );
  port (
    CLK : in STD_LOGIC;
    CLK_out : out STD_LOGIC
  );
  end component Freq_Divider;

  component digit_display is
  port (
    CA : out STD_LOGIC;
    CB : out STD_LOGIC;
    CC : out STD_LOGIC;
    CD : out STD_LOGIC;
    CE : out STD_LOGIC;
    CF : out STD_LOGIC;
    CG : out STD_LOGIC;
    DP : out STD_LOGIC;
    select_secondary : in STD_LOGIC;
    AN : out STD_LOGIC_VECTOR (0 to 7);
    disp_byte0 : in std_logic_vector(7 downto 0);
    disp_byte1 : in std_logic_vector(7 downto 0);
    disp_byte2 : in std_logic_vector(7 downto 0);
    disp_byte3 : in std_logic_vector(7 downto 0);
    secondary_disp_byte0 : in std_logic_vector(7 downto 0);
    secondary_disp_byte1 : in std_logic_vector(7 downto 0);
    secondary_disp_byte2 : in std_logic_vector(7 downto 0);
    secondary_disp_byte3 : in std_logic_vector(7 downto 0);
    CLK : in STD_LOGIC
  );
  end component digit_display;
  component switches_manager is
  port (
    switches : in STD_LOGIC_VECTOR ( 15 downto 0 );
    reg_change : in STD_LOGIC;
    save_enable : in STD_LOGIC;
    CLK : in STD_LOGIC;
    byte0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    byte1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    byte0_saved : out STD_LOGIC_VECTOR ( 7 downto 0 );
    byte1_saved : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component switches_manager;
component io_mem_controller is
       generic ( N_ctrler : natural :=1);--on a N controller
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
      io_clk : in std_logic;--clock des IO
      RST : in std_logic;
      --led_Test: out STD_LOGIC_VECTOR (15 downto 0);
      --interface N
        Write_Read : in STD_LOGIC_vector(N_ctrler-1 downto 0);                                                                                                      
        upper_addr : in bus_array(N_ctrler-1 downto 0)(23 downto 0);--mot de 64 bits =>                                                              
        lower_addr : in bus_array(N_ctrler-1 downto 0)(1 downto 0);--adresse basse : choisi le demi-mot de 16 bit à placer au debut             
        addr_mode : in bus_array(N_ctrler-1 downto 0)(1 downto 0);-- 10 => 32 bit  11 => 64 bit  00=> 8 bit et 01=> 16 bit                      
        Read_data : out bus_array(N_ctrler-1 downto 0)(63 downto 0);                                                                                 
        Write_data : in bus_array(N_ctrler-1 downto 0)(63 downto 0);                                                                                 
                                                                                                                                                                                                                                 
        ext_address_bit : in STD_LOGIC_vector(N_ctrler-1 downto 0);                                                                                                 
        new_command : in STD_logic_vector(N_ctrler-1 downto 0); --mis a un 1 lorsque nouvelle commande                                                               
         command_finish : out STD_logic_vector(N_ctrler-1 downto 0);
          --port io
         io_extern_port: inout IO_PORT_BUS_TYPE;
         io_extern_port_EN: out std_logic_vector(IO_PORT_COUNT-1 downto 0);--activé si 1
         io_extern_port_WE: out std_logic_vector(IO_PORT_COUNT-1 downto 0);--mode write si 1
         io_extern_port_rd_valid :in std_logic_vector(IO_PORT_COUNT-1 downto 0)--mode write si 1 
         
      );
  end component;
    
     signal     Write_Read :  STD_LOGIC_vector(0 downto 0);                                                                                                      
     signal   upper_addr :  bus_array(0 downto 0)(23 downto 0);--mot de 64 bits =>                                                              
     signal   lower_addr :  bus_array(0 downto 0)(1 downto 0);--adresse basse : choisi le demi-mot de 16 bit à placer au debut             
     signal   addr_mode :  bus_array(0 downto 0)(1 downto 0);-- 10 => 32 bit  11 => 64 bit  00=> 8 bit et 01=> 16 bit                      
     signal   Read_data :  bus_array(0 downto 0)(63 downto 0);                                                                                 
     signal   Write_data :  bus_array(0 downto 0)(63 downto 0);      
     signal    ext_address_bit :  STD_LOGIC_vector(0 downto 0);                                                                                                 
     signal   new_command :  STD_logic_vector(0 downto 0); --mis a un 1 lorsque nouvelle commande
     signal io_extern_port:  IO_PORT_BUS_TYPE;
     signal io_extern_port_EN:  std_logic_vector(IO_PORT_COUNT-1 downto 0);--activé si 1
     signal io_extern_port_WE: std_logic_vector(IO_PORT_COUNT-1 downto 0);--mode write si 1
     signal io_extern_port_rd_valid : std_logic_vector(IO_PORT_COUNT-1 downto 0);--mode write si 1 
    
    signal byte0 :  STD_LOGIC_VECTOR ( 7 downto 0 );
    signal byte1 :  STD_LOGIC_VECTOR ( 7 downto 0 );
    signal byte2 :  STD_LOGIC_VECTOR ( 7 downto 0 );
    signal byte3 :  STD_LOGIC_VECTOR ( 7 downto 0 );
    
    signal addr : std_logic_vector (26 downto 0);
    signal slow_CLK: std_logic;
    signal CLK_200MHZ: std_logic;
    signal CLK_1200MHZ: std_logic;
    signal CLK_600MHZ: std_logic;
    signal CLK_500MHZ: std_logic;
    signal CLK_1500MHZ: std_logic;
    signal   my_upper_addr :  std_logic_vector(23 downto 0);--mot de 64 bits =>                                                              
    signal   my_lower_addr : std_logic_vector(1 downto 0);--adresse basse : choisi le demi-mot de 16 bit à placer au debut     
    
begin
byte3<="0000000"&addr(24);
digit_display_0 : digit_display 
port map(AN=>AN , CA=> CA,CB=>CB,CC=>CC,CD=>CD,CE=>CE,CF=>CF,CG=>CG,DP=>DP ,disp_byte0=>read_data(0)(7 downto 0),disp_byte1=>read_data(0)(15 downto 8),disp_byte2=>read_data(0)(23 downto 16),disp_byte3=>read_data(0)(31 downto 24),CLK=>slow_CLK,select_secondary=>UP_button,
secondary_disp_byte0=>addr(7 downto 0),secondary_disp_byte1=>addr(15 downto 8),secondary_disp_byte2=>addr(23 downto 16),secondary_disp_byte3=>byte3);

Freq_Divider_0 :Freq_Divider
generic map( divide_by=> 100000)
port map(CLK=>EXT_OSC,CLK_out=>slow_CLK);

switches_manager_0 : switches_manager
port map(switches=> SW , save_enable=>OK_button , byte0=> write_data(0)(7 downto 0) , byte1 => write_data(0)(15 downto 8) ,byte0_saved=> addr(7 downto 0),byte1_saved=> addr(26 downto 19),CLK=>slow_CLK,reg_change=>'0');

new_command(0)<=LEFT_button or RIGHT_button;
my_lower_addr<= addr(1 downto 0);
my_upper_addr<= addr(25 downto 2);
upper_addr(0)<=my_upper_addr;
lower_addr(0)<=my_lower_addr;
Write_Read(0)<=LEFT_button;
addr_mode(0)<="11";
ext_address_bit(0)<='0';
memory_controller_0: io_mem_controller
port map(
ddr2_addr=> ddr2_addr,
ddr2_ba => ddr2_ba,
ddr2_cas_n=> ddr2_cas_n,
ddr2_ck_n=> ddr2_ck_n,
ddr2_ck_p=> ddr2_ck_p,
ddr2_cke=> ddr2_cke,
ddr2_ras_n=> ddr2_ras_n,
ddr2_we_n=> ddr2_we_n,
ddr2_dq=> ddr2_dq,
ddr2_dqs_n => ddr2_dqs_n,
ddr2_dqs_p=> ddr2_dqs_p,
ddr2_cs_n=> ddr2_cs_n,
ddr2_dm=> ddr2_dm,
ddr2_odt=> ddr2_odt,

master_CLK => CLK_200MHZ,
CLK => CLK_500MHZ,
io_clk=> CLK_200MHZ,
RST=>RST_button,

upper_addr=> upper_addr,
lower_addr=> lower_addr,
Read_data=>read_data,
Write_data=> write_data,
new_command=> new_command,
ext_address_bit=>ext_address_bit,
addr_mode=>addr_mode,
Write_Read => Write_Read,

io_extern_port=>io_extern_port,
io_extern_port_EN => io_extern_port_EN,
io_extern_port_WE=> io_extern_port_WE,
io_extern_port_rd_valid=>io_extern_port_rd_valid

);
CLOCK_manager_0: CLOCK_manager
      generic map( 
            multiplier => 15,
            Divide_0  =>1,
            Divide_1  => 1,
            Divide_2  => 3,
            Divide_3  =>16,
            Divide_4  => 16,
            Divide_5  =>16
  )
  port map(
    master_CLK => EXT_OSC,
    reset => '0',
    CLK_out0 => CLK_1500MHZ,
    CLK_out2 => CLK_500MHZ
  );
  
CLOCK_manager_1: CLOCK_manager
        generic map( 
              multiplier => 12,
              Divide_0  =>6,
              Divide_1  => 1,
              Divide_2  => 2,
              Divide_3  =>16,
              Divide_4  => 16,
              Divide_5  =>16
    )
    port map(
      master_CLK => EXT_OSC,
      reset => '0',
      CLK_out0 => CLK_200MHZ
    );
   
    

end Behavioral;

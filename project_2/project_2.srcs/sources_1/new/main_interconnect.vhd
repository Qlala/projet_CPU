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
component memory_controller is
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
      led_Test: out STD_LOGIC_VECTOR (15 downto 0);
      --interface 1
      ext_adrress_bit : in STD_LOGIC;
      upper_addr : in std_logic_vector (24 downto 0);
      lower_addr : in std_logic_vector (0 downto 0);--déplace de 16 bit
      Read_data : out STD_LOGIC_VECTOR (31 downto 0);
      Write_data : in STD_LOGIC_VECTOR (31 downto 0);
      new_command : in STD_logic;--mis a un 1 lorsque nouvelle commande 
      command_finish : out STD_logic;
      Write_Read : in STD_LOGIC;
    --interface 2 qui ne peut pas ecrire
      
          --interface 2 lecture de ligne d'instuction
      ext_adrress_bit_2 : in STD_LOGIC;
      upper_addr_2 : in std_logic_vector (23 downto 0);--position du Compteur programe
      --lower_addr_2 : in std_logic_vector (0 downto 0):="0";
      Read_data_2 : out STD_LOGIC_VECTOR (63 downto 0);
      --Write_data_2 : in STD_LOGIC_VECTOR (63 downto 0); on est forcément en read
      new_command_2 : in STD_logic;--mis a un 1 lorsque nouvelle commande 
      command_finish_2 : out STD_logic  
      );
  end component memory_controller;

  
  
    signal byte0 :  STD_LOGIC_VECTOR ( 7 downto 0 );
    signal byte1 :  STD_LOGIC_VECTOR ( 7 downto 0 );
    signal byte2 :  STD_LOGIC_VECTOR ( 7 downto 0 );
    signal byte3 :  STD_LOGIC_VECTOR ( 7 downto 0 );
    signal addr : std_logic_vector (26 downto 0);
    signal read_data : std_logic_vector (31 downto 0);
    signal write_data : std_logic_vector (31 downto 0);
    signal lower_addr : std_logic_vector (0 downto 0);
    signal slow_CLK: std_logic;
    signal CLK_200MHZ: std_logic;
    signal new_command: std_logic;
begin
byte3<="0000000"&addr(24);
digit_display_0 : digit_display 
port map(AN=>AN , CA=> CA,CB=>CB,CC=>CC,CD=>CD,CE=>CE,CF=>CF,CG=>CG,DP=>DP ,disp_byte0=>read_data(7 downto 0),disp_byte1=>read_data(15 downto 8),disp_byte2=>read_data(23 downto 16),disp_byte3=>read_data(31 downto 24),CLK=>slow_CLK,select_secondary=>UP_button,
secondary_disp_byte0=>addr(7 downto 0),secondary_disp_byte1=>addr(15 downto 8),secondary_disp_byte2=>addr(23 downto 16),secondary_disp_byte3=>byte3);

Freq_Divider_0 :Freq_Divider
generic map( divide_by=> 100000)
port map(CLK=>EXT_OSC,CLK_out=>slow_CLK);

switches_manager_0 : switches_manager
port map(switches=> SW , save_enable=>OK_button , byte0=> write_data(7 downto 0) , byte1 => write_data(15 downto 8) ,byte0_saved=> addr(7 downto 0),byte1_saved=> addr(26 downto 19),CLK=>slow_CLK,reg_change=>'0');

new_command<=LEFT_button or RIGHT_button;
lower_addr<= addr(0 downto 0);
memory_controller_0: memory_controller
port map(ddr2_addr=> ddr2_addr,
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
upper_addr=> addr(25 downto 1),
upper_addr_2=> (others=>'0'),
lower_addr=> lower_addr,
Read_data=>read_data,
Write_data=> write_data,
master_CLK => CLK_200MHZ,
CLK => EXT_OSC,
RST=>RST_button,
new_command=> new_command,
new_command_2=> '0',
ext_adrress_bit_2=>'0',
ext_adrress_bit=>'0',
led_Test=>led,
Write_Read => LEFT_button

);
CLOCK_manager_0 :CLOCK_manager
      generic map( 
            multiplier => 16,
            Divide_0  =>8,
            Divide_1  => 16,
            Divide_2  => 16,
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

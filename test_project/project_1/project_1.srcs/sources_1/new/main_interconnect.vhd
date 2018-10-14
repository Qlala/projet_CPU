----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.10.2018 23:06:14
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
    DOWN_button : in std_logic;
    RST_button : in STD_LOGIC;--actif sur niveau bas
    SW : in STD_LOGIC_VECTOR ( 15 downto 0 );
    led : out STD_LOGIC_VECTOR ( 15 downto 0 )
    --ddr2
--    ddr2_dq       : inout std_logic_vector(15 downto 0);
--    ddr2_dqs_p    : inout std_logic_vector(1 downto 0);
--    ddr2_dqs_n    : inout std_logic_vector(1 downto 0);
--    ddr2_addr     : out   std_logic_vector(12 downto 0);
--    ddr2_ba       : out   std_logic_vector(2 downto 0);
--    ddr2_ras_n    : out   std_logic;
--    ddr2_cas_n    : out   std_logic;
--    ddr2_we_n     : out   std_logic;
--    ddr2_ck_p     : out   std_logic_vector(0 downto 0);
--    ddr2_ck_n     : out   std_logic_vector(0 downto 0);
--    ddr2_cke      : out   std_logic_vector(0 downto 0);
--    ddr2_cs_n     : out   std_logic_vector(0 downto 0);
--    ddr2_dm       : out   std_logic_vector(1 downto 0);
--    ddr2_odt      : out   std_logic_vector(0 downto 0)
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
 component  mult is
  generic( N :integer:=4);
  port (
      A: in std_logic_vector(N-1 downto 0);
      B: in std_logic_vector(N-1 downto 0);
      S : out std_logic_vector(2*N-1 downto 0);
      CLK : in std_logic;
      start : in std_logic;
      done : out std_logic);
  end component mult;
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
  
  
    signal byte0 :  STD_LOGIC_VECTOR ( 7 downto 0 ):=(others=>'0');
    signal byte1 :  STD_LOGIC_VECTOR ( 7 downto 0 ):=(others=>'0');
    signal byte2 :  STD_LOGIC_VECTOR ( 7 downto 0 ):=(others=>'0');
    signal byte3 :  STD_LOGIC_VECTOR ( 7 downto 0 ):=(others=>'0');
    signal addr : std_logic_vector (26 downto 0);
    signal read_data : std_logic_vector (31 downto 0);
    signal write_data : std_logic_vector (31 downto 0);
    signal lower_addr : std_logic_vector (0 downto 0);
    signal slow_CLK: std_logic;
    signal CLK_200MHZ: std_logic;
    signal new_command: std_logic;
begin
byte0<="0000"&SW(3 downto 0);
byte1<="0000"&SW(11 downto 8);
byte2<="00000000";
digit_display_0 : digit_display 
port map(AN=>AN , CA=> CA,CB=>CB,CC=>CC,CD=>CD,CE=>CE,CF=>CF,CG=>CG,DP=>DP ,disp_byte0=>byte0,disp_byte1=>byte1,disp_byte2=>byte2,disp_byte3=>byte3,CLK=>slow_CLK,select_secondary=>UP_button,
secondary_disp_byte0=>addr(7 downto 0),secondary_disp_byte1=>addr(15 downto 8),secondary_disp_byte2=>addr(23 downto 16),secondary_disp_byte3=>byte3);

Freq_Divider_0 :Freq_Divider
generic map( divide_by=> 400000)
port map(CLK=>EXT_OSC,CLK_out=>slow_CLK);

mult_inst: mult
   port map (
      -- Input Ports - Single Bit
      CLK           => EXT_OSC,         
      start         => OK_button,       
      -- Input Ports - Busses
      A(3 downto 0) => SW(3 downto 0),
      B(3 downto 0) => SW(11 downto 8),
      -- Output Ports - Single Bit
      done          => led(0),        
      -- Output Ports - Busses
      S(7 downto 0) => byte3
      -- InOut Ports - Single Bit
      -- InOut Ports - Busses
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

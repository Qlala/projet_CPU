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
    AN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CA : out STD_LOGIC;
    CB : out STD_LOGIC;
    CC : out STD_LOGIC;
    CD : out STD_LOGIC;
    CE : out STD_LOGIC;
    CF : out STD_LOGIC;
    CG : out STD_LOGIC;
    DP : out STD_LOGIC;
	
    
    --button
    OK_BTN : in STD_LOGIC;
    LEFT_BTN : in STD_LOGIC;
    UP_BTN: in STD_LOGIC;
    RIGHT_BTN : in STD_LOGIC;
    DOWN_BTN : in std_logic;
    CPU_RST : in STD_LOGIC;--actif sur niveau bas
	--switches and led
    SW : in STD_LOGIC_VECTOR ( 15 downto 0 );
    LED : out STD_LOGIC_VECTOR ( 15 downto 0 );
	-- led RGB
	LED16_B : out std_logic;
	LED16_G : out std_logic;
	LED16_R : out std_logic;
	LED17_B : out std_logic;
	LED17_G : out std_logic;
	LED17_R : out std_logic;
	--Jport
	JA : inout std_logic_vector(10 downto 1);
	JB : inout std_logic_vector(10 downto 1);
	JC : inout std_logic_vector(10 downto 1);
	JD : inout std_logic_vector(10 downto 1);
	--XADC
	XA_N : inout std_logic_vector(4 downto 1);
	XA_P : inout std_logic_vector(4 downto 1);
	--VGA
	VGA_R : out std_logic_vector(3 downto 0);
	VGA_G : out std_logic_vector(3 downto 0);
	VGA_B : out std_logic_vector(3 downto 0);
	VGA_HS : out std_logic;
	VGA_VS : out std_logic;
	--SD card
	SD_RESET : out std_logic;--force reset SD card (actif sur niveau haut => doit être forcée à '0')
	SD_SCK : out std_logic;
	SD_CMD : inout std_logic;
	SD_DAT : inout std_logic_vector(3 downto 0);
	SD_CD :  in std_logic;--card detect
	--Accelerometer(SPI)
	ACL_MISO : in std_logic;
	ACL_MOSI : out std_logic;
	ACL_SCLK : out std_logic;
	ACL_CSN : out std_logic;--slave select active low
	ACL_INT : in std_logic_vector(2 downto 1);--interupt (have to be set on 'H' (need pull_up))
	--temperature sensor(I2C)
	TMP_SCL: out std_logic;
	TMP_SDA : inout std_logic;
	TMP_INT : in std_logic; --over temperature and under temperature interupt
	TMP_CT : in std_logic;--Critical temperature
	--microphone
	 M_CLK : out std_logic;
	 M_DATA : in std_logic;
     M_LRSEL : out std_logic;--channel select (L or R)
	--USB RS232
	UART_TX_OUT : out std_logic:='H';
	UART_RX_IN : in std_logic; 
	UART_CTS : in std_logic:='H';
	UART_RTS : out std_logic:='H';
	--USB HID (PS/2)
	PS2_CLK : inout std_logic;
	PS2_DATA : inout std_logic;
	--PWM Audio Amplifier
	AUD_PWM : out std_logic;
	AUD_SD : out std_logic;--Shutdown (shutdown amplifiers in the salen key low pass filter.)
	--ethernet PHY
	ETH_MDC : out std_logic;
	ETH_MDIO : inout std_logic;
	ETH_RSTN : out std_logic; --Reset (niveau bas mais la ligne a une RES de pull-up)
	ETH_CRSDV : inout std_logic;
	ETH_RXERR : inout std_logic;
	ETH_RXD :inout std_logic_vector(1 downto 0);
	ETH_TXEN: out std_logic;
	ETH_TXD:out std_logic_vector(1 downto 0);
	ETH_REFCLK:out std_logic;
	ETH_INTN: inout std_logic;
	--Quad SPI Flash
	 QSPI_DQ : inout std_logic_vector(3 downto 0);
	 QSPI_CSN : out std_logic;
	 --SCLK accessible through STARTUPE2 primitive
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

	--clk
	CLK100MHZ : in STD_LOGIC
  );
end main_interconnect;

architecture Behavioral of main_interconnect is
component UART_RS232 is
  Port (
   --extern port 
   TX:out std_logic:='H';
   RX: in std_logic;
   CTS : in std_logic;
   RTS : out std_logic;
   --port intern rx
   rx_data : out std_logic_vector(7 downto 0);
   rx_valid : out std_logic; --1 if valid
   rx_new_data : out  std_logic;--assert if data is valid
   rx_ack : in std_logic :='1';--asert to acknowledge data.
   
   --port intern tx
   tx_data: in std_logic_vector(7 downto 0);
   tx_start: in std_logic;
   tx_done : out std_logic;
   --CLK and RST
   CLK :in std_logic;
   RST : in std_logic --active on low front
  );
end component;
component  digit_display is
    Port ( 
    CA : out STD_LOGIC;
    CB : out STD_LOGIC;
    CC : out STD_LOGIC;
    CD : out STD_LOGIC;
    CE : out STD_LOGIC;
    CF : out STD_LOGIC;
    CG : out STD_LOGIC;
    DP : out STD_LOGIC;
    select_secondary : in STD_LOGIC;
    AN : out STD_LOGIC_VECTOR (7 downto 0);
    disp_byte0 : in std_logic_vector(7 downto 0);
    disp_byte1 : in std_logic_vector(7 downto 0);
    disp_byte2 : in std_logic_vector(7 downto 0);
    disp_byte3 : in std_logic_vector(7 downto 0);
    secondary_disp_byte0 : in std_logic_vector(7 downto 0);
    secondary_disp_byte1 : in std_logic_vector(7 downto 0);
    secondary_disp_byte2 : in std_logic_vector(7 downto 0);
    secondary_disp_byte3 : in std_logic_vector(7 downto 0);
    CLK : in std_logic);
    
end component;
component symetric_freq_Divider is
    generic ( divide_by: Natural :=100 );
    Port ( CLK : in STD_LOGIC;
           CLK_out : out STD_LOGIC);
        
end component;
signal byte_in: std_logic_vector(7 downto 0);
signal CLK_10KHZ : std_logic;
signal CLK_2MHZ : std_logic;
signal CLK_1MHZ : std_logic;
signal byte_out : std_logic_vector(7 downto 0);
signal TX_line : std_logic:='H';
signal TX_line_late : std_logic;
signal Ctrl_signal :std_logic;
signal data_bus_loop : std_logic_vector(7 downto 0);
signal data_start_loop :std_logic;
begin
--valeur par défault
--AN <= (others =>'1');
--CA <='0';
--CB <='0';
--CC <='0';
--CD <='0';
--CE <='0';
--CF <='0';
--CG <='0';
--DP <='0';
--led<=(others=>'0');
LED16_B <='0';
LED16_G <='0';
LED16_R <='0';
LED17_B <='0';
LED17_G <='0';
LED17_R <='0';
--JA <=(others=>'Z');
JB <=(others=>'Z');
JC <=(others=>'Z');
JD <=(others=>'Z');
XA_N <=(others=>'Z');
XA_P <=(others=>'Z');
VGA_R<=(others=>'0');
VGA_G<=(others=>'0');
VGA_B<=(others=>'0');
VGA_HS <='0';
VGA_VS <='0';
SD_RESET <='1';--mettre à 0 pour activé
SD_SCK <='0';
SD_CMD <='Z';
SD_DAT <=(others=>'Z');
ACL_MOSI <='0';
ACL_SCLK <='0';
ACL_CSN <='1';--actif sur niveau bas
TMP_SCL<='0';
 M_CLK <='0';
 M_LRSEL <='0';
--UART_TX_OUT<='0';
--UART_RTS <='0';
ETH_MDC <='Z';
ETH_RSTN <='Z';
ETH_TXEN<='Z';
ETH_TXD<=(others=>'Z');
ETH_REFCLK<='Z';
QSPI_CSN<='Z';
 --commencez l'�criture ici
 byte_in<=SW(7 downto 0);
 digit_display_inst: digit_display
    port map (
       -- Input Ports - Single Bit
       CLK                              => CLK_10khz,                            
       select_secondary                 => '0',               
       -- Input Ports - Busses
       disp_byte0(7 downto 0)           => data_bus_loop,         
       disp_byte1(7 downto 0)           => byte_out,         
       disp_byte2(7 downto 0)           => (others=>'0'),         
       disp_byte3(7 downto 0)           => (others=>'0'),         
       secondary_disp_byte0(7 downto 0) => (others=>'0'),
       secondary_disp_byte1(7 downto 0) => (others=>'0'),
       secondary_disp_byte2(7 downto 0) => (others=>'0'),
       secondary_disp_byte3(7 downto 0) => (others=>'0'),
       -- Output Ports - Single Bit
       CA                               => CA,                             
       CB                               => CB,                             
       CC                               => CC,                             
       CD                               => CD,                             
       CE                               => CE,                             
       CF                               => CF,                             
       CG                               => CG,                             
       DP                               => DP,                             
       -- Output Ports - Busses
       AN(7 downto 0)                   =>  AN(7 downto 0)                 
       -- InOut Ports - Single Bit
       -- InOut Ports - Busses
    );
UART_RS232_inst : UART_RS232
   Port map(
     --extern port 
     TX=>TX_line,
     RX=>UART_RX_IN,
     CTS => UART_CTS,
     RTS => Ctrl_signal,
     --port intern rx
     rx_data  =>data_bus_loop,
     rx_valid =>JA(7),
     rx_new_data =>data_start_loop,
     rx_ack =>OK_BTN,
     
     --port intern tx
     tx_data  =>data_bus_loop,
     tx_start =>data_start_loop,
     tx_done  =>led(1),
     --CLK and RST
     CLK =>CLK_10KHZ,
     RST =>CPU_RST
    );  
    
led(3)<=OK_BTN;
led(2)<=UART_CTS;
UART_RTS<=Ctrl_signal;
JA(1)<=UART_RX_IN;
JA(4)<=UART_CTS;
JA(3)<=Ctrl_signal;
JA(8)<=data_start_loop;
UART_TX_OUT<=TX_line;
JA(2)<=TX_line;
--led(5)<=UART_RX_IN;
led(4)<=Ctrl_signal;
inst:symetric_freq_Divider generic map(10000) port map(CLK=>CLK100MHZ,CLK_out=>CLK_10KHZ);
inst_1MHZ:symetric_freq_Divider generic map(100) port map(CLK=>CLK100MHZ,CLK_out=>CLK_1MHZ);
inst_2MHZ:symetric_freq_Divider generic map(50) port map(CLK=>CLK100MHZ,CLK_out=>CLK_2MHZ);
 end Behavioral;
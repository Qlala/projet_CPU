----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.04.2018 10:53:00
-- Design Name: 
-- Module Name: io_mem_controller - Behavioral
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
library work;
use work.CPU_package.all;

entity io_mem_controller is
    generic ( N_ctrler : natural :=1);--on a N controller
  Port (
  --entré controller                                                                                                                  
  Write_Read : in STD_LOGIC_vector(N_ctrler-1 downto 0);                                                                                                      
  upper_addr : in bus_array(N_ctrler-1 downto 0)(23 downto 0);--mot de 64 bits =>                                                              
  lower_addr : in bus_array(N_ctrler-1 downto 0)(1 downto 0);--adresse basse : choisi le demi-mot de 16 bit à placer au debut             
  addr_mode : in bus_array(N_ctrler-1 downto 0)(1 downto 0);-- 10 => 32 bit  11 => 64 bit  00=> 8 bit et 01=> 16 bit                      
  Read_data : out bus_array(N_ctrler-1 downto 0)(63 downto 0);                                                                                 
  Write_data : in bus_array(N_ctrler-1 downto 0)(63 downto 0);                                                                                 
                                                                                                                                                                                                                           
  ext_address_bit : in STD_LOGIC_vector(N_ctrler-1 downto 0);                                                                                                 
  new_command : in STD_logic_vector(N_ctrler-1 downto 0); --mis a un 1 lorsque nouvelle commande                                                               
   command_finish : out STD_logic_vector(N_ctrler-1 downto 0);
  
  
  --port ddram
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
  --port io
  io_extern_port: inout IO_PORT_BUS_TYPE;
  io_extern_port_EN: out std_logic_vector(IO_PORT_COUNT-1 downto 0);--activé si 1
  io_extern_port_WE: out std_logic_vector(IO_PORT_COUNT-1 downto 0);--mode write si 1
  io_extern_port_rd_valid :in std_logic_vector(IO_PORT_COUNT-1 downto 0);--mode write si 1
  --clk
   clk : in std_logic;
   io_clk : in std_logic;--clock des IO
   master_clk: in std_logic;
   rst : in std_logic
  );
end io_mem_controller;

architecture Behavioral of io_mem_controller is
component arbitrated_mem_controller is
 Port (
 --
 CLK:in std_logic;
 interface_clk : in std_logic;
 RST:in std_logic;
 --entré
 Write_Read : in STD_LOGIC;
 upper_addr : in std_logic_vector (23 downto 0);--mot de 64 bits =>
 lower_addr : in std_logic_vector (1 downto 0):="00";--adresse basse : choisi le demi-mot de 16 bit à placer au debut
 addr_mode : in std_logic_vector(1 downto 0):="00";-- 10 => 32 bit  11 => 64 bit  00=> 8 bit et 01=> 16 bit
 Read_data : out STD_LOGIC_VECTOR (63 downto 0);
 Write_data : in STD_LOGIC_VECTOR (63 downto 0);
 
  --donné non passé au sous controller
 ext_address_bit : in STD_LOGIC;
 new_command : in STD_logic;--mis a un 1 lorsque nouvelle commande 
 
 --etat passé au controlleur suivant
 ddr_read_cmd : out std_logic;
 ddr_write_cmd : out std_logic;
 
 physical_read_cmd: out std_logic;
 physical_write_cmd: out std_logic;
 
 --réponse du sous controlleur
 sync_rd_data_valid : in std_logic;
 physical_rd_data_valid : in std_logic;--sync des interface physique : peut être special
 read_ack:in std_logic;
 write_ack : in std_logic;
 
 --donné à passer  
 ddr_rd_data : in  std_logic_vector(63 downto 0);
 ddr_wr_data : out  std_logic_vector(63 downto 0); 
 ddr_write_mask : out std_logic_vector(7 downto 0);
 --adress
 ddr_upper_addr : out std_logic_vector (23 downto 0);--mot de 64 bits =>
 ddr_lower_addr : out std_logic_vector (1 downto 0):="00";--adresse basse : choisi le mot de 16 bit à placer au debut
 --interface physique
 physical_upper_addr: out std_logic_vector (23 downto 0);
 physical_lower_addr :out std_logic_vector (1 downto 0):="00";
 physical_rd_data : in  std_logic_vector(63 downto 0);
 physical_wr_data : out  std_logic_vector(63 downto 0); 
 physical_write_mask : out std_logic_vector(7 downto 0);
 
 --interaction entre les controlleur
 inib_ram:in std_logic;--inib si à 1 deconect si à 1
 inib_physical : in std_logic;
 inib_read_data: in std_logic;
 waiting_ram_read : out std_logic;
 --aucun controller ne doit avoir les même priorité réciproque
 inib_ram_other_high_priority : out std_logic;
 inib_ram_other_low_priority : out std_logic;
 inib_physical_other_high_priority : out std_logic;
 inib_physical_other_low_priority : out std_logic;
 
 --signal de validation
 command_finish : out STD_logic
 
  );
end component;

component physical_controller is
  Port ( 
  --commande
  read_cmd: in std_logic;
  write_cmd: in std_logic;
  
rd_data : out  std_logic_vector(63 downto 0);
wr_data : in  std_logic_vector(63 downto 0); 
upper_addr: in std_logic_vector (23 downto 0);
lower_addr :in std_logic_vector (1 downto 0):="00";--pour ça non plus
write_mask : in std_logic_vector(7 downto 0);--je sais pas trop si je vais prendre ça en compte (pas supporter ensemble)
--on ne peut pas acceder a des division qui ne sont pas dans le mot de 64bit
physical_rd_data_valid : out std_logic;

--on connect maintenant au port extern bi directionelle 512 adress => "000000000000000XXXXXXXXX"
extern_port: inout IO_PORT_BUS_TYPE;
extern_port_EN: out std_logic_vector(IO_PORT_COUNT-1 downto 0);--activé si 1
extern_port_WE: out std_logic_vector(IO_PORT_COUNT-1 downto 0);--mode write si 1
extern_port_rd_valid :in std_logic_vector(IO_PORT_COUNT-1 downto 0);--mode write si 1
--clk
CLK:in std_logic;
 io_clk : in std_logic;--clock des IO
RST:in std_logic
 );
end component;

component ddram_controller is
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
 --interface
 rd_data : out  std_logic_vector(63 downto 0);
 wr_data : in  std_logic_vector(63 downto 0); 
 --cmd inteface
 write_cmd : in std_logic;--force la transition vers l'état
 read_cmd : in std_logic;
 read_ack : out std_logic;--1 si les donné on été pris en compte
 write_ack :  out std_logic;
 sync_rd_data_vaild: out std_logic;
 
 write_mask : in std_logic_vector(7 downto 0);
 --adress
 upper_addr : in std_logic_vector (23 downto 0);--mot de 64 bits =>
 lower_addr : in std_logic_vector (1 downto 0):="00";--adresse basse : choisi le mot de 16 bit à placer au debut
 --clock
 interface_clk: out std_logic;
 master_CLK : in std_logic;
 RST : in std_logic--RST sur niveau bas
 
 );
end component;
--clocks
signal ddr_interface_clk : std_logic;
signal physical_clk:std_logic;
--signal io_clk : std_logic;--clock des IO

    --physical controller
 signal physical_upper_addr:  std_logic_vector (23 downto 0);
  signal physical_lower_addr : std_logic_vector (1 downto 0):="00";
  signal physical_rd_data :   std_logic_vector(63 downto 0);
 signal  physical_wr_data :  std_logic_vector(63 downto 0); 
  signal physical_write_mask : std_logic_vector(7 downto 0);
 signal  physical_rd_data_valid :std_logic;--sync des interface physique : peut être special

  --dram controller
   signal ddr_rd_data :  std_logic_vector(63 downto 0):=(others=>'0');
  signal ddr_wr_data :  std_logic_vector(63 downto 0):=(others=>'0'); 
  signal ddr_write_mask : std_logic_vector(7 downto 0):=(others=>'0');
  signal ddr_upper_addr :  std_logic_vector (23 downto 0):=(others=>'0');--mot de 64 bits =>
  signal ddr_lower_addr :  std_logic_vector (1 downto 0):="00";--adresse basse : choisi le mot de 16 bit à placer au debut
  signal ddr_sync_rd_data_vaild :std_logic;
  signal ddr_read_ack: std_logic;
  signal ddr_write_ack :  std_logic;
  
 --message de lecture écriture pour les sous controller
 signal ddr_read_cmd : std_logic;
 signal ddr_write_cmd : std_logic;
 signal physical_read_cmd: std_logic;
 signal physical_write_cmd: std_logic;
 
 type upper_adress_type is array(N_ctrler-1 downto 0) of std_logic_vector (23 downto 0);
 type lower_adress_type is array(N_ctrler-1 downto 0) of std_logic_vector (1 downto 0);
 type data_type is  array(N_ctrler-1 downto 0) of STD_LOGIC_VECTOR (63 downto 0);
 type addr_mode_type is  array(N_ctrler-1 downto 0) of std_logic_vector(1 downto 0);
  
 --N_ctrler
 --interface entré
 --signal   Write_Read :  STD_LOGIC_vector(N_ctrler-1 downto 0);
 --signal  upper_addr :  upper_adress_type;--mot de 64 bits =>
-- signal  lower_addr :  lower_adress_type;--adresse basse : choisi le demi-mot de 16 bit à placer au debut
-- signal  addr_mode : addr_mode_type;-- 10 => 32 bit  11 => 64 bit  00=> 8 bit et 01=> 16 bit
-- signal  Read_data :  data_type;
-- signal  Write_data :  data_type;
-- signal ext_address_bit :STD_LOGIC_vector(N_ctrler-1 downto 0);
-- signal new_command :  STD_LOGIC_vector(N_ctrler-1 downto 0);--mis a un 1 lorsque nouvelle commande 
-- --interface : sortie
-- signal command_finish : std_logic_vector(N_ctrler-1 downto 0);
 --communication inter controller
 signal inib_ram: std_logic_vector(N_ctrler-1 downto 0);--inib si à 1 deconect si à 1
signal  inib_physical : std_logic_vector(N_ctrler-1 downto 0);
 signal inib_read_data: std_logic_vector(N_ctrler-1 downto 0);
signal  waiting_ram_read : std_logic_vector(N_ctrler-1 downto 0);
 --aucun controller ne doit avoir les même priorité réciproque
signal  inib_ram_other_high_priority : std_logic_vector(N_ctrler-1 downto 0);
signal  inib_ram_other_low_priority : std_logic_vector(N_ctrler-1 downto 0);
signal  inib_physical_other_high_priority : std_logic_vector(N_ctrler-1 downto 0);
signal  inib_physical_other_low_priority : std_logic_vector(N_ctrler-1 downto 0);
--signal controller
 signal ctrl_ddr_read_cmd : std_logic_vector(N_ctrler-1 downto 0);
 signal ctrl_ddr_write_cmd : std_logic_vector(N_ctrler-1 downto 0);
 signal ctrl_physical_read_cmd: std_logic_vector(N_ctrler-1 downto 0);
 signal ctrl_physical_write_cmd: std_logic_vector(N_ctrler-1 downto 0);

--gestion des ordre de lecture en attente 
constant zero_col : std_logic_vector(N_ctrler-1 downto 0):=(others=>'0'); 
type inib_read_data_mat_type is array(N_ctrler-1 downto 0) of std_logic_vector(N_ctrler-1 downto 0); 
signal inib_read_data_mat :inib_read_data_mat_type :=(others=>(others=>'0'));
signal col_sum_mat : std_logic_vector(N_ctrler-1 downto 0):=(others=>'0');
signal next_inib_read_data_mat :inib_read_data_mat_type :=(others=>(others=>'0'));
signal inib_read_data_mask : std_logic_vector(N_ctrler-1 downto 0):=(others=>'0'); 
begin
physical_clk<=CLK;

process(ctrl_ddr_read_cmd,ctrl_ddr_write_cmd,ctrl_physical_read_cmd,ctrl_physical_write_cmd)
variable temp_ddr_read_cmd: std_logic :='0';
variable temp_ddr_write_cmd: std_logic :='0';
variable temp_physical_read_cmd: std_logic :='0';
variable temp_physical_write_cmd: std_logic :='0';
--variable ram_inib
variable temp_inib_ram: std_logic :='1';
variable temp_inib_physical: std_logic :='1';
variable final_temp_inib_ram: std_logic :='0';
variable final_temp_inib_physical: std_logic :='0';
variable total_inib_ram: std_logic :='1';--systeme pour bien rendre incompatible les controller => 1 de activé les suivant sont tous désactivé
variable total_inib_physical: std_logic :='1';
begin
temp_physical_read_cmd:='0';
temp_physical_write_cmd:='0';
temp_ddr_read_cmd:='0';
temp_ddr_write_cmd:='0';
for I in N_ctrler-1 downto 0 loop
    --boucle des cmd si 1 controller envoie le sous-controller recoit
    temp_ddr_read_cmd:=ctrl_ddr_read_cmd(I)or temp_ddr_read_cmd;
    temp_ddr_write_cmd:=ctrl_ddr_write_cmd(I)or temp_ddr_write_cmd;
    temp_physical_read_cmd:=ctrl_physical_read_cmd(I)or temp_physical_read_cmd;
    temp_physical_write_cmd:=ctrl_physical_write_cmd(I)or temp_physical_write_cmd;
    total_inib_ram:=temp_inib_ram and total_inib_ram;--on cherche le premier pas inib donc à 0 => total est à 0 au premier 0 croisé
    total_inib_physical:=temp_inib_physical and total_inib_physical;
    --synthese des inib
    temp_inib_ram:='0';
    temp_inib_physical:='0';
   for k_high in N_ctrler-1 downto I+1 loop--high priority
        temp_inib_ram:=inib_ram_other_high_priority(k_high) or temp_inib_ram;
        temp_inib_physical:=inib_physical_other_high_priority(k_high) or temp_inib_ram;
   end loop;
   for k_low in I-1 downto 0 loop--low priority
        temp_inib_ram:=inib_ram_other_low_priority(k_low) or temp_inib_ram;
        temp_inib_physical:=inib_physical_other_low_priority(k_low) or temp_inib_ram;
   end loop;  
   final_temp_inib_ram:=temp_inib_ram ;--le premier activé désactive les autres
   final_temp_inib_physical:=temp_inib_physical;--le premier activé désactive les autres
   --inib_ram(I)<='0';
   --inib_physical(I)<='0';

   inib_physical(I)<=final_temp_inib_ram;
   inib_ram(I)<=final_temp_inib_physical;
   --buffer de lecture
end loop;
ddr_read_cmd<=temp_ddr_read_cmd;
ddr_write_cmd<=temp_ddr_write_cmd;
physical_read_cmd<=temp_physical_read_cmd;
physical_write_cmd<=temp_physical_write_cmd;
end process;

inib_read_data_mat<=(others=>(others=>'0')) when RST='0' else next_inib_read_data_mat when rising_edge(CLK);
--last_controler_arrived<=(others=>'0')when RST='0' else next_last_controler_arrived when rising_edge(CLK);


inib_read_data_algo:for I in N_ctrler-1 downto 0 generate
inib_read_data_mask<=(I=>'1',others=>'0');--etat final d'une colone est un 1 sur la valeur I correpsondante
col_sum_mat(I)<= '1' when inib_read_data_mat(I)=inib_read_data_mask else '0';-- est a 1 lorsqu'une collone est en premier de la file d'attente
next_inib_read_data_mat(I)<= zero_col when waiting_ram_read(I)='0'else waiting_ram_read when waiting_ram_read(I)='1' and inib_read_data_mat(I)=zero_col else inib_read_data_mat(I)and waiting_ram_read;

--next_last_controler_arrived(I)<='0' when waiting_ram_read(I)='0' else '1' when waiting_ram_read(I)='1' and col_sum_mat(I)='1' else '0' when (waiting_ram_read and col_sum_mat)/=zero_col and not col_sum_mat/=zero_col  else last_controler_arrived(I);
end generate;
inib_read_data<= not(col_sum_mat and waiting_ram_read);--inib si à 1
CTRL:
for I in N_ctrler-1 downto 0 generate
 ARB_I:arbitrated_mem_controller 
 Port map(
 --
 CLK => CLK,
 interface_clk  =>ddr_interface_clk,
 RST=> RST,
 --entré
 Write_Read =>Write_Read(I),
 upper_addr =>upper_addr(I),
 lower_addr => lower_addr(I),
 addr_mode => addr_mode(I),
 Read_data => Read_data(I),
 Write_data => Write_data(I),
 
  --donné non passé au sous controller
 ext_address_bit =>ext_address_bit(I),
 new_command =>new_command(I),--mis a un 1 lorsque nouvelle commande 
 
 --etat passé au controlleur suivant
 ddr_read_cmd =>  ctrl_ddr_read_cmd(I) ,
 ddr_write_cmd =>  ctrl_ddr_write_cmd(I) ,
 
 physical_read_cmd  =>ctrl_physical_read_cmd(I) ,
 physical_write_cmd =>ctrl_physical_write_cmd(I) ,
 
 --réponse du sous controlleur
 sync_rd_data_valid => ddr_sync_rd_data_vaild,
 physical_rd_data_valid => physical_rd_data_valid,
 read_ack => ddr_read_ack,
 write_ack => ddr_write_ack,
 
 --donné à passer  
 ddr_rd_data => ddr_rd_data,
 ddr_wr_data => ddr_wr_data, 
 ddr_write_mask => ddr_write_mask,
 --adress
 ddr_upper_addr => ddr_upper_addr,
 ddr_lower_addr => ddr_lower_addr,
 --interface physique
 physical_upper_addr=> physical_upper_addr,
 physical_lower_addr => physical_lower_addr,
 physical_rd_data=> physical_rd_data,
 physical_wr_data =>physical_wr_data,
 physical_write_mask=>physical_write_mask,
 
 --interaction entre les controlleur
 inib_ram=>inib_ram(I),
 inib_physical=>inib_physical(I),
 inib_read_data=>inib_read_data(I),
 waiting_ram_read => waiting_ram_read(I),
 --aucun controller ne doit avoir les même priorité réciproque
 inib_ram_other_high_priority          => inib_ram_other_high_priority     (I),
 inib_ram_other_low_priority           => inib_ram_other_low_priority      (I),
 inib_physical_other_high_priority     => inib_physical_other_high_priority(I),
 inib_physical_other_low_priority      => inib_physical_other_low_priority (I),
 
 --signal de validation
 command_finish =>command_finish(I)
 
  );

end generate;



DDRAM: ddram_controller 
 Port map( 
     --port DDRAM  
 ddr2_dq       =>  ddr2_dq   ,
 ddr2_dqs_p    =>  ddr2_dqs_p ,
 ddr2_dqs_n    =>  ddr2_dqs_n ,
 ddr2_addr     =>  ddr2_addr ,
 ddr2_ba       =>  ddr2_ba   ,
 ddr2_ras_n    =>  ddr2_ras_n,
 ddr2_cas_n    =>  ddr2_cas_n,
 ddr2_we_n     =>  ddr2_we_n ,
 ddr2_ck_p     =>  ddr2_ck_p ,
 ddr2_ck_n     =>  ddr2_ck_n ,
 ddr2_cke      =>  ddr2_cke  ,
 ddr2_cs_n     =>  ddr2_cs_n ,
 ddr2_dm       =>  ddr2_dm   ,
 ddr2_odt      =>  ddr2_odt  ,
 --interface
 rd_data =>ddr_rd_data,
 wr_data =>ddr_wr_data,
 --cmd inteface
 write_cmd =>ddr_write_cmd,
 read_cmd  =>ddr_read_cmd,
 read_ack  =>ddr_read_ack,
 write_ack =>ddr_write_ack,
 sync_rd_data_vaild =>ddr_sync_rd_data_vaild,
 
 write_mask =>ddr_write_mask,
 --adress   
 upper_addr =>ddr_upper_addr,
 lower_addr =>ddr_lower_addr,
 --clock
 interface_clk =>ddr_interface_clk,
 master_CLK =>master_CLK,
 RST => RST
 );
 
 phys: physical_controller 
   Port map( 
   --commande
   read_cmd=>physical_read_cmd,
   write_cmd=>physical_write_cmd,
  
 rd_data => physical_rd_data,
 wr_data => physical_wr_data,
 upper_addr => physical_upper_addr,
 lower_addr => physical_lower_addr,
 write_mask => physical_write_mask,
 --on ne peut pas acceder a des division qui ne sont pas dans le mot de 64bit
 physical_rd_data_valid  => physical_rd_data_valid,
 
 --on connect maintenant au port extern bi directionelle 512 adress => "000000000000000XXXXXXXXX"
 extern_port=>io_extern_port,
 extern_port_EN=>io_extern_port_EN,
 extern_port_WE=>io_extern_port_WE,
 extern_port_rd_valid =>io_extern_port_rd_valid,
 --clk
 CLK=>physical_clk,
  io_clk => io_clk,
 RST=> RST
  );

end Behavioral;

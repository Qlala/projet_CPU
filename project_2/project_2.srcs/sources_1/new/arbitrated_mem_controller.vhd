----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2018 17:01:12
-- Design Name: 
-- Module Name: arbitrated_mem_controller - Behavioral
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

entity arbitrated_mem_controller is
 Port (
 --
 CLK:in std_logic;
 interface_clk : in std_logic;
 RST:in std_logic;
 --entré
 Write_Read : in STD_LOGIC;
 upper_addr : in std_logic_vector (23 downto 0);--mot de 64 bits =>
 lower_addr : in std_logic_vector (2 downto 0):="0";--adresse basse : choisi le demi-mot de 16 bit à placer au debut
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
end arbitrated_mem_controller;

architecture Behavioral of arbitrated_mem_controller is
type state_type is (idle,handshake,wait_other_controller_write,wait_other_controller_read,sending_read,sending_write,wait_ram_read,sending_physical_read,sending_physical_write,wait_physical_read);
signal current_state : state_type;
signal next_state : state_type;
--sauvegarde annulé => on authorisé pas le changement tant que pas de réponse
signal saved_ext_address_bit :std_logic;
signal saved_upper_addr : std_logic_vector (23 downto 0);--mot de 64 bits =>
signal saved_lower_addr :  std_logic_vector (2 downto 0):="0";--adresse basse : choisi le demi-mot de 16 bit à placer au debut
signal saved_addr_mode :  std_logic_vector(1 downto 0):="00";-- 10 => 32 bit  11 => 64 bit  00=> 8 bit et 01=> 16 bit
signal saved_Write_data : STD_LOGIC_VECTOR (63 downto 0);
--signal port : compatible avec le passage en haute impéndance
signal port_ddr_wr_data :   std_logic_vector(63 downto 0); 
signal port_ddr_upper_addr :  std_logic_vector (23 downto 0);--mot de 64 bits =>
signal port_ddr_lower_addr :  std_logic_vector (1 downto 0);--adresse basse : choisi le mot de 16 bit à placer au debut

signal port_physical_upper_addr: std_logic_vector (23 downto 0);
signal port_physical_lower_addr : std_logic_vector (1 downto 0):="00";
signal port_physical_wr_data : std_logic_vector(63 downto 0); 

signal port_write_mask :std_logic_vector(7 downto 0);
--read buffer
signal read_buffer : std_logic_vector(63 downto 0);
signal next_read_buffer : std_logic_vector(63 downto 0);

--ack ddr
signal my_read_ack : std_logic;
signal my_write_ack : std_logic;
signal next_my_read_ack : std_logic;
signal next_my_write_ack : std_logic;


begin
next_my_read_ack<= '0'when current_state=idle else read_ack;
next_my_write_ack<= '0'when current_state=idle else write_ack;

my_read_ack<=next_my_read_ack when rising_edge(interface_clk);--seul registre synchronisé sur la clock de la ddr
my_write_ack<=next_my_write_ack when rising_edge(interface_clk);--seul registre synchronisé sur la clock de la ddr

current_state<=next_state when rising_edge(CLK);
state_machin:process(current_state,my_read_ack,my_write_ack,new_command,ext_address_bit,inib_ram,inib_read_data,sync_rd_data_valid,Write_read)
begin
    case(current_state) is
        when idle =>
            if new_command='1' then
                if ext_address_bit='0' then -- on est en ram
                    if inib_ram='0' then --pas inibé on a le droit d'interagir
                        if Write_read='1' then--read=1
                            next_state<=sending_read;
                        else
                            next_state<=sending_write;
                        end if;
                    else --on est inibé on doit donc attendre
                        if Write_read='1' then--read=1
                            next_state<=wait_other_controller_read;
                         else
                            next_state<=wait_other_controller_write;
                        end if;
                    end if;
                else --adress physique
                    if Write_read='1' then--read=1
                        next_state<=sending_physical_read;
                    else
                        next_state<=sending_physical_write;
                    end if;
                    
                end if;
            else--pas de commande
                next_state<=idle;
            end if;
      when wait_other_controller_read =>
                    if ext_address_bit='0' then -- on est en ram
                        if inib_ram='0' then --pas inibé on a le droit d'interagir
                               next_state<=sending_read;
                        else --on est inibé on doit donc attendre
                                next_state<=wait_other_controller_read;
                        end if;
                    else --adress physique
                         if inib_physical='0' then
                            next_state<=sending_physical_read;
                          else
                            next_state<=wait_other_controller_read;
                          end if;
                    end if;
     when wait_other_controller_write =>
          if ext_address_bit='0' then -- on est en ram
              if inib_ram='0' then --pas inibé on a le droit d'interagir
                   next_state<=sending_write;
               else --on est inibé on doit donc attendre
                   next_state<=wait_other_controller_write;
               end if;
           else --adress physique
              if inib_physical='0' then
                   next_state<=sending_physical_write;
               else
                    next_state<=wait_other_controller_write;
               end if;
          end if;                                   
     when sending_read =>
        if my_read_ack='1' then --on a fini
            next_state<=wait_ram_read;
        else
            next_state<=current_state;
        end if;
    when sending_write=>
        if my_write_ack='1' then
            next_state<=handshake;
        else
            next_state<=current_state;
        end if;
     when wait_ram_read=>
        if sync_rd_data_valid='1' and inib_read_data='0' then--on doit pas etre inibé
            next_state<=handshake;
        else
            next_state<=current_state;
        end if;
      when sending_physical_read =>
            next_state<=wait_physical_read;--les envoie de lecture ne prennent qu'un cycle (au pire elle donne dans un registre)
      when sending_physical_write =>
            next_state<=handshake;
      when wait_physical_read=>
         if physical_rd_data_valid='1' then--on ne prend pas en compte les adress physique ultra lente moins de 4 cycle processeur de réaction 
            next_state<=handshake;
         else
         next_state<=current_state;
         end if;
      when handshake=>
        if new_command='0' then
            next_state<=idle;
        else
            next_state<=handshake;
        end if;
    end case;
end process;
sync_CTRL_machin:process(CLK)
begin
    case(next_state)is
        when sending_read =>
                port_ddr_upper_addr<=upper_addr;
                port_ddr_lower_addr<=lower_addr;
         when sending_write =>
                  port_ddr_upper_addr<=upper_addr;
                  port_ddr_lower_addr<=lower_addr;
                  --saved_addr_mode<=addr_mode;
                  port_ddr_wr_data<=write_data;

          --sauvergarde de la commande   
          --when wait_other_controller_read =>
               -- saved_upper_addr<=upper_addr;
               -- saved_lower_addr<=lower_addr;
          --when wait_other_controller_write=>
               -- saved_upper_addr<=upper_addr;
               -- saved_lower_addr<=lower_addr;
                --saved_Write_data<=write_data;
               -- saved_addr_mode<=addr_mode;
          when sending_physical_read => 
                port_physical_upper_addr<=upper_addr;
                port_physical_lower_addr<=lower_addr;
                           
          when sending_physical_write => 
                 port_physical_upper_addr<=upper_addr;
                 port_physical_lower_addr<=lower_addr;
                 port_physical_wr_data<=write_data;
    end case;
end process;
async_CTRL_machin:process(current_state):
begin
case(current_state) is
    when idle =>
        command_finish<='0';
        ddr_read_cmd<='0';
        ddr_write_cmd<='0';
        physical_read_cmd<='0';
        physical_write_cmd<='0';
    --lecture écriture
    when sending_read=>
        command_finish<='0';
        ddr_read_cmd<='1';
        ddr_write_cmd<='0';
        physical_read_cmd<='0';
        physical_write_cmd<='0';
    when sending_write=>
         command_finish<='0';
         ddr_read_cmd<='0';
         ddr_write_cmd<='1';
         physical_read_cmd<='0';
         physical_write_cmd<='0';
     when sending_physical_read=>
         command_finish<='0';
         ddr_read_cmd<='0';
         ddr_write_cmd<='0';
         physical_read_cmd<='1';
         physical_write_cmd<='0';  
     when sending_physical_write=>
         command_finish<='0';
         ddr_read_cmd<='0';
         ddr_write_cmd<='0';
         physical_read_cmd<='0';
         physical_write_cmd<='1';
    --attente
    when wait_other_controller_read=>
         command_finish<='0';
         ddr_read_cmd<='0';
         ddr_write_cmd<='0';
         physical_read_cmd<='0';
         physical_write_cmd<='0';         
    when wait_other_controller_write=>
        command_finish<='0';
        ddr_read_cmd<='0';
        ddr_write_cmd<='0';
        physical_read_cmd<='0';
        physical_write_cmd<='0';
    when wait_ram_read=>
        command_finish<='0';
        ddr_read_cmd<='0';
        ddr_write_cmd<='0';
        physical_read_cmd<='0';
        physical_write_cmd<='0';
    when wait_physical_read=>
        command_finish<='0';
        ddr_read_cmd<='0';
        ddr_write_cmd<='0';
        physical_read_cmd<='0';
        physical_write_cmd<='0';
     when handshake=>
        command_finish<='1';
        ddr_read_cmd<='0';
        ddr_write_cmd<='0';
        physical_read_cmd<='0';
        physical_write_cmd<='0';
end case;
case(addr_mode) is
    when "00"=>--mode 64 bit
        port_write_mask<="11111111";
    when "01"=> --mode 32 bit
        port_write_mask<="00001111";
    when "10"=>
        port_write_mask<="00000011";
    when "11"=>--octet => pas vraiment d'interet
        port_write_mask<="00000001";
end case;

end process;
--piorité
inib_ram_other_high_priority<='1' when current_state=sending_read or current_state=sending_write or next_state=sending_read else '0';
inib_ram_other_low_priority<='1' when current_state=sending_read or current_state=sending_write else '0' ;
--pour le physic l'attente est bloquante
inib_physical_other_high_priority<='1' when current_state=sending_physical_read or  current_state=wait_physical_read or current_state=sending_physical_write or next_state=sending_physical_read else '0';
inib_physical_other_low_priority<='1' when current_state=sending_physical_read or current_state=wait_physical_read or current_state=sending_physical_write else '0' ;
--pas d'inib => qu'un seul peu être en attente. (prévoir des registre pour les attente plus longue) ( un registre peu etre lu pour avertir de la fin de la lecture qui est placé dans un autre registre)

next_read_buffer<= ddr_rd_data when ext_address_bit='0' and current_state=wait_ram_read and sync_rd_data_valid='1' and inib_read_data='0' else physical_rd_data when ext_address_bit='1' and current_state=wait_physical_read and physical_rd_data_valid='1' else read_buffer;
read_buffer<=next_read_buffer when rising_edge(CLK);

--compatibilté a la haute impéndance
ddr_upper_addr<=port_ddr_upper_addr when inib_ram='0' else (others=>'Z');
ddr_lower_addr<=port_ddr_lower_addr when inib_ram='0' else (others=>'Z');
ddr_wr_data<=port_ddr_wr_data when inib_ram='0' else (others=>'Z');
ddr_write_mask<=port_write_mask when inib_ram='0' else (others=>'Z');

physical_upper_addr<=port_physical_upper_addr when inib_physical='0' else (others=>'Z');
physical_lower_addr<=port_physical_lower_addr when inib_physical='0' else (others=>'Z');
physical_wr_data<=port_physical_wr_data when inib_physical='0' else (others=>'Z');
physical_write_mask<=port_write_mask when inib_physical='0' else (others=>'Z');
--synthese des inib des autre controlleur
waiting_ram_read<='1' when current_state=wait_ram_read else '0';
end Behavioral;

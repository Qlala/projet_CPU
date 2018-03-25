----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2018 15:41:41
-- Design Name: 
-- Module Name: memory_controller - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;
use work.CPU_package.all;

entity memory_controller is
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
    --interface de sortie pour les adress physical
    --le controlleur doit faire l'abritrage entre les différente interface ici aussi
    --il n'as cependant pas a adapter la taille des lecture au mémoire utilisé
    --un autre composant devra etre designé pour passer à de plus petite adresse
    physical_adress: out std_logic_vector (23 downto 0);
    physical_lower_adress: out std_logic_vector (3 downto 0);
    physical_Read_data : in STD_LOGIC_VECTOR (63 downto 0);
    physical_Write_data : out STD_LOGIC_VECTOR (63 downto 0); 
    physical_new_command : out STD_logic;--mis a un 1 lorsque nouvelle commande 
    physical_command_finish : in STD_logic;  
    
    --interface 1 registre
    --ne pas oublier qu'il y a un bit inutilisé dans les adresse
    -- 
    ext_adrress_bit : in STD_LOGIC;
    upper_addr : in std_logic_vector (23 downto 0);--mot de 64 bits =>
    lower_addr : in std_logic_vector (2 downto 0):="0";--adresse basse : choisi le demi-mot de 16 bit à placer au debut
    addr_mode : in std_logic_vector(1 downto 0):="00";-- 10 => 32 bit  11 => 64 bit  00=> 8 bit et 01=> 16 bit
    Read_data : out STD_LOGIC_VECTOR (63 downto 0);
    Write_data : in STD_LOGIC_VECTOR (63 downto 0);
    new_command : in STD_logic;--mis a un 1 lorsque nouvelle commande 
    command_finish : out STD_logic;  
    Write_Read : in STD_LOGIC;
    
    --interface 2 lecture de ligne d'instuction
    ext_adrress_bit_2 : in STD_LOGIC;
    upper_addr_2 : in std_logic_vector (23 downto 0);--position du Compteur programe
    --lower_addr_2 : in std_logic_vector (0 downto 0):="0";
    Read_data_2 : out STD_LOGIC_VECTOR (63 downto 0);
    --Write_data_2 : in STD_LOGIC_VECTOR (63 downto 0); on est forcément en read
    new_command_2 : in STD_logic;--mis a un 1 lorsque nouvelle commande 
    command_finish_2 : out STD_logic
    );
end memory_controller;

architecture Behavioral of memory_controller is
signal app_addr                  :     std_logic_vector(26 downto 0) := (others =>'0') ;
signal app_cmd                   :     std_logic_vector(2 downto 0):= (others =>'0') ;
signal app_en                    :     std_logic:='0';
signal app_wdf_data              :    std_logic_vector(63 downto 0):= (others =>'0') ;
signal app_wdf_end               :     std_logic:='0';
signal app_wdf_mask         :    std_logic_vector(7 downto 0):="11110000" ;

signal app_wdf_wren              :     std_logic:='0';
signal app_rd_data               :    std_logic_vector(63 downto 0):= (others =>'0') ;

signal app_rd_data_end           :    std_logic:='0';
signal app_rd_data_valid         :    std_logic:='0';
signal app_rdy                   :   std_logic:='0';
signal app_wdf_rdy               :    std_logic:='0';
signal app_sr_req                :     std_logic:='0';
signal app_ref_req               :     std_logic:='0';
signal app_zq_req                :     std_logic:='0';
signal app_sr_active             :    std_logic:='0';
signal app_ref_ack               :    std_logic:='0';
signal app_zq_ack                :    std_logic:='0';
signal  ui_clk                    :   std_logic:='0';
signal ui_clk_sync_rst           :    std_logic:='0';
signal init_calib_complete       :    std_logic:='0';
-- System Clock Ports
signal sys_clk_i                      :    std_logic;
signal sys_rst:    std_logic;
component mig_7series_0 is
  port (
    ddr2_dq       : inout std_logic_vector(15 downto 0) ;
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
    app_addr                  : in    std_logic_vector(26 downto 0);
    app_cmd                   : in    std_logic_vector(2 downto 0);
    app_en                    : in    std_logic;
    app_wdf_data              : in    std_logic_vector(63 downto 0);
    app_wdf_end               : in    std_logic;
    app_wdf_mask         : in    std_logic_vector(7 downto 0);
    app_wdf_wren              : in    std_logic;
    app_rd_data               : out   std_logic_vector(63 downto 0);
    app_rd_data_end           : out   std_logic;
    app_rd_data_valid         : out   std_logic;
    app_rdy                   : out   std_logic;
    app_wdf_rdy               : out   std_logic;
    app_sr_req                : in    std_logic;
    app_ref_req               : in    std_logic;
    app_zq_req                : in    std_logic;
    app_sr_active             : out   std_logic;
    app_ref_ack               : out   std_logic;
    app_zq_ack                : out   std_logic;
    ui_clk                    : out   std_logic;
    ui_clk_sync_rst           : out   std_logic;
    init_calib_complete       : out   std_logic;
    --ref clock
    -- System Clock Ports
    sys_clk_i                      : in    std_logic;
    sys_rst                     : in    std_logic
  );
end component mig_7series_0;

signal last_new_command : std_logic;
signal command_state : std_logic;
signal next_command_state : std_logic;

--readbuffer
signal read_buffer : std_logic_vector(63 downto 0);
signal next_read_buffer : std_logic_vector(63 downto 0);
signal app_rd_data_delayed :    std_logic_vector(63 downto 0):= (others =>'0') ;

signal read_buffer_2 : std_logic_vector(63 downto 0);
signal next_read_buffer_2 : std_logic_vector(63 downto 0);

signal sync_read_data : std_logic;
signal next_sync_read_data : std_logic;
signal inib_read: std_logic;
signal next_inib_read: std_logic;

signal sync_read_data_2 : std_logic;
signal next_sync_read_data_2 : std_logic;
signal inib_read_2: std_logic;
signal next_inib_read_2: std_logic;

--synchronisation avec l'ui_clk
signal intern_Write_Read :std_logic;
signal intern_new_command :std_logic;
signal intern_new_command_2 :std_logic;
signal intern_upper_addr : std_logic_vector (23 downto 0);
signal intern_upper_addr_2 : std_logic_vector (23 downto 0);
signal intern_lower_addr : std_logic_vector (2 downto 0);--adressage par packet de 8
signal  intern_addr_mode :  std_logic_vector(1 downto 0);

type intern_state_type is (not_calib,idle,sending_ram_read,waiting_ram_response_read,waiting_ram_response_write,handshake_command,waiting_other_controller_read,waiting_other_controller_write);
type extern_state_type is (idle,waiting_response_read,waiting_response_write,handshake_command,waiting_other_controller_read,waiting_other_controller_write);
signal current_state : intern_state_type:=not_calib;
signal next_state : intern_state_type:=not_calib;
signal current_state_2 : intern_state_type:=not_calib;
signal next_state_2 : intern_state_type:=not_calib;
signal physical_current_state : extern_state_type:=idle;
signal next_physical_state : extern_state_type:=idle;
signal physical_current_state_2 : extern_state_type:=idle;
signal next_physical_state_2 : extern_state_type:=idle;

signal command_finish_signal:std_logic:='0';
signal command_finish_signal_2:std_logic:='0';

signal next_app_wdf_mask   : std_logic_vector(7 downto 0);
begin

sys_clk_i <= master_CLK;
 u_mig_7series_0 : mig_7series_0
    port map (
      -- Memory interface ports
      ddr2_addr                      => ddr2_addr,
      ddr2_ba                        => ddr2_ba,
      ddr2_cas_n                     => ddr2_cas_n,
      ddr2_ck_n                      => ddr2_ck_n,
      ddr2_ck_p                      => ddr2_ck_p,
      ddr2_cke                       => ddr2_cke,
      ddr2_ras_n                     => ddr2_ras_n,
      ddr2_we_n                      => ddr2_we_n,
      ddr2_dq                        => ddr2_dq,
      ddr2_dqs_n                     => ddr2_dqs_n,
      ddr2_dqs_p                     => ddr2_dqs_p,
      init_calib_complete            => init_calib_complete,
      ddr2_cs_n                      => ddr2_cs_n,
      ddr2_dm                        => ddr2_dm,
      ddr2_odt                       => ddr2_odt,
      -- Application interface ports
      app_addr                       => app_addr,
      app_cmd                        => app_cmd,
      app_en                         => app_en,
      app_wdf_data                   => app_wdf_data,
      app_wdf_end                    => app_wdf_end,
      app_wdf_wren                   => app_wdf_wren,
      app_rd_data                    => app_rd_data,
      app_rd_data_end                => app_rd_data_end,
      app_rd_data_valid              => app_rd_data_valid,
      app_rdy                        => app_rdy,
      app_wdf_rdy                    => app_wdf_rdy,
      app_sr_req           => '0',
      app_sr_active        => open,
      app_ref_req          => '0',
      app_ref_ack          => open,
      app_zq_req           => '0',
      app_zq_ack           => open,
      ui_clk                         => ui_clk,
      ui_clk_sync_rst                => ui_clk_sync_rst,
      app_wdf_mask                   => app_wdf_mask,
      -- System Clock Ports
      sys_clk_i                       => master_CLK,
      sys_rst                        => RST
    );

--app_addr(15 downto 0)<= addr;
--last_new_command<= new_command when rising_edge(ui_clk);
--app_wdf_data(15 downto 0)<= Write_data;
--command_state<=next_command_state when rising_edge(ui_clk);
--next_command_state<='1' when new_command='1' and last_new_command='0'else '0';
--app_en<= new_command;
--app_wdf_wren<=new_command;
--app_wdf_end<=new_command and not Write_Read;
--app_wdf_wren<=new_command and not Write_Read;--active l'ecriture

--app_wdf_end<=command_state and not Write_Read;--pas obligatoire rend compte de la fin de la serie de burst
--command_finish<=init_calib_complete;
--app_rdy<='1';

current_state<=not_calib when RST= '0' else next_state when rising_edge(ui_clk);
current_state_2<=not_calib when RST= '0' else next_state_2 when rising_edge(ui_clk);
SYNC_ui_clk: process(ui_clk)
begin
  if rising_edge(ui_clk) then
      intern_Write_Read <=Write_Read;
      intern_new_command <=new_command and not ext_adrress_bit;--on active les command que si l'adresse contient
      intern_new_command_2 <=new_command_2 and not ext_adrress_bit_2;
      intern_upper_addr<= upper_addr;
      intern_upper_addr_2 <= upper_addr_2;
      intern_lower_addr <= lower_addr;
      intern_addr_mode<=addr_mode;
   end if;
end process;

--machine d'état pour le controller 1 : lecture ecriture
process(init_calib_complete,current_state,current_state_2,app_rdy,intern_new_command,intern_new_command_2,app_rd_data_end,app_rd_data_valid,app_wdf_rdy,intern_Write_read)
begin
 case(current_state) is
        when not_calib =>
               if init_calib_complete ='1' and app_rdy ='1' then
                        next_state<=idle;
               else
                   next_state<=current_state;
               end if;
        when idle =>
            if intern_new_command='1' then
                if intern_Write_read='0' then -- write=0
                    if not (current_state_2=waiting_ram_response_write or current_state_2=sending_ram_read) and intern_new_command_2='0' then
                        if  app_rdy='1' and (app_wdf_rdy='1' or app_wdf_rdy='0') then
                            next_state<=waiting_ram_response_write;
                        else
                            next_state<=current_state;
                        end if;
                     else
                        next_state<=waiting_other_controller_write;
                     end if;
                      
                else  -- read=1
                  if not (current_state_2=waiting_ram_response_write or current_state_2=sending_ram_read) and intern_new_command_2='0' then
                      if app_rdy='1' then
                               next_state<=sending_ram_read;
                        else
                              next_state<=current_state;
                       end if;
                  else
                     next_state<=waiting_other_controller_read;
                  end if;
                end if;
            else
                next_state<=current_state;
            end if;
         when waiting_other_controller_read=>
              if not (current_state_2=waiting_ram_response_write or current_state_2=sending_ram_read) and intern_new_command_2='0' then
                if app_rdy='1' then
                      next_state<=sending_ram_read;
                else
                      next_state<=current_state;
                end if;
              else
               next_state<=waiting_other_controller_read;
            end if;
        when waiting_other_controller_write=>
              if not (current_state_2=waiting_ram_response_write or current_state_2=waiting_ram_response_read) and intern_new_command_2='0' then
                if  app_rdy='1' and (app_wdf_rdy='1' or app_wdf_rdy='0') then
                     next_state<=waiting_ram_response_write;
                 else
                     next_state<=current_state;
                 end if;
                      else
                 next_state<=waiting_ram_response_write;
                 end if;
         when sending_ram_read=>
          if current_state_2=waiting_other_controller_read or current_state_2=waiting_other_controller_write then
            if app_rd_data_valid='1' and app_rd_data_end='1'  then
                next_state<=handshake_command;
             else
                 next_state<=waiting_ram_response_read;
             end if;
          else
            next_state<=waiting_ram_response_read;
          end if;
             
         when waiting_ram_response_write =>
            if app_rdy='1' then
                next_state<=handshake_command;
             else
                    next_state<=current_state;
             end if;
        when waiting_ram_response_read =>
            if app_rd_data_valid='1' and app_rd_data_end='1'  then
                next_state<=handshake_command;
             else
                 next_state<=current_state;
             end if;
         when handshake_command=>
            if intern_new_command='0' then
                next_state<=idle;
            else
                next_state<=current_state;
            end if;
       end case;                                 
end process;
--controller 2
process(init_calib_complete,current_state,current_state_2,app_rdy,intern_new_command,intern_new_command_2,app_rd_data_end,app_rd_data_valid,app_wdf_rdy,intern_Write_read)
begin
 case(current_state_2) is
        when not_calib =>
               if init_calib_complete ='1' and app_rdy ='1' then
                        next_state_2<=idle;
               else
                   next_state_2<=current_state;
               end if;
        when idle =>
            if intern_new_command_2='1' then--que des read
                  if not (current_state=waiting_ram_response_write or current_state=sending_ram_read) then
                      if app_rdy='1' then
                               next_state_2<=sending_ram_read;
                        else
                              next_state_2<=current_state;
                       end if;
                  else
                     next_state_2<=waiting_other_controller_read;
                  end if;
            else
                next_state_2<=current_state;
            end if;
         when waiting_other_controller_read=>
              if not (current_state=waiting_ram_response_write or current_state=sending_ram_read) then
                if app_rdy='1' then
                      next_state_2<=sending_ram_read;
                else
                      next_state_2<=current_state;
                end if;
              else
               next_state_2<=waiting_other_controller_read;
            end if;
         when sending_ram_read=>
          if current_state=waiting_other_controller_read or current_state=waiting_other_controller_write then
                 if app_rd_data_valid='1' and app_rd_data_end='1'  then
                    next_state_2<=handshake_command;
                else
                    next_state_2<=waiting_ram_response_read;
                 end if;
          else
                next_state_2<=waiting_ram_response_read;
          end if;
             
        when waiting_ram_response_read =>
            if app_rd_data_valid='1' and app_rd_data_end='1'  then
                next_state_2<=handshake_command;
             else
                 next_state_2<=current_state;
             end if;
         when handshake_command=>
            if intern_new_command='0' then
                next_state_2<=idle;
            else
                next_state_2<=current_state;
            end if;
          when others =>
                next_state_2<=current_state;
       end case;                                 
end process;

physyical_State_machine: process(physical_current_state,new_command,Write_read)--on est forcement synchronise
begin
case(physical_current_state) is
    when idle =>
        if new_command and current_state=idle or current_state=not_calib and nnew_command='1' and ext_adress_bit='1' then
            if Write_read='1' then
                next_physical_state<=waiting_response_read;
            else
                next_physical_state<=waiting_response_write;
            end if;
        else
            next_physical_state<=idle;
        end if;
    when waiting_response_read=>
        if physical_command_finish='1' then
            next_physical_state<=handshake_command;
        else
            next_physical_state<=waiting_response_read;
        end if;
    when waiting_response_read =>
        if physical_command_finish='1' then
            next_physical_state<=handshake_command;
         else
             next_physical_state<=waiting_response_read;
         end if;
     when handshake_command =>
        if new_command='0'then
            next_physical_state<=idle;
        else
            next_physical_state<=handshake_command;
        end if;
end case;
end process;
physical_state_machine_output: process(physical_current_state,CLK,physical_current_state_2)
begin
    if rising_edge(CLK) then
        
    end if;
    
end process;

--bufer de lecture
next_Read_buffer<=app_rd_data when sync_read_data='1' and ext_adrress_bit='0'  else physical_Read_data when ext_adrress_bit='1' and physical_command_finish='1' and physical_current_state=waiting_response_read else Read_buffer;
next_Read_buffer_2<=app_rd_data when sync_read_data_2='1' and ext_adrress_bit_2='0' else physical_Read_data when ext_adrress_bit_2='1' and physical_command_finish='1' and physical_current_state_2=waiting_response_read else Read_buffer;--taille des donné phyique?
--condition d'activation
next_sync_read_data<='1' when app_rd_data_valid='1' and (current_state=waiting_ram_response_read or current_state=sending_ram_read) and inib_read='1' else '0';
sync_read_data<= next_sync_read_data when rising_edge(ui_clk);
next_sync_read_data_2<='1' when app_rd_data_valid='1' and (current_state_2=waiting_ram_response_read or current_state_2=sending_ram_read) and inib_read_2='1' else '0';
sync_read_data_2<= next_sync_read_data_2 when rising_edge(ui_clk);

--inib
inib_read<=next_inib_read when rising_edge(ui_clk);
inib_read_2<=next_inib_read_2 when rising_edge(ui_clk);

--un système bien complique qui inib le 2eme arrivé => on inib  lorsqu'inib passe à 0
next_inib_read_2<=not inib_read when current_state=waiting_ram_response_read or current_state=sending_ram_read else  '1';
next_inib_read<=not inib_read_2 when current_state_2=waiting_ram_response_read or current_state_2=sending_ram_read else '1';

Read_buffer<=(others=>'1')when RST='0' else next_Read_buffer when rising_edge(ui_clk);
app_rd_data_delayed<=app_rd_data when rising_edge(ui_clk);
app_wdf_data<=Write_data;

next_app_wdf_mask<="11111111" when intern_addr_mode="11" else "00001111" when intern_addr_mode="10" else "00000011" when intern_addr_mode="01" else "00000001" ;  
Moore_machine_outuput: process(ui_clk,current_state,current_state_2)
begin
if rising_edge(ui_clk) then
    case(current_state) is
       when idle => 
           --led_Test(2 downto 0)<="010";
           command_finish_signal<='0';    
       when waiting_ram_response_write =>
            --led_Test(2 downto 0)<="100";
            command_finish_signal<='0';
       when waiting_ram_response_read =>
          -- led_Test(2 downto 0)<="001";
           command_finish_signal<='0';
        when handshake_command=>
            --led_Test(2 downto 0)<="111";
           command_finish_signal<='1';
        when others=>
            
      end case;
      case(current_state_2) is
         when idle =>   
             command_finish_signal_2<='0';
         when waiting_ram_response_write =>
              command_finish_signal_2<='0';
         when waiting_ram_response_read =>
             command_finish_signal_2<='0';
          when handshake_command=>
             command_finish_signal_2<='1';
           when others=>
        end case;
      if next_state=waiting_ram_response_write or next_state=sending_ram_read or next_state=waiting_ram_response_read then
            app_addr(26 downto 0)<=  intern_upper_addr(23 downto 0) &"0" & intern_lower_addr(2 downto 1) ;
            app_wdf_mask<=next_app_wdf_mask;
       else
            if next_state_2=sending_ram_read or next_state_2=waiting_ram_response_read then
                app_addr(26 downto 0)<=  intern_upper_addr_2(23 downto 0) &"000" ;
            --il ne peut pas ecrire
                else 
            app_addr(26 downto 0)<=app_addr(26 downto 0);
            end if;
       end if;

      
end if;
 if current_state=waiting_ram_response_write then
     app_cmd<="000";
     app_wdf_wren<='1';
     app_wdf_end<='1';
     app_en<='1';     
else
     if current_state=sending_ram_read or current_state_2=sending_ram_read  then
         app_cmd<="001";
         app_wdf_wren<='0';
         app_wdf_end<='0'; 
         app_en<='1';
     else
         app_en<='0';
         app_wdf_wren<='0';
         app_wdf_end<='0'; 
     end if;
end if;
end process;



--app_en<= '1' when current_state=waiting_ram_response_write or current_state=sending_ram_read or current_state_2=sending_ram_read else '0';--le 2 ne peut pas ecrire
--app_wdf_mask<="11110000" ;--mode 32 bit
--app_addr(26)<='0';
--app_sr_req<='0';




--output
command_finish<=(not ext_adrress_bit and command_finish_signal) or (ext_adrress_bit and physical_command_finish);
command_finish_2<=(not ext_adrress_bit and command_finish_signal_2) or (ext_adrress_bit and physical_command_finish);

read_data<=Read_buffer;
read_data_2<=Read_buffer_2;
--adress extern -> pour le moment seul le code est en extern

--led_Test(0)<=command_finish_signal;
--led_Test(1)<=app_wdf_rdy; 
--led_Test(2)<=app_rdy;
led_Test(3)<=app_cmd(0);
led_Test(4)<=app_wdf_wren;
--led_Test(5)<=app_rd_data_valid;
--led_Test(6)<=init_calib_complete;
--led_Test(7)<=Write_Read;
--led_Test(15)<=new_command;

end Behavioral;

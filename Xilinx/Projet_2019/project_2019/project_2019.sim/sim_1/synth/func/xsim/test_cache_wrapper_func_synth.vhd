-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Tue Aug  6 11:27:33 2019
-- Host        : Qlala running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               E:/xilinx_project/CPUproject/projet_CPU/Projet_2019/project_2019/project_2019.sim/sim_1/synth/func/xsim/test_cache_wrapper_func_synth.vhd
-- Design      : test_cache_wrapper
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Cache_bus_M_to_S is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    cache_bus : out STD_LOGIC_VECTOR ( 32 downto 0 );
    busy : out STD_LOGIC;
    EN : in STD_LOGIC;
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    address : in STD_LOGIC_VECTOR ( 31 downto 0 );
    W_R : in STD_LOGIC
  );
end Cache_bus_M_to_S;

architecture STRUCTURE of Cache_bus_M_to_S is
  signal \FSM_sequential_curr_st[0]_i_2_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal addr_buf : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal curr_st : STD_LOGIC_VECTOR ( 1 to 1 );
  signal data_buf : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \data_buf[31]_i_1_n_0\ : STD_LOGIC;
  signal \^next_st\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal next_st_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_curr_st[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_sequential_curr_st[1]_i_1\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_curr_st_reg[0]\ : label is "idle:00,sending_data:11,sending_addr_w:10,sending_addr_r:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_curr_st_reg[1]\ : label is "idle:00,sending_data:11,sending_addr_w:10,sending_addr_r:01";
  attribute SOFT_HLUTNM of busy_INST_0 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cache_bus[0]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cache_bus[14]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cache_bus[16]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cache_bus[1]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cache_bus[32]_INST_0\ : label is "soft_lutpair2";
begin
  Q(0) <= \^q\(0);
\FSM_sequential_curr_st[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => \^q\(0),
      I1 => W_R,
      I2 => curr_st(1),
      O => \^next_st\(0)
    );
\FSM_sequential_curr_st[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => RST,
      O => \FSM_sequential_curr_st[0]_i_2_n_0\
    );
\FSM_sequential_curr_st[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"45"
    )
        port map (
      I0 => \^q\(0),
      I1 => curr_st(1),
      I2 => W_R,
      O => \^next_st\(1)
    );
\FSM_sequential_curr_st_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => next_st_n_0,
      CLR => \FSM_sequential_curr_st[0]_i_2_n_0\,
      D => \^next_st\(0),
      Q => \^q\(0)
    );
\FSM_sequential_curr_st_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => next_st_n_0,
      CLR => \FSM_sequential_curr_st[0]_i_2_n_0\,
      D => \^next_st\(1),
      Q => curr_st(1)
    );
\addr_buf_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(0),
      Q => addr_buf(0),
      R => '0'
    );
\addr_buf_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(10),
      Q => addr_buf(10),
      R => '0'
    );
\addr_buf_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(11),
      Q => addr_buf(11),
      R => '0'
    );
\addr_buf_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(12),
      Q => addr_buf(12),
      R => '0'
    );
\addr_buf_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(13),
      Q => addr_buf(13),
      R => '0'
    );
\addr_buf_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(14),
      Q => addr_buf(14),
      R => '0'
    );
\addr_buf_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(15),
      Q => addr_buf(15),
      R => '0'
    );
\addr_buf_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(16),
      Q => addr_buf(16),
      R => '0'
    );
\addr_buf_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(17),
      Q => addr_buf(17),
      R => '0'
    );
\addr_buf_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(18),
      Q => addr_buf(18),
      R => '0'
    );
\addr_buf_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(19),
      Q => addr_buf(19),
      R => '0'
    );
\addr_buf_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(1),
      Q => addr_buf(1),
      R => '0'
    );
\addr_buf_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(20),
      Q => addr_buf(20),
      R => '0'
    );
\addr_buf_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(21),
      Q => addr_buf(21),
      R => '0'
    );
\addr_buf_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(22),
      Q => addr_buf(22),
      R => '0'
    );
\addr_buf_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(23),
      Q => addr_buf(23),
      R => '0'
    );
\addr_buf_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(24),
      Q => addr_buf(24),
      R => '0'
    );
\addr_buf_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(25),
      Q => addr_buf(25),
      R => '0'
    );
\addr_buf_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(26),
      Q => addr_buf(26),
      R => '0'
    );
\addr_buf_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(27),
      Q => addr_buf(27),
      R => '0'
    );
\addr_buf_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(28),
      Q => addr_buf(28),
      R => '0'
    );
\addr_buf_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(29),
      Q => addr_buf(29),
      R => '0'
    );
\addr_buf_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(2),
      Q => addr_buf(2),
      R => '0'
    );
\addr_buf_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(30),
      Q => addr_buf(30),
      R => '0'
    );
\addr_buf_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(31),
      Q => addr_buf(31),
      R => '0'
    );
\addr_buf_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(3),
      Q => addr_buf(3),
      R => '0'
    );
\addr_buf_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(4),
      Q => addr_buf(4),
      R => '0'
    );
\addr_buf_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(5),
      Q => addr_buf(5),
      R => '0'
    );
\addr_buf_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(6),
      Q => addr_buf(6),
      R => '0'
    );
\addr_buf_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(7),
      Q => addr_buf(7),
      R => '0'
    );
\addr_buf_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(8),
      Q => addr_buf(8),
      R => '0'
    );
\addr_buf_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => address(9),
      Q => addr_buf(9),
      R => '0'
    );
busy_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^q\(0),
      I1 => curr_st(1),
      O => busy
    );
\cache_bus[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(0),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(0),
      O => cache_bus(0)
    );
\cache_bus[10]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(10),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(10),
      O => cache_bus(10)
    );
\cache_bus[11]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(11),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(11),
      O => cache_bus(11)
    );
\cache_bus[12]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(12),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(12),
      O => cache_bus(12)
    );
\cache_bus[13]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(13),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(13),
      O => cache_bus(13)
    );
\cache_bus[14]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(14),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(14),
      O => cache_bus(14)
    );
\cache_bus[15]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(15),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(15),
      O => cache_bus(15)
    );
\cache_bus[16]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(16),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(16),
      O => cache_bus(16)
    );
\cache_bus[17]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(17),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(17),
      O => cache_bus(17)
    );
\cache_bus[18]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(18),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(18),
      O => cache_bus(18)
    );
\cache_bus[19]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(19),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(19),
      O => cache_bus(19)
    );
\cache_bus[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(1),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(1),
      O => cache_bus(1)
    );
\cache_bus[20]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(20),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(20),
      O => cache_bus(20)
    );
\cache_bus[21]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(21),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(21),
      O => cache_bus(21)
    );
\cache_bus[22]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(22),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(22),
      O => cache_bus(22)
    );
\cache_bus[23]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(23),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(23),
      O => cache_bus(23)
    );
\cache_bus[24]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(24),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(24),
      O => cache_bus(24)
    );
\cache_bus[25]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(25),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(25),
      O => cache_bus(25)
    );
\cache_bus[26]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(26),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(26),
      O => cache_bus(26)
    );
\cache_bus[27]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(27),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(27),
      O => cache_bus(27)
    );
\cache_bus[28]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(28),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(28),
      O => cache_bus(28)
    );
\cache_bus[29]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(29),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(29),
      O => cache_bus(29)
    );
\cache_bus[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(2),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(2),
      O => cache_bus(2)
    );
\cache_bus[30]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(30),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(30),
      O => cache_bus(30)
    );
\cache_bus[31]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(31),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(31),
      O => cache_bus(31)
    );
\cache_bus[32]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => curr_st(1),
      O => cache_bus(32)
    );
\cache_bus[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(3),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(3),
      O => cache_bus(3)
    );
\cache_bus[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(4),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(4),
      O => cache_bus(4)
    );
\cache_bus[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(5),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(5),
      O => cache_bus(5)
    );
\cache_bus[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(6),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(6),
      O => cache_bus(6)
    );
\cache_bus[7]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(7),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(7),
      O => cache_bus(7)
    );
\cache_bus[8]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(8),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(8),
      O => cache_bus(8)
    );
\cache_bus[9]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC80"
    )
        port map (
      I0 => data_buf(9),
      I1 => \^q\(0),
      I2 => curr_st(1),
      I3 => addr_buf(9),
      O => cache_bus(9)
    );
\data_buf[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => EN,
      I1 => curr_st(1),
      I2 => \^q\(0),
      O => \data_buf[31]_i_1_n_0\
    );
\data_buf_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(0),
      Q => data_buf(0),
      R => '0'
    );
\data_buf_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(10),
      Q => data_buf(10),
      R => '0'
    );
\data_buf_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(11),
      Q => data_buf(11),
      R => '0'
    );
\data_buf_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(12),
      Q => data_buf(12),
      R => '0'
    );
\data_buf_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(13),
      Q => data_buf(13),
      R => '0'
    );
\data_buf_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(14),
      Q => data_buf(14),
      R => '0'
    );
\data_buf_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(15),
      Q => data_buf(15),
      R => '0'
    );
\data_buf_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(16),
      Q => data_buf(16),
      R => '0'
    );
\data_buf_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(17),
      Q => data_buf(17),
      R => '0'
    );
\data_buf_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(18),
      Q => data_buf(18),
      R => '0'
    );
\data_buf_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(19),
      Q => data_buf(19),
      R => '0'
    );
\data_buf_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(1),
      Q => data_buf(1),
      R => '0'
    );
\data_buf_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(20),
      Q => data_buf(20),
      R => '0'
    );
\data_buf_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(21),
      Q => data_buf(21),
      R => '0'
    );
\data_buf_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(22),
      Q => data_buf(22),
      R => '0'
    );
\data_buf_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(23),
      Q => data_buf(23),
      R => '0'
    );
\data_buf_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(24),
      Q => data_buf(24),
      R => '0'
    );
\data_buf_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(25),
      Q => data_buf(25),
      R => '0'
    );
\data_buf_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(26),
      Q => data_buf(26),
      R => '0'
    );
\data_buf_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(27),
      Q => data_buf(27),
      R => '0'
    );
\data_buf_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(28),
      Q => data_buf(28),
      R => '0'
    );
\data_buf_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(29),
      Q => data_buf(29),
      R => '0'
    );
\data_buf_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(2),
      Q => data_buf(2),
      R => '0'
    );
\data_buf_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(30),
      Q => data_buf(30),
      R => '0'
    );
\data_buf_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(31),
      Q => data_buf(31),
      R => '0'
    );
\data_buf_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(3),
      Q => data_buf(3),
      R => '0'
    );
\data_buf_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(4),
      Q => data_buf(4),
      R => '0'
    );
\data_buf_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(5),
      Q => data_buf(5),
      R => '0'
    );
\data_buf_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(6),
      Q => data_buf(6),
      R => '0'
    );
\data_buf_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(7),
      Q => data_buf(7),
      R => '0'
    );
\data_buf_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(8),
      Q => data_buf(8),
      R => '0'
    );
\data_buf_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => \data_buf[31]_i_1_n_0\,
      D => data(9),
      Q => data_buf(9),
      R => '0'
    );
next_st: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => curr_st(1),
      I1 => \^q\(0),
      I2 => EN,
      O => next_st_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Cache_bus_M_to_S_peer is
  port (
    new_data : out STD_LOGIC;
    address : out STD_LOGIC_VECTOR ( 31 downto 0 );
    data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    W_R : out STD_LOGIC;
    discard_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_valid : out STD_LOGIC;
    cache_bus : in STD_LOGIC_VECTOR ( 33 downto 0 );
    RST : in STD_LOGIC;
    CLK : in STD_LOGIC;
    ack : in STD_LOGIC
  );
end Cache_bus_M_to_S_peer;

architecture STRUCTURE of Cache_bus_M_to_S_peer is
  signal W_R_i_1_n_0 : STD_LOGIC;
  signal \addr_buf[31]_i_1_n_0\ : STD_LOGIC;
  signal \^address\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal curr_st : STD_LOGIC;
  signal curr_st_i_1_n_0 : STD_LOGIC;
  signal curr_st_i_2_n_0 : STD_LOGIC;
  signal \discard_addr[31]_i_1_n_0\ : STD_LOGIC;
  signal discard_valid_i_1_n_0 : STD_LOGIC;
  signal discard_valid_i_2_n_0 : STD_LOGIC;
  signal \^new_data\ : STD_LOGIC;
  signal next_new_data_reg : STD_LOGIC;
begin
  address(31 downto 0) <= \^address\(31 downto 0);
  new_data <= \^new_data\;
W_R_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => cache_bus(33),
      I1 => cache_bus(32),
      I2 => curr_st,
      O => W_R_i_1_n_0
    );
W_R_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => '0',
      Q => W_R,
      S => W_R_i_1_n_0
    );
\addr_buf[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cache_bus(32),
      I1 => curr_st,
      O => \addr_buf[31]_i_1_n_0\
    );
\addr_buf_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(0),
      Q => \^address\(0),
      R => '0'
    );
\addr_buf_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(10),
      Q => \^address\(10),
      R => '0'
    );
\addr_buf_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(11),
      Q => \^address\(11),
      R => '0'
    );
\addr_buf_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(12),
      Q => \^address\(12),
      R => '0'
    );
\addr_buf_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(13),
      Q => \^address\(13),
      R => '0'
    );
\addr_buf_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(14),
      Q => \^address\(14),
      R => '0'
    );
\addr_buf_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(15),
      Q => \^address\(15),
      R => '0'
    );
\addr_buf_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(16),
      Q => \^address\(16),
      R => '0'
    );
\addr_buf_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(17),
      Q => \^address\(17),
      R => '0'
    );
\addr_buf_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(18),
      Q => \^address\(18),
      R => '0'
    );
\addr_buf_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(19),
      Q => \^address\(19),
      R => '0'
    );
\addr_buf_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(1),
      Q => \^address\(1),
      R => '0'
    );
\addr_buf_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(20),
      Q => \^address\(20),
      R => '0'
    );
\addr_buf_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(21),
      Q => \^address\(21),
      R => '0'
    );
\addr_buf_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(22),
      Q => \^address\(22),
      R => '0'
    );
\addr_buf_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(23),
      Q => \^address\(23),
      R => '0'
    );
\addr_buf_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(24),
      Q => \^address\(24),
      R => '0'
    );
\addr_buf_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(25),
      Q => \^address\(25),
      R => '0'
    );
\addr_buf_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(26),
      Q => \^address\(26),
      R => '0'
    );
\addr_buf_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(27),
      Q => \^address\(27),
      R => '0'
    );
\addr_buf_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(28),
      Q => \^address\(28),
      R => '0'
    );
\addr_buf_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(29),
      Q => \^address\(29),
      R => '0'
    );
\addr_buf_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(2),
      Q => \^address\(2),
      R => '0'
    );
\addr_buf_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(30),
      Q => \^address\(30),
      R => '0'
    );
\addr_buf_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(31),
      Q => \^address\(31),
      R => '0'
    );
\addr_buf_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(3),
      Q => \^address\(3),
      R => '0'
    );
\addr_buf_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(4),
      Q => \^address\(4),
      R => '0'
    );
\addr_buf_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(5),
      Q => \^address\(5),
      R => '0'
    );
\addr_buf_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(6),
      Q => \^address\(6),
      R => '0'
    );
\addr_buf_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(7),
      Q => \^address\(7),
      R => '0'
    );
\addr_buf_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(8),
      Q => \^address\(8),
      R => '0'
    );
\addr_buf_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \addr_buf[31]_i_1_n_0\,
      D => cache_bus(9),
      Q => \^address\(9),
      R => '0'
    );
curr_st_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => cache_bus(33),
      I1 => cache_bus(32),
      I2 => curr_st,
      O => curr_st_i_1_n_0
    );
curr_st_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => RST,
      O => curr_st_i_2_n_0
    );
curr_st_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => curr_st_i_2_n_0,
      D => curr_st_i_1_n_0,
      Q => curr_st
    );
\data_buf_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(0),
      Q => data(0),
      R => '0'
    );
\data_buf_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(10),
      Q => data(10),
      R => '0'
    );
\data_buf_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(11),
      Q => data(11),
      R => '0'
    );
\data_buf_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(12),
      Q => data(12),
      R => '0'
    );
\data_buf_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(13),
      Q => data(13),
      R => '0'
    );
\data_buf_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(14),
      Q => data(14),
      R => '0'
    );
\data_buf_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(15),
      Q => data(15),
      R => '0'
    );
\data_buf_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(16),
      Q => data(16),
      R => '0'
    );
\data_buf_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(17),
      Q => data(17),
      R => '0'
    );
\data_buf_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(18),
      Q => data(18),
      R => '0'
    );
\data_buf_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(19),
      Q => data(19),
      R => '0'
    );
\data_buf_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(1),
      Q => data(1),
      R => '0'
    );
\data_buf_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(20),
      Q => data(20),
      R => '0'
    );
\data_buf_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(21),
      Q => data(21),
      R => '0'
    );
\data_buf_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(22),
      Q => data(22),
      R => '0'
    );
\data_buf_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(23),
      Q => data(23),
      R => '0'
    );
\data_buf_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(24),
      Q => data(24),
      R => '0'
    );
\data_buf_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(25),
      Q => data(25),
      R => '0'
    );
\data_buf_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(26),
      Q => data(26),
      R => '0'
    );
\data_buf_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(27),
      Q => data(27),
      R => '0'
    );
\data_buf_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(28),
      Q => data(28),
      R => '0'
    );
\data_buf_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(29),
      Q => data(29),
      R => '0'
    );
\data_buf_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(2),
      Q => data(2),
      R => '0'
    );
\data_buf_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(30),
      Q => data(30),
      R => '0'
    );
\data_buf_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(31),
      Q => data(31),
      R => '0'
    );
\data_buf_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(3),
      Q => data(3),
      R => '0'
    );
\data_buf_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(4),
      Q => data(4),
      R => '0'
    );
\data_buf_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(5),
      Q => data(5),
      R => '0'
    );
\data_buf_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(6),
      Q => data(6),
      R => '0'
    );
\data_buf_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(7),
      Q => data(7),
      R => '0'
    );
\data_buf_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(8),
      Q => data(8),
      R => '0'
    );
\data_buf_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => curr_st,
      D => cache_bus(9),
      Q => data(9),
      R => '0'
    );
\discard_addr[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^new_data\,
      I1 => cache_bus(32),
      I2 => curr_st,
      O => \discard_addr[31]_i_1_n_0\
    );
\discard_addr_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(0),
      Q => discard_addr(0),
      R => '0'
    );
\discard_addr_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(10),
      Q => discard_addr(10),
      R => '0'
    );
\discard_addr_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(11),
      Q => discard_addr(11),
      R => '0'
    );
\discard_addr_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(12),
      Q => discard_addr(12),
      R => '0'
    );
\discard_addr_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(13),
      Q => discard_addr(13),
      R => '0'
    );
\discard_addr_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(14),
      Q => discard_addr(14),
      R => '0'
    );
\discard_addr_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(15),
      Q => discard_addr(15),
      R => '0'
    );
\discard_addr_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(16),
      Q => discard_addr(16),
      R => '0'
    );
\discard_addr_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(17),
      Q => discard_addr(17),
      R => '0'
    );
\discard_addr_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(18),
      Q => discard_addr(18),
      R => '0'
    );
\discard_addr_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(19),
      Q => discard_addr(19),
      R => '0'
    );
\discard_addr_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(1),
      Q => discard_addr(1),
      R => '0'
    );
\discard_addr_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(20),
      Q => discard_addr(20),
      R => '0'
    );
\discard_addr_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(21),
      Q => discard_addr(21),
      R => '0'
    );
\discard_addr_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(22),
      Q => discard_addr(22),
      R => '0'
    );
\discard_addr_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(23),
      Q => discard_addr(23),
      R => '0'
    );
\discard_addr_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(24),
      Q => discard_addr(24),
      R => '0'
    );
\discard_addr_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(25),
      Q => discard_addr(25),
      R => '0'
    );
\discard_addr_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(26),
      Q => discard_addr(26),
      R => '0'
    );
\discard_addr_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(27),
      Q => discard_addr(27),
      R => '0'
    );
\discard_addr_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(28),
      Q => discard_addr(28),
      R => '0'
    );
\discard_addr_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(29),
      Q => discard_addr(29),
      R => '0'
    );
\discard_addr_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(2),
      Q => discard_addr(2),
      R => '0'
    );
\discard_addr_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(30),
      Q => discard_addr(30),
      R => '0'
    );
\discard_addr_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(31),
      Q => discard_addr(31),
      R => '0'
    );
\discard_addr_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(3),
      Q => discard_addr(3),
      R => '0'
    );
\discard_addr_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(4),
      Q => discard_addr(4),
      R => '0'
    );
\discard_addr_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(5),
      Q => discard_addr(5),
      R => '0'
    );
\discard_addr_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(6),
      Q => discard_addr(6),
      R => '0'
    );
\discard_addr_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(7),
      Q => discard_addr(7),
      R => '0'
    );
\discard_addr_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(8),
      Q => discard_addr(8),
      R => '0'
    );
\discard_addr_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \discard_addr[31]_i_1_n_0\,
      D => \^address\(9),
      Q => discard_addr(9),
      R => '0'
    );
discard_valid_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => curr_st,
      I1 => cache_bus(32),
      O => discard_valid_i_1_n_0
    );
discard_valid_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => curr_st,
      O => discard_valid_i_2_n_0
    );
discard_valid_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => discard_valid_i_2_n_0,
      D => \^new_data\,
      Q => discard_valid,
      R => discard_valid_i_1_n_0
    );
new_data_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF8"
    )
        port map (
      I0 => cache_bus(32),
      I1 => cache_bus(33),
      I2 => curr_st,
      I3 => \^new_data\,
      O => next_new_data_reg
    );
new_data_reg_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      CLR => ack,
      D => next_new_data_reg,
      Q => \^new_data\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity test_cache_Cache_bus_M_to_S_0_0 is
  port (
    cache_bus : out STD_LOGIC_VECTOR ( 33 downto 0 );
    address : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    W_R : in STD_LOGIC;
    EN : in STD_LOGIC;
    busy : out STD_LOGIC;
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of test_cache_Cache_bus_M_to_S_0_0 : entity is "test_cache_Cache_bus_M_to_S_0_0,Cache_bus_M_to_S,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of test_cache_Cache_bus_M_to_S_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of test_cache_Cache_bus_M_to_S_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of test_cache_Cache_bus_M_to_S_0_0 : entity is "Cache_bus_M_to_S,Vivado 2019.1";
end test_cache_Cache_bus_M_to_S_0_0;

architecture STRUCTURE of test_cache_Cache_bus_M_to_S_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of CLK : signal is "xilinx.com:signal:clock:1.0 CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CLK : signal is "XIL_INTERFACENAME CLK, ASSOCIATED_RESET RST, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN test_cache_sys_clock, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of RST : signal is "xilinx.com:signal:reset:1.0 RST RST";
  attribute X_INTERFACE_PARAMETER of RST : signal is "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.Cache_bus_M_to_S
     port map (
      CLK => CLK,
      EN => EN,
      Q(0) => cache_bus(33),
      RST => RST,
      W_R => W_R,
      address(31 downto 0) => address(31 downto 0),
      busy => busy,
      cache_bus(32 downto 0) => cache_bus(32 downto 0),
      data(31 downto 0) => data(31 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity test_cache_Cache_bus_M_to_S_peer_0_1 is
  port (
    cache_bus : in STD_LOGIC_VECTOR ( 33 downto 0 );
    address : out STD_LOGIC_VECTOR ( 31 downto 0 );
    data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    W_R : out STD_LOGIC;
    new_data : out STD_LOGIC;
    ack : in STD_LOGIC;
    discard_addr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_valid : out STD_LOGIC;
    CLK : in STD_LOGIC;
    RST : in STD_LOGIC
  );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of test_cache_Cache_bus_M_to_S_peer_0_1 : entity is "test_cache_Cache_bus_M_to_S_peer_0_1,Cache_bus_M_to_S_peer,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of test_cache_Cache_bus_M_to_S_peer_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of test_cache_Cache_bus_M_to_S_peer_0_1 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of test_cache_Cache_bus_M_to_S_peer_0_1 : entity is "Cache_bus_M_to_S_peer,Vivado 2019.1";
end test_cache_Cache_bus_M_to_S_peer_0_1;

architecture STRUCTURE of test_cache_Cache_bus_M_to_S_peer_0_1 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of CLK : signal is "xilinx.com:signal:clock:1.0 CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of CLK : signal is "XIL_INTERFACENAME CLK, ASSOCIATED_RESET RST, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN test_cache_sys_clock, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of RST : signal is "xilinx.com:signal:reset:1.0 RST RST";
  attribute X_INTERFACE_PARAMETER of RST : signal is "XIL_INTERFACENAME RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.Cache_bus_M_to_S_peer
     port map (
      CLK => CLK,
      RST => RST,
      W_R => W_R,
      ack => ack,
      address(31 downto 0) => address(31 downto 0),
      cache_bus(33 downto 0) => cache_bus(33 downto 0),
      data(31 downto 0) => data(31 downto 0),
      discard_addr(31 downto 0) => discard_addr(31 downto 0),
      discard_valid => discard_valid,
      new_data => new_data
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity test_cache is
  port (
    EN_0 : in STD_LOGIC;
    W_R_0 : in STD_LOGIC;
    W_R_1 : out STD_LOGIC;
    ack_0 : in STD_LOGIC;
    address_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    address_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    busy_0 : out STD_LOGIC;
    data_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_addr_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_valid_0 : out STD_LOGIC;
    new_data_0 : out STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of test_cache : entity is "test_cache.hwdef";
end test_cache;

architecture STRUCTURE of test_cache is
  signal cache_bus : STD_LOGIC_VECTOR ( 33 downto 0 );
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of Cache_bus_M_to_S_0 : label is "test_cache_Cache_bus_M_to_S_0_0,Cache_bus_M_to_S,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of Cache_bus_M_to_S_0 : label is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of Cache_bus_M_to_S_0 : label is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of Cache_bus_M_to_S_0 : label is "Cache_bus_M_to_S,Vivado 2019.1";
  attribute CHECK_LICENSE_TYPE of Cache_bus_M_to_S_peer_0 : label is "test_cache_Cache_bus_M_to_S_peer_0_1,Cache_bus_M_to_S_peer,{}";
  attribute downgradeipidentifiedwarnings of Cache_bus_M_to_S_peer_0 : label is "yes";
  attribute ip_definition_source of Cache_bus_M_to_S_peer_0 : label is "module_ref";
  attribute x_core_info of Cache_bus_M_to_S_peer_0 : label is "Cache_bus_M_to_S_peer,Vivado 2019.1";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 RST.RESET RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of sys_clock : signal is "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK";
  attribute X_INTERFACE_PARAMETER of sys_clock : signal is "XIL_INTERFACENAME CLK.SYS_CLOCK, ASSOCIATED_RESET reset, CLK_DOMAIN test_cache_sys_clock, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
begin
Cache_bus_M_to_S_0: entity work.test_cache_Cache_bus_M_to_S_0_0
     port map (
      CLK => sys_clock,
      EN => EN_0,
      RST => reset,
      W_R => W_R_0,
      address(31 downto 0) => address_0(31 downto 0),
      busy => busy_0,
      cache_bus(33 downto 0) => cache_bus(33 downto 0),
      data(31 downto 0) => data_0(31 downto 0)
    );
Cache_bus_M_to_S_peer_0: entity work.test_cache_Cache_bus_M_to_S_peer_0_1
     port map (
      CLK => sys_clock,
      RST => reset,
      W_R => W_R_1,
      ack => ack_0,
      address(31 downto 0) => address_1(31 downto 0),
      cache_bus(33 downto 0) => cache_bus(33 downto 0),
      data(31 downto 0) => data_1(31 downto 0),
      discard_addr(31 downto 0) => discard_addr_0(31 downto 0),
      discard_valid => discard_valid_0,
      new_data => new_data_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity test_cache_wrapper is
  port (
    EN_0 : in STD_LOGIC;
    W_R_0 : in STD_LOGIC;
    W_R_1 : out STD_LOGIC;
    ack_0 : in STD_LOGIC;
    address_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    address_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    busy_0 : out STD_LOGIC;
    data_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_addr_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    discard_valid_0 : out STD_LOGIC;
    new_data_0 : out STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of test_cache_wrapper : entity is true;
end test_cache_wrapper;

architecture STRUCTURE of test_cache_wrapper is
  signal EN_0_IBUF : STD_LOGIC;
  signal W_R_0_IBUF : STD_LOGIC;
  signal W_R_1_OBUF : STD_LOGIC;
  signal ack_0_IBUF : STD_LOGIC;
  signal address_0_IBUF : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal address_1_OBUF : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal busy_0_OBUF : STD_LOGIC;
  signal data_0_IBUF : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal data_1_OBUF : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal discard_addr_0_OBUF : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal discard_valid_0_OBUF : STD_LOGIC;
  signal new_data_0_OBUF : STD_LOGIC;
  signal reset_IBUF : STD_LOGIC;
  signal sys_clock_IBUF : STD_LOGIC;
  signal sys_clock_IBUF_BUFG : STD_LOGIC;
  attribute hw_handoff : string;
  attribute hw_handoff of test_cache_i : label is "test_cache.hwdef";
begin
EN_0_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => EN_0,
      O => EN_0_IBUF
    );
W_R_0_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => W_R_0,
      O => W_R_0_IBUF
    );
W_R_1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => W_R_1_OBUF,
      O => W_R_1
    );
ack_0_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => ack_0,
      O => ack_0_IBUF
    );
\address_0_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(0),
      O => address_0_IBUF(0)
    );
\address_0_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(10),
      O => address_0_IBUF(10)
    );
\address_0_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(11),
      O => address_0_IBUF(11)
    );
\address_0_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(12),
      O => address_0_IBUF(12)
    );
\address_0_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(13),
      O => address_0_IBUF(13)
    );
\address_0_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(14),
      O => address_0_IBUF(14)
    );
\address_0_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(15),
      O => address_0_IBUF(15)
    );
\address_0_IBUF[16]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(16),
      O => address_0_IBUF(16)
    );
\address_0_IBUF[17]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(17),
      O => address_0_IBUF(17)
    );
\address_0_IBUF[18]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(18),
      O => address_0_IBUF(18)
    );
\address_0_IBUF[19]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(19),
      O => address_0_IBUF(19)
    );
\address_0_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(1),
      O => address_0_IBUF(1)
    );
\address_0_IBUF[20]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(20),
      O => address_0_IBUF(20)
    );
\address_0_IBUF[21]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(21),
      O => address_0_IBUF(21)
    );
\address_0_IBUF[22]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(22),
      O => address_0_IBUF(22)
    );
\address_0_IBUF[23]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(23),
      O => address_0_IBUF(23)
    );
\address_0_IBUF[24]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(24),
      O => address_0_IBUF(24)
    );
\address_0_IBUF[25]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(25),
      O => address_0_IBUF(25)
    );
\address_0_IBUF[26]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(26),
      O => address_0_IBUF(26)
    );
\address_0_IBUF[27]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(27),
      O => address_0_IBUF(27)
    );
\address_0_IBUF[28]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(28),
      O => address_0_IBUF(28)
    );
\address_0_IBUF[29]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(29),
      O => address_0_IBUF(29)
    );
\address_0_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(2),
      O => address_0_IBUF(2)
    );
\address_0_IBUF[30]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(30),
      O => address_0_IBUF(30)
    );
\address_0_IBUF[31]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(31),
      O => address_0_IBUF(31)
    );
\address_0_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(3),
      O => address_0_IBUF(3)
    );
\address_0_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(4),
      O => address_0_IBUF(4)
    );
\address_0_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(5),
      O => address_0_IBUF(5)
    );
\address_0_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(6),
      O => address_0_IBUF(6)
    );
\address_0_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(7),
      O => address_0_IBUF(7)
    );
\address_0_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(8),
      O => address_0_IBUF(8)
    );
\address_0_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => address_0(9),
      O => address_0_IBUF(9)
    );
\address_1_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(0),
      O => address_1(0)
    );
\address_1_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(10),
      O => address_1(10)
    );
\address_1_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(11),
      O => address_1(11)
    );
\address_1_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(12),
      O => address_1(12)
    );
\address_1_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(13),
      O => address_1(13)
    );
\address_1_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(14),
      O => address_1(14)
    );
\address_1_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(15),
      O => address_1(15)
    );
\address_1_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(16),
      O => address_1(16)
    );
\address_1_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(17),
      O => address_1(17)
    );
\address_1_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(18),
      O => address_1(18)
    );
\address_1_OBUF[19]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(19),
      O => address_1(19)
    );
\address_1_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(1),
      O => address_1(1)
    );
\address_1_OBUF[20]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(20),
      O => address_1(20)
    );
\address_1_OBUF[21]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(21),
      O => address_1(21)
    );
\address_1_OBUF[22]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(22),
      O => address_1(22)
    );
\address_1_OBUF[23]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(23),
      O => address_1(23)
    );
\address_1_OBUF[24]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(24),
      O => address_1(24)
    );
\address_1_OBUF[25]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(25),
      O => address_1(25)
    );
\address_1_OBUF[26]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(26),
      O => address_1(26)
    );
\address_1_OBUF[27]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(27),
      O => address_1(27)
    );
\address_1_OBUF[28]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(28),
      O => address_1(28)
    );
\address_1_OBUF[29]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(29),
      O => address_1(29)
    );
\address_1_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(2),
      O => address_1(2)
    );
\address_1_OBUF[30]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(30),
      O => address_1(30)
    );
\address_1_OBUF[31]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(31),
      O => address_1(31)
    );
\address_1_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(3),
      O => address_1(3)
    );
\address_1_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(4),
      O => address_1(4)
    );
\address_1_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(5),
      O => address_1(5)
    );
\address_1_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(6),
      O => address_1(6)
    );
\address_1_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(7),
      O => address_1(7)
    );
\address_1_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(8),
      O => address_1(8)
    );
\address_1_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => address_1_OBUF(9),
      O => address_1(9)
    );
busy_0_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => busy_0_OBUF,
      O => busy_0
    );
\data_0_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(0),
      O => data_0_IBUF(0)
    );
\data_0_IBUF[10]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(10),
      O => data_0_IBUF(10)
    );
\data_0_IBUF[11]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(11),
      O => data_0_IBUF(11)
    );
\data_0_IBUF[12]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(12),
      O => data_0_IBUF(12)
    );
\data_0_IBUF[13]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(13),
      O => data_0_IBUF(13)
    );
\data_0_IBUF[14]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(14),
      O => data_0_IBUF(14)
    );
\data_0_IBUF[15]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(15),
      O => data_0_IBUF(15)
    );
\data_0_IBUF[16]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(16),
      O => data_0_IBUF(16)
    );
\data_0_IBUF[17]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(17),
      O => data_0_IBUF(17)
    );
\data_0_IBUF[18]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(18),
      O => data_0_IBUF(18)
    );
\data_0_IBUF[19]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(19),
      O => data_0_IBUF(19)
    );
\data_0_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(1),
      O => data_0_IBUF(1)
    );
\data_0_IBUF[20]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(20),
      O => data_0_IBUF(20)
    );
\data_0_IBUF[21]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(21),
      O => data_0_IBUF(21)
    );
\data_0_IBUF[22]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(22),
      O => data_0_IBUF(22)
    );
\data_0_IBUF[23]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(23),
      O => data_0_IBUF(23)
    );
\data_0_IBUF[24]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(24),
      O => data_0_IBUF(24)
    );
\data_0_IBUF[25]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(25),
      O => data_0_IBUF(25)
    );
\data_0_IBUF[26]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(26),
      O => data_0_IBUF(26)
    );
\data_0_IBUF[27]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(27),
      O => data_0_IBUF(27)
    );
\data_0_IBUF[28]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(28),
      O => data_0_IBUF(28)
    );
\data_0_IBUF[29]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(29),
      O => data_0_IBUF(29)
    );
\data_0_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(2),
      O => data_0_IBUF(2)
    );
\data_0_IBUF[30]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(30),
      O => data_0_IBUF(30)
    );
\data_0_IBUF[31]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(31),
      O => data_0_IBUF(31)
    );
\data_0_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(3),
      O => data_0_IBUF(3)
    );
\data_0_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(4),
      O => data_0_IBUF(4)
    );
\data_0_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(5),
      O => data_0_IBUF(5)
    );
\data_0_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(6),
      O => data_0_IBUF(6)
    );
\data_0_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(7),
      O => data_0_IBUF(7)
    );
\data_0_IBUF[8]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(8),
      O => data_0_IBUF(8)
    );
\data_0_IBUF[9]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_0(9),
      O => data_0_IBUF(9)
    );
\data_1_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(0),
      O => data_1(0)
    );
\data_1_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(10),
      O => data_1(10)
    );
\data_1_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(11),
      O => data_1(11)
    );
\data_1_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(12),
      O => data_1(12)
    );
\data_1_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(13),
      O => data_1(13)
    );
\data_1_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(14),
      O => data_1(14)
    );
\data_1_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(15),
      O => data_1(15)
    );
\data_1_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(16),
      O => data_1(16)
    );
\data_1_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(17),
      O => data_1(17)
    );
\data_1_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(18),
      O => data_1(18)
    );
\data_1_OBUF[19]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(19),
      O => data_1(19)
    );
\data_1_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(1),
      O => data_1(1)
    );
\data_1_OBUF[20]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(20),
      O => data_1(20)
    );
\data_1_OBUF[21]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(21),
      O => data_1(21)
    );
\data_1_OBUF[22]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(22),
      O => data_1(22)
    );
\data_1_OBUF[23]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(23),
      O => data_1(23)
    );
\data_1_OBUF[24]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(24),
      O => data_1(24)
    );
\data_1_OBUF[25]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(25),
      O => data_1(25)
    );
\data_1_OBUF[26]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(26),
      O => data_1(26)
    );
\data_1_OBUF[27]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(27),
      O => data_1(27)
    );
\data_1_OBUF[28]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(28),
      O => data_1(28)
    );
\data_1_OBUF[29]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(29),
      O => data_1(29)
    );
\data_1_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(2),
      O => data_1(2)
    );
\data_1_OBUF[30]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(30),
      O => data_1(30)
    );
\data_1_OBUF[31]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(31),
      O => data_1(31)
    );
\data_1_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(3),
      O => data_1(3)
    );
\data_1_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(4),
      O => data_1(4)
    );
\data_1_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(5),
      O => data_1(5)
    );
\data_1_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(6),
      O => data_1(6)
    );
\data_1_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(7),
      O => data_1(7)
    );
\data_1_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(8),
      O => data_1(8)
    );
\data_1_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_1_OBUF(9),
      O => data_1(9)
    );
\discard_addr_0_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(0),
      O => discard_addr_0(0)
    );
\discard_addr_0_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(10),
      O => discard_addr_0(10)
    );
\discard_addr_0_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(11),
      O => discard_addr_0(11)
    );
\discard_addr_0_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(12),
      O => discard_addr_0(12)
    );
\discard_addr_0_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(13),
      O => discard_addr_0(13)
    );
\discard_addr_0_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(14),
      O => discard_addr_0(14)
    );
\discard_addr_0_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(15),
      O => discard_addr_0(15)
    );
\discard_addr_0_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(16),
      O => discard_addr_0(16)
    );
\discard_addr_0_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(17),
      O => discard_addr_0(17)
    );
\discard_addr_0_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(18),
      O => discard_addr_0(18)
    );
\discard_addr_0_OBUF[19]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(19),
      O => discard_addr_0(19)
    );
\discard_addr_0_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(1),
      O => discard_addr_0(1)
    );
\discard_addr_0_OBUF[20]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(20),
      O => discard_addr_0(20)
    );
\discard_addr_0_OBUF[21]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(21),
      O => discard_addr_0(21)
    );
\discard_addr_0_OBUF[22]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(22),
      O => discard_addr_0(22)
    );
\discard_addr_0_OBUF[23]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(23),
      O => discard_addr_0(23)
    );
\discard_addr_0_OBUF[24]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(24),
      O => discard_addr_0(24)
    );
\discard_addr_0_OBUF[25]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(25),
      O => discard_addr_0(25)
    );
\discard_addr_0_OBUF[26]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(26),
      O => discard_addr_0(26)
    );
\discard_addr_0_OBUF[27]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(27),
      O => discard_addr_0(27)
    );
\discard_addr_0_OBUF[28]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(28),
      O => discard_addr_0(28)
    );
\discard_addr_0_OBUF[29]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(29),
      O => discard_addr_0(29)
    );
\discard_addr_0_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(2),
      O => discard_addr_0(2)
    );
\discard_addr_0_OBUF[30]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(30),
      O => discard_addr_0(30)
    );
\discard_addr_0_OBUF[31]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(31),
      O => discard_addr_0(31)
    );
\discard_addr_0_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(3),
      O => discard_addr_0(3)
    );
\discard_addr_0_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(4),
      O => discard_addr_0(4)
    );
\discard_addr_0_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(5),
      O => discard_addr_0(5)
    );
\discard_addr_0_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(6),
      O => discard_addr_0(6)
    );
\discard_addr_0_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(7),
      O => discard_addr_0(7)
    );
\discard_addr_0_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(8),
      O => discard_addr_0(8)
    );
\discard_addr_0_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => discard_addr_0_OBUF(9),
      O => discard_addr_0(9)
    );
discard_valid_0_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => discard_valid_0_OBUF,
      O => discard_valid_0
    );
new_data_0_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => new_data_0_OBUF,
      O => new_data_0
    );
reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset,
      O => reset_IBUF
    );
sys_clock_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => sys_clock_IBUF,
      O => sys_clock_IBUF_BUFG
    );
sys_clock_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => sys_clock,
      O => sys_clock_IBUF
    );
test_cache_i: entity work.test_cache
     port map (
      EN_0 => EN_0_IBUF,
      W_R_0 => W_R_0_IBUF,
      W_R_1 => W_R_1_OBUF,
      ack_0 => ack_0_IBUF,
      address_0(31 downto 0) => address_0_IBUF(31 downto 0),
      address_1(31 downto 0) => address_1_OBUF(31 downto 0),
      busy_0 => busy_0_OBUF,
      data_0(31 downto 0) => data_0_IBUF(31 downto 0),
      data_1(31 downto 0) => data_1_OBUF(31 downto 0),
      discard_addr_0(31 downto 0) => discard_addr_0_OBUF(31 downto 0),
      discard_valid_0 => discard_valid_0_OBUF,
      new_data_0 => new_data_0_OBUF,
      reset => reset_IBUF,
      sys_clock => sys_clock_IBUF_BUFG
    );
end STRUCTURE;

library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.numeric_std.all;

entity UART_I2C is
    generic(
        IS_MASTER: boolean := TRUE;
        DEFAULT_LINE_STATE :STD_LOGIC :='H';
        N:integer :=8;
        AUTO_INC_RX: boolean := TRUE
    );
    port (
        --bus
        SDA : inout STD_LOGIC;
        SCL : inout STD_LOGIC;
        
        --TX
        DATA_TX : in STD_LOGIC_VECTOR(N-1 downto 0);
        ADDR_TX : in STD_LOGIC_VECTOR(N-2 downto 0);
        R_W_TX : in STD_LOGIC;--READ = '0'
        EN : in STD_LOGIC;
        auto_inc_TX : in STD_LOGIC;--If asserted auto_increment addr
        auto_next_data : out STD_LOGIC;-- asserted when new data can be send for auto_inc;
        done_TX : in STD_LOGIC;
        --RX
        DATA_RX_WRITE : out STD_LOGIC_VECTOR(N-1 downto 0);
        DATA_RX_READ : out STD_LOGIC_VECTOR(N-1 downto 0);
        ADDR_RX : out STD_LOGIC_VECTOR(N-2 downto 0);
        new_data_READ_RX :STD_LOGIC;--write
        new_data_WRITE_RX :STD_LOGIC;--write
        stall : in STD_LOGIC;--STALL transmission => if asserted the data can't be ack
        
        
        clk: in  std_logic;
        rst: in  std_logic --active on low
    );
end entity;

architecture rtl of UART_I2C is
    --start SDA 0->1 et SCL='1'
    --stop SCL ='1' et SDA 0->1 
    type tx_state_t is (idle,start_trans,addr_sending,reading,writing);
    type rx_state_t is (idle,start_recv,addr_check,reading,writing);
    signal STOP_signal : STD_LOGIC;
    signal START_signal : STD_LOGIC;
    
    --tx tools
    signal tx_byte_shift_reg : std_logic_vector(N-1 downto 0);
    signal tx_next_bit_shift_reg : STD_LOGIC;
    signal tx_EN_shift_reg : STD_LOGIC;
    signal tx_ld_shift_reg : STD_LOGIC;
    signal tx_cnt_reg : integer range N-1 downto 0;
    signal tx_cnt_rst : STD_LOGIC;
    signal tx_ld_byte_shift_reg : STD_LOGIC_vector(N-1 downto 0);
    --rx tools
    signal rx_byte_shift_reg : std_logic_vector(N-1 downto 0);
    signal rx_EN_shift_reg : STD_LOGIC;
    signal rx_cnt_reg : integer range N-1 downto 0;
    signal rx_cnt_rst : STD_LOGIC:='0';--active on high
    
    
    
begin
    
    --tools
    STOP_signal <= SCL when rising_edge(SDA);
    START_signal <= SCL when falling_edge(SDA);
    TX_SHIFT_REG:process(SCL,tx_EN_shift_reg)
    begin
        if tx_cnt_rst='1' then
            tx_cnt_reg<=0;
        else
            if rising_edge(SCL) then
                if tx_EN_shift_reg ='1' then
                    tx_byte_shift_reg(N-1 downto 1)<= tx_byte_shift_reg(N-2 downto 0);
                    SDA<=tx_byte_shift_reg(N-1);
                    tx_byte_shift_reg(0)<=tx_next_bit_shift_reg;
                    tx_cnt_reg<=tx_cnt_reg+1;
                elsif tx_ld_shift_reg ='1' then
                     tx_byte_shift_reg(N-1 downto 0)<=tx_ld_byte_shift_reg;
                     tx_cnt_reg<=0;
                end if;
            end if;
        end if;
    end process;
    
    RX_SHIFT_REG:process(SCL,rx_EN_shift_reg)
    begin
        if rx_cnt_rst='1' then
            rx_cnt_reg<=0;
        else
            if rising_edge(SCL) then
                if rx_EN_shift_reg ='1' then
                    rx_byte_shift_reg(N-1 downto 1)<= tx_byte_shift_reg(N-2 downto 0);
                    rx_byte_shift_reg(0)<=SDA;--on échantillon SDA avec SCL;
                    rx_cnt_reg<=rx_cnt_reg+1;
                end if;
            end if;
       end if;
    end process;
    
    
    
end architecture;
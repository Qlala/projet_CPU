library ieee;
	use ieee.std_logic_1164.all;
	use ieee.NUMERIC_STD.all;

library std;
	use std.textio.all;

entity tb_UART_RS232 is
end entity;

architecture rtl_sim of tb_UART_RS232 is
	constant N: natural := 8;
	constant START_B: std_logic := '0';
	constant STOP_B: std_logic := '1';
	constant DEFAULT_LINE_STATE: std_logic := '1';
	constant PARITY_CHECK: boolean := TRUE;

	constant CLK_PERIOD: time := 40 ns;
	constant RST_HOLD_DURATION: time := 200 ns;
	signal TX: std_logic;
	signal RX: std_logic;
	signal CTS: std_logic;
	signal RTS: std_logic;
	signal rx_data: std_logic_vector(N - 1 downto 0);
	signal rx_valid: std_logic;
	signal rx_new_data: std_logic;
	signal rx_ack: std_logic;
	signal tx_data: std_logic_vector(N - 1 downto 0);
	signal tx_start: std_logic;
	signal tx_done: std_logic;
	signal CLK: std_logic;
	signal RST: std_logic;
begin

	stimuli_p: process is
	begin
		wait;
	end process;

	UART_RS232_inst: entity work.UART_RS232
		generic map (
			N                  => N,
			START_B            => START_B,
			STOP_B             => STOP_B,
			DEFAULT_LINE_STATE => DEFAULT_LINE_STATE,
			PARITY_CHECK       => PARITY_CHECK
		)
		port map (
			TX                 => TX,
			RX                 => RX,
			CTS                => CTS,
			RTS                => RTS,
			rx_data            => rx_data,
			rx_valid           => rx_valid,
			rx_new_data        => rx_new_data,
			rx_ack             => rx_ack,
			tx_data            => tx_data,
			tx_start           => tx_start,
			tx_done            => tx_done,
			CLK                => CLK,
			RST                => RST
		);
    CTS<=RTS;
    tx_data<=x"2A";
    tx_start<='1';
    RX<=TX;
    rx_ack<=tx_done;
	clock_p: process is
	begin
		CLK <= '0';
		wait for CLK_PERIOD / 2;
		CLK <= '1';
		wait for CLK_PERIOD / 2;
	end process;

	reset_p: process is
	begin
		RST <= '0';
		wait for RST_HOLD_DURATION;
		RST <= '1';
		wait;
	end process;
	process 
	begin

		wait for 390 ns;

		wait until rising_edge(CLK);
		wait until CLK='0';
		--tx_start<='0';
	end process;
end architecture;
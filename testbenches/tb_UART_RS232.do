vlib work

vcom -2008 "../my_ip/UART_RS232.vhd"
vcom -2008 "tb_UART_RS232.vhd"

vsim tb_UART_RS232

add wave *
add wave -divider
add wave /UART_RS232_inst/*
add wave -divider

run 10ms

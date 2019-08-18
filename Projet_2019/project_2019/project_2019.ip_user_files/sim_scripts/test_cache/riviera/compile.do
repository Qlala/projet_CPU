vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_2019.srcs/sources_1/bd/test_cache/ipshared/c923" \
"E:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"E:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/test_cache/ip/test_cache_Cache_bus_M_to_S_0_0/sim/test_cache_Cache_bus_M_to_S_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_2019.srcs/sources_1/bd/test_cache/ipshared/c923" \
"../../../bd/test_cache/ip/test_cache_clk_wiz_2/test_cache_clk_wiz_2_clk_wiz.v" \
"../../../bd/test_cache/ip/test_cache_clk_wiz_2/test_cache_clk_wiz_2.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/test_cache/ip/test_cache_Cache_bus_M_to_S_peer_0_1/sim/test_cache_Cache_bus_M_to_S_peer_0_1.vhd" \
"../../../bd/test_cache/sim/test_cache.vhd" \

vlog -work xil_defaultlib \
"glbl.v"


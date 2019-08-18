-makelib xcelium_lib/xil_defaultlib -sv \
  "E:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "E:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/test_cache/ip/test_cache_Cache_bus_M_to_S_0_0/sim/test_cache_Cache_bus_M_to_S_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/test_cache/ip/test_cache_clk_wiz_2/test_cache_clk_wiz_2_clk_wiz.v" \
  "../../../bd/test_cache/ip/test_cache_clk_wiz_2/test_cache_clk_wiz_2.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/test_cache/ip/test_cache_Cache_bus_M_to_S_peer_0_1/sim/test_cache_Cache_bus_M_to_S_peer_0_1.vhd" \
  "../../../bd/test_cache/sim/test_cache.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib


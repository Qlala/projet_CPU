vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/clocking/mig_7series_v4_0_clk_ibuf.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/clocking/mig_7series_v4_0_infrastructure.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/clocking/mig_7series_v4_0_iodelay_ctrl.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/clocking/mig_7series_v4_0_tempmon.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_arb_mux.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_arb_row_col.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_arb_select.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_bank_cntrl.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_bank_common.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_bank_compare.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_bank_mach.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_bank_queue.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_bank_state.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_col_mach.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_mc.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_rank_cntrl.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_rank_common.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_rank_mach.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/controller/mig_7series_v4_0_round_robin_arb.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_buf.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_dec_fix.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_gen.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_merge_enc.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/ecc/mig_7series_v4_0_fi_xor.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/ip_top/mig_7series_v4_0_memc_ui_top_std.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/ip_top/mig_7series_v4_0_mem_intfc.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_byte_group_io.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_byte_lane.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_calib_top.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_if_post_fifo.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_mc_phy.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_mc_phy_wrapper.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_of_pre_fifo.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_4lanes.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_dqs_found_cal.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_dqs_found_cal_hr.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_init.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_cntlr.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_data.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_edge.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_lim.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_mux.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_po_cntlr.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_samp.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_oclkdelay_cal.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_prbs_rdlvl.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_rdlvl.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_tempmon.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrcal.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrlvl.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrlvl_off_delay.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_prbs_gen.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_poc_cc.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_poc_edge_store.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_poc_meta.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_poc_pd.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_poc_tap_base.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_poc_top.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/ui/mig_7series_v4_0_ui_cmd.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/ui/mig_7series_v4_0_ui_rd_data.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/ui/mig_7series_v4_0_ui_top.v" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/ui/mig_7series_v4_0_ui_wr_data.v" \

vcom -work xil_defaultlib -93 \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_top.vhd" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/mig_7series_0_mig_sim.vhd" \
"../../../../project_3.srcs/sources_1/ip/mig_7series_0_1/mig_7series_0/user_design/rtl/mig_7series_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"


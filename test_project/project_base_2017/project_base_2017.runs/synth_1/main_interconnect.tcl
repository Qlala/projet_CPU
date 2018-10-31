# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache E:/Users/Qlala/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-12540-Qlala-PC/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/xilinx_project/CPUproject/projet_CPU/test_project/project_base_2017/project_base_2017.cache/wt [current_project]
set_property parent.project_path E:/xilinx_project/CPUproject/projet_CPU/test_project/project_base_2017/project_base_2017.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo e:/xilinx_project/CPUproject/projet_CPU/test_project/project_base_2017/project_base_2017.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  E:/xilinx_project/CPUproject/projet_CPU/test_project/project_base_2017/project_base_2017.srcs/sources_1/imports/my_lib/digit_display.vhd
  E:/xilinx_project/CPUproject/projet_CPU/test_project/project_base_2017/project_base_2017.srcs/sources_1/imports/my_lib/symetric_freq_divider.vhd
  E:/xilinx_project/CPUproject/projet_CPU/test_project/project_base_2017/project_base_2017.srcs/sources_1/imports/my_lib/main_interconnect.vhd
}
read_vhdl -vhdl2008 -library xil_defaultlib E:/xilinx_project/CPUproject/projet_CPU/test_project/project_base_2017/project_base_2017.srcs/sources_1/new/UART_RS232.vhd
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/xilinx_project/CPUproject/projet_CPU/test_project/project_base_2017/project_base_2017.srcs/constrs_1/imports/my_lib/Nexys-4-DDR-Master.xdc
set_property used_in_implementation false [get_files E:/xilinx_project/CPUproject/projet_CPU/test_project/project_base_2017/project_base_2017.srcs/constrs_1/imports/my_lib/Nexys-4-DDR-Master.xdc]


synth_design -top main_interconnect -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef main_interconnect.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file main_interconnect_utilization_synth.rpt -pb main_interconnect_utilization_synth.pb"

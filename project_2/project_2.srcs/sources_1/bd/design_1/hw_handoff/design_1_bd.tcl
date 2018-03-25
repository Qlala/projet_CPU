
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# CLOCK_manager, Freq_Divider, Freq_Divider, digit_display, switches_manager

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set AN [ create_bd_port -dir O -from 0 -to 7 AN ]
  set CA [ create_bd_port -dir O CA ]
  set CB [ create_bd_port -dir O CB ]
  set CC [ create_bd_port -dir O CC ]
  set CD [ create_bd_port -dir O CD ]
  set CE [ create_bd_port -dir O CE ]
  set CF [ create_bd_port -dir O CF ]
  set CG [ create_bd_port -dir O CG ]
  set DP [ create_bd_port -dir O DP ]
  set EXT_OSC [ create_bd_port -dir I -type clk EXT_OSC ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
 ] $EXT_OSC
  set JA1 [ create_bd_port -dir O JA1 ]
  set OK_button [ create_bd_port -dir I OK_button ]
  set RST_button [ create_bd_port -dir I -type rst RST_button ]
  set SW [ create_bd_port -dir I -from 15 -to 0 SW ]

  # Create instance: CLOCK_manager_0, and set properties
  set block_name CLOCK_manager
  set block_cell_name CLOCK_manager_0
  if { [catch {set CLOCK_manager_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $CLOCK_manager_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.Divide_0 {15} \
   CONFIG.Divide_1 {16} \
   CONFIG.multiplier {16} \
 ] $CLOCK_manager_0

  # Create instance: Freq_Divider_1, and set properties
  set block_name Freq_Divider
  set block_cell_name Freq_Divider_1
  if { [catch {set Freq_Divider_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Freq_Divider_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.divide_by {100000000} \
 ] $Freq_Divider_1

  # Create instance: Freq_Divider_2, and set properties
  set block_name Freq_Divider
  set block_cell_name Freq_Divider_2
  if { [catch {set Freq_Divider_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Freq_Divider_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.divide_by {10000} \
 ] $Freq_Divider_2

  # Create instance: digit_display_0, and set properties
  set block_name digit_display
  set block_cell_name digit_display_0
  if { [catch {set digit_display_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $digit_display_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: switches_manager_0, and set properties
  set block_name switches_manager
  set block_cell_name switches_manager_0
  if { [catch {set switches_manager_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $switches_manager_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net CLOCK_manager_0_CLKFBOUT [get_bd_pins CLOCK_manager_0/CLKFBIN] [get_bd_pins CLOCK_manager_0/CLKFBOUT]
  connect_bd_net -net CLOCK_manager_0_CLK_out1 [get_bd_pins CLOCK_manager_0/CLK_out1] [get_bd_pins Freq_Divider_1/CLK]
  connect_bd_net -net EXT_OSC_1 [get_bd_ports EXT_OSC] [get_bd_pins CLOCK_manager_0/master_CLK] [get_bd_pins Freq_Divider_2/CLK] [get_bd_pins switches_manager_0/CLK]
  connect_bd_net -net Freq_Divider_2_CLK_out [get_bd_pins Freq_Divider_2/CLK_out] [get_bd_pins digit_display_0/CLK]
  connect_bd_net -net OK_button_1 [get_bd_ports OK_button] [get_bd_pins switches_manager_0/save_enable]
  connect_bd_net -net RST_button_1 [get_bd_ports RST_button] [get_bd_pins CLOCK_manager_0/reset]
  connect_bd_net -net SW_1 [get_bd_ports SW] [get_bd_pins switches_manager_0/switches]
  connect_bd_net -net digit_display_0_AN [get_bd_ports AN] [get_bd_pins digit_display_0/AN]
  connect_bd_net -net digit_display_0_CA [get_bd_ports CA] [get_bd_pins digit_display_0/CA]
  connect_bd_net -net digit_display_0_CB [get_bd_ports CB] [get_bd_pins digit_display_0/CB]
  connect_bd_net -net digit_display_0_CC [get_bd_ports CC] [get_bd_pins digit_display_0/CC]
  connect_bd_net -net digit_display_0_CD [get_bd_ports CD] [get_bd_pins digit_display_0/CD]
  connect_bd_net -net digit_display_0_CE [get_bd_ports CE] [get_bd_pins digit_display_0/CE]
  connect_bd_net -net digit_display_0_CF [get_bd_ports CF] [get_bd_pins digit_display_0/CF]
  connect_bd_net -net digit_display_0_CG [get_bd_ports CG] [get_bd_pins digit_display_0/CG]
  connect_bd_net -net digit_display_0_DP [get_bd_ports DP] [get_bd_pins digit_display_0/DP]
  connect_bd_net -net switches_manager_0_byte0 [get_bd_pins digit_display_0/disp_byte0] [get_bd_pins switches_manager_0/byte0]
  connect_bd_net -net switches_manager_0_byte0_saved [get_bd_pins digit_display_0/disp_byte2] [get_bd_pins switches_manager_0/byte0_saved]
  connect_bd_net -net switches_manager_0_byte1 [get_bd_pins digit_display_0/disp_byte1] [get_bd_pins switches_manager_0/byte1]
  connect_bd_net -net switches_manager_0_byte1_saved [get_bd_pins digit_display_0/disp_byte3] [get_bd_pins switches_manager_0/byte1_saved]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""



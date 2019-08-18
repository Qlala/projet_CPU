# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "Divide_0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Divide_1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Divide_2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Divide_3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Divide_4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Divide_5" -parent ${Page_0}
  ipgui::add_param $IPINST -name "multiplier" -parent ${Page_0}


}

proc update_PARAM_VALUE.Divide_0 { PARAM_VALUE.Divide_0 } {
	# Procedure called to update Divide_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Divide_0 { PARAM_VALUE.Divide_0 } {
	# Procedure called to validate Divide_0
	return true
}

proc update_PARAM_VALUE.Divide_1 { PARAM_VALUE.Divide_1 } {
	# Procedure called to update Divide_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Divide_1 { PARAM_VALUE.Divide_1 } {
	# Procedure called to validate Divide_1
	return true
}

proc update_PARAM_VALUE.Divide_2 { PARAM_VALUE.Divide_2 } {
	# Procedure called to update Divide_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Divide_2 { PARAM_VALUE.Divide_2 } {
	# Procedure called to validate Divide_2
	return true
}

proc update_PARAM_VALUE.Divide_3 { PARAM_VALUE.Divide_3 } {
	# Procedure called to update Divide_3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Divide_3 { PARAM_VALUE.Divide_3 } {
	# Procedure called to validate Divide_3
	return true
}

proc update_PARAM_VALUE.Divide_4 { PARAM_VALUE.Divide_4 } {
	# Procedure called to update Divide_4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Divide_4 { PARAM_VALUE.Divide_4 } {
	# Procedure called to validate Divide_4
	return true
}

proc update_PARAM_VALUE.Divide_5 { PARAM_VALUE.Divide_5 } {
	# Procedure called to update Divide_5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Divide_5 { PARAM_VALUE.Divide_5 } {
	# Procedure called to validate Divide_5
	return true
}

proc update_PARAM_VALUE.multiplier { PARAM_VALUE.multiplier } {
	# Procedure called to update multiplier when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.multiplier { PARAM_VALUE.multiplier } {
	# Procedure called to validate multiplier
	return true
}


proc update_MODELPARAM_VALUE.multiplier { MODELPARAM_VALUE.multiplier PARAM_VALUE.multiplier } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.multiplier}] ${MODELPARAM_VALUE.multiplier}
}

proc update_MODELPARAM_VALUE.Divide_0 { MODELPARAM_VALUE.Divide_0 PARAM_VALUE.Divide_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Divide_0}] ${MODELPARAM_VALUE.Divide_0}
}

proc update_MODELPARAM_VALUE.Divide_1 { MODELPARAM_VALUE.Divide_1 PARAM_VALUE.Divide_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Divide_1}] ${MODELPARAM_VALUE.Divide_1}
}

proc update_MODELPARAM_VALUE.Divide_2 { MODELPARAM_VALUE.Divide_2 PARAM_VALUE.Divide_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Divide_2}] ${MODELPARAM_VALUE.Divide_2}
}

proc update_MODELPARAM_VALUE.Divide_3 { MODELPARAM_VALUE.Divide_3 PARAM_VALUE.Divide_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Divide_3}] ${MODELPARAM_VALUE.Divide_3}
}

proc update_MODELPARAM_VALUE.Divide_4 { MODELPARAM_VALUE.Divide_4 PARAM_VALUE.Divide_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Divide_4}] ${MODELPARAM_VALUE.Divide_4}
}

proc update_MODELPARAM_VALUE.Divide_5 { MODELPARAM_VALUE.Divide_5 PARAM_VALUE.Divide_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Divide_5}] ${MODELPARAM_VALUE.Divide_5}
}


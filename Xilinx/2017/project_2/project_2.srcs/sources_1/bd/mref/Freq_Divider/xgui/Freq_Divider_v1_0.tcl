# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "divide_by" -parent ${Page_0}


}

proc update_PARAM_VALUE.divide_by { PARAM_VALUE.divide_by } {
	# Procedure called to update divide_by when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.divide_by { PARAM_VALUE.divide_by } {
	# Procedure called to validate divide_by
	return true
}


proc update_MODELPARAM_VALUE.divide_by { MODELPARAM_VALUE.divide_by PARAM_VALUE.divide_by } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.divide_by}] ${MODELPARAM_VALUE.divide_by}
}


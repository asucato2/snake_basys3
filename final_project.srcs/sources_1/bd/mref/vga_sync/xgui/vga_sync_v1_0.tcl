# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "h_end_count" -parent ${Page_0}
  ipgui::add_param $IPINST -name "h_pixels_across" -parent ${Page_0}
  ipgui::add_param $IPINST -name "h_sync_end" -parent ${Page_0}
  ipgui::add_param $IPINST -name "h_sync_start" -parent ${Page_0}
  ipgui::add_param $IPINST -name "v_end_count" -parent ${Page_0}
  ipgui::add_param $IPINST -name "v_pixels_down" -parent ${Page_0}
  ipgui::add_param $IPINST -name "v_sync_end" -parent ${Page_0}
  ipgui::add_param $IPINST -name "v_sync_start" -parent ${Page_0}


}

proc update_PARAM_VALUE.h_end_count { PARAM_VALUE.h_end_count } {
	# Procedure called to update h_end_count when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.h_end_count { PARAM_VALUE.h_end_count } {
	# Procedure called to validate h_end_count
	return true
}

proc update_PARAM_VALUE.h_pixels_across { PARAM_VALUE.h_pixels_across } {
	# Procedure called to update h_pixels_across when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.h_pixels_across { PARAM_VALUE.h_pixels_across } {
	# Procedure called to validate h_pixels_across
	return true
}

proc update_PARAM_VALUE.h_sync_end { PARAM_VALUE.h_sync_end } {
	# Procedure called to update h_sync_end when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.h_sync_end { PARAM_VALUE.h_sync_end } {
	# Procedure called to validate h_sync_end
	return true
}

proc update_PARAM_VALUE.h_sync_start { PARAM_VALUE.h_sync_start } {
	# Procedure called to update h_sync_start when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.h_sync_start { PARAM_VALUE.h_sync_start } {
	# Procedure called to validate h_sync_start
	return true
}

proc update_PARAM_VALUE.v_end_count { PARAM_VALUE.v_end_count } {
	# Procedure called to update v_end_count when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.v_end_count { PARAM_VALUE.v_end_count } {
	# Procedure called to validate v_end_count
	return true
}

proc update_PARAM_VALUE.v_pixels_down { PARAM_VALUE.v_pixels_down } {
	# Procedure called to update v_pixels_down when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.v_pixels_down { PARAM_VALUE.v_pixels_down } {
	# Procedure called to validate v_pixels_down
	return true
}

proc update_PARAM_VALUE.v_sync_end { PARAM_VALUE.v_sync_end } {
	# Procedure called to update v_sync_end when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.v_sync_end { PARAM_VALUE.v_sync_end } {
	# Procedure called to validate v_sync_end
	return true
}

proc update_PARAM_VALUE.v_sync_start { PARAM_VALUE.v_sync_start } {
	# Procedure called to update v_sync_start when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.v_sync_start { PARAM_VALUE.v_sync_start } {
	# Procedure called to validate v_sync_start
	return true
}


proc update_MODELPARAM_VALUE.h_pixels_across { MODELPARAM_VALUE.h_pixels_across PARAM_VALUE.h_pixels_across } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.h_pixels_across}] ${MODELPARAM_VALUE.h_pixels_across}
}

proc update_MODELPARAM_VALUE.h_sync_start { MODELPARAM_VALUE.h_sync_start PARAM_VALUE.h_sync_start } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.h_sync_start}] ${MODELPARAM_VALUE.h_sync_start}
}

proc update_MODELPARAM_VALUE.h_sync_end { MODELPARAM_VALUE.h_sync_end PARAM_VALUE.h_sync_end } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.h_sync_end}] ${MODELPARAM_VALUE.h_sync_end}
}

proc update_MODELPARAM_VALUE.h_end_count { MODELPARAM_VALUE.h_end_count PARAM_VALUE.h_end_count } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.h_end_count}] ${MODELPARAM_VALUE.h_end_count}
}

proc update_MODELPARAM_VALUE.v_pixels_down { MODELPARAM_VALUE.v_pixels_down PARAM_VALUE.v_pixels_down } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.v_pixels_down}] ${MODELPARAM_VALUE.v_pixels_down}
}

proc update_MODELPARAM_VALUE.v_sync_start { MODELPARAM_VALUE.v_sync_start PARAM_VALUE.v_sync_start } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.v_sync_start}] ${MODELPARAM_VALUE.v_sync_start}
}

proc update_MODELPARAM_VALUE.v_sync_end { MODELPARAM_VALUE.v_sync_end PARAM_VALUE.v_sync_end } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.v_sync_end}] ${MODELPARAM_VALUE.v_sync_end}
}

proc update_MODELPARAM_VALUE.v_end_count { MODELPARAM_VALUE.v_end_count PARAM_VALUE.v_end_count } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.v_end_count}] ${MODELPARAM_VALUE.v_end_count}
}


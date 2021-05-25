set_global_assignment -entity "ddio" -library "lib_ddio" -name IP_TOOL_NAME "altera_gpio_lite"
set_global_assignment -entity "ddio" -library "lib_ddio" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "ddio" -library "lib_ddio" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_ddio" -name SPD_FILE [file join $::quartus(sip_path) "ddio.spd"]

set_global_assignment -library "lib_ddio" -name MISC_FILE [file join $::quartus(sip_path) "ddio_sim/ddio.v"]
set_global_assignment -library "lib_ddio" -name MISC_FILE [file join $::quartus(sip_path) "ddio_sim/altera_gpio_lite/altera_gpio_lite.sv"]

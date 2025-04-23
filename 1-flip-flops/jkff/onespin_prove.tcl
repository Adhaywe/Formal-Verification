# TCL-script for OneSpin (Siemens EDA)

# Change working directory to the directory of the script
set SCRIPT_LOCATION [file dirname [file normalize [info script]]]
cd $SCRIPT_LOCATION

# Restart
set_mode setup
delete_design -both
remove_server -all

# Change style from name/name to name.name
set_session_option -naming_style sv

# Load the file(s) by using the SystemVerilog standard SV2012
read_verilog -golden -version sv2012 {
    dff.sv
    jkff.sv
}

elaborate    -golden
compile      -golden
set_mode mv

read_sva fv_jkff.sv

# Uncomment this to automatically check the properties
check -all [get_assertions]

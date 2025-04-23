# TCL-script for VC Formal (Synopsys)

# Change working directory to the directory of the script
set SCRIPT_LOCATION [file dirname [file normalize [info script]]] 
cd $SCRIPT_LOCATION


#################
# Configure VCF #
set_fml_appmode FPV
set_app_var apply_bind_in_all_units true
set_app_var fml_auto_save default
set_app_var fml_composite_trace true
set_fml_var fml_witness_on true
set_fml_var fml_vacuity_on true


###############
# Load Design #
analyze -format sverilog -vcs "dff.sv"
analyze -format sverilog -vcs "-assert svaext fv_dff.sv"

set top dff
set elaborateOption -verbose
elaborate $top $elaborateOption -sva 

create_clock clk -period 2
#create_reset rst -sense high


####################
# Check properties #
#sim_run -stable
#sim_save_reset

# Uncomment this to automatically check the properties
#check_fv

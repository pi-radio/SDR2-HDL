cd /Users/zapma/Pi-Radio/SDR2-HDL

open_project SDR2-HDL.xpr
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
update_compile_order -fileset sources_1
open_bd_design {SDR2-HDL.srcs/sources_1/bd/SDRv2/SDRv2.bd}

source update.tcl

#reset_run synth_1
#launch_runs synth_1 -jobs 2

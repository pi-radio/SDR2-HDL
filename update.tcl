cd /Users/zapma/Documents/PiRadIP
source generate_all.tcl

cd /Users/zapma/Pi-Radio/SDR2-HDL
update_ip_catalog -rebuild -repo_path c:/Users/zapma/Documents/PiRadIP
report_ip_status
upgrade_ip [get_ips  {SDRv2_axis_sample_buffer_o_0_10 SDRv2_axis_sample_buffer_o_0_11 SDRv2_axis_sample_buffer_o_0_14 SDRv2_axis_sample_buffer_o_0_17 SDRv2_axis_sample_buffer_o_0_15 SDRv2_axis_sample_buffer_o_0_13 SDRv2_axis_sample_buffer_o_0_12 SDRv2_axis_sample_buffer_o_0_16 SDRv2_piradspi_ip_0_0}] -log ip_upgrade.log
export_ip_user_files -of_objects [get_ips {SDRv2_axis_sample_buffer_o_0_10 SDRv2_axis_sample_buffer_o_0_11 SDRv2_axis_sample_buffer_o_0_14 SDRv2_axis_sample_buffer_o_0_17 SDRv2_axis_sample_buffer_o_0_15 SDRv2_axis_sample_buffer_o_0_13 SDRv2_axis_sample_buffer_o_0_12 SDRv2_axis_sample_buffer_o_0_16 SDRv2_piradspi_ip_0_0}] -no_script -sync -force 
generate_target all [get_files  C:/Users/zapma/Pi-Radio/SDR2-HDL/SDR2-HDL.srcs/sources_1/bd/SDRv2/SDRv2.bd]
report_ip_status

synth_design -top SDRv2_wrapper -part xczu28dr-ffvg1517-2-e -verbose

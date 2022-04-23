update_ip_catalog -rebuild -repo_path ../PiRadIP
report_ip_status
upgrade_ip [get_ips  {SDRv2_axis_sample_buffer_o_0_0 SDRv2_axis_sample_buffer_o_1_0 SDRv2_axis_sample_buffer_o_2_0 SDRv2_axis_sample_buffer_o_3_0 SDRv2_axis_sample_buffer_o_4_0 SDRv2_axis_sample_buffer_o_5_0 SDRv2_axis_sample_buffer_o_6_0 SDRv2_axis_sample_buffer_o_7_0 SDRv2_piradspi_ip_0_0}] -log ip_upgrade.log
export_ip_user_files -of_objects [get_ips {SDRv2_axis_sample_buffer_o_0_10 SDRv2_axis_sample_buffer_o_0_11 SDRv2_axis_sample_buffer_o_0_14 SDRv2_axis_sample_buffer_o_0_17 SDRv2_axis_sample_buffer_o_0_15 SDRv2_axis_sample_buffer_o_0_13 SDRv2_axis_sample_buffer_o_0_12 SDRv2_axis_sample_buffer_o_0_16 SDRv2_piradspi_ip_0_0}] -no_script -sync -force \
    
generate_target all [get_files  SDR2-HDL.srcs/sources_1/bd/SDRv2/SDRv2.bd]

export_ip_user_files -of_objects [get_files SDR2-HDL.srcs/sources_1/bd/SDRv2/SDRv2.bd] -no_script -sync -force -quiet

report_ip_status


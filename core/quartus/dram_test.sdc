
## VENDOR  "Altera"
## PROGRAM "Quartus II"

#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {clk_in} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk_in}]


#**************************************************************
# Create Generated Clock
#**************************************************************

#derive_pll_clocks
create_generated_clock -name data_clk \
    -source [get_pins {dram_pll|*|*|pll1|inclk[0]}] \
    -multiply_by 2 [get_pins {dram_pll|*|*|pll1|clk[0]}]
create_generated_clock -name shifted_clk \
    -source [get_pins {dram_pll|*|*|pll1|inclk[0]}] \
    -multiply_by 2 -phase 90 [get_pins {dram_pll|*|*|pll1|clk[1]}]
create_generated_clock -name output_clk \
    -source [get_pins {dram_pll|*|*|pll1|clk[1]}] \
    [get_ports {dram_stb*}]


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -clock [get_clocks {output_clk}] -max 1.50 [get_ports {dram_data*}] -add_delay
set_output_delay -clock [get_clocks {output_clk}] -min -0.8 [get_ports {dram_data*}] -add_delay
set_output_delay -clock [get_clocks {output_clk}] -max 1.50 -clock_fall [get_ports {dram_data*}] -add_delay
set_output_delay -clock [get_clocks {output_clk}] -min -0.8 -clock_fall [get_ports {dram_data*}] -add_delay


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -setup -rise_from [get_clocks {data_clk}] -fall_to [get_clocks {output_clk}]
set_false_path -setup -fall_from [get_clocks {data_clk}] -rise_to [get_clocks {output_clk}]
set_false_path -hold -rise_from [get_clocks {data_clk}] -fall_to [get_clocks {output_clk}]
set_false_path -hold -fall_from [get_clocks {data_clk}] -rise_to [get_clocks {output_clk}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************


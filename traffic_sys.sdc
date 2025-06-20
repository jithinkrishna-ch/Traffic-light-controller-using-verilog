create_clock -period 10 [get_ports clk]

set_input_delay -max 2 -clock clk [get_ports {clk reset t1 t2 t3 t4}]
set_input_transition 0.5 [get_ports {clk reset t1 t2 t3 t4}]

set_output_delay -max 2 -clock clk [get_ports {north_light[0] north_light[1] north_light[2] 
                                                west_light[0] west_light[1] west_light[2] 
                                                south_light[0] south_light[1] south_light[2] 
                                                east_light[0] east_light[1] east_light[2] 
                                                count[0] count[1] count[2] count[3]}]

set_clock_uncertainty -setup 0.3 [get_clocks clk]
set_clock_uncertainty -hold 0.1 [get_clocks clk]

set_max_transition 0.25 [current_design]
set_max_transition -clock_path 0.15 [get_clocks clk]

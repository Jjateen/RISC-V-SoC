//Copyright (C)2014-2023 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//GOWIN Version: 1.9.8.09 Education
//Created Time: 2023-11-19 16:32:34
create_clock -name SYS_CLK -period 37.037 -waveform {0 18.518} [get_ports {clk_in}]
create_clock -name PLL_CLK -period 33.333 -waveform {0 16.666} [get_nets {clk}]

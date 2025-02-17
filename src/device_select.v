module device_select (
    input [31:0] addr,
    output s0_sel_mem,
    output s1_sel_leds
    // output s2_sel,
    // output s3_sel,
    // output s4_sel,
    // output s5_sel,
    // output s6_sel,
    // output s7_sel,
    // output s8_sel
);


  wire mem_space = (addr[31:28] == 4'h0);
  wire leds_space = (addr[31:28] == 4'h4);

  assign s0_sel_mem  = mem_space;
  assign s1_sel_leds = leds_space;

endmodule

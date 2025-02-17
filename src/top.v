module top (
    input clk,
    input reset_n,
    output reg [4:0] leds
);


   wire mem_rstrb;
   wire mem_instr;
   wire mem_ready;
   wire [31:0] mem_addr;
   wire [31:0] mem_wdata;
   wire [3:0] mem_wstrb;
   wire [31:0] mem_rdata;

   wire s0_sel_mem;
   wire s1_sel_leds;

   wire [31:0] processor_rdata = (s1_sel_leds)? {{27{1'b0}},leds} : mem_rdata;


  Memory #(
      .MEM_FILE("/home/jjateen/Desktop/risc-v-soc/firmware/firmware.hex"),
      .SIZE(1024)
  ) D_mem_unit (
      .clk(clk),
      .mem_addr(mem_addr),
      .mem_rdata(mem_rdata),
      .mem_rstrb(s0_sel_mem & mem_rstrb),
      .mem_wdata(mem_wdata),
      .mem_wmask({4{s0_sel_mem}} & mem_wstrb)
  );

  FemtoRV32  processor (
      .clk      (clk),
      .reset   (reset_n),
      .mem_rstrb(mem_rstrb),
      .mem_rbusy(1'b0),
      .mem_wbusy(1'b0),
      .mem_addr (mem_addr),
      .mem_wdata(mem_wdata),
      .mem_wmask(mem_wstrb),
      .mem_rdata(processor_rdata)
  );

  device_select dv_sel(
    .addr(mem_addr),
    .s0_sel_mem(s0_sel_mem),
    .s1_sel_leds(s1_sel_leds)
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        leds <= 'h0;
    end 
    else begin
        if (s1_sel_leds &  mem_wstrb[0]) begin
            leds <= mem_wdata[4:0];
        end
    end
end

endmodule

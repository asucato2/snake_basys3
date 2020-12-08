module clk_5hz_gen(
    input clk_25mhz,
    input sclr,
    input en,
    output clk_5hz
);
  
  localparam TOP = 23'd2_500_000;
  reg[22:0] q;
  wire q_at_target;
  
  // counter
  always @(posedge clk_25mhz) begin
    if (sclr || q_at_target) begin
      q <= 0;
    end else if (en) begin
      q <= q + 1;
    end
  end
  
  assign q_at_target = (q == TOP);
  
  assign clk_5hz = q_at_target;   
endmodule

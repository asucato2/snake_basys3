module sr_flipflop(
    input clk,
    input s,
    input r,
    output reg q
);

  always @(posedge clk) begin
    if (r) q <= 0;
    else if (s) q <= 1;
  end
endmodule

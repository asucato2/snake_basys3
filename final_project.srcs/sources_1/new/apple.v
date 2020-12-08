module apple(
    input reset,
    input[9:0] pixel_col,
    input[9:0] pixel_row,
    input update,
    output reg apple_on
);

  localparam SIZE = 10'd10;
  
  reg[9:0] x, y;

  always @(*) begin
    if ((pixel_col > x) && (pixel_col < (x + SIZE)) &&
        (pixel_row > y) && (pixel_row < (y + SIZE)))
    begin
      apple_on = 1;
    end else begin
      apple_on = 0;
    end
  end
  
  always @(posedge update or posedge reset) begin
    if (reset) begin
      x <= 10'd320;
      y <= 10'd240;
    end else begin
      // Add random functionality
      x <= x + 10;
      y <= y + 10;
    end
  end
endmodule

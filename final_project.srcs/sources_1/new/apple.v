module apple(
    input reset,
    input[9:0] pixel_col,
    input[9:0] pixel_row,
    input[9:0] rand_x,
    input[9:0] rand_y,
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
  
  always @(posedge update) begin
    x <= rand_x;
    y <= rand_y;
  end
endmodule

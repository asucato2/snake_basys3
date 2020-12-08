module border(
    input[9:0] pixel_row, pixel_col,
    output reg border_on
);
  
  always @(*) begin
    if ((pixel_col < 10) || (pixel_col > 630) || (pixel_row < 10) || (pixel_row > 470)) begin
      border_on = 1;
    end else begin
      border_on = 0;
    end
  end
endmodule

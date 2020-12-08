`timescale 1ns / 1ns

module tb_snake_top();

  reg clk_100mhz, reset, pause;
  
  snake_top dut(
    .CLK100MHZ(clk_100mhz),
    .SW({pause, reset})    
  );
  
  always #5 clk_100mhz = ~clk_100mhz;
  
  initial begin
    clk_100mhz = 0;
    reset = 1;
    pause = 0;
    #1500
    
    reset = 0;
  end
endmodule

module debouncer(
    input clk,
    input reset,
    input db_in,
    output reg db_out
    );
  
  reg sync_0, sync_1;
  reg [19:0] count;
  wire stable;
  
  localparam COUNT_MAX = {20{1'b1}};
  
  assign stable = db_out == sync_1;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      sync_0 = 0;
      sync_1 = 0;
    end else begin
      sync_0 <= db_in;
      sync_1 <= sync_0;
    end
  end
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      db_out <= 0;
      count <= 0;
    end else if (stable) begin
      count <= 20'd0;
    end else if (count == COUNT_MAX) begin
      db_out <= sync_1;
      count <= 20'd0;
    end else begin
      count <= count + 20'd1;
    end
  end
endmodule
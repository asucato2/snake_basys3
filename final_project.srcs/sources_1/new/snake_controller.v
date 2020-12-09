module snake_controller(
    input clk_25mhz,
    input reset,
    input pause,
    input collision,
    input got_apple,
    input clk_5hz,
    input v_sync,
    output reg counter_en,
    output reg counter_sclr,
    output reg score_counter_sclr,
    output reg snake_update,
    output reg snake_increase_size,
    output reg apple_update,
    output[5:0] state_out
);

  localparam STATE_INIT                 = 6'b000001;
  localparam STATE_WAIT                 = 6'b000010;
  localparam STATE_SYNC                 = 6'b000100;
  localparam STATE_UPDATE               = 6'b001000;
  localparam STATE_CHECK_FOR_COLLISIONS = 6'b010000;
  localparam STATE_FINISH               = 6'b100000;
  
  reg[5:0] current_state, next_state;
  wire v_sync_edge;
  
  // For debug purposes
  assign state_out = current_state;
  
  reg v_sync_current, v_sync_last;
  assign v_sync_edge = (v_sync_current == 0) & (v_sync_last == 1);
  always @(posedge clk_25mhz) begin
    v_sync_current <= v_sync;
    v_sync_last <= v_sync_current;
  end
  
  always @(posedge clk_25mhz or posedge reset) begin
    if (reset) current_state <= STATE_INIT;
    else current_state <= next_state;
  end
  
  always @(*) begin
    next_state = current_state;
    counter_en = 0;
    counter_sclr = 0;
    score_counter_sclr = 1;
    snake_update = 0;
    snake_increase_size = 0;
    apple_update = 0;
    
    if (!pause) begin
      case (current_state)
        STATE_INIT: begin
          score_counter_sclr = 1;
          counter_sclr = 1;
          apple_update = 1;
          next_state = STATE_WAIT;
        end
        STATE_WAIT: begin
          counter_en = 1;
          if (clk_5hz) begin
            counter_sclr = 1;
            next_state = STATE_SYNC;
          end
        end
        STATE_SYNC: begin
          if (v_sync_edge) begin
            next_state = STATE_UPDATE;
          end
        end
        STATE_UPDATE: begin
          snake_update = 1;
          next_state = STATE_CHECK_FOR_COLLISIONS;
        end
        STATE_CHECK_FOR_COLLISIONS: begin
          if (collision) begin
            next_state = STATE_FINISH;
          end else if (got_apple) begin
            snake_increase_size = 1;
            apple_update = 1;
            next_state = STATE_WAIT;
          end else if (v_sync_edge) begin
            next_state = STATE_WAIT;
          end          
        end
        STATE_FINISH: begin
          // Do nothing for now
        end
      endcase
    end
  end
endmodule

module snake(
    input reset,
    input [9:0] pixel_row, pixel_col,
    input update,
    input increase_size,
    input[3:0] direction,
    output reg snake_head_on,
    output reg snake_body_on
);

  localparam BLOCK_SIZE = 10'd9;
  
  localparam DIRECTION_UP = 4'b0001;
  localparam DIRECTION_DOWN = 4'b0010;
  localparam DIRECTION_LEFT = 4'b0100;
  localparam DIRECTION_RIGHT = 4'b1000;
  
  reg[3:0] current_direction;
  reg[9:0] snake_x[0:127];
  reg[9:0] snake_y[0:127];
  reg[6:0] size;
  
  integer body_index_0,body_index_1, body_index_2;
  
  always @ (*) begin
    snake_head_on = 0;
    snake_body_on = 0;
    for (body_index_0 = 0; body_index_0 < size; body_index_0 = body_index_0 + 1) begin
      if ((pixel_col >= snake_x[body_index_0]) && (pixel_col <= (snake_x[body_index_0] + BLOCK_SIZE)) &&
          (pixel_row >= snake_y[body_index_0]) && (pixel_row <= (snake_y[body_index_0] + BLOCK_SIZE)))
      begin
        if (body_index_0 == 0)begin
          snake_head_on = 1;
        end else begin
          snake_body_on = 1;
        end
      end
    end
  end
  
  always @(posedge update or posedge reset) begin
    if (reset) begin
      snake_x[0] <= 10'd400;
      snake_x[1] <= 10'd410;
      snake_x[2] <= 10'd420;
      snake_x[3] <= 10'd430;
      snake_y[0] <= 10'd400;
      snake_y[1] <= 10'd400;
      snake_y[2] <= 10'd400;
      snake_y[3] <= 10'd400;
      for (body_index_1 = 4; body_index_1 < 128; body_index_1 = body_index_1 + 1) begin
        snake_x[body_index_1] <= 10'd700;
        snake_y[body_index_1] <= 10'd500;
      end      
    end else begin
      case (current_direction)
        DIRECTION_UP: begin
          snake_y[0] <= snake_y[0] - 10;
        end
        DIRECTION_DOWN: begin
          snake_y[0] <= snake_y[0] + 10;
        end
        DIRECTION_LEFT: begin
          snake_x[0] <= snake_x[0] - 10;
        end
        DIRECTION_RIGHT: begin
          snake_x[0] <= snake_x[0] + 10;
        end
      endcase
      
      for (body_index_2 = 127; body_index_2 > 0; body_index_2 = body_index_2 - 1) begin
        if (body_index_2 <= size - 1) begin
          snake_x[body_index_2] <= snake_x[body_index_2 - 1];
          snake_y[body_index_2] <= snake_y[body_index_2 - 1];
        end
      end
    end
  end
  
  always @(posedge update or posedge reset) begin
    if (reset) begin
      current_direction <= DIRECTION_LEFT;
    end else begin
      case (direction)
        DIRECTION_LEFT: begin
          if (current_direction != DIRECTION_RIGHT) begin
            current_direction <= DIRECTION_LEFT;
          end
        end
        DIRECTION_RIGHT: begin
          if (current_direction != DIRECTION_LEFT) begin
            current_direction <= DIRECTION_RIGHT;
          end
        end
        DIRECTION_UP: begin
          if (current_direction != DIRECTION_DOWN) begin
            current_direction <= DIRECTION_UP;
          end
        end
        DIRECTION_DOWN: begin
          if (current_direction != DIRECTION_UP) begin
            current_direction <= DIRECTION_DOWN; 
          end
        end
        default: begin
          current_direction <= current_direction;
        end
      endcase
    end
  end
  
  always @(posedge update or posedge reset) begin
    if (reset) begin
      size <= 7'd4;
    end else if (increase_size) begin
      size <= size + 1;
    end
  end  
endmodule

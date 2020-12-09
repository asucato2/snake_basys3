module snake_top(
    input CLK100MHZ,
    input[2:0] SW,
    input BTN_C, BTN_U, BTN_D, BTN_L, BTN_R,
    output[15:0] LED,
    output[3:0] VGA_RED, VGA_GREEN, VGA_BLUE,
    output VGA_HS, VGA_VS
);

  wire clk_25mhz;
  wire reset, pause;
  wire [9:0] pixel_row, pixel_col;
  wire red_data, green_data, blue_data, vga_red, vga_green, vga_blue, v_sync, h_sync;
  
  wire border_on, snake_head_on, snake_body_on, apple_on;
  
  wire up, down, left, right;
  wire[3:0] direction;
  
  wire counter_en, counter_sclr;
  wire clk_5hz;
  wire snake_update, snake_increase_size;
  wire apple_update;
  wire collision;
  wire got_apple;
  
  wire [3:0] score;
  wire score_counter_sclr;
  
  wire[5:0] state_out;
  
  assign direction = {right, left, down, up};
  
  clk_25mhz_gen clk_25mhz_gen(
    .clk_in(CLK100MHZ),
    .clk_out(clk_25mhz)
  );
  
  clk_5hz_gen clk_5hz_gen(
    .clk_25mhz(clk_25mhz),
    .sclr(counter_sclr),
    .en(counter_en),
    .clk_5hz(clk_5hz)
  );
    
  input_processor input_processor(
    .clk_25mhz(clk_25mhz),
    .BTN_U(BTN_U),
    .BTN_D(BTN_D),
    .BTN_L(BTN_L),
    .BTN_R(BTN_R),
    .SW(SW[1:0]),
    .up(up),
    .down(down),
    .left(left),
    .right(right),
    .reset(reset),
    .pause(pause)
  );
    
  vga_sync vga_sync (
    .clock_25mhz(clk_25mhz),
    .red(red_data),
    .green(green_data),
    .blue(blue_data),
    .red_out(vga_red),
    .green_out(vga_green),
    .blue_out(vga_blue),
    .horiz_sync_out(h_sync),
    .vert_sync_out(v_sync),
    .pixel_row(pixel_row),
    .pixel_col(pixel_col)
  );
  
  border border(
    .pixel_row(pixel_row),
    .pixel_col(pixel_col),
    .border_on(border_on)
  );
   
  apple apple(
    .reset(reset),
    .pixel_col(pixel_col),
    .pixel_row(pixel_row),
    .update(apple_update),
    .apple_on(apple_on)
  );
  
  snake snake(
    .reset(reset),
    .pixel_row(pixel_row),
    .pixel_col(pixel_col),
    .update(snake_update),
    .increase_size(snake_increase_size),
    .direction(direction),
    .snake_head_on(snake_head_on),
    .snake_body_on(snake_body_on)
  );
  
  snake_controller controller(
    .clk_25mhz(clk_25mhz),
    .reset(reset),
    .pause(pause),
    .collision(collision),
    .got_apple(got_apple),
    .clk_5hz(clk_5hz),
    .v_sync(v_sync),
    .counter_en(counter_en),
    .counter_sclr(counter_sclr),
    .score_counter_sclr(score_counter_sclr),
    .snake_update(snake_update),
    .snake_increase_size(snake_increase_size),
    .apple_update(apple_update),
    .state_out(state_out)
  );
  
  score_counter score_counter(
    .clk(clk_25mhz),
    .sclr(score_counter_sclr),
    .en(clk_5hz),
    .score_out(score)
  );
  
  assign collision = snake_head_on & (snake_body_on | border_on);
  assign got_apple = snake_head_on & apple_on;
    
  assign red_data = apple_on;
  assign green_data = snake_head_on | snake_body_on;
  assign blue_data = border_on;
  
  assign VGA_VS = v_sync;
  assign VGA_HS = h_sync;
  assign VGA_RED = {4{vga_red}};
  assign VGA_GREEN = {4{vga_green}};
  assign VGA_BLUE = {4{vga_blue}};
  
  // debug
  assign LED[5:0] = state_out;
  assign LED[15] = collision;
  assign LED[14] = got_apple;
  assign LED[13] = clk_5hz;
  assign LED[10:7] = score;
  
endmodule

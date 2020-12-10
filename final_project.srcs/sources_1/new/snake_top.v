module snake_top(
    input CLK100MHZ,
    input[2:0] SW,
    input BTN_C, BTN_U, BTN_D, BTN_L, BTN_R,
    output[15:0] LED,
    output[3:0] VGA_RED, VGA_GREEN, VGA_BLUE,
    output VGA_HS, VGA_VS,
    output[3:0] SSEG_AN,
    output[6:0] SSEG_CA
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
  reg collision;
  reg got_apple;
  
  wire [12:0] score;
  wire score_counter_sclr;
  
  wire[9:0] rand_x, rand_y;
  
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
    .rand_x(rand_x),
    .rand_y(rand_y),
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
    .en(snake_increase_size),
    .score_out(score)
  );
  
  random_point_gen random_point_gen(
    .clk(clk_25mhz),
    .reset(reset),
    .rand_x(rand_x),
    .rand_y(rand_y)
  );
  
  seven_seg_controller(
    .clock_100Mhz(CLK100MHZ),
    .reset(reset),
    .disp_in(score),
    .Anode_Activate(SSEG_AN),
    .LED_out(SSEG_CA)
  );
    
  
  always @(posedge clk_25mhz) begin
    collision <= snake_head_on & (snake_body_on | border_on);
    got_apple <= snake_head_on & apple_on;
  end
    
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
  
endmodule

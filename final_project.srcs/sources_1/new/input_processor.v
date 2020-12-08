module input_processor(
    input clk_25mhz,
    input BTN_U,
    input BTN_D,
    input BTN_L,
    input BTN_R,
    input[1:0] SW,
    output up, down, left, right, reset, pause
);
  
  assign reset = SW[0];
  
  debouncer db_up(
    .clk(clk_25mhz),
    .reset(reset),
    .db_in(BTN_U),
    .db_out(up)
  );
  
  debouncer db_down(
    .clk(clk_25mhz),
    .reset(reset),
    .db_in(BTN_D),
    .db_out(down)
  );
  
  debouncer db_left(
    .clk(clk_25mhz),
    .reset(reset),
    .db_in(BTN_L),
    .db_out(left)
  );
  
  debouncer db_right(
    .clk(clk_25mhz),
    .reset(reset),
    .db_in(BTN_R),
    .db_out(right)
  );
  
  debouncer db_pause(
    .clk(clk_25mhz),
    .reset(reset),
    .db_in(SW[1]),
    .db_out(pause)
  );    
endmodule

// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Tue Dec  8 11:01:25 2020
// Host        : LAPTOP-JJHB379V running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/asuca/OneDrive/Documents/FinalProject/final_project/final_project.srcs/sources_1/ip/clk_25mhz_gen/clk_25mhz_gen_stub.v
// Design      : clk_25mhz_gen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_25mhz_gen(clk_out, reset, locked, clk_in)
/* synthesis syn_black_box black_box_pad_pin="clk_out,reset,locked,clk_in" */;
  output clk_out;
  input reset;
  output locked;
  input clk_in;
endmodule

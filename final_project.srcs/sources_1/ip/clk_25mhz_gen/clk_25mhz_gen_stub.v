// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sat Dec  5 09:32:24 2020
// Host        : LAPTOP-JJHB379V running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top clk_25mhz_gen -prefix
//               clk_25mhz_gen_ clk_25mhz_gen_stub.v
// Design      : clk_25mhz_gen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_25mhz_gen(clk_out, clk_in)
/* synthesis syn_black_box black_box_pad_pin="clk_out,clk_in" */;
  output clk_out;
  input clk_in;
endmodule

// $Id: $
// File name:   counter.sv
// Created:     2/13/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: counter

module counter
(
	input wire clk,
	input wire n_reset,
	input wire cnt_up,
	input wire clear,
	output wire one_k_samples
);

reg [9:0] out_temp;

flex_counter #(.NUM_CNT_BITS(10)) counter(.clk(clk), .n_rst(n_reset), .clear(clear), .count_enable(cnt_up), .rollover_val(10'd1000), .rollover_flag(one_k_samples),.count_out(out_temp));

endmodule

// $Id: $
// File name:   timer.sv
// Created:     2/21/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: timer

module timer (input wire clk, input wire n_rst, input wire d_edge, input wire rcving, output reg shift_enable, output reg byte_received);

reg flag;
reg [3:0]clock_count;
reg [3:0]byte_count;

flex_counter #(4) COUNTER1 (.clk(clk), .n_rst(n_rst), .clear(d_edge), .count_enable(rcving), .rollover_val(4'd8), .count_out(clock_count), .rollover_flag(flag));
flex_counter #(4) COUNTER2 (.clk(clk), .n_rst(n_rst), .clear(!rcving || byte_received), .count_enable(shift_enable), .rollover_val(4'd8), .count_out(byte_count), .rollover_flag(byte_received));
assign shift_enable = (clock_count == 3);
endmodule

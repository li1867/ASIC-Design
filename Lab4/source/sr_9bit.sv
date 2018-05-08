// $Id: $
// File name:   sr_9bit.sv
// Created:     2/6/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: 9 bit shift register

module sr_9bit
(
	input wire clk,
	input wire n_rst,
	input wire serial_in,
	input wire shift_strobe,
	output reg [7:0] packet_data,
	output reg stop_bit
);

reg [8:0] temp;
assign stop_bit = temp[8];
assign packet_data = temp[7:0];
flex_stp_sr #(9,0) A1 (.clk(clk), .n_rst(n_rst), .serial_in(serial_in),.shift_enable(shift_strobe), .parallel_out(temp));
endmodule



















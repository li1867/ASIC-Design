// $Id: $
// File name:   shift_register.sv
// Created:     2/21/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: shift register

module shift_register (input wire clk, input wire n_rst, input wire shift_enable, input wire d_orig, output reg [7:0] rcv_data);

flex_stp_sr #(8, 0) STP_SR (.clk(clk), .n_rst(n_rst), .serial_in(d_orig), .shift_enable(shift_enable), .parallel_out(rcv_data));

endmodule

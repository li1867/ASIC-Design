// $Id: $
// File name:   timer.sv
// Created:     2/6/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: timer

module timer
(
	input wire clk,
	input wire n_rst,
	input wire enable_timer,
	output reg shift_strobe,
	output reg packet_done
);
   //reg [3:0] 		  nine_bit = 4'd9;
   //reg 	[3:0]	   ten_bit = 4'd10;
   reg [3:0]count_out_9;
   reg [3:0]count_out_10;
   
   

   flex_counter #(4) A1(.clk(clk), .n_rst(n_rst), .clear(packet_done), .count_enable(shift_strobe), .rollover_val(4'd9), .rollover_flag(packet_done), .count_out(count_out_9));  //9 bit ocunter
   flex_counter #(4) A2(.clk(clk), .n_rst(n_rst), .clear(packet_done), .count_enable(enable_timer), .rollover_val(4'd10), .rollover_flag(shift_strobe),.count_out(count_out_10));  //10 bit counter
   

endmodule

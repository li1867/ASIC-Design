// $Id: $
// File name:   usb_receiver.sv
// Created:     2/21/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: use receiver

module usb_receiver (
	input wire clk, 
	input wire n_rst, 
	input wire d_plus, 
	input wire d_minus, 
	input wire r_enable, 
	output reg [7:0] r_data, 
	output reg empty, 
	output reg full, 
	output reg rcving, 
	output reg r_error
);

reg d_plus_sync;
reg d_minus_sync;
reg shift_enable;
reg eop;
reg d_orig;
reg d_edge;
reg byte_received;
reg [7:0] rcv_data;
reg w_enable;

sync_high SYNC_HIGH (.clk(clk), .n_rst(n_rst), .async_in(d_plus), .sync_out(d_plus_sync));

sync_low SYNC_LOW (.clk(clk), .n_rst(n_rst), .async_in(d_minus), .sync_out(d_minus_sync));

decode DECODE (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .shift_enable(shift_enable), .eop(eop), .d_orig(d_orig));

eop_detect EOP_DETECT (.d_plus(d_plus_sync), .d_minus(d_minus_sync), .eop(eop));

edge_detect EDGE_DETECT (.clk(clk), .n_rst(n_rst), .d_plus(d_plus_sync), .d_edge(d_edge));

timer TIMER (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving), .shift_enable(shift_enable), .byte_received(byte_received));

shift_register SHIFT_REGESTER (.clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), .d_orig(d_orig), .rcv_data(rcv_data));

rcu RCU (.clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), .shift_enable(shift_enable), .rcv_data(rcv_data), .byte_received(byte_received), .rcving(rcving), .w_enable(w_enable), .r_error(r_error));

rx_fifo FIFO (.clk(clk), .n_rst(n_rst), .r_enable(r_enable), .w_enable(w_enable), .w_data(rcv_data), .r_data(r_data), .empty(empty), .full(full));

endmodule

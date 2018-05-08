// $Id: $
// File name:   rcv_block.sv
// Created:     2/6/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: rcv_block

module rcv_block
(
	input wire clk,
	input wire n_rst,
	input wire serial_in,
	input wire data_read,
	output reg [7:0] rx_data,
	output reg data_ready,
	output overrun_error,
	output reg framing_error
);

	reg timer_enable;
	reg shift_strobe;
	reg packet_done;
	reg sbc_clear;
	reg start_bit_detect;
	reg sbc_enable;
	reg load_buffer;
	wire [7:0]packet_data;
	reg stop_bit;

	timer timer_in_rcv(.clk(clk), .n_rst(n_rst), .enable_timer(timer_enable), .shift_strobe(shift_strobe), .packet_done(packet_done));
	rcu rcu_in_rcv(.clk(clk),.n_rst(n_rst),.start_bit_detected(start_bit_detect),.packet_done(packet_done),.framing_error(framing_error),.sbc_clear(sbc_clear),.sbc_enable(sbc_enable),.load_buffer(load_buffer),.enable_timer	(timer_enable));
	sr_9bit sr9bit_in_rcv(.clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit));
	rx_data_buff rxdatabuff_in_rcv(.clk(clk), .n_rst(n_rst),.load_buffer(load_buffer),.packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), .data_ready(data_ready), .overrun_error(overrun_error));
	start_bit_det startbitdet_in_rcv(.clk(clk), .n_rst(n_rst), .serial_in(serial_in),.start_bit_detected(start_bit_detect));
	stop_bit_chk stopbitchk_in_rcv(.clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear),.sbc_enable(sbc_enable),.stop_bit(stop_bit),.framing_error(framing_error));
endmodule

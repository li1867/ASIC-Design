// $Id: $
// File name:   rcu.sv
// Created:     2/6/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: receive control unit

module rcu
(
	input wire clk,
	input wire n_rst,
	input wire start_bit_detected,
	input packet_done,
	output reg sbc_clear,
	output reg sbc_enable,
	output reg load_buffer,
	output reg enable_timer,
 	input wire framing_error
);

typedef enum bit [2:0] {IDLE, CLEAR, START_DETECT, LOAD, STOP, HOLD} stateType;
stateType next_state, cur_state;

always_ff @ (posedge clk, negedge n_rst) begin
	if(n_rst == 0) begin
		cur_state <= IDLE;
	end
	else begin
		cur_state <= next_state;
	end
end

assign sbc_enable = (cur_state == STOP) ? 1 : 0;
assign sbc_clear = (cur_state == CLEAR) ? 1: 0;
assign load_buffer = (cur_state == LOAD) ? 1 : 0;
assign enable_timer = (cur_state == START_DETECT) ? 1: 0;

always_comb begin
	next_state = cur_state;
	case(cur_state)
	IDLE: begin
		if(start_bit_detected == 1'b1) begin
			next_state = CLEAR;
		   end
		else begin
			next_state = IDLE;
		   end
	end
	CLEAR: begin
		next_state = START_DETECT;
	end
	START_DETECT: begin
		if(packet_done == 1) begin
			next_state = STOP;
		   end
		else begin
			next_state = START_DETECT;
		   end
	end
	STOP: begin
		next_state = HOLD;	
	end
	HOLD: begin
		if(framing_error == 1) begin
			next_state = IDLE;
		end
		else begin
			next_state = LOAD;
		end
	end
	LOAD: begin
		next_state = IDLE;
	end
	endcase
end
endmodule











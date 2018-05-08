// $Id: $
// File name:   rcu.sv
// Created:     2/21/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: rcu

module rcu (input wire clk, input wire n_rst, input wire d_edge, input wire eop, input wire shift_enable, input wire [7:0] rcv_data, input wire byte_received, output reg rcving, output reg w_enable, output reg r_error);

typedef enum bit [3:0] {IDLE, DETECT_EDGE, CHECK_MATCH, READ_FIRST_BIT, READ_REST_7_BIT, STORE, CHECK_D_EDGE1, WAIT, CHECK_D_EDGE2, EIDLE} stateType;

stateType next_state;
stateType current_state;


always_ff @ (posedge clk, negedge n_rst) begin
	if( n_rst == 0) begin
		current_state <= IDLE;
	end
	else begin
		current_state <= next_state;
	end
end

always_comb begin
	rcving = 0;
	w_enable = 0;
	r_error = 0;
	if(current_state == DETECT_EDGE) begin
		rcving = 1;
	end
	if(current_state == CHECK_MATCH) begin
		rcving = 1;
	end
	if(current_state == READ_FIRST_BIT) begin
		rcving = 1;
	end
	if(current_state == READ_REST_7_BIT) begin
		rcving = 1;
	end
	if(current_state == STORE) begin
		rcving = 1;
		w_enable = 1;
	end
	if(current_state == CHECK_D_EDGE1) begin
		rcving = 1;
	end
	if(current_state == CHECK_D_EDGE2) begin
		rcving = 1;
		r_error = 1;
	end
	if(current_state == EIDLE) begin
		r_error = 1;
	end
	if(current_state == WAIT) begin
		rcving = 1;
		r_error = 1;
	end
end

always_comb begin
	next_state = current_state;
	case(current_state)
	IDLE: begin
		if(d_edge == 1) begin
			next_state = DETECT_EDGE;
		end
		else begin
			next_state = IDLE;
		end
	end

	DETECT_EDGE: begin
		if(byte_received == 1) begin
			next_state = CHECK_MATCH;
		end
		else begin
			next_state = DETECT_EDGE;
		end
	end

	CHECK_MATCH: begin
		if(rcv_data == 8'b10000000) begin
			next_state = READ_FIRST_BIT;
		end
		else if (rcv_data != 8'b10000000) begin
			next_state = WAIT;
		end
	end

	READ_FIRST_BIT: begin  
		if(eop == 1 && shift_enable == 1) begin
			next_state = CHECK_D_EDGE1;
		end
		else if(eop == 0 && shift_enable == 1) begin
			next_state = READ_REST_7_BIT;
		end
	end

	CHECK_D_EDGE1: begin
		if(d_edge == 1) begin
			next_state = IDLE;
		end
	end

	READ_REST_7_BIT: begin
		if(byte_received == 1) begin
			next_state = STORE;
		end
		else if(eop == 1 & shift_enable == 1) begin
			next_state = CHECK_D_EDGE2;
		end
	end

	STORE: begin
		next_state = READ_FIRST_BIT;
	end

	CHECK_D_EDGE2: begin
		if(d_edge == 1) begin
			next_state = EIDLE;
		end
	end

	WAIT: begin
		if(eop == 1 & shift_enable == 1) begin
			next_state = CHECK_D_EDGE2;
		end
	end

	EIDLE: begin
		if(d_edge == 1) begin
			next_state = DETECT_EDGE;
		end
	end
	endcase
end
endmodule

	
		





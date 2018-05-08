// $Id: $
// File name:   mealy.sv
// Created:     1/30/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: mealy code design

module mealy
   (
    	input wire clk,
	input wire n_rst,
	output reg o,
	input wire i
    );
	reg [1:0]cur_state;
	reg [1:0]next_state;

	parameter [1:0] state_1 = 2'b00;
	parameter [1:0] state_2 = 2'b01;
	parameter [1:0] state_3 = 2'b10;
	parameter [1:0] state_4 = 2'b11;

always_ff @ (posedge clk, negedge n_rst) begin
	if( n_rst == 0 ) begin
		cur_state = 2'b00;
	end
	else begin
		cur_state = next_state;
	end
end

always_comb begin
	o = 0;
	next_state = cur_state;
	case(cur_state)
	state_1: begin
		if(i == 1) begin
			next_state = state_2;
			o = 0;
		end
		else begin
			next_state = state_1;
			o = 0;
		end
		
	end
	state_2: begin
		if(i == 1) begin
			next_state = state_3;
			o = 0;
		end
		else begin
			next_state = state_1;
			o = 0;
		end
	end
	state_3: begin
		if(i == 1) begin
			next_state = state_3;
			o = 0;
		end
		else begin
			next_state = state_4;
			o = 0;
	end
	end
	state_4: begin
		if(i == 1) begin
			next_state = state_2;
			o = 1;
		end
		else begin
			next_state = state_1;
			o = 0;
	end
	end
	default: begin
		next_state = state_1;
		end
endcase
end
endmodule
   
   
   

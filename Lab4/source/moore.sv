// $Id: $
// File name:   moore.sv
// Created:     2/1/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: moore

module moore
(
	input wire clk,
	input wire n_rst,
	input wire i,
	output reg o
);

	parameter [3:0] state_1 = 4'b0000;
	parameter [3:0] state_2 = 4'b0001;
	parameter [3:0] state_3 = 4'b0011;
	parameter [3:0] state_4 = 4'b0110;
	parameter [3:0] state_5 = 4'b1101;
	
	reg [3:0] cur_state;
	reg [3:0] next_state;

	always_ff @ (posedge clk, negedge n_rst) begin
		if( n_rst == 0 ) begin
			cur_state = 4'b0000;
		end
		else begin
			cur_state = next_state;
		end
	end

	always_comb begin
		o = 0;
		case(cur_state)
		state_1: begin
			if( i == 1 ) begin
				next_state = state_2;
				o = 0;
			end
			else begin
				next_state = state_1;
				o = 0;
			end
		end
		state_2: begin
			if( i == 1 ) begin
				next_state = state_3;
				o = 0;
			end
			else begin
				next_state = state_1;
				o = 0;
			end
		end
		state_3: begin
			if( i == 1) begin
				next_state = state_3;
				o = 0;
			end
			else begin
				next_state = state_4;
				o = 0;
			end
		end
		state_4: begin
			if( i == 1 ) begin
				next_state = state_5;
				o = 1;
			end
			else begin
				next_state = state_1;
				o = 0;
			end
		end
		state_5: begin
			if( i == 1 ) begin
				next_state = state_3;
				o = 0;
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


























	

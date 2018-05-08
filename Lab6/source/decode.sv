// $Id: $
// File name:   decode.sv
// Created:     2/19/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: decode

module decode (input wire clk, input wire n_rst, input wire d_plus, input wire shift_enable, input wire eop, output reg d_orig);

reg o1;
reg o2;
reg next_d_plus;

always_ff @(posedge clk, negedge n_rst) begin
	if(n_rst == '0) begin
		next_d_plus <= '1;
		o2 <= '1;
	end
	else begin
		next_d_plus <= d_plus;
		o2 <= o1;
	end
end

always_comb begin
	if(shift_enable == '1) begin
		if(eop == '1) begin
			o1 = '1;
		end
		else begin
			o1 = next_d_plus;
		end
	end
	else begin
		o1 = o2;
	end
end

assign d_orig = !(o2 ^ next_d_plus);
//xnor (d_orig, o1, next_d_plus);


endmodule

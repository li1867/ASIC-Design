// $Id: $
// File name:   edge_detect.sv
// Created:     2/19/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: edge detect

module edge_detect(
	input wire clk,
	input wire n_rst,
	input wire d_plus,  //current d_plus value
	output reg d_edge
);

reg current;
reg prev;

always_ff @(posedge clk, negedge n_rst) begin
	if(n_rst == '0) begin
		current <= 1'b1;
		prev <= 1'b1;
	end
	else begin
		prev <= current;
		current <= d_plus;
	end
end

assign d_edge =!(prev ==  current);

endmodule
	

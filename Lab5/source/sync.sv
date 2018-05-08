// $Id: $
// File name:   sync.sv
// Created:     2/13/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: sync

module sync
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
);

reg Q1;

always_ff @(posedge clk, negedge n_rst) begin
	if(n_rst == 0) begin
		sync_out <= 0;
		Q1 <= 0;
	end
	else begin
		Q1 <= async_in;
		sync_out <= Q1;
	end
end
endmodule

// $Id: $
// File name:   magnitude.sv
// Created:     2/13/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: magnitude

module magnitude
(
	input wire [16:0] in,
	output reg[15:0] out
);

reg [16:0] temp;
reg left_most;// = in[16];

assign left_most = in[16];
assign temp = ~(in - 1'b1);
assign out = (left_most == 1'b1) ? (temp[15:0]) : in[15:0];
//assign out = temp;

endmodule

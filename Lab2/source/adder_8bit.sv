// $Id: $
// File name:   adder_8bit.sv
// Created:     1/21/2018
// Author:      Peiyuan Li
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: 8bitadder

module adder_8bit

   (
    //port decleration
    input wire [7:0] a,
    input wire [7:0] b,
    input wire carry_in,

    output wire [7:0] sum,
    output wire overflow
    );

   adder_nbit #(8) A1 (.a(a), .b(b), .carry_in(carry_in), .sum(sum), .overflow(overflow));
   endmodule
